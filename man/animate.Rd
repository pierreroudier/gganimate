% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/animate.R, R/gganim.R
\name{animate}
\alias{animate}
\alias{print.gganim}
\alias{plot.gganim}
\title{Render a gganim object}
\usage{
animate(plot, nframes = 100, fps = 10, length = NULL, detail = 1,
  renderer = magick_renderer(), device = "png", ref_frame = 1, ...)

\method{print}{gganim}(x, ...)

\method{plot}{gganim}(x, nframes = 9, detail = 10, ...)
}
\arguments{
\item{plot, x}{A \code{gganim} object}

\item{nframes}{The number of frames to render}

\item{fps}{The framerate of the animation in frames/sec}

\item{length}{The length of the animation in seconds}

\item{detail}{The number of additional frames to calculate, per frame}

\item{renderer}{The function used to render the generated frames into an
animation. Gets a vector of paths to images along with the framerate.}

\item{device}{The device to use for rendering the single frames. Possible
values are \code{'png'}, \code{'jpeg'}, \code{'tiff'}, and \code{'bmp'}. Defaults to \code{'png'}.}

\item{ref_frame}{The frame to use for fixing dimensions of the plot, e.g. the
space available for axis text. Defaults to the first frame. Negative values
counts backwards (-1 is the last frame)}

\item{...}{Arguments passed on to the device}
}
\value{
The return value of the \code{renderer} function
}
\description{
This function takes a gganim object and renders it into an animation. The
nature of the animation is dependent on the renderer, but defaults to using
\code{magick} to render it to a gif. The length and framerate is decided on render
time and can be any two combination of \code{nframes}, \code{fps}, and \code{length}.
Rendering is happening in discrete time units. This means that any event in
the animation is rounded of to the nearest frame (e.g. entering will always
take a whole number of frames). This means that rounding artefacts are
possible when only rendering few frames. To avoid this you can increase the
\code{detail} argument. \code{detail} will get multiplied to \code{nframes} and the
resulting number of frames will get calculated, but only \code{nframes} evenly
spaced frames are rendered.
}
\details{
\code{print.gganim}()  is an alias for \code{animate()} in the same way as
\code{print.ggplot()} is an alias for \code{plot.ggplot()}. This ensures that gganimate
behaves ggplot2-like and produces the animation when the object is printed.
The \code{plot()} method is different and produces an ensemble of frames to give
a static overview of the animation. The default is to produce a 3x3 grid.
}
