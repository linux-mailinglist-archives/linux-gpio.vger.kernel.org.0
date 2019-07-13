Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62297677D8
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 05:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbfGMDrL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jul 2019 23:47:11 -0400
Received: from hermes.aosc.io ([199.195.250.187]:42637 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727466AbfGMDrL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jul 2019 23:47:11 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id E474F6EA60;
        Sat, 13 Jul 2019 03:47:04 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v4 0/8] Support for Allwinner V3/S3L and Sochip S3
Date:   Sat, 13 Jul 2019 11:46:26 +0800
Message-Id: <20190713034634.44585-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset tries to add support for Allwinner V3/S3L and Sochip S3.

Allwinner V3/V3s/S3L and Sochip S3 share the same die, but with
different package. V3 is BGA w/o co-packaged DDR, V3s is QFP w/ DDR2,
S3L is BGA w/ DDR2 and S3 is BGA w/ DDR3. (S3 and S3L is compatible
for pinout, but because of different DDR, DDR voltage is different
between the two variants). Because of the pin count of V3s is
restricted due to the package, some pins are not bound on V3s, but
they're bound on V3/S3/S3L.

Currently the kernel is only prepared for the features available on V3s.
This patchset adds the features missing on V3s for using them on
V3/S3/S3L, and add bindings for V3/S3/S3L. It also adds a S3 SoM by
Sipeed, called Lichee Zero Plus.

Icenowy Zheng (8):
  pinctrl: sunxi: v3s: introduce support for V3
  clk: sunxi-ng: v3s: add the missing PLL_DDR1
  dt-bindings: clk: sunxi-ccu: add compatible string for V3 CCU
  clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
  clk: sunxi-ng: v3s: add Allwinner V3 support
  ARM: sunxi: dts: s3/s3l/v3: add DTSI files for S3/S3L/V3 SoCs
  dt-bindings: arm: sunxi: add binding for Lichee Zero Plus core board
  ARM: dts: sun8i: s3: add devicetree for Lichee zero plus w/ S3

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/sun8i-s3-lichee-zero-plus.dts    |   8 +
 .../dts/sun8i-s3-s3l-lichee-zero-plus.dtsi    |  46 +++
 arch/arm/boot/dts/sun8i-s3.dtsi               |   6 +
 arch/arm/boot/dts/sun8i-s3l.dtsi              |   6 +
 arch/arm/boot/dts/sun8i-v3.dtsi               |  14 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c          | 250 ++++++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     | 265 +++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |   2 +
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +
 include/dt-bindings/reset/sun8i-v3s-ccu.h     |   3 +
 14 files changed, 604 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
 create mode 100644 arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi

-- 
2.21.0

