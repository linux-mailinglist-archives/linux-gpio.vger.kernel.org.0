Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FA93D353F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 09:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhGWGue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 02:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhGWGud (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 02:50:33 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF666C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 00:31:07 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id s19so941443ybc.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 00:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vs+we/6ft1FfVa0CVz20fRewulUcTgapCBk4PsMDMMQ=;
        b=JPyoG4tDLazDPsS8Y3oVxlDJm75zO3sr5Mwj9G2MnrcoE/tXE6m8Q7IDz7QI/HrG18
         xlTRSLavT1GWOuRuJSRa2gKNvB9Z25aSlfeFzmf4rtlDTcVQrSqDVdbuiz1aFt9AbmVS
         Bn8n8SkRdYMai4NwvEI2Suhn5IvGbTMAXHcMmlN6kBJA2EWAbj7uqaOsdhx5HR6dXh8E
         Qu1hiLp388RZyk+2SNzk0qHrlu7vQ9ohNOQXse3g8P03+XwbTLKU0GKBYXQl3hnFj5QG
         4FyAaDXc/oappirdBhHoW7wA1+nwd8NCic04Fu6HtgJ0cfr4lCEuzvZxjEWRXAJEZ9Pv
         uHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vs+we/6ft1FfVa0CVz20fRewulUcTgapCBk4PsMDMMQ=;
        b=VTFl9RCGKADv7ZfVstCwukB+3Wng13NVSjKNUMY1KH3AJAJ56502UW4SYCR82L9JS8
         S1FgtqSvjtVp8CIhAVWOye0iDUbZLnunoT021N62U42xhOGIzNSOgcN9IAQsZJDCTi/k
         3+3AtKJuyiSJE5CcrBOdFyEQK7zaqa0XkifGFFKGFr9i6EGLP0MWlRRPthyCqb7rClAE
         NQG64aPE1SpBe/nd+YOmYctNsleaT4MNiVh8QpBMNOwpXG176ctd4pGPP0UTyQ9l3b8v
         EMkGeI1YRx+fv6yotBZ8taEwcHqrxhsJp1qMbu4aFHLVVkJK/xTN4DNEV1U1YENk+Vjd
         vK7Q==
X-Gm-Message-State: AOAM530O2kFYAsMRAFlxOnLcNLkyOVTnuTghGgr5T3+DAv2xR6jHPMLV
        PzmzYIKBsoFF6HEIgFPEa8Ujw3gW3MjwwW4USmAR4w==
X-Google-Smtp-Source: ABdhPJwg0akw1mzLE5SRir9S3txrzipyiauGM7ybFw0aTjvqg6GRL6JrZTEfDza78OmWm3R7qONfl5YzUx+jnBc5bxE=
X-Received: by 2002:a25:487:: with SMTP id 129mr5006427ybe.0.1627025466848;
 Fri, 23 Jul 2021 00:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com> <20210723031615.GA10457@aspeedtech.com>
In-Reply-To: <20210723031615.GA10457@aspeedtech.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 23 Jul 2021 09:30:56 +0200
Message-ID: <CAMpxmJU4jN-hpNYPLHLbjx4uZ6vDqcyuMVQXhHg1BWXOqyS22A@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
To:     Steven Lee <steven_lee@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 5:16 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The 07/21/2021 21:27, Bartosz Golaszewski wrote:
> > On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> > >
> > > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > > with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> > > supports up to 80 pins.
> > > In the current driver design, the max number of sgpio pins is hardcoded
> > > in macro MAX_NR_HW_SGPIO and the value is 80.
> > >
> > > For supporting sgpio master interfaces of AST2600 SoC, the patch series
> > > contains the following enhancement:
> > > - Convert txt dt-bindings to yaml.
> > > - Update aspeed-g6 dtsi to support the enhanced sgpio.
> > > - Support muiltiple SGPIO master interfaces.
> > > - Support up to 128 pins by dts ngpios property.
> > > - Pair input/output GPIOs instead of using 0 as GPIO input pin base and
> > >   MAX_NR_HW_SGPIO as GPIO output pin base.
> > > - Support wdt reset tolerance.
> > > - Fix irq_chip issues which causes multiple sgpio devices use the same
> > >   irq_chip data.
> > > - Replace all of_*() APIs with device_*().
> > >
> > > Changes from v5:
> > > * Squash v5 patch-05 and patch-06 to one patch.
> > > * Remove MAX_NR_HW_SGPIO and corresponding design to make the gpio
> > >   input/output pin base are determined by ngpios.
> > >   For example, if MAX_NR_HW_SGPIO is 80 and ngpios is 10, the original
> > >   pin order is as follows:
> > >     Input:
> > >     0 1 2 3 ... 9
> > >     Output:
> > >     80 81 82 ... 89
> > >
> > >   With the new design, pin order is changed as follows:
> > >     Input:
> > >     0 2 4 6 ... 18(ngpios * 2 - 2)
> > >     Output:
> > >     1 3 5 7 ... 19(ngpios * 2 - 1)
> > > * Replace ast2600-sgpiom-128 and ast2600-sgpiom-80 compatibles by
> > >   ast2600-sgpiom.
> > > * Fix coding style issues.
> > >
> > > Changes from v4:
> > > * Remove ngpios from dtsi
> > > * Add ast2400 and ast2500 platform data.
> > > * Remove unused macros.
> > > * Add ngpios check in a separate patch.
> > > * Fix coding style issues.
> > >
> > > Changes from v3:
> > > * Split dt-bindings patch to 2 patches
> > > * Rename ast2600-sgpiom1 compatible with ast2600-sgiom-128
> > > * Rename ast2600-sgpiom2 compatible with ast2600-sgiom-80
> > > * Correct the typo in commit messages.
> > > * Fix coding style issues.
> > > * Replace all of_*() APIs with device_*().
> > >
> > > Changes from v2:
> > > * Remove maximum/minimum of ngpios from bindings.
> > > * Remove max-ngpios from bindings and dtsi.
> > > * Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
> > >   driver.
> > > * Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
> > >   number of available gpio pins are different.
> > > * Modify functions to pass aspeed_sgpio struct instead of passing
> > >   max_ngpios.
> > > * Split sgpio driver patch to 3 patches
> > >
> > > Changes from v1:
> > > * Fix yaml format issues.
> > > * Fix issues reported by kernel test robot.
> > >
> > > Please help to review.
> > >
> > > Thanks,
> > > Steven
> > >
> > > Steven Lee (9):
> > >   dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
> > >   dt-bindings: aspeed-sgpio: Add ast2600 sgpio
> > >   ARM: dts: aspeed-g6: Add SGPIO node.
> > >   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.
> > >   gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
> > >   gpio: gpio-aspeed-sgpio: Add set_config function
> > >   gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
> > >   gpio: gpio-aspeed-sgpio: Use generic device property APIs
> > >   gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.
> > >
> > >  .../bindings/gpio/aspeed,sgpio.yaml           |  77 ++++++++
> > >  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
> > >  arch/arm/boot/dts/aspeed-g5.dtsi              |   1 -
> > >  arch/arm/boot/dts/aspeed-g6.dtsi              |  28 +++
> > >  drivers/gpio/gpio-aspeed-sgpio.c              | 178 +++++++++++-------
> > >  5 files changed, 215 insertions(+), 115 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > >
> > > --
> > > 2.17.1
> > >
> >
> > The series looks good to me. Can the DTS and GPIO patches go into
> > v5.15 separately?
> >
>
> Hi Bart,
>
> Thanks for the review.
> Shall we do anything to make the patches go into v5.15 or wait for picking-up?
>
> Steven
>
> > Bart

It's more of a question to the relevant SoC maintainers.

Joel, Andrew: can I take the GPIO patches through the GPIO tree and
you'll take the ARM patches separately into v5.15?

Bartosz
