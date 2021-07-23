Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F90C3D322D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 05:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbhGWCgf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 22:36:35 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48250 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbhGWCge (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 22:36:34 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 16N2xiOM016399;
        Fri, 23 Jul 2021 10:59:44 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 11:16:17 +0800
Date:   Fri, 23 Jul 2021 11:16:16 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
Message-ID: <20210723031615.GA10457@aspeedtech.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16N2xiOM016399
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 07/21/2021 21:27, Bartosz Golaszewski wrote:
> On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> > supports up to 80 pins.
> > In the current driver design, the max number of sgpio pins is hardcoded
> > in macro MAX_NR_HW_SGPIO and the value is 80.
> >
> > For supporting sgpio master interfaces of AST2600 SoC, the patch series
> > contains the following enhancement:
> > - Convert txt dt-bindings to yaml.
> > - Update aspeed-g6 dtsi to support the enhanced sgpio.
> > - Support muiltiple SGPIO master interfaces.
> > - Support up to 128 pins by dts ngpios property.
> > - Pair input/output GPIOs instead of using 0 as GPIO input pin base and
> >   MAX_NR_HW_SGPIO as GPIO output pin base.
> > - Support wdt reset tolerance.
> > - Fix irq_chip issues which causes multiple sgpio devices use the same
> >   irq_chip data.
> > - Replace all of_*() APIs with device_*().
> >
> > Changes from v5:
> > * Squash v5 patch-05 and patch-06 to one patch.
> > * Remove MAX_NR_HW_SGPIO and corresponding design to make the gpio
> >   input/output pin base are determined by ngpios.
> >   For example, if MAX_NR_HW_SGPIO is 80 and ngpios is 10, the original
> >   pin order is as follows:
> >     Input:
> >     0 1 2 3 ... 9
> >     Output:
> >     80 81 82 ... 89
> >
> >   With the new design, pin order is changed as follows:
> >     Input:
> >     0 2 4 6 ... 18(ngpios * 2 - 2)
> >     Output:
> >     1 3 5 7 ... 19(ngpios * 2 - 1)
> > * Replace ast2600-sgpiom-128 and ast2600-sgpiom-80 compatibles by
> >   ast2600-sgpiom.
> > * Fix coding style issues.
> >
> > Changes from v4:
> > * Remove ngpios from dtsi
> > * Add ast2400 and ast2500 platform data.
> > * Remove unused macros.
> > * Add ngpios check in a separate patch.
> > * Fix coding style issues.
> >
> > Changes from v3:
> > * Split dt-bindings patch to 2 patches
> > * Rename ast2600-sgpiom1 compatible with ast2600-sgiom-128
> > * Rename ast2600-sgpiom2 compatible with ast2600-sgiom-80
> > * Correct the typo in commit messages.
> > * Fix coding style issues.
> > * Replace all of_*() APIs with device_*().
> >
> > Changes from v2:
> > * Remove maximum/minimum of ngpios from bindings.
> > * Remove max-ngpios from bindings and dtsi.
> > * Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
> >   driver.
> > * Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
> >   number of available gpio pins are different.
> > * Modify functions to pass aspeed_sgpio struct instead of passing
> >   max_ngpios.
> > * Split sgpio driver patch to 3 patches
> >
> > Changes from v1:
> > * Fix yaml format issues.
> > * Fix issues reported by kernel test robot.
> >
> > Please help to review.
> >
> > Thanks,
> > Steven
> >
> > Steven Lee (9):
> >   dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
> >   dt-bindings: aspeed-sgpio: Add ast2600 sgpio
> >   ARM: dts: aspeed-g6: Add SGPIO node.
> >   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.
> >   gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
> >   gpio: gpio-aspeed-sgpio: Add set_config function
> >   gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
> >   gpio: gpio-aspeed-sgpio: Use generic device property APIs
> >   gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.
> >
> >  .../bindings/gpio/aspeed,sgpio.yaml           |  77 ++++++++
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
> >  arch/arm/boot/dts/aspeed-g5.dtsi              |   1 -
> >  arch/arm/boot/dts/aspeed-g6.dtsi              |  28 +++
> >  drivers/gpio/gpio-aspeed-sgpio.c              | 178 +++++++++++-------
> >  5 files changed, 215 insertions(+), 115 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> >
> > --
> > 2.17.1
> >
> 
> The series looks good to me. Can the DTS and GPIO patches go into
> v5.15 separately?
> 

Hi Bart,

Thanks for the review.
Shall we do anything to make the patches go into v5.15 or wait for picking-up?

Steven

> Bart
