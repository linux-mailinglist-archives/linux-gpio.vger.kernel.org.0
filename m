Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE547CD88
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 22:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730420AbfGaUB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 16:01:59 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:55959 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730417AbfGaUB6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 16:01:58 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-99-5d41f3b6d51d
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id EA.F1.14973.6B3F14D5; Wed, 31 Jul 2019 16:01:59 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 31 Jul 2019 16:01:57 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Stanley <joel@jms.id.au>, <devicetree@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>
Subject: [v7 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Date:   Wed, 31 Jul 2019 16:01:36 -0400
Message-ID: <1564603297-1391-2-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
References: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWyRiBhgu72z46xBs9n8ljsusxh8WXuKRaL
        +UfOsVr8Pv+X2WLKn+VMFpseX2O1aF59jtli8/w/jBaXd81hs2jde4Tdgcvjavsudo/3N1rZ
        PS5+PMbssWlVJ5vHnWt72Dw2L6n3OD9jIaPH501yARxRXDYpqTmZZalF+nYJXBlLtnxgLTgp
        UrHqQzNzA+MTgS5GTg4JAROJ/Tv2sHYxcnEICexiktjV/ogRwjnMKPG79Rs7SBWbgJrE3s1z
        mEASIgL9jBJ3ehvAEswCLUwSn5cVgdjCAnYSF7/+ZAWxWQRUJR5MX8wCYvMK2Escvb2KHWKd
        nMTNc53MIDangIPEr1/rgIZyAG2zl5j6vRqiXFDi5MwnLBDjJSQOvngBVi4kICtx69BjJogx
        ChLP+x6zTGAUmIWkZRaSlgWMTKsYhRJLcnITM3PSyw31EnMz9ZLzczcxQiJg0w7GlovmhxiZ
        OBgPMUpwMCuJ8C4Wt48V4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrtyzbcYIYH0xJLU7NTUgtQi
        mCwTB6dUAyPv5zvTpTS7ljf7XbBx2m/PL1Xt/oBjG8M2LYbXX85WK7FGeFutPxlpuuBaY/rH
        olvuev03TkhM9N1jeMXvn8/BgKs6JhHH76mczfjtr3ToqP/a7LBV18q4Xq3ZsvLO4ZNhVwr6
        fHPsni77oNbrf2br9+QpuZdOZFYn8Hw3ZWhRXnXO0uuvywElluKMREMt5qLiRAA4kPZzbgIA
        AA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings to support SGPIO on AST2400 or AST2500.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
Reviewed-by:   Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
new file mode 100644
index 0000000..8545bbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
@@ -0,0 +1,55 @@
+Aspeed SGPIO controller Device Tree Bindings
+-------------------------------------------
+
+This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full 
+featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to 
+support the following options:
+- Support interrupt option for each input port and various interrupt 
+  sensitivity option (level-high, level-low, edge-high, edge-low)
+- Support reset tolerance option for each output port
+- Directly connected to APB bus and its shift clock is from APB bus clock
+  divided by a programmable value.
+- Co-work with external signal-chained TTL components (74LV165/74LV595)
+
+
+Required properties:
+
+- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
+
+- #gpio-cells 		: Should be two
+			  - First cell is the GPIO line number
+			  - Second cell is used to specify optional
+			    parameters (unused)
+
+- reg			: Address and length of the register set for the device
+- gpio-controller	: Marks the device node as a GPIO controller
+- interrupts		: Interrupt specifier (see interrupt bindings for
+			  details)
+
+- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
+
+- ngpios		: number of GPIO pins to serialise. 
+			  (should be multiple of 8, up to 80 pins)
+
+- clocks                : A phandle to the APB clock for SGPM clock division
+
+- bus-frequency		: SGPM CLK frequency
+
+
+The sgpio and interrupt properties are further described in their respective bindings documentation:
+
+- Documentation/devicetree/bindings/gpio/gpio.txt
+- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+  Example:
+	sgpio: sgpio@1e780200 {
+		#gpio-cells = <2>;
+		compatible = "aspeed,ast2500-sgpio";
+		gpio-controller;
+		interrupts = <40>;
+		reg = <0x1e780200 0x0100>;
+		clocks = <&syscon ASPEED_CLK_APB>;
+		interrupt-controller;
+		ngpios = <8>;
+		bus-frequency = <12000000>;
+	};
-- 
2.7.4

