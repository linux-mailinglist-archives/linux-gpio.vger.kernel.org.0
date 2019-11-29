Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 694D810D8C2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 17:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfK2Q6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 11:58:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53893 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfK2Q6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 11:58:23 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iajb2-00013m-2j; Fri, 29 Nov 2019 17:58:20 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iajb1-0005MF-Em; Fri, 29 Nov 2019 17:58:19 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, support.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: mfd: da9062: add gpio bindings
Date:   Fri, 29 Nov 2019 17:58:15 +0100
Message-Id: <20191129165817.20426-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129165817.20426-1-m.felsch@pengutronix.de>
References: <20191129165817.20426-1-m.felsch@pengutronix.de>
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
Changelog:

v2:
- remove sub-node documentation
- squash gpio properties into mfd documentation
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index edca653a5777..089a28bc77a4 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -13,6 +13,7 @@ da9062-rtc              :               : Real-Time Clock
 da9062-onkey            :               : On Key
 da9062-watchdog         :               : Watchdog Timer
 da9062-thermal          :               : Thermal
+da9062-gpio             :               : GPIOs
 
 The DA9061 PMIC consists of:
 
@@ -38,6 +39,15 @@ Required properties:
 See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
 further information on IRQ bindings.
 
+Optional properties:
+
+- gpio-controller : Marks the device as a gpio controller.
+- #gpio-cells     : Should be two. The first cell is the pin number and the
+                    second cell is used to specify the gpio polarity.
+
+See Documentation/devicetree/bindings/gpio/gpio.txt for further information on
+GPIO bindings.
+
 Sub-nodes:
 
 - regulators : This node defines the settings for the LDOs and BUCKs.
-- 
2.20.1

