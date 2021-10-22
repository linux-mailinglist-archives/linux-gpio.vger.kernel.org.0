Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C766A4373FB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 10:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhJVIyI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 04:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhJVIyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 04:54:07 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27611C061764;
        Fri, 22 Oct 2021 01:51:50 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z20so966985edc.13;
        Fri, 22 Oct 2021 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vsSof8B35sJ3TdkUFeoW7PDjPfQXbtV3oB1joueUNsI=;
        b=LmOW2M7Fls4cmKaeo5kDREtk0zbyuTkrGZBD8wxmaysk/H0O0rScyPc56wgFeg6BtR
         Oi8BOBQD+Fym+tArVe6z1Y1H1aNXcMv7ojyYr+GFhZEZXyp2DJpyEt9B3MqLdt0ZMIUJ
         TvGAy/iVDbjKK1Wyha135Etodgnpe8mk04QRAJI0qG+7mRumNyYYXS+JClEOk/xkj8+v
         dXgtyctgJtieXo7LMiBedb3Vcoub142ihtAxE6RQXey9sjgjhpwhQXulz+s633tIDqDc
         j6LSTINe9bgiELKxM8C3MTuaYked3bcPiczfVP26IQo7fdvNZ7kS8zxCFteFea8RGbbh
         YMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vsSof8B35sJ3TdkUFeoW7PDjPfQXbtV3oB1joueUNsI=;
        b=XmF2Z//OphpBD45R4K/WSPOeVv/dZkMQDLrcBuJgxbZSsqjJwae1L2foLyrK1Z7aXl
         Eor3dltASS/f0r5F/tTFk50JWiG/PSu9xdr0SUzkUlP/hq/mI0KqOBV2w4T+kxLI1vJC
         0EbKM/rgfZMeHtPJWZUAWfz1D7j6Qqr+obvlce8KiShS3xsxFIKzjLyfxohEk2d4Vkgj
         ezUuBcUZuX8lpXDmTvq6qkkRT0patXPlaET3/wqe+2rcKxH1jZbwSLguq7fCwUtvG4DO
         s5jNdMHAblyIWyVxYaRG6CQjoxPg5mCDb6D6Ux1owTwmlTnPWhyhYAc5ZawxMEEYWkKc
         oqMA==
X-Gm-Message-State: AOAM532oKHdfB/wT4e58xoeQ2MfO63dRgwJzmkkp/+vnLbbaIEoo8Tv+
        InsuGDKMxFwiQV1DBbykFKbqokDziI3uTYHJ4t8=
X-Google-Smtp-Source: ABdhPJxg0tLJ7/LdpnuntihRiqWvlRRwACrMPNo7XYl/Y8z0+A5FUElZXiGRbf+lmQ4LBqBm7evjGm3ttticSo63kcs=
X-Received: by 2002:a17:906:1707:: with SMTP id c7mr13563725eje.377.1634892708737;
 Fri, 22 Oct 2021 01:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-2-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-2-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 11:50:52 +0300
Message-ID: <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 8:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add StarFive Kconfig option to select SoC specific and common drivers
> required for these SoCs.

...

> +config SOC_STARFIVE
> +       bool "StarFive SoCs"
> +       select PINCTRL
> +       select RESET_CONTROLLER

> +       select SIFIVE_PLIC

If this is well understood and platform related the above two are too
generic. Why have you selected them?

> +       help
> +         This enables support for StarFive SoC platform hardware.

Not too much to read here. What is the point of this help?
I would elaborate what kind of platform it may support, what kind of
drivers it selects due to necessity of the accomplishing the boot
process, etc.

-- 
With Best Regards,
Andy Shevchenko
