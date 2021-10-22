Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABF74374EC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 11:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhJVJmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 05:42:36 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:37495 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbhJVJmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 05:42:33 -0400
Received: by mail-pf1-f178.google.com with SMTP id q19so3130200pfl.4;
        Fri, 22 Oct 2021 02:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DRet2N5HhCm6h5wynnS1gaOYbkbGXzOrerbjjC0E3g=;
        b=Jrkj7Jx9VmBivqrIstT5FQ0tLVNsID3nHIkQBDPtRh693hp0l2M+vwDTZWwH8Lbxtr
         LnNOXPEoA8FcICMv8yUk4RTPW7QlSWU+pLolsrYWpZnELe07BesyDZHVDiU2+kVaPXBf
         38bt1sw4J2ijStGsfnNa3IFwXlvw0nFq69cMgiLV3Od620tFd4xpxfaKkWMRaOVWUW2Z
         nDBLzf0FbjGLd3UO/Sz4bf+P5Z2SI10s3EbmccvpVa3HWk2GwvppAD+18Rtzk+JdTaPO
         yASB+VH+TpLlKJp1dY5bAMnU94mZGHUNmjER79pHeufJ49J59vq0yYf+9SQCV82+0y67
         Xzyg==
X-Gm-Message-State: AOAM532EV4cWAG4PnESuapwrRCmLoctHc7OPuGQ8UyCZBkEFw8r7eegm
        FefogQ1DrYrr8eV3+B3hHlGsKuWBAJJ2umwslS4=
X-Google-Smtp-Source: ABdhPJyblyCb0CC4y8acTqNncuSqdbB5QocuyXB3xV6V6A5/kNsqxhKmEJEGhcR1xInlPyJlLfr9PFvQz/JeTr9ws8o=
X-Received: by 2002:a62:5257:0:b0:44c:ed84:350a with SMTP id
 g84-20020a625257000000b0044ced84350amr11091780pfb.79.1634895616438; Fri, 22
 Oct 2021 02:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-2-kernel@esmil.dk>
 <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
In-Reply-To: <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 11:40:05 +0200
Message-ID: <CANBLGcxJGgi9nuT6LpjGgPj1bg0aW-ELRCAO0Csv3xi82gTCnQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Fri, 22 Oct 2021 at 10:51, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Add StarFive Kconfig option to select SoC specific and common drivers
> > required for these SoCs.
>
> ...
>
> > +config SOC_STARFIVE
> > +       bool "StarFive SoCs"
> > +       select PINCTRL
> > +       select RESET_CONTROLLER
>
> > +       select SIFIVE_PLIC
>
> If this is well understood and platform related the above two are too
> generic. Why have you selected them?

From your last comments the criterion seemed to be to only add it here
if it would otherwise fail to boot. Well it does fail to boot without
the reset and pinctrl drivers. The clock driver too, but RISCV already
selects COMMON_CLK. Once PINCTRL and RESET_CONTROLLER is selected the
specific drivers defaults to SOC_STARFIVE.

Alternatively we'd select the drivers too, but I can't promise that
future StarFive chips will need the same JH7100 clock and reset
drivers. Doing it this way means that selecting SOC_STARFIVE by
default gives you a kernel that will boot on all StarFive SoCs, but
you can still customise it further to your particular chip. It seems
like SOC_SIFIVE is doing the same.

> > +       help
> > +         This enables support for StarFive SoC platform hardware.
>
> Not too much to read here. What is the point of this help?
> I would elaborate what kind of platform it may support, what kind of
> drivers it selects due to necessity of the accomplishing the boot
> process, etc.

This is exactly as the other descriptions in this file. I don't know
why SOC_STARFIVE should be special.

/Emil
