Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B401B133FA2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 11:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgAHKsR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 05:48:17 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56257 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgAHKsI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 05:48:08 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip8se-0000ea-5E; Wed, 08 Jan 2020 11:48:04 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip8sd-000156-Ia; Wed, 08 Jan 2020 11:48:03 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: mfd: da9062: add gpio bindings
Date:   Wed,  8 Jan 2020 11:47:44 +0100
Message-Id: <20200108104746.1765-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108104746.1765-1-m.felsch@pengutronix.de>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
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
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
Changelog:

v2:
- remove sub-node documentation
- squash gpio properties into mfd documentation
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index bc4b59de6a55..857af982c88f 100644
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

