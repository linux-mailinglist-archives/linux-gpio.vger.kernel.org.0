Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17442D445E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 15:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbgLIO3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 09:29:40 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:13722 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730096AbgLIO3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 09:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607524178; x=1639060178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aQKIASvjfKB2ZIa1sY5M5ArBbbYHMpb8duod/gP9B8g=;
  b=MzgjrO1KxmuJI7RY57eRuWk1SMqyOQ/Zzw5+A+EyU+fN9SigAIsQKx2h
   XRA1fkpVZ8A4DvYvB1prybwoWz47HNTRh8xum3qfTRQZSbbLnbG2MVURx
   u9C8rVgt1WLuCl6oWGxD9KRPGFmTZeI9vQ2uER9B+3hjSi4Jnpfyqdv53
   EEtf1YZ8uUG/b6ngy+FsaqUfk405geOeUpYH6JhKau/Mj1v9f9dF/DGoz
   EAHnUSBGWm4+jziGFrPhmIO79xtfs0N6jEvDhUW70FVz3cMpY7X6N9wN3
   NAbVqH6CVwmkw4CFQMnquqTWAxSTOhLdxeLVYrnEvxNkpCA8YbK+SVg+9
   w==;
IronPort-SDR: pjd57PINjurwEY6w+ve5EXW3sJ56RR2Y3cUkOPllhn1HSfO+QFjkukcDT/rRqfLf0WJHPNRxz4
 RvWYhJ1uUW4RSy1ogmEBUbYpElnSXGzKd/ria+fPqBY0NvSK7g+Nr1SByJeK2wQ03F9B8IBpdd
 k+RNEXC5QiZAWbD1mGdQcEFuXmT+ZFwPTC4uTSy18A16zn69PZbgU3UE56zsyeQyfqYiGBv6Yc
 3Z+5Gu8wSnFow7r9ZSmTRu8/eU2FFZGczPtOM6KiGqXnHid0QWE8zwhvNBM7pu34M2QwE46bfy
 hBQ=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="101529653"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Dec 2020 07:28:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 07:28:21 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 07:28:19 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH -next 2/3] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add irq support
Date:   Wed, 9 Dec 2020 15:27:52 +0100
Message-ID: <20201209142753.683208-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209142753.683208-1-lars.povlsen@microchip.com>
References: <20201209142753.683208-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This describe the new bindings for the added IRQ support in the
pinctrl-microchip-sgpio driver.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index 08325bf77a81..df0c83cb1c6e 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -91,6 +91,18 @@ patternProperties:
          controlled indirectly by the "ngpios" property: (ngpios/32).
         const: 3
 
+      interrupts:
+        description: Specifies the sgpio IRQ (in parent controller)
+        maxItems: 1
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        description:
+         Specifies the pin (port and bit) and flags, as defined in
+         defined in include/dt-bindings/interrupt-controller/irq.h
+        const: 3
+
       ngpios:
         description: The numbers of GPIO's exposed. This must be a
           multiple of 32.
@@ -118,6 +130,7 @@ required:
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     sgpio2: gpio@1101059c {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -134,6 +147,9 @@ examples:
         gpio-controller;
         #gpio-cells = <3>;
         ngpios = <96>;
+        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
       };
       sgpio_out2: gpio@1 {
         compatible = "microchip,sparx5-sgpio-bank";
-- 
2.25.1

