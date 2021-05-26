Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2353913FC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 11:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbhEZJsU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 05:48:20 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:14848 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhEZJsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 05:48:19 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14Q9X9CB082694;
        Wed, 26 May 2021 17:33:09 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 17:46:11 +0800
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
Subject: [PATCH v1 0/4] ASPEED sgpio driver enhancement.
Date:   Wed, 26 May 2021 17:46:04 +0800
Message-ID: <20210526094609.14068-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14Q9X9CB082694
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
- Update aspeed dtsi to support the enhanced sgpio.
- Get the max number of sgpio that SoC supported from dts.
- Support muiltiple SGPIO master interfaces.
- Support up to 128 pins.

Please help to review.

Thanks,
Steven


Steven Lee (4):
  dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
  ARM: dts: aspeed-g6: Add SGPIO node.
  ARM: dts: aspeed-g5: Modify sgpio node for the enhanced sgpio driver.
  gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support

 .../bindings/gpio/aspeed,sgpio.yaml           |  91 +++++++++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
 arch/arm/boot/dts/aspeed-g5.dtsi              |   3 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |  32 +++
 drivers/gpio/gpio-aspeed-sgpio.c              | 193 ++++++++++++------
 5 files changed, 250 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

-- 
2.17.1

