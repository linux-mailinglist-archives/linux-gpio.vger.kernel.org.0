Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84937AC42
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 17:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732318AbfG3PZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 11:25:17 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:61512 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729202AbfG3PZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 11:25:17 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-80-5d40615d96f9
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id C0.CD.14973.D51604D5; Tue, 30 Jul 2019 11:25:17 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 30 Jul 2019 11:25:15 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Stanley <joel@jms.id.au>, <devicetree@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>
Subject: [v6 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Date:   Tue, 30 Jul 2019 11:24:27 -0400
Message-ID: <1564500268-2627-2-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564500268-2627-1-git-send-email-hongweiz@ami.com>
References: <1564500268-2627-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWyRiBhgm5sokOswYTPhha7LnNYfJl7isVi
        /pFzrBa/z/9ltpjyZzmTxabH11gtmlefY7bYPP8Po8XlXXPYLFr3HmF34PK42r6L3eP9jVZ2
        j4sfjzF7bFrVyeZx59oeNo/NS+o9zs9YyOjxeZNcAEcUl01Kak5mWWqRvl0CV8av6edZCmaK
        VKy6eJq1gXG3QBcjJ4eEgInEjXnn2LsYuTiEBHYxSZy9+ZsNwjnMKHH6wSd2kCo2ATWJvZvn
        MIEkRAT6GSXu9DaAJZgFWpgkPi8rArGFBewkHp2bzApiswioSqxdtBTM5hWwl/jc+5cFYp2c
        xM1zncxdjBwcnAIOEjve+oGEhYBKDm9fxQJRLihxcuYTFojxEhIHX7xghqiRlbh16DETxBgF
        ied9j1kmMArMQtIyC0nLAkamVYxCiSU5uYmZOenlhnqJuZl6yfm5mxghEbBpB2PLRfNDjEwc
        jIcYJTiYlUR4F4vbxwrxpiRWVqUW5ccXleakFh9ilOZgURLnXbnmW4yQQHpiSWp2ampBahFM
        lomDU6qBcWPkW9aw8EjvXWVy1qfWyHKfeFXl/XXirtVqK7Vk7z38YvDdPiMsaE4/i5UohzKb
        SfPL9bZre1f/P5OtudXiiLilt21dwlV166R2Nv+jkXaq1UuKVy26/aQvKjTnt4ZX8bW4qJo5
        TlIVMzd/FbLhO7Ju6mk3E29vkS9Trt9dHfxuQpVH4rFcJZbijERDLeai4kQAYytEwG4CAAA=
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

