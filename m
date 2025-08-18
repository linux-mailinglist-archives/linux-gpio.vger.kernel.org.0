Return-Path: <linux-gpio+bounces-24490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F0B29D85
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 11:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7685167027
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 09:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D1730DEB6;
	Mon, 18 Aug 2025 09:20:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E372D7D42;
	Mon, 18 Aug 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508847; cv=none; b=TOqprEdY7ZJOxt12EVKmpZspLSSCzlYO7/IWNyKnPK+IQV98KuaWpwCzIs/oIgquQ/FczJaTIYGJQmoQYqffMny3aabYNwqwfljPiD9Q40aCy5ne7DWlXCRhvNHr4SeNkbOkNsEL2KbHMqyBYunD4pf6ubGb1CCGtFCBtKAxDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508847; c=relaxed/simple;
	bh=FsJjFzo97CaIj8ecmEYrlheS4JZRtCwCquhmLdyFc7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqkU5ePIkXtFKyOwIEFPyMXmJb5ykZRPnfMoGJHEMFLQaSFTtonEkMFwINQCoVMdownpSzatzBBua7JkJA9mLBengS4GzCwv8mrZ3rprMVtsxcCemkaVHUzAtJwy7Q3x0zxmywO7K3TQt/n+OKTgaY2Wa3SLgMAUN1fKJHbpkzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sf33SKz9sX4;
	Mon, 18 Aug 2025 10:46:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rx4zHsvHPdak; Mon, 18 Aug 2025 10:46:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sZ1ZzKz9sWh;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 217968B763;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id giALWGHkvImb; Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EDCBB8B764;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
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
Subject: [PATCH v2 5/5] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Mon, 18 Aug 2025 10:45:58 +0200
Message-ID: <be8952a26d7a8d55ff96e4547f6c107094988220.1755506608.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755506608.git.christophe.leroy@csgroup.eu>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=2392; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=FsJjFzo97CaIj8ecmEYrlheS4JZRtCwCquhmLdyFc7U=; b=hFHnrqREIMbLuXYAIGjkJ3D28meiD7b8MHSCYawlfY+LlUHthVv1wORv0SDpFEM2Ka+xgcy44 ih8BI2ai0K2Dpx8Wvzs9qmU5X2t5EZKhQym3hoV6sJGw8lmJpxLC2XS
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it for that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Fixed problems reported by 'make dt_binding_check'
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 000000000000..b7c74c66347c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - Christophe Leroy <christophe.leroy@csgroup.eu>
+
+description:
+  Interrupt controller for the QUICC Engine I/O ports found on some Freescale/NXP PowerQUICC and QorIQ SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+      - fsl,mpc8360-qe-ports-ic
+      - fsl,mpc8568-qe-ports-ic
+
+  reg:
+    maxItems: 1
+    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
+
+  interrupt-controller: true
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line to which the QE I/O Ports controller is connected.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@c00 {
+      interrupt-controller;
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      reg = <0xc00 0x18>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
+    };
-- 
2.49.0


