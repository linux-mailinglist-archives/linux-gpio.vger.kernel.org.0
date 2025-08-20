Return-Path: <linux-gpio+bounces-24672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777EB2E386
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD14A235A5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09FF345754;
	Wed, 20 Aug 2025 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="czRh2mvz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902FF18BBB9;
	Wed, 20 Aug 2025 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710280; cv=pass; b=bOwbNsxjJIjEsmiynbrisZ1xVdpiwjbbwLddpBc404awYAfdN1ap2KuHM9TQOMbFC0T3ItGS1cBMd4zGvEn2bCL5OMCao8A5IT6URDT3QBMFbuN6zDRytsZxpzCHv6KAquhIkPlHute4WABXxurLP3h/gvP3KPsMJg9dprEIXlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710280; c=relaxed/simple;
	bh=GrZJKQObZvuYNJ3ctiE4UlmVdIRpwc2yP4nRI10ihmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkS9okKDUulD6ri83+oNlhRiw9Bx3yae6QyRf6s4Mxuo36oRKyy5ziam5rF4NAPvPnrlUnbRuy8RWDcH8doltkfTeNpZ8QPg6FvY29F4BHxKkxfHYtZ7JafgAQe/AXzKFFisNq0DJ0OxC16lIkXhcV5ot4qQaJBMBRImE8Ef1KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=czRh2mvz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jxMnTm6Cuq0s86rLXIMY4+PooMQsFtb1doQSY1MnqoA/Xqd1GOc9UWYlu16tWqn1cLRbAUsY8C96wu9EnUD0LdNCGiXyLINotXg+/S5NVQheSvUqlD76+eIdf7hBz3aGv+MjSJv+oX1vrMO5gFPr9/4/5y9WVHWpXkKazANYovs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710230; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ycniQyaJgGJqNZKTwz8OPAQgXyL5GobzzmE9CRpgq1Q=; 
	b=QA2/VXsJM1yPDLmu9RLzq/qNo/5wgIgdL8s6ggml4QgXh7m1a3g2oHdz1cnVFksiud7+63fQqkooIUDZAMbq7N52BRMdUoDUs5MSO/d5VUKo8b7acny+Afl1XVJn87VEZcrB2LcB4TXJbRO1JVSJ5dwwRWWTBjOF8bLVA9jpVX4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710230;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ycniQyaJgGJqNZKTwz8OPAQgXyL5GobzzmE9CRpgq1Q=;
	b=czRh2mvzHkUEpQ+isiTqQNdXOID4rSWSeTrMIHdCtSJQn8UmJQY5A6I/UrheE2AS
	UMqC1Qm+Hde8EWnoaR+Bje4ROzNkKoJQwKzzcYL07IMKyTUfGBoD790NCfpAMgyEteH
	4/n1O8QC2u3/FyE2yl7F1pR4kTc2DrPUGWpBEc1M=
Received: by mx.zohomail.com with SMTPS id 1755710228543472.88877592218955;
	Wed, 20 Aug 2025 10:17:08 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
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
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS MIP4 Touchscreen to YAML
Date: Wed, 20 Aug 2025 14:13:01 -0300
Message-ID: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
controller to a YAML schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
 .../input/touchscreen/melfas_mip4.txt         | 20 -------
 2 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
new file mode 100644
index 0000000000000..170fd4212467e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
@@ -0,0 +1,55 @@
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
+    const: "melfas,mip4_ts"
+
+  reg:
+    description: I2C address of the chip (0x48 or 0x34)
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ce-gpios:
+    description: GPIO connected to the CE (chip enable) pin of the chip
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


