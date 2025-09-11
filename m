Return-Path: <linux-gpio+bounces-25977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8BB53788
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6FD1C86E08
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0056369353;
	Thu, 11 Sep 2025 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="H9jOcS9S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968E33570D9;
	Thu, 11 Sep 2025 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603768; cv=pass; b=IFs3LHMEYprVkz9Tt50hKjYdx5J+Qqu+PAcHFAgrQyZpFw8MFCKii//qspsN4dYx+oDxm5vWX9eXzaEN4rho84bYUHeIEALEb8+4kzM4ibI9Zf5hpkI0ylMJdC1HWtXrdZx2kjfm4GM3QdGY31MiCZ12KPOy1CocIwmjkA6EwLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603768; c=relaxed/simple;
	bh=8m+L9EuCiB2kd+H+6i0/olJjoUQfOiV+U9l4XmnkecM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8sxg1crDxLfeTODI7/MG9tYdLYJB3ntOFIhUQprfx1HA4pST7FZa2dfnbahKqJNxdVLNgn84cS2zqLp7dkWob3keICLP3iTjCvqgn9WZEsz7nScVfzlFX0yyAsV7a2MXHrXPFrVmFqHodDba/WSM+x0H3SVfe3P9kdDaJAOQAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=H9jOcS9S; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XdFivKCZ1zSV2DL8A2apCZSVhyGEctH5ibbsN5jnFp92ih8VPPHUt1cYWhfClmon7J3wdT8XMj835fnw3QSHdTqDIxOx9aCzGLYJA3MrC1PM35mhAw9g4XRSaMvjWn0Ebda4XdnOLXWLtITXwA+ZSUO3MG9s0cd845vDoG9CAYo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603713; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5GbnEMgGDcefdIhwqbOGABlaP4C+kCbcjuGMBFPW0FU=; 
	b=AJrDS76FnZIW0jLOYXGptiWpzTsBY+npeA8L7BwDefMBU9NbrNHLq5zshxQ6M9UrIsvXqA9LyHtkTCul0qwIFQh2RuSjtHZnC0VBqs5hohXvNancIOHVZC2uroKOXNJxEcmbfsCm1bodh69SN+uOvAnD+aTfYV6zKMe8pJ4GNiI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603713;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5GbnEMgGDcefdIhwqbOGABlaP4C+kCbcjuGMBFPW0FU=;
	b=H9jOcS9Sf+b45wYgJY5wui9mLzHAFv/8dEF8qzkXIwmkNeLdBo+3737VQFbvZ329
	cmuyy3V5VCxxklt+8rkDs/4GE0lvqHaocm3GFfgriUVQNIxO+SuJiePrxoKtuMAXu3C
	ptx0CFAAXKTJtBC4k5JxeWR+Itv5KV3s+U4F5ous=
Received: by mx.zohomail.com with SMTPS id 1757603711035627.8749849505076;
	Thu, 11 Sep 2025 08:15:11 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 12/12] dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema
Date: Thu, 11 Sep 2025 12:10:01 -0300
Message-ID: <20250911151001.108744-13-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
controller to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../input/touchscreen/melfas,mip4_ts.yaml     | 56 +++++++++++++++++++
 .../input/touchscreen/melfas_mip4.txt         | 20 -------
 2 files changed, 56 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
new file mode 100644
index 0000000000000..314be65c56caa
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MELFAS MIP4 Touchscreen
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: melfas,mip4_ts
+
+  reg:
+    description: I2C address of the chip (0x48 or 0x34)
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ce-gpios:
+    description:
+      GPIO connected to the CE (chip enable) pin of the chip (active high)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@34 {
+            compatible = "melfas,mip4_ts";
+            reg = <0x34>;
+
+            interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+            ce-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-0 = <&touchscreen_default>;
+            pinctrl-names = "default";
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt b/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
deleted file mode 100644
index b2ab5498e5190..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* MELFAS MIP4 Touchscreen
-
-Required properties:
-- compatible: must be "melfas,mip4_ts"
-- reg: I2C slave address of the chip (0x48 or 0x34)
-- interrupts: interrupt to which the chip is connected
-
-Optional properties:
-- ce-gpios: GPIO connected to the CE (chip enable) pin of the chip
-
-Example:
-	i2c@00000000 {
-		touchscreen: melfas_mip4@48 {
-			compatible = "melfas,mip4_ts";
-			reg = <0x48>;
-			interrupt-parent = <&gpio>;
-			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-			ce-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
-		};
-	};
-- 
2.50.1


