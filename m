Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0CC6EB04
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2019 21:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730039AbfGSTZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jul 2019 15:25:05 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:59089 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfGSTZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jul 2019 15:25:05 -0400
X-AuditID: ac10606f-d27ff70000003324-49-5d3219109378
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 7D.6D.13092.019123D5; Fri, 19 Jul 2019 15:25:04 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Jul 2019 15:25:03 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>,
        <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Date:   Fri, 19 Jul 2019 15:24:50 -0400
Message-ID: <1563564291-9692-2-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWyRiBhgq6ApFGsweoGJYtdlzksvsw9xWIx
        /8g5Vovf5/8yW0z5s5zJYtPja6wWzavPMVtsnv+H0eLyrjlsFkuvX2SyaN17hN2B2+Nq+y52
        jzXz1jB6vL/Ryu5x8eMxZo9NqzrZPO5c28PmsXlJvcf5GQsZPT5vkgvgjOKySUnNySxLLdK3
        S+DK+DX9PEvBTJGKVRdPszYw7hboYuTkkBAwkfi19ytbFyMXh5DALiaJCf9Ws4IkhAQOM0oc
        XFsFYrMJqEns3TyHCcQWEciTOLz+LStIA7PAKSaJGfs6wRqEBewk1s8+xgxiswioSlze1MsC
        YvMK2Essn9rECrFNTuLmuU6wGk4BB4mvT1tYIJbZS5zdf4QRol5Q4uTMJ2BxZgEJiYMvXjBD
        1MhK3Dr0mAlijoLE877HLBMYBWYhaZmFpGUBI9MqRqHEkpzcxMyc9HIjvcTcTL3k/NxNjJCo
        yN/B+PGj+SFGJg7GQ4wSHMxKIry3X+rHCvGmJFZWpRblxxeV5qQWH2KU5mBREuddteZbjJBA
        emJJanZqakFqEUyWiYNTqoGR9/bxrQlKCWcstX8ueCk0taq/0622b+WVo+v+hVh6BN+d0NaS
        deGQJLvjDM830rdnrDSQEiuofX3/CquZ/y+r5fHBnLPPvH7lrJy0Usho1QTRysgDLP+SK/I3
        Fiws+1p3rqhX5Uq3+bPLt+b/+Rp/WuyidFase3pi49Sb5+7/P1XKuPh71iZpJZbijERDLeai
        4kQAfuefe3gCAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings to support SGPIO on AST2400 or AST2500.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
new file mode 100644
index 0000000..f9ed438
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
+- Documentation/devicetree/bindings/sgpio/gpio.txt
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

