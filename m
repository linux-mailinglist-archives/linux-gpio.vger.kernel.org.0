Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A99478124
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 01:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhLQAMP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 19:12:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhLQAMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 19:12:14 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82205C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 16:12:14 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id y7so409009plp.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 16:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vi/Ok+gpSQDOOK9eLilwzk36bHNWjM+yp80y0wHsmCs=;
        b=efemdLPvF/B4xfoXC0tH9ZVv5o9/VJomapNrTnROWOQ3JcwDCS8xyj+6tuxyYrIc7h
         d/+ylXWK4N9qUKU/+LJndO4Ra7Zt80QONstUD4Eo46wdhFVf3w53+pvEtMw69cTLH/Pk
         b0crNvV3kP0fecGo+1EkebSPX+zaXi5XPsxNfIFXmtFpX7qmlEa2Zvmbj9Ee+VhsEp92
         yujkzSJ1FTPOJNOTK2Hs8GsT0XsEk1qEPavW9RYufaERduf5vZLy+stJmtULxtT62/86
         +cuYn+7zG+XPrI1wgsaKG8GvIA7vYWRZWmHg9cYMOX7MDXXkXNb12dbCOWsXwwmASiD4
         STLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vi/Ok+gpSQDOOK9eLilwzk36bHNWjM+yp80y0wHsmCs=;
        b=XFAWknxm0zqHM/tdz3ByrH1By4nYv4KP6SJc99YAi93t7L4dpIdLj9g5fYwZ7qYAfr
         wao7aVYEGBEsBoViaP2dI+r+LhV9oy7TS06cwPuJjrwLJuM+XNWNvRm7Q9giIXsNeQMq
         SCMMUlrsJ+8EFwe/ViE5ugFtIlP2DtlixHnwehGdnl+z7R9HezVkKslZJCzaaixPegi9
         jQVZdCZcxRyhsWhJCuiqmKqlPvODnCepPd3sv7rlK2rOffjiCkgSA/iT5GAQWqzjZt/B
         lUCsuFPtIjjX2QGqNx3OKNMN6fW0vlmww1YUiD8bYj5ix2EI8qdwbaU2M9Jaye783jXB
         VVcg==
X-Gm-Message-State: AOAM532MbR/mPOJS2Pv2hYG8TdHOi/C8V5PqiETJsfXAnzSGUsnF2GiW
        GHSAFa/XN8tNld5fv2KlJjs=
X-Google-Smtp-Source: ABdhPJxOAzPmpID6Zt58KUUzmVunYcFAyw15Iff+lP3YAbJJpQkMRdYiiOBORQLxp5Vx7OJL4f7DFQ==
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr9099133pjb.177.1639699934006;
        Thu, 16 Dec 2021 16:12:14 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id u22sm7436363pfk.148.2021.12.16.16.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 16:12:13 -0800 (PST)
Date:   Fri, 17 Dec 2021 08:12:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217001207.GA6287@sol>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 02:59:25PM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 2, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Add rust wrappers around FFI bindings to provide a convenient interface
> > for the users.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> 
> Hi Viresh, thanks for the hard work.
> 
> Obviously this is not something we can merge yet but it's a good base
> to continue the work.
> 
> General comment on the naming convention:
> 
> The line from one of the examples: 'use libgpiod::chip::GpiodChip;'
> looks like it has a lot of redundancy in it. How about calling the
> crate gpiod and dropping the chip package entirely? Basically follow
> what C++ and python bindings do by having `use gpiod::Chip` etc.?
> 

I'm of the opinion that a rust implementation would be better targetting
the ioctls directly rather than libgpiod, as my Go library does and for
essentially the same reasons.
To test that theory, and as an exercise to learn rust, I've been writing
one, and so far I've been calling it gpiod :-|.

Since this crate targets libgpiod it would make sense for it to
remain named libgpiod.

I agree with the chip::Chip repitition point - found the same thing
myself.  OTOH chip::Info and line::Info etc work well, and in rust
you can always rename them as you import them into your namespace if it
bothers you.  So overall I'm still on the fence on this one.

> [snip]
> 
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
> rust errors? Can you elaborate on how that works? I see it always
> returns IoError. In my WIP C++ and Python code I try to translate the
> errnos into some meaningful exceptions - for instance EINVAL ->
> ::std::invalid_argument etc. Can we have a similar thing here?
> 
> [snip]
> 
> > +
> > +    /// Get the GPIO chip name as represented in the kernel.
> > +    pub fn get_name(&self) -> Result<&str> {
> > +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> > +        // as the `struct GpiodChip`.
> > +        let name = unsafe { bindings::gpiod_chip_get_name(self.ichip.chip()) };
> > +        if name.is_null() {
> 
> This is not possible, the string can be empty at the very least but
> never null. Same for label and path.
> 

On the subject of strings, are paths, names, labels, and consumers
guaranteed to be valid UTF-8?
If not then failing to convert them using UTF-8 is not an error (not
here but elsewhere in the patch).

Cheers,
Kent.
