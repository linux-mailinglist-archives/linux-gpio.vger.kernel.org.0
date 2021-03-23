Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07033455A1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 03:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhCWCnE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 22:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhCWCmh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 22:42:37 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80899C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 19:42:36 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id l123so12746158pfl.8
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 19:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0En3mkBS0z/4yv4J4cbe8NVwfq4ngxqOyzQ1Lfh8Eqs=;
        b=v8EAXvolQATdUneBvaH9tvmKkwZ43JlDhtMWk6Zt4tBkiAny01O+dlFb2/7nlzhXEQ
         cIufV1LThb41gXsVmGpbKKYGaW2fBZbGk33OhbUImPHuUf7jnFZT5f2YNK0GcyyXjqtW
         Emtp6c7LGkqEdz14TbfgDWaf44GI9Lm2g1sNwDX+dXeQTd35PhOg8dMSXA+KI+kzB3x5
         iXsMMkn6goH0W1nNBJnfcH6ND1NXiJFcOhZJWsa5dNKyZx1+m7UuamaD9XmwZZFYwbGE
         at09OdBqrgpCXyNqin3upHEJDxvr3QWMFRECvgqGAthFFrcmiLtQi6uZ6DUYbUeRLDFC
         cd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0En3mkBS0z/4yv4J4cbe8NVwfq4ngxqOyzQ1Lfh8Eqs=;
        b=bYv+qUoWricXBiUxfQZG2fX5bMh3locsKdKKhMyCO4tLzv5KMgdzrfI0JX80ze3GVX
         yuEWr9XJ6nIt5zQGMLGSgdqxqNg7QQWkc85lzl089C6FzWKswbmwCJeUXl3oqlNH00c0
         RpVnRNLIBtznoJ8guEcdJ8Nd8TY8OkAyTwgi0SVvUYUJqCOPePw3/xDtGy1F+SolvL1V
         iOvbfPwDKps2ODIEHFZkTuj4FDVVlz9Fqdq+yf6D8IQ9Ov+D+bff03NJ1+LEdrQO+8xo
         +T9WfxKHwGG6IYqh6KWyh9jrhBcvdgsSuWUV6EyeNBV1UTX0G1EzaUCk3FoLh/NxU7Hi
         xTWQ==
X-Gm-Message-State: AOAM530IS3mmXfHnsTLLYkFvZjWQxo/uj10VLeoR/oTv+K19tacVgCxu
        F+hmCgDDl9EViqlZTlY1twrh0g==
X-Google-Smtp-Source: ABdhPJwB2E0FHpoNSrvjGzI3rjhxfMRFX58vZEfOKEvRhdDQHBnqpH1KiPOgbDbwWKRlXtyX+1M8FA==
X-Received: by 2002:a17:902:b78a:b029:e4:8ce6:fb64 with SMTP id e10-20020a170902b78ab02900e48ce6fb64mr2775357pls.77.1616467356038;
        Mon, 22 Mar 2021 19:42:36 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:75f9:d347:f722:e669])
        by smtp.gmail.com with ESMTPSA id 11sm15396408pfn.146.2021.03.22.19.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 19:42:35 -0700 (PDT)
Date:   Mon, 22 Mar 2021 19:42:33 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>
Subject: Re: RFC for a GPIO input muxer
Message-ID: <20210323024233.GH505022@x1>
References: <545111184.50061.1615922388276@ichabod.co-bxl>
 <CAHp75VdhX1iC_JKyDigFrwzn7mUvvk0PGC-fgVUvJtYS+Dz6Hw@mail.gmail.com>
 <CAHp75Vd-OT7SVBKMjhZNbVdo24Ep5Jv6_xMY39JDRLTrB0pi-A@mail.gmail.com>
 <20210322061916.GC392062@x1>
 <1911385944.526128.1616432980719@ichabod.co-bxl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1911385944.526128.1616432980719@ichabod.co-bxl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 06:09:40PM +0100, Mauri Sandberg wrote:
> 
> 
> > ----------------------------------------
> > From: Drew Fustini <drew@beagleboard.org>
> > Sent: Mon Mar 22 07:19:16 CET 2021
> > To: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Mauri Sandberg <sandberg@mailfence.com>, Linux GPIO <linux-gpio@vger.kernel.org>
> > Subject: Re: RFC for a GPIO input muxer
> > 
> > 
> > On Wed, Mar 17, 2021 at 02:30:50PM +0200, Andy Shevchenko wrote:
> > > +Cc: Drew, I believe he has some thoughts about.
> > > 
> > > On Wed, Mar 17, 2021 at 1:17 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Tuesday, March 16, 2021, Mauri Sandberg <sandberg@mailfence.com> wrote:
> > > >>
> > > >> I am writing to you to ask for comments on the preferred way of implementing a 4-way GPIO multiplexer in the most generic way. The situation is that there is a dual 4-way multiplexer on my device and its select pins a controlled with GPIOs. The output pins of the multiplexer are connected to two other GPIOs. The datasheet of the multiplexer is here: https://assets.nexperia.com/documents/data-sheet/74HC_HCT153.pdf
> > > >>
> > > >> This is what I have been contemplating on but I am not aware if the same could be achieved with existing pinctrl or gpio driver or combination of those.
> > > >
> > > >
> > > > To me looks like a typical pinmux. Dunno if pinctrl supports pure pinmux and how it can handle that at runtime.
> > 
> > Regarding runtime pinmux, this patchset by myself was recently merged
> > and might be of interest [1].
> Thanks, I'll have a look.
> 
> > 
> > > >
> > > >  That said, I would consider what has been done in pinctrl for that.
> > > >>
> > > >>
> > > >> The 'key-mux1' below implements a gpio-controller that drives the multiplexer and provides gpios for reading device key presses. At the moment it has to be polled as interrupts are not being generated by the key presses. I tried looking around but software interrupts did not give me any hits.
> > > >>
> > > >> I have omitted 'key-mux2' from this for clarity.
> > > >>
> > > >> mux: mux-controller {
> > > >>         compatible = "gpio-mux";
> > > >>         #mux-control-cells = <0>;
> > > >>
> > > >>         mux-gpios = <&gpio 9 GPIO_ACTIVE_HIGH>,         /* s0 */
> > > >>                     <&gpio 11 GPIO_ACTIVE_HIGH>;        /* s1 */
> > > >> };
> > > >>
> > > >> gpio2: key-mux1 {
> > > >>         compatible = "gpio-mux-input";
> > > >>         mux-controls = <&mux>;
> > > >>
> > > >>         gpio-controller;
> > > >>         #gpio-cells = <2>;
> > > >>
> > > >>         // GPIOs used by this node, mux pin
> > > >>         pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;        /* 1y */
> > > >> };
> > 
> > I don't see "gpio-mux-input" in mainline so I presume you wrote a driver
> > than uses this binding?  If so, could you share the code?
> Oh yes, the code is at [2]. I  must apologize as it's still WIP but it should convey the general idea. It looks for a multiplexer, then proceeds to grab a GPIO pin and finally creates a gpio_chip.
> 
> Before polishing up I though it might be better to ask first if it is even the right approach.

I would recommend posting your RFC again but as a RFC patch containing
the new code. I was confused at first until I realized that you were
refering to new code that you had written but not yet shared. I believe
it is ok for the code in an RFC to have some problems if your goal is
to get feedback on the general approach.

I think regular gpio reviewers like Andy, Bartosz, Geert, Kent and Linus
will provide some opinions if you post the code.


Regards,
Drew
