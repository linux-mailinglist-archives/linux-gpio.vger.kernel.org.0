Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39ED447845A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 06:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhLQFBj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 00:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhLQFBj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 00:01:39 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C667FC061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:01:38 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id j11so1054297pgs.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4aU9CV/JVsiuVfHb3/TgyYa734++pRwDE63Bcp7Su30=;
        b=eBkk2z/p1zYTefob1/3gw5AYp2tyWeul7KucIPQq9BsWC1Flmr9ODGjsgUx1cRqamO
         MLsWSzZTuq/LIkR6MG4iA7LG1w9kjaKqp3G1yfdDsLxkmPelbG6iye/1zLp+Rj6Z2i4p
         xK26iPbHy6+mG0zZwKb7OWF31+zNBbYBa8isok4SUmIpPOjsB5M/gMPmSYVzAI5CPgQf
         YOmFDQ4lMK6uGkEQN9M7r3GgvFDwKT1m0u0QQc8hkM2vGOM1sTqJw+96tgfzMQrH0fUs
         6zYKBAQeaFPb1FZp1l3WRUjSl3V19PthKdIDdNwF1V6OHHO7GvE8Xj+1T+ofgPHahX1l
         SqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4aU9CV/JVsiuVfHb3/TgyYa734++pRwDE63Bcp7Su30=;
        b=Fkf3zL4+VWNt15MOqzWuplmNaWdBTAE6AD138yztdL3FQ22Oiqj1spdTqG4ypIy/ZA
         0SmxCOm5qoeeduirET9qCbV0Xexl8b0jL18nUx46/ITKTfnY0z6prxJfzVD8UxkzldF1
         YdjV4SYZCEmOz787bs47w2+aFMg3bibSYvv8MqhzIunb0tmJhhPDEwwIg8b8SweqbR00
         AKxEzyHJ3mZ2Ryn7BQmHQzvqj8Fu9tw9yTxA42XOZQkyZDbLEf29PqzjoNqF9Wl3p9Of
         e0BG6dvOJUq4wBKC8zGGoDvJ+YWnKSQF6kjvAVdmqqYWB80/qAWufBrYyWrN2nujLzxI
         9FXQ==
X-Gm-Message-State: AOAM530zeO+O8S5bP6TPrPbUjfw72IPGI/diUyBXVW7mysjpKriRhRJS
        dpV5iTJZk/TxUrvK7pWQBns6Rw==
X-Google-Smtp-Source: ABdhPJxRhnQf6H3qCylLQtNDDAjo0aicVnKJvNQ/Prdmsj7cqxo//dJZh/Bjq0pvlQZV0gFnNZ36ag==
X-Received: by 2002:a63:eb0f:: with SMTP id t15mr1416124pgh.145.1639717297955;
        Thu, 16 Dec 2021 21:01:37 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id t38sm8005038pfg.218.2021.12.16.21.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 21:01:37 -0800 (PST)
Date:   Fri, 17 Dec 2021 10:31:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-12-21, 14:59, Bartosz Golaszewski wrote:
> On Thu, Dec 2, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> General comment on the naming convention:
> 
> The line from one of the examples: 'use libgpiod::chip::GpiodChip;'
> looks like it has a lot of redundancy in it. How about calling the
> crate gpiod and dropping the chip package entirely? Basically follow
> what C++ and python bindings do by having `use gpiod::Chip` etc.?

That would mean I move back all the code to lib.rs, which makes it contain too
much code. I am okay though if you want it that way.

> > +
> > +impl GpiodChipInternal {
> > +    /// Find a GPIO chip by path.
> > +    pub(crate) fn open(path: &str) -> Result<Self> {
> > +        let chip = unsafe { bindings::gpiod_chip_open(path.as_ptr() as *const c_char) };
> > +        if chip.is_null() {
> > +            return Err(Error::OperationFailed("GpiodChip open", IoError::last()));
> 
> One of my concerns last time was error handling. Does this now
> translate the error codes from the underlying C code to some kind of
> rust errors? Can you elaborate on how that works?

You can think of it like wrapping around or concatenation of errors in a way.
The above line will return this now:

Err(libgpiod::Error::OperationFailed("GpiodChip open", IoError::last())) and
will print like for EINVAL:

Operation GpiodChip open Failed: 22

The user crate can further wrap it around with their own error enums, but this
error information wouldn't be lost and won't be subject to interpretation as
well, as we return the real underlying value now. This is the right/best way to
do it I suppose in Rust, this is what I was suggested to do for the vhost-device
Rust crate I merged in rust-vmm project.

> I see it always returns IoError.

This returns the underling errno value.

> In my WIP C++ and Python code I try to translate the
> errnos into some meaningful exceptions - for instance EINVAL ->
> ::std::invalid_argument etc. Can we have a similar thing here?

I would avoid translating errors into some interpretation here and rather pass
on the real error number returned by kernel. That can be more useful in
debugging the failures later.

> > +    /// Get the GPIO chip name as represented in the kernel.
> > +    pub fn get_name(&self) -> Result<&str> {
> > +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> > +        // as the `struct GpiodChip`.
> > +        let name = unsafe { bindings::gpiod_chip_get_name(self.ichip.chip()) };
> > +        if name.is_null() {
> 
> This is not possible, the string can be empty at the very least but
> never null. Same for label and path.

Miguel, what's your take on stuff like this ? I am not sure if we should just
drop this check altogether.

> > +
> > +        match ret {
> > +            -1 => Err(Error::OperationFailed(
> > +                "GpiodChip info-event-wait",
> > +                IoError::last(),
> > +            )),
> > +            0 => Err(Error::OperationTimedOut),
> 
> Does it have to be an Error? It's pretty normal for an operation to
> time out, no?

Right, but it is still a timeout and should be represented like that. And it is
up for the caller to act based on it. For example in the gpiomon example, we
check if the returned value is OperationTimedOut or not, and we retry if it is.

> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Read a single line status change event from this chip. If no events are
> > +    /// pending, this function will block.
> > +    pub fn info_event_read(&self) -> Result<GpiodInfoEvent> {
> > +        GpiodInfoEvent::new(&self.ichip.clone())
> 
> Would you mind explaining what the clone() function does here to ichip
> and why it's needed.

Normally clone() is like copying of the objects, but in this case ichip is
declared as Arc (Atomic Reference Counting).

Invoking clone on Arc produces a new Arc instance, which points to the same
allocation on the heap as the source Arc, while increasing a reference count.

In rust, when the last reference of an object goes away, it is freed
automatically.

> > +impl GpiodEdgeEvent {
> > +    /// Get an event stored in the buffer.
> > +    pub fn new(buffer: &GpiodEdgeEventBuffer, index: u64) -> Result<Self> {
> > +        let event = unsafe { bindings::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
> > +        if event.is_null() {
> > +            return Err(Error::OperationFailed(
> > +                "GpiodEdgeEvent buffer-get-event",
> > +                IoError::last(),
> > +            ));
> > +        }
> > +
> > +        Ok(Self { event })
> > +    }
> > +
> > +    /// Get the event type.
> > +    pub fn get_event_type(&self) -> Result<EdgeEvent> {
> > +        EdgeEvent::new(unsafe { bindings::gpiod_edge_event_get_event_type(self.event) } as u32)
> > +    }
> > +
> > +    /// Get the timestamp of the event.
> > +    pub fn get_timestamp(&self) -> Duration {
> > +        Duration::from_nanos(unsafe { bindings::gpiod_edge_event_get_timestamp(self.event) })
> > +    }
> > +
> > +    /// Get the offset of the line on which the event was triggered.
> > +    pub fn get_line_offset(&self) -> u32 {
> > +        unsafe { bindings::gpiod_edge_event_get_line_offset(self.event) }
> > +    }
> > +
> > +    /// Get the global sequence number of this event.
> > +    ///
> > +    /// Returns sequence number of the event relative to all lines in the
> > +    /// associated line request.
> > +    pub fn get_global_seqno(&self) -> u64 {
> > +        unsafe { bindings::gpiod_edge_event_get_global_seqno(self.event) }
> > +    }
> > +
> > +    /// Get the event sequence number specific to concerned line.
> > +    ///
> > +    /// Returns sequence number of the event relative to this line within the
> > +    /// lifetime of the associated line request.
> > +    pub fn get_line_seqno(&self) -> u64 {
> > +        unsafe { bindings::gpiod_edge_event_get_line_seqno(self.event) }
> > +    }
> > +}
> 
> AFAICT this object will not survive the parent buffer. Take a look at
> the current development version of the C++ bindings where I play with
> copy constructors to ensure that.

Adding back some of the removed code as well.

+impl Drop for GpiodEdgeEvent {
+    /// Free the edge event object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_edge_event_free(self.event) }
+    }
+}

While testing this I found a bug few days back and I wonder why
gpiod_edge_event_free() even exists. The memory for "events" is allocated with
the buffer and gpiod_edge_event_free() shouldn't try to free a part of that.
This looks buggy.

Yes I realize that the edge event shouldn't exist past the buffer itself, I will
try to fix it in a Rusty way (maybe with Arc or something else).

-- 
viresh
