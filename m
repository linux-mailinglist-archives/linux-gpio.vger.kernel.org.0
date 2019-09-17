Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DE5B4C6A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 12:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfIQK7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 06:59:08 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44857 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfIQK7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 06:59:08 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iABCK-0006HL-Ur; Tue, 17 Sep 2019 12:59:04 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iABCK-0000Nh-HI; Tue, 17 Sep 2019 12:59:04 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, support.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/3] dt-bindings: mfd: da9062: add gpio bindings
Date:   Tue, 17 Sep 2019 12:59:00 +0200
Message-Id: <20190917105902.445-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917105902.445-1-m.felsch@pengutronix.de>
References: <20190917105902.445-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpio device documentation to make the da9062 gpios available for
users.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/gpio/gpio-da9062.txt  | 26 +++++++++++++++++++
 .../devicetree/bindings/mfd/da9062.txt        |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-da9062.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-da9062.txt b/Documentation/devicetree/bindings/gpio/gpio-da9062.txt
new file mode 100644
index 000000000000..b0f9236a7176
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-da9062.txt
@@ -0,0 +1,26 @@
+GPIO driver for DA9062 Power management IC (PMIC)
+
+Device has 5 GPIO pins which can be configured as GPIO as well as the
+special IO functions.
+
+Required properties:
+-------------------
+- compatible      : Should be "dlg,da9062-gpio".
+- gpio-controller : Marks the device node as a gpio controller.
+- #gpio-cells     : Should be two. The first cell is the pin number and the
+                    second cell is used to specify the gpio polarity.
+
+See Documentation/devicetree/bindings/gpio/gpio.txt for further information on
+GPIO bindings.
+
+Example:
+--------
+	pmic@58 {
+		...
+		pmic_gpio: gpio {
+			compatible = "dlg,da9062-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+		...
+	};
diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index edca653a5777..eec69c4f0697 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -13,6 +13,7 @@ da9062-rtc              :               : Real-Time Clock
 da9062-onkey            :               : On Key
 da9062-watchdog         :               : Watchdog Timer
 da9062-thermal          :               : Thermal
+da9062-gpio             :               : GPIOs
 
 The DA9061 PMIC consists of:
 
@@ -76,6 +77,8 @@ Sub-nodes:
 
 - thermal : See ../thermal/da9062-thermal.txt
 
+- gpio : See ../gpio/gpio-da9062.txt
+
 Example:
 
 	pmic0: da9062@58 {
-- 
2.20.1

