Return-Path: <linux-gpio+bounces-25315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D0B3E28F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA431A8198D
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4939732C300;
	Mon,  1 Sep 2025 12:20:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6949731355E;
	Mon,  1 Sep 2025 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729251; cv=none; b=J12EiEQx5F28bkWs92O0SlfU8uS/MoUUeGaY1KPfthe9Bh8AUoUt0KBksDrDcuPlvs84fLh9p12vwy12IhEXMm+nMqQpYCDk7MMDGwc+MqWe71TzVRaLJrNISumMu77kIYCU8bwlWPf6NG2JyF4uQikPIk8XU5nFvtZyxFIXExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729251; c=relaxed/simple;
	bh=NiGGEzSVsJLntFwP1MIryFHdxpjk8igr3FrrVNxKPP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOZK1LMOZZ82eY8dyQrrfqcawmHGqcQeA8yZE4NZ2jqxd0g0khhy9iObOSPKdo940F7gKCmxw7/LoAUrxX2V9PjHKpGMx9NuIw241mAY6vY+iLtZjWeJv711DkuCdVt+fbQM9kXH/sr4fVR0SNNX7P6FJPedGrNL1yvs37fLnZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndK1HxPz9sT7;
	Mon,  1 Sep 2025 14:05:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoA5S3BHDBbU; Mon,  1 Sep 2025 14:05:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC6fbFz9sSr;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE69E8B790;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id r-KaAi8_MPiL; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AED58B77B;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
Date: Mon,  1 Sep 2025 14:05:13 +0200
Message-ID: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=3362; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=NiGGEzSVsJLntFwP1MIryFHdxpjk8igr3FrrVNxKPP0=; b=5WGZ5OgL+UExib3sv3fqbTbNCnvFZWxhkGlIIBNdXJikd0CcgFn/iAKdoshFpSqdsfhcw8u+A AJl1zujb3KNA/2ZISoit2AJr8HNP+vrVFJqtJpC2pYIMie16Qi8gN0s
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Convert QE QPIO devicetree binding to DT schema.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
---
 .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 53 +++++++++++++++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +--------
 2 files changed, 54 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
new file mode 100644
index 000000000000..e6ba319a75c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
+
+maintainers:
+  - Christophe Leroy <christophe.leroy@csgroup.eu>
+
+description:
+  Bindings for the Freescale QUICC Engine Parallel I/O (PARIO) GPIO controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,chip-qe-pario-bank
+      - const: fsl,mpc8323-qe-pario-bank
+
+  reg:
+    maxItems: 1
+    description: Offset to the register set and its length.
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    qe_pio_a: gpio-controller@1400 {
+        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    qe_pio_e: gpio-controller@1460 {
+        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1460 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
index 09b1b05fa677..782699c14567 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
@@ -24,28 +24,4 @@ par_io@1400 {
 
 Note that "par_io" nodes are obsolete, and should not be used for
 the new device trees. Instead, each Par I/O bank should be represented
-via its own gpio-controller node:
-
-Required properties:
-- #gpio-cells : should be "2".
-- compatible : should be "fsl,<chip>-qe-pario-bank",
-  "fsl,mpc8323-qe-pario-bank".
-- reg : offset to the register set and its length.
-- gpio-controller : node to identify gpio controllers.
-
-Example:
-	qe_pio_a: gpio-controller@1400 {
-		#gpio-cells = <2>;
-		compatible = "fsl,mpc8360-qe-pario-bank",
-		"fsl,mpc8323-qe-pario-bank";
-		reg = <0x1400 0x18>;
-		gpio-controller;
-	  };
-
-	qe_pio_e: gpio-controller@1460 {
-		#gpio-cells = <2>;
-		compatible = "fsl,mpc8360-qe-pario-bank",
-			     "fsl,mpc8323-qe-pario-bank";
-		reg = <0x1460 0x18>;
-		gpio-controller;
-	  };
+via its own gpio-controller node.
-- 
2.49.0


