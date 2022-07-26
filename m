Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59709580ECE
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 10:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbiGZIWm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 04:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiGZIWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 04:22:41 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDC2248DA
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:22:40 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z22so16826032edd.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=08tcE2vu2I9T0Xk6dAn7S5oArabDra+29MFMHsyeaqI=;
        b=G2/EVxBxN4rB6T4wGwdLmqgRXNQy25e3vZjVrtKBWS+CEmLDUXb51cdwtlq/XNW91/
         Q2jln0xnGkbd6bsZ0conYSgr4jyLtpPXHXkl+NwF+llj2jp6Ixr1w+qCR0upCZBoIwuz
         Alt7dZWUgUwn/81Dn4Ka+nZah5pDK1no01Z8J1131V+J3OXnFwtjAXrdlD7YS2iuuaBs
         nrqsUEWMzt1MwqGEDFS973ret2e+vHvcKgJJ9WRTaPPnSB1kXJ9LLEC/vwngN9TFrIs+
         8aIPKTBYc8p/UJPNABFvHWgU19Sp9gEjijS7+vX4K3ALFhVWybvXMKwu35g3OmbiU1rs
         0E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=08tcE2vu2I9T0Xk6dAn7S5oArabDra+29MFMHsyeaqI=;
        b=geP5PPiOSwNEglLaN+59kLq6NSdU6jODhhQX2Q4ldvcDW1TQ2ooQKdYEhdMv17IeA5
         h2Z7sLQyY8ANOEsLXdbLWXEGDteTsdDc4e36X7104F68hP/TBR5o/ITAAXzNFFdoqilf
         bwhTfUG9fH1Iry3yY83MfS2SSfku964VCI5AtMSI8/YaCiUeHNjMgsSwIeUDyq/IyHeQ
         lmZev8iY5Q2qaZGDCdBATdhRJp6aZwevzqYMTgCB84WBOhj2238xAmuI7PMklCF6d4oJ
         w4VYjssGoG0GSA/dmP8BbJ30FJKsZR9+XxWCzO/6KYucmgWM5B5f9Xcbs2GSF/pJTj2q
         SvKQ==
X-Gm-Message-State: AJIora+HL4ZG5Mr87l4u03RtVCuzoyetSFLd8LEGK2HzSlxpjxfohwyh
        mKbw1nwvQvXg7aSM11i0aaHCfx0Yntp+KHPz09nxIK4w2Ls9eA==
X-Google-Smtp-Source: AGRyM1sMaWXVe/G0sYkAD/6Iqb0PAapBPHs65v0QUWZnvGv8PI0xcv5Eq1ksaSLp+M+fIZ4xy8jXL72mhZeB9ZUpiOg=
X-Received: by 2002:a05:6402:3685:b0:43b:dfd3:9487 with SMTP id
 ej5-20020a056402368500b0043bdfd39487mr15509729edb.32.1658823759230; Tue, 26
 Jul 2022 01:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220724171057.18549-1-marex@denx.de> <20220724171057.18549-2-marex@denx.de>
 <CAHp75VfW6s56uYdEBYD_gcX6_PoBMJXmDQWYT7rERqW75=XoOA@mail.gmail.com>
In-Reply-To: <CAHp75VfW6s56uYdEBYD_gcX6_PoBMJXmDQWYT7rERqW75=XoOA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 10:22:28 +0200
Message-ID: <CACRpkdYVw5moBtVi-VCUbQpzhZGOrd4EqGzohUEWyiT2e=mmww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 10:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Jul 24, 2022 at 7:21 PM Marek Vasut <marex@denx.de> wrote:
> >
> > Always configure GPIO pins which are used as interrupt source as INPUTs.
> > In case the default pin configuration is OUTPUT, or the prior stage does
> > configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> > INPUT and no interrupts are received.
> >
> > Always configure interrupt source GPIO pin as input to fix the above case.
>
> the interrupt
>
> ...
>
> I'm wondering if it's configured as output (by who?) shouldn't you
> issue a warning?

That could be the power-on default or boot loader that put it
into output mode I think, so it can be something outside of the kernel
and outside of our control. We just adjust the reality to the map
and go on :P

Yours,
Linus Walleij
