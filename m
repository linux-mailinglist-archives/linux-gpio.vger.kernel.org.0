Return-Path: <linux-gpio+bounces-4625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AF88B65A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 01:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454911C35B10
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 00:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CFB1C28F;
	Tue, 26 Mar 2024 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XPj/FIg7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657F1BF2B;
	Tue, 26 Mar 2024 00:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711414157; cv=none; b=uEgbmD5ImEzl4PEN/+lqMTW/6Ea+d/f5mjiKhNRK0wFrlJszuGlf+ZC0VRTLtf82tedYUFzqGeGNK8mtRgbHvHdbEZ0uwMEwnPsnSVdSrfLnSjiODdGduBW0df0R/Zt/HTYfZNF2fLEgp33GKq3j7CYgZD6+vlYG5d6IJnx0T78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711414157; c=relaxed/simple;
	bh=Sa9IRMvtnM0QuweKJqjKjWNjgJdZneOoJNDLhMrwbb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dzw/yvLUWFtVGOaw37loApi8XEcdxaGhb048ZozpJ5PBRunxYBf+/kzKisXnG6vadEQEfap99aAekJDAY22IIAzFVAYpy6n6Wc8Rwg/+kCt1eju+lKhtm/gtvmr8ou8hU3Pn2kU4tzyqlWJC1aPAa9jfrqkdBlWKNyfF9qoUt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XPj/FIg7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD41E675;
	Tue, 26 Mar 2024 01:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711414123;
	bh=Sa9IRMvtnM0QuweKJqjKjWNjgJdZneOoJNDLhMrwbb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XPj/FIg7GSBXfFSfkKjdOzdtQJSxDyOBAlddB3shbF6rY4OlB5MazwtNuyYffb/j3
	 A42OJj+4tz7VqGCPzpDs7Hg8cDIfQ3Y7Z+e8jSen5/t98Td72nG8QFY5yYo2FBdvko
	 43/Vvfgtp1IzA382O5pptF8LvEQNdqTgbTRe4OCA=
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
Subject: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add missing properties
Date: Tue, 26 Mar 2024 02:49:01 +0200
Message-ID: <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
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

The raspberrypi,bcm2835-firmware devices requires a dma-ranges property,
and, as a result, also needs to specify #address-cells and #size-cells.
Those properties have been added to thebcm2835-rpi.dtsi in commits
be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmware
bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DMA
limitations"), but the DT bindings haven't been updated, resulting in
validation errors:

arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges', 'gpio' do not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

Fix this by adding the properties to the bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 39e3c248f5b7..dc38f2be7ad6 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -25,6 +25,14 @@ properties:
       - const: raspberrypi,bcm2835-firmware
       - const: simple-mfd
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  dma-ranges: true
+
   mboxes:
     maxItems: 1
 
@@ -81,6 +89,9 @@ properties:
 
 required:
   - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - dma-ranges
   - mboxes
 
 additionalProperties: false
@@ -89,6 +100,11 @@ examples:
   - |
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges;
+
         mboxes = <&mailbox>;
 
         firmware_clocks: clocks {
-- 
Regards,

Laurent Pinchart


