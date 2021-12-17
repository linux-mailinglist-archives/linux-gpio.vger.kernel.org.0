Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367A04784B3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 06:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhLQFwk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 00:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhLQFwk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 00:52:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D11C06173E
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:52:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf39so2363890lfb.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVZdBX4TtKsIyxWWOmh748fpo+FnTuOI030WPIXAU1c=;
        b=RUnhIHn5nn2tFZ8ieKbzOlS3HrTR6qR7pHfat78A1ScGjjBIc+0xX4YeZc2jNtiEp2
         kAapPsqhHNEvJa7iglSNm48IKTrdz09iHO7k4EUj58bJSJxWdppi+R7txDmdAzQ3fC3J
         JkMbmJV7DDZcUQgiAE8FXEWJK76UYuFzLxEvxXqpSJoZUgohKuJWRdGld/xj6r9w2MoL
         4q1c4hX7p3mXF0U/IYNsEOPUoKsNMSFvJP80ajhtF32da2372lJkCcHNh8jAga3AFgmZ
         jIc2B/+iJRx3yLEGH/GYuLdtB6qEsvMSnSHkaRCdXgoza6CXrENEiX8PHLM8tOqZYy4u
         1ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVZdBX4TtKsIyxWWOmh748fpo+FnTuOI030WPIXAU1c=;
        b=lbCJkHu+xsL7Ia0MX4aO/udZV3XSwG5WP0auVrvE1r1k2HBxpyE3qGLU0d7qYVRHEc
         CZ8EbW1D0vm/wyWTKTv6m8efGsZBv3bDMAIWFj20zZdWzT1ufd8YorwVhSjESFkLXvtd
         wxLrGPyhUtQaB/uEpcCedTo0T2vh3eYWVcuUu2w68aOhyID07wiWMnrClwJAD7is4ic6
         sSF3wUCibR6WX2AkT/y9onxqIwK1c5VTE/ZBssJ0zh4x+liM1el8dtcSUT87me7oo/A7
         WGsG3LmiUL15ZiRDi75bD3TixXPcSfsrLFGtlEynmnxlrklMpSk1Im7HdcWJBNIhOvqC
         Rp+A==
X-Gm-Message-State: AOAM531FwjOUW/T63hRvg0MnJlzn4IRKBb1rPtG6pofmetPJtLO40+uH
        eUXtdT5kXBfzcrw6a7+l4wVHjNQbm+LZH6iUu/RQ
X-Google-Smtp-Source: ABdhPJyGApKiaZZq5GS6Eyit99ai0ozevE+udCVXVEA01gp7Eu71VIhT94EyK2tibxYTIq7FuyKEe73YUpntML+USJA=
X-Received: by 2002:ac2:5bcf:: with SMTP id u15mr1536158lfn.57.1639720357603;
 Thu, 16 Dec 2021 21:52:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com> <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
In-Reply-To: <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Fri, 17 Dec 2021 05:52:26 +0000
Message-ID: <CAMKQLNJyjCsCO8mXw4H9yVL_yx2gi4-2Rg+W8rCTdeqnEuwEbg@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some drive-by comments. I haven't reviewed the code in detail.

On Fri, 17 Dec 2021 at 05:01, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 16-12-21, 14:59, Bartosz Golaszewski wrote:
> > On Thu, Dec 2, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > General comment on the naming convention:
> >
> > The line from one of the examples: 'use libgpiod::chip::GpiodChip;'
> > looks like it has a lot of redundancy in it. How about calling the
> > crate gpiod and dropping the chip package entirely? Basically follow
> > what C++ and python bindings do by having `use gpiod::Chip` etc.?
>
> That would mean I move back all the code to lib.rs, which makes it contain too
> much code. I am okay though if you want it that way.

You can keep things in different source files/modules and then expose
them from lib.rs. For example, we have something like this in the
kernel crate:

mod types;
pub use crate::types::{bit, bits_iter, Mode, Opaque, ScopeGuard};

So these are implemented in `types.rs` but exposed directly from the
kernel crate as `kernel::bit`, `kernel::bits_iter`, etc.

> > > +
> > > +impl GpiodChipInternal {
> > > +    /// Find a GPIO chip by path.
> > > +    pub(crate) fn open(path: &str) -> Result<Self> {
> > > +        let chip = unsafe { bindings::gpiod_chip_open(path.as_ptr() as *const c_char) };

Note that Rust strings are not necessarily null-terminated, so if
`gpiod_chip_open` is expecting a null-terminated string, this isn't
always going to work. In the kernel we have null-terminated strings as
a CStr type, and they can be initialised with constants using the
`c_str!` macro. You'll probably need something similar here if you
want to avoid allocations (otherwise you can just allocate a
null-terminated copy of `path`, use it, then free it).

> > > +        if chip.is_null() {
> > > +            return Err(Error::OperationFailed("GpiodChip open", IoError::last()));
> >
> > One of my concerns last time was error handling. Does this now
> > translate the error codes from the underlying C code to some kind of
> > rust errors? Can you elaborate on how that works?
>
> You can think of it like wrapping around or concatenation of errors in a way.
> The above line will return this now:
>
> Err(libgpiod::Error::OperationFailed("GpiodChip open", IoError::last())) and
> will print like for EINVAL:
>
> Operation GpiodChip open Failed: 22

Seems ok for printing. Is there a way to get the actual error code (22
in the example above) from the error returned? (As opposed to just a
string.)

> The user crate can further wrap it around with their own error enums, but this
> error information wouldn't be lost and won't be subject to interpretation as
> well, as we return the real underlying value now. This is the right/best way to
> do it I suppose in Rust, this is what I was suggested to do for the vhost-device
> Rust crate I merged in rust-vmm project.
>
> > I see it always returns IoError.
>
> This returns the underling errno value.
>
> > In my WIP C++ and Python code I try to translate the
> > errnos into some meaningful exceptions - for instance EINVAL ->
> > ::std::invalid_argument etc. Can we have a similar thing here?
>
> I would avoid translating errors into some interpretation here and rather pass
> on the real error number returned by kernel. That can be more useful in
> debugging the failures later.
>
> > > +    /// Get the GPIO chip name as represented in the kernel.
> > > +    pub fn get_name(&self) -> Result<&str> {
> > > +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> > > +        // as the `struct GpiodChip`.
> > > +        let name = unsafe { bindings::gpiod_chip_get_name(self.ichip.chip()) };
> > > +        if name.is_null() {
> >
> > This is not possible, the string can be empty at the very least but
> > never null. Same for label and path.
>
> Miguel, what's your take on stuff like this ? I am not sure if we should just
> drop this check altogether.

I'm obviously not Miguel :) But here's my take on this:

I think it's better to keep the check even if it's not possible today.

But if you choose to remove it, then you probably want to note in the
next SAFETY comment for `from_raw_parts` (which I think you forgot to
add) that `name` is always non-null.

> > > +
> > > +        match ret {
> > > +            -1 => Err(Error::OperationFailed(
> > > +                "GpiodChip info-event-wait",
> > > +                IoError::last(),
> > > +            )),
> > > +            0 => Err(Error::OperationTimedOut),
> >
> > Does it have to be an Error? It's pretty normal for an operation to
> > time out, no?
>
> Right, but it is still a timeout and should be represented like that. And it is
> up for the caller to act based on it. For example in the gpiomon example, we
> check if the returned value is OperationTimedOut or not, and we retry if it is.
>
> > > +            _ => Ok(()),
> > > +        }
> > > +    }
> > > +
> > > +    /// Read a single line status change event from this chip. If no events are
> > > +    /// pending, this function will block.
> > > +    pub fn info_event_read(&self) -> Result<GpiodInfoEvent> {
> > > +        GpiodInfoEvent::new(&self.ichip.clone())
> >
> > Would you mind explaining what the clone() function does here to ichip
> > and why it's needed.
>
> Normally clone() is like copying of the objects, but in this case ichip is
> declared as Arc (Atomic Reference Counting).
>
> Invoking clone on Arc produces a new Arc instance, which points to the same
> allocation on the heap as the source Arc, while increasing a reference count.
>
> In rust, when the last reference of an object goes away, it is freed
> automatically.

Your description of `Arc` is accurate, but it doesn't look like the
code does what you intended. Note that you're passing the _address_ of
the cloned arc to `GpiodInfoEvent::new`, so what you're doing here is:
incrementing the refcount, calling GpiodInfoEvent::new, then
immediately decrementing the count. If you want to keep the extra
reference alive, you must transfer ownership of it (and hold on to it
for as long as you want it alive).

> > > +impl GpiodEdgeEvent {
> > > +    /// Get an event stored in the buffer.
> > > +    pub fn new(buffer: &GpiodEdgeEventBuffer, index: u64) -> Result<Self> {
> > > +        let event = unsafe { bindings::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
> > > +        if event.is_null() {
> > > +            return Err(Error::OperationFailed(
> > > +                "GpiodEdgeEvent buffer-get-event",
> > > +                IoError::last(),
> > > +            ));
> > > +        }
> > > +
> > > +        Ok(Self { event })
> > > +    }
> > > +
> > > +    /// Get the event type.
> > > +    pub fn get_event_type(&self) -> Result<EdgeEvent> {
> > > +        EdgeEvent::new(unsafe { bindings::gpiod_edge_event_get_event_type(self.event) } as u32)
> > > +    }
> > > +
> > > +    /// Get the timestamp of the event.
> > > +    pub fn get_timestamp(&self) -> Duration {
> > > +        Duration::from_nanos(unsafe { bindings::gpiod_edge_event_get_timestamp(self.event) })
> > > +    }
> > > +
> > > +    /// Get the offset of the line on which the event was triggered.
> > > +    pub fn get_line_offset(&self) -> u32 {
> > > +        unsafe { bindings::gpiod_edge_event_get_line_offset(self.event) }
> > > +    }
> > > +
> > > +    /// Get the global sequence number of this event.
> > > +    ///
> > > +    /// Returns sequence number of the event relative to all lines in the
> > > +    /// associated line request.
> > > +    pub fn get_global_seqno(&self) -> u64 {
> > > +        unsafe { bindings::gpiod_edge_event_get_global_seqno(self.event) }
> > > +    }
> > > +
> > > +    /// Get the event sequence number specific to concerned line.
> > > +    ///
> > > +    /// Returns sequence number of the event relative to this line within the
> > > +    /// lifetime of the associated line request.
> > > +    pub fn get_line_seqno(&self) -> u64 {
> > > +        unsafe { bindings::gpiod_edge_event_get_line_seqno(self.event) }
> > > +    }
> > > +}
> >
> > AFAICT this object will not survive the parent buffer. Take a look at
> > the current development version of the C++ bindings where I play with
> > copy constructors to ensure that.
>
> Adding back some of the removed code as well.
>
> +impl Drop for GpiodEdgeEvent {
> +    /// Free the edge event object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_edge_event_free(self.event) }
> +    }
> +}
>
> While testing this I found a bug few days back and I wonder why
> gpiod_edge_event_free() even exists. The memory for "events" is allocated with
> the buffer and gpiod_edge_event_free() shouldn't try to free a part of that.
> This looks buggy.
>
> Yes I realize that the edge event shouldn't exist past the buffer itself, I will
> try to fix it in a Rusty way (maybe with Arc or something else).
>
> --
> viresh
