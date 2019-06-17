Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E83486C1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 17:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfFQPOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 11:14:04 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:55575 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728170AbfFQPOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 11:14:04 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hctKc-000504-Ki from Harish_Kandiga@mentor.com ; Mon, 17 Jun 2019 08:14:02 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 17 Jun 2019 16:13:58 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V2 2/2] gpio: inverter: document the inverter bindings
Date:   Mon, 17 Jun 2019 20:43:45 +0530
Message-ID: <1560784425-20227-3-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560784425-20227-1-git-send-email-harish_kandiga@mentor.com>
References: <1560784425-20227-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the device tree binding for the inverter gpio
controller to configure the polarity of the gpio pins
used by the consumers.

Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
new file mode 100644
index 0000000..cc8fe55
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
@@ -0,0 +1,29 @@
+GPIO-INVERTER
+======
+This binding defines the gpio-inverter. The gpio-inverter is a driver that
+allows to properly describe the gpio polarities on the hardware.
+
+Please refer to gpio.txt for generic information regarding GPIO bindings.
+
+Required properties:
+- compatible : "gpio-inverter".
+- gpio-controller: Marks the port as GPIO controller.
+- #gpio-cells: Two. The first cell is the pin number and
+   the second cell is used to specify the gpio polarity as defined in
+   defined in <dt-bindings/gpio/gpio.h>:
+      0 = GPIO_ACTIVE_HIGH
+      1 = GPIO_ACTIVE_LOW
+- mapped-gpios: Array of GPIO pins required from consumers, whose polarity has
+  to be configured in the driver.
+- gpio-line-names: This is an array of strings defining the names for the
+  mapped-gpios correspondingly. Name should be defined for each gpio pin.
+
+Example:
+
+gpio_inv: gpio-inv {
+	compatible = "gpio-inverter";
+	gpio-controller;
+	#gpio-cell = <2>;
+	mapped-gpios = <&gpio5 24 1>, <&gpio7 0 1>, <&gpio7 1 1>;
+	gpio-line-names = "JTAG_DNL_EN", "lvds-pwrdwn", "lcd-on";
+};
--
2.7.4

