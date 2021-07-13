Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822D73C6CC6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 11:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbhGMJC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 05:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234815AbhGMJC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 05:02:56 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC207C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 02:00:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t17so49044593lfq.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auooqGend/MpgDzrAxPulB+LTrlAKF1M6jC9r1DHfm4=;
        b=YewyrC2cjM63ymEp0Y0p663ELwRfw/RHQwzpyR0GigFKynIrn8GTs3GlKlRv+BQZjh
         g23GoCFQEYrTIJWAsb+qPxppLienpkZgWOKqoGv6APbWQ/9tyPQbd7+r0FS4TO6lyY39
         ruA3lQyrz15qRLLqrYcqFJWgJYupBQsgTprw+WTn8+QDJ9SaceCUvtyy7KKrfgaaZURE
         a1yQAKmq2gcz1nH4B7/0DXtqG/aDPpw4kNsdrQraLIBeYQeACZRTuWmFrlu6LVcpPbfJ
         pNMDj2gmz4l7ZRWVo9IbrZdTpG9G14YjauihkYxtUXsFD/DREw2bZoSXNQ9L30zSpO6U
         SW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auooqGend/MpgDzrAxPulB+LTrlAKF1M6jC9r1DHfm4=;
        b=JMNOX3tzRiAoUA4/Y9kJNCsUyVuMm7VSFwFQxqgfmoQQ5DSMMRLkCrJkb3gOuy9Hxd
         BPQMzFdI6a42MZmvoNPIm5VIZX6Szv9AWJ4woxYzm0wJg9vG0aqeG5iEFm61npQWqqzM
         KgOVrmI1nu/iP1L91SmsvP6NmH92NR/aFHoFBu6pXB2oGezAOWkaQSkAUYwgjqYW/Q9U
         HmCsQDpm9gdxupLohjvo2I+H2Nami4GDnVqgDIjG22cN1rP0MsC7xv6cegnU14DOEYnu
         di1cTDmCWEoCQmL7ah0qG4uHx+XB2KDOQuuXfE6MuXcnTnHJpUbUJE/2HytvyrZi08R+
         3NxA==
X-Gm-Message-State: AOAM530PBYU4XyNScLZl9RdDyiV9d/eF7f0978Tht6KCi++6fVCyXngq
        VT+zSL734FLQZ8xy8KsdVmc922R76wKC/T0OIXIx6A==
X-Google-Smtp-Source: ABdhPJz5BHsQ1V41B0ZOTtW9XeAJmBUmOzSB8o4bj4ZLB02n7lL8RL7XfT5Kjqw569hfnGdCOJXWkoXLP8XavixQNaY=
X-Received: by 2002:a19:5018:: with SMTP id e24mr2816820lfb.29.1626166805038;
 Tue, 13 Jul 2021 02:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com> <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
 <YOh/JC//dotfm5J9@google.com>
In-Reply-To: <YOh/JC//dotfm5J9@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Jul 2021 10:59:53 +0200
Message-ID: <CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Greg KH <greg@kroah.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mark Brown <broonie@kernel.org>,
        Roland Dreier <roland@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 9, 2021 at 6:54 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:

> In preparation for writing the abstractions to implement a gpio driver in Rust,
> I was reading through some of the code you describe above.

Nice, bonus review :)

> Unless I'm missing something (very much possible!), this "numbing" seems to not
> be synchronised, that is, there are still race windows when userspace may cause
> UAFs in the kernel.

That's possible.

> For example, gpiochip_remove sets gdev->chip to NULL; gpio_ioctl returns -ENODEV
> if gdev->chip is NULL, which I believe is an instance of what you describe
> above.

Yes.

> However, what ensures that it remains non-null?
(...)
> I see that in functions
> called by gpio_ioctl (e.g., lineinfo_get), gdev->chip is used as if it were
> guaranteed to be valid.
(...)
> Is my reading correct or is there some synchronisation that I'm missing?

No there are definately possible synchronization bugs there.

We probably need a few more
if (!gdev->chip) return -ENODEV;
in some of these callbacks for example.
There are probably also more narrow possible sync bugs.

They are a bit hard to reproduce in practice because people do not
unplug their GPIO devices so much, the one case that is used a bit
would be USB-based GPIO expanders which happens on e.g.
serial dongles (FTDI with additional GPIO is the most common).
These are used in practice for controlling lab boards and stuff
but when people unplug them it is usually part of tearing down an
entire setup so the circumstances are a bit chaotic and subtle
bugs are not noticed.

Yours,
Linus Walleij
