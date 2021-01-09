Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DE62EFCAF
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 02:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbhAIBXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 20:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbhAIBXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 20:23:00 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331F7C061573
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 17:22:20 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 23so27249473lfg.10
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 17:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P7K4KwoyoMC1EHC74ArNpJ8GH0eAGxVDT4lx8rL5k2k=;
        b=qSdoP74JG7n1KT2X+r7FEOV1BJ9c8yNMdLxzu4ZCkkBzR8AuRy8mRFp7kZNr4bBYQN
         yxecIqCmOcgPpVGJcMxl70RZS517tOJnV07kvDb8X9gJQyvqYwifsJORHcfgaPDdjLoI
         pXLj8xo88O6+uO36AgfaQf+LahG81TvRjcAuSg/6/GEj8C5i5oy2r297z3dxJae0vjf2
         hUVRnmhCgmRc9eTbpq3X+yZ6wYSz+xjSqA6BFpd+TX5G7REXISpppVY0kiZ37aNEO3Ve
         i+Z+/uVoPSWkYvIk7lt9npNBgG9Bioc+5m4carm+Fctpsxu4SSWMDlesZ2svxlZWX5eF
         4kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7K4KwoyoMC1EHC74ArNpJ8GH0eAGxVDT4lx8rL5k2k=;
        b=k1vVoKPCwDfBvuuXgVxYkqEzus7HjtZs/Wi5qz1HZf+QRutbU924zcm0EdD+rqsJ0M
         jPWlvhCyKFHuyfkgbP7ZhK8sKl9PzF5vxmw+jMrac8r3Rta4xZgB7PBOfLZvSk6dFUrI
         KLaBX9qXoCZ4vqInSv4UG1SxNTp54PBD5Ibd4tWRwthuiMm4OTUufxJ9oQMMKQVFTD71
         BfR4eUT/RafmnBxjrgCnq3sESxdv9DpYnkVN+MePTspP6FO6cRkJ/ZCwLW9s87GVeWQu
         9CIg12PgDB8lLgJrUT4w9u5/EatBia1bc9Yh0covVRTNLga5euT+Sn/dV8TSBRTWe1oI
         fX+A==
X-Gm-Message-State: AOAM532ebTk4MHtwQnFHjVAXKV5Ixb94/BpbV+Q0XncyMNoQKweDd/vJ
        9qMF4PvODWDhuaM4CoduEfp4Kb+qcLLg0wOUevK6HA==
X-Google-Smtp-Source: ABdhPJwTgthk+MVK7vW7yJpfvbi1p9U6DTD2CXyKcAwRu1k3bxg6CqKGGouPRYcyTSvdVYfnVSVhaL0O9/G+NX15fl8=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr2729651ljo.368.1610155338714;
 Fri, 08 Jan 2021 17:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com> <20201224203603.GA59600@x1>
In-Reply-To: <20201224203603.GA59600@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 02:22:07 +0100
Message-ID: <CACRpkdb9RnGJbct+D-88JPDSbaVp1XS8vjhhHYosy20EPkLjaw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

sorry for belated review. The approach is so uncommon so it had me
confused.

On Thu, Dec 24, 2020 at 9:36 PM Drew Fustini <drew@beagleboard.org> wrote:

> > > I used the compatible string "pinctrl,state-helper" but would appreciate
> > > advice on how to best name this. Should I create a new vendor prefix?
> >
> > Here is the first concern. Why does this require to be a driver with a
> > compatible string?
>
> I have not been able to figure out how to have different active pinctrl
> states for each header pins (for example P2 header pin 3) unless they
> are represented as DT nodes with their own compatible for this helper
> driver such as:
>
> &ocp {
>         P2_03_pinmux {
>                 compatible = "pinctrl,state-helper";
>                 pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pwm";
>                 pinctrl-0 = <&P2_03_default_pin>;
>                 pinctrl-1 = <&P2_03_gpio_pin>;
>                 pinctrl-2 = <&P2_03_gpio_pu_pin>;
>                 pinctrl-3 = <&P2_03_gpio_pd_pin>;
>                 pinctrl-4 = <&P2_03_gpio_input_pin>;
>                 pinctrl-5 = <&P2_03_pwm_pin>;
>         };
> }

I do not think the DT people are going to appreciate this pseudo-device.

Can you not just represent them as pin control hogs and have the debugfs
code with the other debugfs code in drivers/pinctrl/core.c?

Normal drivers cannot play around with the state assigned to a
hog, but debugfs can certainly do that so go ahead and patch
the core.

> I can assign pinctrl states in the pin controller DT node which has
> compatible pinctrl-single (line 301 arch/arm/boot/dts/am33xx-l4.dtsi):
>
> &am33xx_pinmux {
>
>         pinctrl-names = "default", "gpio", "pwm";
>         pinctrl-0 =   < &P2_03_default_pin &P1_34_default_pin &P2_19_default_pin &P2_24_default_pin
>                         &P2_33_default_pin &P2_22_default_pin &P2_18_default_pin &P2_10_default_pin
>                         &P2_06_default_pin &P2_04_default_pin &P2_02_default_pin &P2_08_default_pin
>                         &P2_17_default_pin >;
>         pinctrl-1 =   < &P2_03_gpio_pin &P1_34_gpio_pin &P2_19_gpio_pin &P2_24_gpio_pin
>                         &P2_33_gpio_pin &P2_22_gpio_pin &P2_18_gpio_pin &P2_10_gpio_pin
>                         &P2_06_gpio_pin &P2_04_gpio_pin &P2_02_gpio_pin &P2_08_gpio_pin
>                         &P2_17_gpio_pin >;
>         pinctrl-2 =   < &P2_03_pwm &P1_34_pwm &P2_19_pwm &P2_24_pwm
>                         &P2_33_pwm &P2_22_pwm &P2_18_pwm &P2_10_pwm
>                         &P2_06_pwm &P2_04_pwm &P2_02_pwm &P2_08_pwm
>                         &P2_17_pwm >;
>
> }
>
> However, there is no way to later select "gpio" for P2.03 and select
> "pwm" for P1.34 at the same time.  Thus, I can not figure out a way to
> select independent states per pin unless I make a node for each pin that
> binds to a helper driver.
>
> It feels like there may be a simpler soluation but I can't see to figure
> it out.  Suggestions welcome!

I think maybe there is no solution because you are solving a problem
that only pinctrl-single while trying to stay generic? The single
driver is special in that it requires all states of pins to be encoded
into the device tree, but for debugging that is kind of unfriendly
which was mentioned in its inception. For deep debugging it is good
to let the core know of all available functions and groups and
single does not IIUC.

Yours,
Linus Walleij
