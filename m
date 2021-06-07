Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C075239D5BC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhFGHRr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:17:47 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:35918 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhFGHRq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:17:46 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15771UrV056303;
        Mon, 7 Jun 2021 15:01:30 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 15:15:15 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        open list <linux-kernel@vger.kernel.org>
CC:     <steven_lee@aspeedtech.com>, <Hongweiz@ami.com>,
        <ryan_chen@aspeedtech.com>, <billy_tsai@aspeedtech.com>
Subject: [PATCH v4 0/7] ASPEED sgpio driver enhancement.
Date:   Mon, 7 Jun 2021 15:15:05 +0800
Message-ID: <20210607071514.11727-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15771UrV056303
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
supports up to 80 pins.
In the current driver design, the max number of sgpio pins is hardcoded
in macro MAX_NR_HW_SGPIO and the value is 80.

For supporting sgpio master interfaces of AST2600 SoC, the patch series
contains the following enhancement:
- Convert txt dt-bindings to yaml.
- Update aspeed-g6 dtsi to support the enhanced sgpio.
- Define max number of gpio pins in ast2600 platform data. Old chip
  uses the original hardcoded value.
- Support muiltiple SGPIO master interfaces.
- Support up to 128 pins.
- Support wdt reset tolerance.
- Fix irq_chip issues which causes multiple sgpio devices use the same
  irq_chip data.
- Replace all of_*() APIs with device_*().

Changes from v3:
* Split dt-bindings patch to 2 patches
* Rename ast2600-sgpiom1 compatible with ast2600-sgiom-128
* Rename ast2600-sgpiom2 compatible with ast2600-sgiom-80
* Correct the typo in commit messages.
* Fix coding style issues.
* Replace all of_*() APIs with device_*().

Changes from v2:
* Remove maximum/minimum of ngpios from bindings.
* Remove max-ngpios from bindings and dtsi.
* Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
  driver.
* Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
  number of available gpio pins are different.
* Modify functions to pass aspeed_sgpio struct instead of passing
  max_ngpios.
* Split sgpio driver patch to 3 patches

Changes from v1:
* Fix yaml format issues.
* Fix issues reported by kernel test robot.

Please help to review.

Thanks,
Steven

Steven Lee (7):
  dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
  dt-bindings: aspeed-sgpio: Add ast2600 sgpio compatibles.
  ARM: dts: aspeed-g6: Add SGPIO node.
  gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
  gpio: gpio-aspeed-sgpio: Add set_config function
  gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
  gpio: gpio-aspeed-sgpio: Use generic device property APIs

 .../bindings/gpio/aspeed,sgpio.yaml           |  78 ++++++++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
 arch/arm/boot/dts/aspeed-g6.dtsi              |  30 +++
 drivers/gpio/gpio-aspeed-sgpio.c              | 185 +++++++++++++-----
 4 files changed, 244 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

-- 
2.17.1

