Return-Path: <linux-gpio+bounces-4626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B588B6B7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 02:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE5ACB27F37
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 00:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4FD1C2BD;
	Tue, 26 Mar 2024 00:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fc2yGcbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E071C2A3;
	Tue, 26 Mar 2024 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711414159; cv=none; b=sP0+CKQNmMA8/QaaXGSoHy29b4XUHz8LhuiMs9s+NtghkBsCetiIw/rX0DOSiHo4O2Yj2LD+r5OCwntnvHQm5ZTjW1pftSq2JTAlmreeiVL3m8n0FkjXfzdcgsqcK6oYjZLi4B3V5D2WppyuNVxyPGRJEutU6hMOexZgrwnhJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711414159; c=relaxed/simple;
	bh=ZEBOqBaWZq4XTNWGxVaYz12/UskACok8TQyXVE9Od1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Frc5yl0LD253MNrOwq8AYFfWQ4xgrqGTt+8+0GwBpYIF7N8eBGfVlZjAApVvpcCJ8kUrBQw1fE9w1WAHWc0RVXEAsgoo8ypqIUIdwiZbKmHNaPzPs5YoaT4n+MXbYf47UNWijj5wDTcyB12GCU9y7IuH15YofgpAZj/MHoVVmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fc2yGcbJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FA9FE0C;
	Tue, 26 Mar 2024 01:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711414124;
	bh=ZEBOqBaWZq4XTNWGxVaYz12/UskACok8TQyXVE9Od1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fc2yGcbJSQ6S4hPIs9KL5LRd/6tOZQVqt/V4CXUGu9h4sOMft8FdZnM1SxpRNpNJR
	 NDnHEFq8Wi9I2nYNeTn1dY8oirfQiHjBHxDp1PFgoBDv21ueD7NfNrfBD++J3fG+AS
	 z5brBJqnBWC0EbYzmAQHDs0FktZA2PwE+bgmuRLU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add gpio child node
Date: Tue, 26 Mar 2024 02:49:02 +0200
Message-ID: <20240326004902.17054-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike the other child nodes of the raspberrypi,bcm2835-firmware device,
the gpio child is documented in a legacy text-based binding in
gpio/raspberrypi,firmware-gpio.txt. This causes DT validation failures:

arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: 'gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

Convert the binding to YAML and move it to
raspberrypi,bcm2835-firmware.yaml.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 29 ++++++++++++++++++
 .../gpio/raspberrypi,firmware-gpio.txt        | 30 -------------------
 2 files changed, 29 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index dc38f2be7ad6..999e1bc49539 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -54,6 +54,29 @@ properties:
       - compatible
       - "#clock-cells"
 
+  gpio:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: raspberrypi,firmware-gpio
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+        description:
+          The first cell is the pin number, and the second cell is used to
+          specify the gpio polarity (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW).
+
+      gpio-line-names: true
+
+    required:
+      - compatible
+      - gpio-controller
+      - "#gpio-cells"
+
   reset:
     type: object
     additionalProperties: false
@@ -112,6 +135,12 @@ examples:
             #clock-cells = <1>;
         };
 
+        expgpio: gpio {
+            compatible = "raspberrypi,firmware-gpio";
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+
         reset: reset {
             compatible = "raspberrypi,firmware-reset";
             #reset-cells = <1>;
diff --git a/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
deleted file mode 100644
index ce97265e23ba..000000000000
--- a/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Raspberry Pi GPIO expander
-
-The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
-firmware exposes a mailbox interface that allows the ARM core to control the
-GPIO lines on the expander.
-
-The Raspberry Pi GPIO expander node must be a child node of the Raspberry Pi
-firmware node.
-
-Required properties:
-
-- compatible : Should be "raspberrypi,firmware-gpio"
-- gpio-controller : Marks the device node as a gpio controller
-- #gpio-cells : Should be two.  The first cell is the pin number, and
-  the second cell is used to specify the gpio polarity:
-  0 = active high
-  1 = active low
-
-Example:
-
-firmware: firmware-rpi {
-	compatible = "raspberrypi,bcm2835-firmware";
-	mboxes = <&mailbox>;
-
-	expgpio: gpio {
-		 compatible = "raspberrypi,firmware-gpio";
-		 gpio-controller;
-		 #gpio-cells = <2>;
-	 };
-};
-- 
Regards,

Laurent Pinchart


