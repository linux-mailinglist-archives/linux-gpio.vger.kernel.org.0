Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD783923F9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 02:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbhE0A62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 20:58:28 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:57278 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhE0A61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 20:58:27 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14R0fwMq067380;
        Thu, 27 May 2021 08:41:58 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 08:55:00 +0800
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
Subject: [PATCH v2 3/4] ARM: dts: aspeed-g5: Modify sgpio node for the enhanced sgpio driver.
Date:   Thu, 27 May 2021 08:54:52 +0800
Message-ID: <20210527005455.25758-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527005455.25758-1-steven_lee@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R0fwMq067380
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The enhanced sgpio driver has changed the compatible name to sgpiom
and reads the max number of sgpio pins that SoC supported from
max-ngpios in dts.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d733c1f161c1..730cbd48eedb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -345,13 +345,14 @@
 
 			sgpio: sgpio@1e780200 {
 				#gpio-cells = <2>;
-				compatible = "aspeed,ast2500-sgpio";
+				compatible = "aspeed,ast2500-sgpiom";
 				gpio-controller;
 				interrupts = <40>;
 				reg = <0x1e780200 0x0100>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				interrupt-controller;
 				ngpios = <8>;
+				max-ngpios = <80>;
 				bus-frequency = <12000000>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_sgpm_default>;
-- 
2.17.1

