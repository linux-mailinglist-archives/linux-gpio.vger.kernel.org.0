Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6399F3D0F7E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 15:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237899AbhGUMr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 08:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233136AbhGUMrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 08:47:25 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FB3C061574
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:28:02 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id y38so366438ybi.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAafdB8maEcxAt7X4aari+TcZmDheDXHSryvpJebCSE=;
        b=lfuTg9AWFswlPJLywoHYJK1agsZpv6/T05aDWoVWngTAAT8PURAoKP4BvhuWDegYwm
         vbyWOypf9xXj4Eka8iqW66c4ICKcLvZ1GaZU9OHYPqXx+phQsBqMmBtMuGNm63DbbQ2R
         tiQ2TmwqRwE25YRB7yabtogkuJoH53yd1eoV7j6SPdismGUzX0KcG3GqdFFbeKNDSr0C
         5VW8VOEtldwEL51DqtvM30NXemVgS42Gimleq+MHwlIy20A9WG9R/juxJzMRObMW1N9O
         ex1D+TORYJp02UbEh+YMRbnDyoMFlrzgP5mLIT13K0gqrn7cdHVE90AnNVSFQs0pXQC0
         M9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAafdB8maEcxAt7X4aari+TcZmDheDXHSryvpJebCSE=;
        b=kl5VGxhWYxVWGr7eaPzmMl3kFYMHgx7HYpK4SwQEJUXKX2xRsHPLCJBq/2haAbATzU
         4IwL4IANtgqDSCcUiktZ2xXuGFrFmJogciPCWO8n2hqRC+xGbQt6eMJ2+D03wXCc9x5Y
         hQ0EiEstjDZBrRsOYRfxl1Znk+yFVZBBN2dquBsgQajelpvVDb3ihVeGUdswzNszzPpE
         WXohiQF0o1cuoumYuTGMJZmu1zBECpWVhWUJ6Hr6AnZ7+qEfD1VDbNYFo/Ka1jf128ac
         7uyRql8XZqy0iWvLF6vrWmp1iV0xAoarcT3cUhTwt9zqcJI9UbwRGSDNmqL+UyBYn1ZK
         W67Q==
X-Gm-Message-State: AOAM531nPBF1tvK45TwfJvmsn2jh6qXObXJ9g6BE57T5QySIcGRZpiqU
        V5874X+IeDp8mPbsxvcCn1UUXIxq7B8S7mYasNpYyUNUMoA=
X-Google-Smtp-Source: ABdhPJx1WjVAkp6jRxZJp7kiQRs4VYJ4eZLaT2BIRQ1z4nBLr5bwozTZDA10RbWlmANLp/oyaO6yLB+iVdqEuKCbZ7k=
X-Received: by 2002:a25:4102:: with SMTP id o2mr43915325yba.23.1626874081235;
 Wed, 21 Jul 2021 06:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 21 Jul 2021 15:27:50 +0200
Message-ID: <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
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

On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> supports up to 80 pins.
> In the current driver design, the max number of sgpio pins is hardcoded
> in macro MAX_NR_HW_SGPIO and the value is 80.
>
> For supporting sgpio master interfaces of AST2600 SoC, the patch series
> contains the following enhancement:
> - Convert txt dt-bindings to yaml.
> - Update aspeed-g6 dtsi to support the enhanced sgpio.
> - Support muiltiple SGPIO master interfaces.
> - Support up to 128 pins by dts ngpios property.
> - Pair input/output GPIOs instead of using 0 as GPIO input pin base and
>   MAX_NR_HW_SGPIO as GPIO output pin base.
> - Support wdt reset tolerance.
> - Fix irq_chip issues which causes multiple sgpio devices use the same
>   irq_chip data.
> - Replace all of_*() APIs with device_*().
>
> Changes from v5:
> * Squash v5 patch-05 and patch-06 to one patch.
> * Remove MAX_NR_HW_SGPIO and corresponding design to make the gpio
>   input/output pin base are determined by ngpios.
>   For example, if MAX_NR_HW_SGPIO is 80 and ngpios is 10, the original
>   pin order is as follows:
>     Input:
>     0 1 2 3 ... 9
>     Output:
>     80 81 82 ... 89
>
>   With the new design, pin order is changed as follows:
>     Input:
>     0 2 4 6 ... 18(ngpios * 2 - 2)
>     Output:
>     1 3 5 7 ... 19(ngpios * 2 - 1)
> * Replace ast2600-sgpiom-128 and ast2600-sgpiom-80 compatibles by
>   ast2600-sgpiom.
> * Fix coding style issues.
>
> Changes from v4:
> * Remove ngpios from dtsi
> * Add ast2400 and ast2500 platform data.
> * Remove unused macros.
> * Add ngpios check in a separate patch.
> * Fix coding style issues.
>
> Changes from v3:
> * Split dt-bindings patch to 2 patches
> * Rename ast2600-sgpiom1 compatible with ast2600-sgiom-128
> * Rename ast2600-sgpiom2 compatible with ast2600-sgiom-80
> * Correct the typo in commit messages.
> * Fix coding style issues.
> * Replace all of_*() APIs with device_*().
>
> Changes from v2:
> * Remove maximum/minimum of ngpios from bindings.
> * Remove max-ngpios from bindings and dtsi.
> * Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
>   driver.
> * Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
>   number of available gpio pins are different.
> * Modify functions to pass aspeed_sgpio struct instead of passing
>   max_ngpios.
> * Split sgpio driver patch to 3 patches
>
> Changes from v1:
> * Fix yaml format issues.
> * Fix issues reported by kernel test robot.
>
> Please help to review.
>
> Thanks,
> Steven
>
> Steven Lee (9):
>   dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
>   dt-bindings: aspeed-sgpio: Add ast2600 sgpio
>   ARM: dts: aspeed-g6: Add SGPIO node.
>   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.
>   gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
>   gpio: gpio-aspeed-sgpio: Add set_config function
>   gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
>   gpio: gpio-aspeed-sgpio: Use generic device property APIs
>   gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.
>
>  .../bindings/gpio/aspeed,sgpio.yaml           |  77 ++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
>  arch/arm/boot/dts/aspeed-g5.dtsi              |   1 -
>  arch/arm/boot/dts/aspeed-g6.dtsi              |  28 +++
>  drivers/gpio/gpio-aspeed-sgpio.c              | 178 +++++++++++-------
>  5 files changed, 215 insertions(+), 115 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
>
> --
> 2.17.1
>

The series looks good to me. Can the DTS and GPIO patches go into
v5.15 separately?

Bart
