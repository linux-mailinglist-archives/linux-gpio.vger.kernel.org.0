Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95AD4784E1
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 07:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhLQG3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 01:29:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbhLQG3L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 01:29:11 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB352C06173E
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 22:29:10 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id f11so1404282pfc.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AbtI+qDwDDpzf7/1HnlC6fpagj+Hike7IJqTd8KIsHc=;
        b=fyOIVAYwt7TAz/YgY9wCY9m6pPMw+nh7f1g624tdYVwewvsYJz4BKwJI+b/k6KXPxO
         sQymrdJsS21UAxiSujdCVoN0hUk1wpWLS6cNlwNmHi51FI2whPMfiMMK5bQxOxm9cPFN
         RJmxSE+7g/Q1rldjBWSN3A5RvcXJSfsqaEjNfcfkGp9nlXUDh4J2y5n9/HFTgqvuVxZZ
         X/nVO99DhtA6iJ23+rddhFK7HRtRuFyZmj+7l1fgXDpa2Z8ZUiUGNxC5wMiBUFJgSR1q
         TGFDA+RX9JMsbo/8rXCyNAmzYEEhiavQPvEJ6TIpUk+59rhgTbHkHE9FoOfJrWen45y6
         8h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AbtI+qDwDDpzf7/1HnlC6fpagj+Hike7IJqTd8KIsHc=;
        b=G2LgaGdg4s16ZRguZWZZqqJXxio4juGiRvqmZGluDmuc2kVZtvjVgZFQYiALLr/2q9
         cqhV8wk8xMWGWznyg4OJ7HCbBvEqwZZSpNux/eT2DpfPbkhhBNwSP04/9AJBfdqvGr/R
         83RGWa0KCIoExUATz6I6q+um0DzAC0wT8bj0rY6mkg7nQ4Ip1lXC6RnM0OE8Ok+1W1qA
         ezt+vJ7wqbLL3MKUB76rcS8FyHE5Ek/lY8drUClStzEhje1NUbrxDKNFWXw4kY1JQeaW
         /EpmyXaW6KslvgA/giISELn/8gKgoZoXNGjR4st3NHbOdnUvtkSUqJ1Mn6MynE2or5IG
         JaZg==
X-Gm-Message-State: AOAM5304Ue9ICvWpTKroOiLmrUc5Qo9RLsRvIsdCccFNMX6a8lXnJSSX
        YDWfk9MXM0+P0hTaLjFa8YOhPA==
X-Google-Smtp-Source: ABdhPJyL4B3oNUQf/Y93GLq0+pUkjPDBk36ZDgJ3BYLGoezdvUNU7CthYAt4Wr7PwMH61PFu/54V7Q==
X-Received: by 2002:a65:4c87:: with SMTP id m7mr1575919pgt.486.1639722550286;
        Thu, 16 Dec 2021 22:29:10 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id k2sm6811162pgh.11.2021.12.16.22.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 22:29:09 -0800 (PST)
Date:   Fri, 17 Dec 2021 11:59:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217062907.q4vwy264jhzc6wq4@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
 <CAMKQLNJyjCsCO8mXw4H9yVL_yx2gi4-2Rg+W8rCTdeqnEuwEbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMKQLNJyjCsCO8mXw4H9yVL_yx2gi4-2Rg+W8rCTdeqnEuwEbg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 05:52, Wedson Almeida Filho wrote:
> Some drive-by comments. I haven't reviewed the code in detail.
> 
> On Fri, 17 Dec 2021 at 05:01, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 16-12-21, 14:59, Bartosz Golaszewski wrote:
> > > On Thu, Dec 2, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > General comment on the naming convention:
> > >
> > > The line from one of the examples: 'use libgpiod::chip::GpiodChip;'
> > > looks like it has a lot of redundancy in it. How about calling the
> > > crate gpiod and dropping the chip package entirely? Basically follow
> > > what C++ and python bindings do by having `use gpiod::Chip` etc.?
> >
> > That would mean I move back all the code to lib.rs, which makes it contain too
> > much code. I am okay though if you want it that way.
> 
> You can keep things in different source files/modules and then expose
> them from lib.rs. For example, we have something like this in the
> kernel crate:

Right I did that kind of thing somewhere else too. This should work better.

> mod types;
> pub use crate::types::{bit, bits_iter, Mode, Opaque, ScopeGuard};
> 
> So these are implemented in `types.rs` but exposed directly from the
> kernel crate as `kernel::bit`, `kernel::bits_iter`, etc.
> 
> > > > +
> > > > +impl GpiodChipInternal {
> > > > +    /// Find a GPIO chip by path.
> > > > +    pub(crate) fn open(path: &str) -> Result<Self> {
> > > > +        let chip = unsafe { bindings::gpiod_chip_open(path.as_ptr() as *const c_char) };
> 
> Note that Rust strings are not necessarily null-terminated, so if
> `gpiod_chip_open` is expecting a null-terminated string,

I guess it would, though my code works just fine right now and I am not sure
why, maybe by chance the next byte is zero or something :)

> this isn't
> always going to work. In the kernel we have null-terminated strings as
> a CStr type, and they can be initialised with constants using the
> `c_str!` macro. You'll probably need something similar here if you
> want to avoid allocations (otherwise you can just allocate a
> null-terminated copy of `path`, use it, then free it).

So I must do something like this then ?

    pub(crate) fn open(path: &str) -> Result<Self> {
        let chip = unsafe { bindings::gpiod_chip_open(CStr::from_ptr(path.as_ptr() as *const c_char)) };

> > > > +        if chip.is_null() {
> > > > +            return Err(Error::OperationFailed("GpiodChip open", IoError::last()));
> > >
> > > One of my concerns last time was error handling. Does this now
> > > translate the error codes from the underlying C code to some kind of
> > > rust errors? Can you elaborate on how that works?
> >
> > You can think of it like wrapping around or concatenation of errors in a way.
> > The above line will return this now:
> >
> > Err(libgpiod::Error::OperationFailed("GpiodChip open", IoError::last())) and
> > will print like for EINVAL:
> >
> > Operation GpiodChip open Failed: 22
> 
> Seems ok for printing. Is there a way to get the actual error code (22
> in the example above) from the error returned? (As opposed to just a
> string.)

The entire thing is returned to the caller,
i.e.  libgpiod::Error::OperationFailed("GpiodChip open", 22).

I think caller should be able to get the code out of it somehow, won't something
like this work ?

let errno = match error {
        libgpiod::Error::OperationFailed(msg, errno) => errno,
        _ => 0,
};

> > > > +    /// Get the GPIO chip name as represented in the kernel.
> > > > +    pub fn get_name(&self) -> Result<&str> {
> > > > +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> > > > +        // as the `struct GpiodChip`.
> > > > +        let name = unsafe { bindings::gpiod_chip_get_name(self.ichip.chip()) };
> > > > +        if name.is_null() {
> > >
> > > This is not possible, the string can be empty at the very least but
> > > never null. Same for label and path.
> >
> > Miguel, what's your take on stuff like this ? I am not sure if we should just
> > drop this check altogether.
> 
> I'm obviously not Miguel :) But here's my take on this:

You are always welcome to provide feedback, I am the newbie here :)

> I think it's better to keep the check even if it's not possible today.
>
> But if you choose to remove it, then you probably want to note in the
> next SAFETY comment for `from_raw_parts` (which I think you forgot to
> add) that `name` is always non-null.

Right.

> > > > +    /// Read a single line status change event from this chip. If no events are
> > > > +    /// pending, this function will block.
> > > > +    pub fn info_event_read(&self) -> Result<GpiodInfoEvent> {
> > > > +        GpiodInfoEvent::new(&self.ichip.clone())
> > >
> > > Would you mind explaining what the clone() function does here to ichip
> > > and why it's needed.
> >
> > Normally clone() is like copying of the objects, but in this case ichip is
> > declared as Arc (Atomic Reference Counting).
> >
> > Invoking clone on Arc produces a new Arc instance, which points to the same
> > allocation on the heap as the source Arc, while increasing a reference count.
> >
> > In rust, when the last reference of an object goes away, it is freed
> > automatically.
> 
> Your description of `Arc` is accurate, but it doesn't look like the
> code does what you intended. Note that you're passing the _address_ of
> the cloned arc to `GpiodInfoEvent::new`, so what you're doing here is:
> incrementing the refcount, calling GpiodInfoEvent::new, then
> immediately decrementing the count. If you want to keep the extra
> reference alive, you must transfer ownership of it (and hold on to it
> for as long as you want it alive).

Ahh, this instance contains a clone by mistake here. It was correctly done at
other places where I wanted the newly allocated structure to contain a reference
to underlying ichip. I have removed clone() from two places where I was passing
the reference instead.

-- 
viresh
