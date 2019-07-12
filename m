Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183DB675B8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2019 22:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfGLUOF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jul 2019 16:14:05 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:56173 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfGLUOF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jul 2019 16:14:05 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-24-5d28ea136749
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id F5.C9.14973.31AE82D5; Fri, 12 Jul 2019 16:14:11 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Jul 2019 16:14:03 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <devicetree@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 2/3 v2] dt-bindings: gpio: aspeed: Add SGPIO support
Date:   Fri, 12 Jul 2019 16:14:00 -0400
Message-ID: <1562962440-15908-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWyRiBhgq7wK41Yg6nnFSx2Xeaw+DL3FIvF
        /CPnWC1+n//LbDHlz3Imi02Pr7FaNK8+x2yxef4fRovLu+awWSy9fpHJonXvEXYHbo+r7bvY
        PdbMW8Po8f5GK7vHxY/HmD02repk87hzbQ+bx+Yl9R7nZyxk9Pi8SS6AM4rLJiU1J7MstUjf
        LoErY9+ehUwF0wUqTn3eydzAOJu3i5GDQ0LARKJ9V0oXIxeHkMAuJonbr+6yQDiHGSWuv//O
        3sXIycEmoCaxd/McJpCEiEAvo8TCr4vBHGaB1UwS7RuOg1UJC7hIrDjbywZiswioSnSduscC
        YvMKOEj8/vcMrEZCQE7i5rlOZoi4oMTJmU/AapgFJCQOvngBFhcSkJW4degxE0S9gsTzvscs
        Exj5ZiFpmYWkZQEj0ypGocSSnNzEzJz0ckO9xNxMveT83E2MkDDftIOx5aL5IUYmDsZDjBIc
        zEoivKv+q8cK8aYkVlalFuXHF5XmpBYfYpTmYFES51255luMkEB6YklqdmpqQWoRTJaJg1Oq
        gXHrH3H5dyUOYndeT792gKF/9TWfu/JlgYeeynnI3Y85Usbu+/belScZh3c/qHo/3/7V0+Yz
        j6JvzazNPCyYoJQt2nG577PPld4XzYuFhApW35PqC5m+ib00fXuDtfr82ODzTw+W9XvZvf/v
        /iLwx+r2r8VfFdf+bDk1c7K8xk7eexIfAoXeX7JUYinOSDTUYi4qTgQADUXdmGECAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings to support SGPIO on AST2400 or AST2500.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
new file mode 100755
index 0000000..3ae2b79
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
@@ -0,0 +1,43 @@
+Aspeed SGPIO controller Device Tree Bindings
+-------------------------------------------
+
+Required properties:
+- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
+
+- #gpio-cells 		: Should be two
+			  - First cell is the GPIO line number
+			  - Second cell is used to specify optional
+			    parameters (unused)
+
+- reg			: Address and length of the register set for the device
+- gpio-controller	: Marks the device node as a GPIO controller.
+- interrupts		: Interrupt specifier (see interrupt bindings for
+			  details)
+
+- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
+
+- nr-gpios		: number of GPIO pins to serialise. (should be multiple of 8, up to 80 pins)
+			  if not specified, defaults to 80.
+
+- clocks               : A phandle to the APB clock for SGPM clock division
+
+- bus-frequency	: SGPM CLK frequency, if not specified defaults to 1 MHz
+
+
+The sgpio and interrupt properties are further described in their respective bindings documentation:
+
+- Documentation/devicetree/bindings/sgpio/gpio.txt
+- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+  Example:
+	sgpio@1e780200 {
+		#gpio-cells = <2>;
+		compatible = "aspeed,ast2500-sgpio";
+		gpio-controller;
+		interrupts = <40>;
+		reg = <0x1e780200 0x0100>;
+		clocks = <&syscon ASPEED_CLK_APB>;
+		interrupt-controller;
+		nr-gpios = <80>;
+		bus-frequency = <1000000>;
+	};
-- 
2.7.4

