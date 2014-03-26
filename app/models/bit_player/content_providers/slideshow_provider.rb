module BitPlayer
  module ContentProviders
    # Defines presentation logic for a Slideshow.
    class SlideshowProvider < ContentProvider
      def slideshow
        source_content
      end

      def render_current(options)
        options.view_context.render(
          template: "slides/show",
          locals: {
            slide: slide(options.position)
          }
        )
      end

      def slide(position)
        slideshow.slides.where(position: position).first ||
          BitPlayer::Slide.new(body: "no slides")
      end

      def exists?(position)
        slideshow.slides.exists?(position: position)
      end

      def show_nav_link?
        true
      end
    end
  end
end
