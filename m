Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B570B330ECA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 14:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhCHNBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 08:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhCHNAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 08:00:46 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D647C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 05:00:46 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id p8so20190773ejb.10
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 05:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BxrIbdQrEERDsECw1Pxz4mKI8rl4Unw8O8vMcUP1fss=;
        b=tChVnLzDQTI6cmd2uPBBxzR9GbxUnBEeVFc0TfyEkfKutggoBrBoYb4djbecFePSMn
         9trY5/gL7A9F9CvCiyfSk8J/6e52HBZHnC06MJiUbAlNiGRDU+JJ0VOI+diMFVGFHrp+
         AurURgQ2gN16V8sfHM1y6gU+X5jfd/eQkJlt8uka1uS+9TE9WjHDh2AABgeTngyNPlkV
         xtaC7TWDdPmLIAUcwnZe0K+a0JS3KTEdu+EezJ7EnEefPoMCN98i4DkvYmZi+HvImcln
         gzBuaAWwYoh4veFQh6d2+wnRz2fKhAL9aVsiNQbOH0rez0nk1tYwDiq3nmOcgEzs8flS
         1jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BxrIbdQrEERDsECw1Pxz4mKI8rl4Unw8O8vMcUP1fss=;
        b=g9gYMqdjdeD6aoi64ql0EHS74lqtGPdVrKe4mNnKdJXbP5u8R9vmvm6SzP7rFxik7r
         iGOQVOJu2p+q6cnrFxyD8EZIS4p8ME4f4ds7GAM0J8PQ2TBhGMbIHR5C9F1T+PTg81yE
         aj6+gPoupJA0QafBSDeRrBEM9s64/KiImWUzbFlLz4vQDbp/BW+6YQbfNB1omOWq37Wl
         +yoIQ+P7UbIkrmJU/AlXFxDNtb3OQx6yAsPehOwaZ8V2E+kaVA0SgeASbvB2bnQ9SFhX
         egNTvyp5MrDjDv3/N/fL+Xesf0PT7PFGQlgpBAStHzyhASO17XHeTbRJEgfH6IhRKwKj
         fjJA==
X-Gm-Message-State: AOAM533rRl5lr9WUwPHT96yQltYKnqMxFZ8PCBb7OvFdKrUQLLT0OavD
        WhJnz1F9ZbLkRievmuT4vi1Dfa5c9b7XOf3Cvq9LOQ==
X-Google-Smtp-Source: ABdhPJwEp6oal76qSV7PJURABOCrJxZhcG0iC7MCmly7XnHRROkGDVSwPw0ieVYjTWpr2kQhZ7zDMBmnbJEEtvx0K90=
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr15223980ejr.516.1615208444859;
 Mon, 08 Mar 2021 05:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJVjdeW5978U--4KDCVr9gtu603gq04j2Zo0ohRi1rURZg@mail.gmail.com>
 <CAHp75Vf9XbZ4S-2aqfQafaw8jJrW3oVQYEw06roi3zOBKRMmOA@mail.gmail.com> <YEYOQqFch8yTE2SZ@smile.fi.intel.com>
In-Reply-To: <YEYOQqFch8yTE2SZ@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Mar 2021 14:00:33 +0100
Message-ID: <CAMpxmJW56EfaP8DgvyRDdmtCWLx4b0G0cS_Wi6Y_5=kxmPH6Cg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 12:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Mar 07, 2021 at 06:14:49PM +0200, Andy Shevchenko wrote:
> > On Sun, Mar 7, 2021 at 4:22 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Fri, Mar 5, 2021 at 1:02 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
> > > > see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
> > > > pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
> > > > and iterates over all of its DT subnodes when registering each GPIO
> > > > bank gpiochip. Each gpiochip has:
> > > >
> > > >   - gpio_chip.parent = dev,
> > > >     where dev is the device node of the pin controller
> > > >   - gpio_chip.of_node = np,
> > > >     which is the OF node of the GPIO bank
> > > >
> > > > Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
> > > > i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
> > > >
> > > > The original code behaved correctly, as it extracted the "gpio-line-names"
> > > > from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
> > > >
> > > > To achieve the same behaviour, read property from the firmware node.
>
> ...
>
> > > Did you run the OF unit tests on this? The check for the parent dev
> > > was added after a bug was reported that was only triggered in unit
> > > tests.
> >
> > Parent is not used anymore. But I can run unittests next week (or if
> > you know that they are failing now, can you please show the failure?).
>
> For the record:
> [   40.587868] ### dt-test ### end of unittest - 190 passed, 0 failed
>
> If you have tests failed, we need more information about what line fails, etc.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

No it's fine, I just wanted to make sure. Patch applied, thanks!

Bartosz
