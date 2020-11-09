Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0794B2AC098
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 17:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgKIQOn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 11:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgKIQOn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 11:14:43 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9E9C0613CF;
        Mon,  9 Nov 2020 08:14:41 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so7512459pgg.12;
        Mon, 09 Nov 2020 08:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFLPfbMyI673S69duDZ3Cwv5aXYQyOe/K7YD64BQqTI=;
        b=i/4wyYTktFpXofS3SmdsBNgfiy0Y51YLwbUDhUhKfaeuQ2zSRnJP6Pmx427YqdxfjA
         r7NUlZ191eIBn9ke5NxVOcsETxgJvm2ySGr6Sldf+boO45pl3OUD9kisr+D7CgzpyQ83
         aQzrNDOiwM8AyqCXkVeWuwgA5hS7aY/vw2BtJ470FSlTdY+ROGaKWs6QRjMuObFQOJz0
         HyTVbPYZiN2mi3ytoW+BV35c8yIBrUwL5WJhuQSg2ssjKI4IdoB0Be+TE3aBySF4fD+L
         RmIJZJmzgu2yGk6w+Z00Fjit4+6jb87lkiVvML5H1uBhINiGUf+iUfup7A2VVqHXYNKQ
         bSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFLPfbMyI673S69duDZ3Cwv5aXYQyOe/K7YD64BQqTI=;
        b=QkPU2ciGUdXylzZ/kJOucVo7eEyDe8U7kwKR724FP+gIjY833BeJ2BJxKyTeqIc63W
         BMB1K7iB10x/wutbGWYaN06WNI6ODP6M85xRVtzTRvTJc90HXxtZnRHmOhVUlqTi9Gnh
         MNBHUILQYXWler+i1FyRTELPFq1ZqyS1WPy8bJtzWrIT4LM3X4yZyzez0b2d+mzoVTOF
         4ERBXZt5gJiPrbTK/ySkY4indo7OPkkcl96htAJiQHAgHA30w58vCvBjFwDjCZ1IOnz7
         gctLQiYS4mEnUPPdpo8Mv/NnIyCIN5hhxsQqXPk5rHmQJhgdpe6AzsM78z1HSzEqswJE
         p6Pg==
X-Gm-Message-State: AOAM533dTLrmqrI/1E0ahwOCmIFQWvBxL8SzkRz49bbZgE6bdMn7nXzk
        CqH93eKUBAWrSIIH55XQwDE9W6euOsrsFnLP1B4qco9dbAo=
X-Google-Smtp-Source: ABdhPJxDqA5Nr0SKOAzL8y48EaUVxGFC07iEmn1XuJxzuj/RIJBFUQBbDW/4v6Mmrl7bH/A7LUIB3+owLXi1prAKJog=
X-Received: by 2002:a17:90b:fc6:: with SMTP id gd6mr29773pjb.181.1604938481158;
 Mon, 09 Nov 2020 08:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20201109132643.457932-1-lars.povlsen@microchip.com>
 <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
 <20201109143237.GJ1257108@piout.net> <CAHp75Vc7eRDq5wUyUdvCZCnV_VS+afGnbJpQeDSeXVE9K_MGng@mail.gmail.com>
 <20201109152748.GA1691943@piout.net>
In-Reply-To: <20201109152748.GA1691943@piout.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 18:15:30 +0200
Message-ID: <CAHp75VfcgyMEr3YscC2Na_RCTtd=ozCzCGq=UO6zKAa+9b4rqg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 5:27 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 09/11/2020 17:16:49+0200, Andy Shevchenko wrote:
> > On Mon, Nov 9, 2020 at 4:32 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > On 09/11/2020 16:17:40+0200, Andy Shevchenko wrote:

...

> > > > > +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
> > > > > +                       pin, input ? "input" : "output");
> > > >
> > > > Do we need this noise? Isn't user space getting a proper error code as
> > > > per doc and can handle this?
> > >
> > > Why would userspace get the error code?
> >
> > Huh?! Why it shouldn't. How will users know if they are doing something wrong?
> >
> > > Userspace should never have to
> > > handle gpios directly or you are doing something wrong.
> >
> > This is true, but check how error codes are propagated to the user space.
> >
>
> your point is to remove an error message because the error may be
> propagated to userspace. My point is that userspace should never use
> gpios and the kernel has to be the consumer.

Tell this to plenty of users of old sysfs interface and to libgpiod ones.
If what you are saying had been true, we would have never had the new
ABI for GPIOs.

> I don't see how your answer
> is relevant here.

I have an opposite opinion.

> Did you already check all the call sites from the
> kernel too?

If you think we have to print a message on each possible error case
(but not always the one) we will get lost in the messages disaster and
dmesg overflow.
It is consumer who should decide if the setting is critical or not to
be printed to user.

-- 
With Best Regards,
Andy Shevchenko
