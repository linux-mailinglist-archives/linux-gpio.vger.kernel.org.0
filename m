Return-Path: <linux-gpio+bounces-24268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51362B225C1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247933BF634
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9A32EA47E;
	Tue, 12 Aug 2025 11:20:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CE42E6137;
	Tue, 12 Aug 2025 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754997646; cv=none; b=DVPJnOqIKBKmLtMrNL5BAvRnhkCbngm3ToJws/ogLSE7KB7qAMPd0Aani0ogcXVave8jBj03U59RrsTx9lwT45rrk7jU+dQitSxlygL45/Kdi+mjSgEm0iplZ+1e/D0vZ1m7TsmLfbdVsMzEWlsmJr17SeVTo7QdpwYh4yLMAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754997646; c=relaxed/simple;
	bh=sBDv7vR+It1XYOsUbKJGVxht0ECRwLjzMeT3ejRDm/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5fqdY8t9JbUhGPYKbbCELfibq/9MJZf1eDJHTw/QPSyoZJ3+uQb7cJfn3EnUjh7a0r+4UyyBUr8k2ZNAnyizxNrXQERwbjeLgFssIDvCObqdsc0ZxkTQqRunwf2ilytpbokD1Q2R03E+Ff80Pyhf9qMVtrPqi9hwSMWS69zLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBR4kXzz9sT7;
	Tue, 12 Aug 2025 13:03:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3y8dTxRQA3KN; Tue, 12 Aug 2025 13:03:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBP5hjWz9sSs;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE0E58B763;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qz7WChCQ-Wh5; Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20F128B764;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
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
Subject: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Tue, 12 Aug 2025 13:02:54 +0200
Message-ID: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=2493; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=sBDv7vR+It1XYOsUbKJGVxht0ECRwLjzMeT3ejRDm/U=; b=BOrAHvPX1MdgLy+6wlTvGbgoypCVvvGj7lfPu6JAC3QbSLnZxuD3Vq6NaU3gedK/5SowU993K yN7/zKYS8O5AWY9thNswXKEYACGBAOQv5dd7OmZYqNex0uG2y6q4nwB
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it for that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 0000000000000..7c98706d03dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - name: Christophe Leroy
+    email: christophe.leroy@csgroup.eu
+
+description: |
+  Interrupt controller for the QUICC Engine I/O ports found on some
+  Freescale/NXP PowerQUICC and QorIQ SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+      - fsl,mpc8360-qe-ports-ic
+      - fsl,mpc8568-qe-ports-ic
+
+  reg:
+    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
+    minItems: 1
+    maxItems: 1
+
+  interrupt-controller:
+    type: boolean
+    description: Indicates this node is an interrupt controller.
+
+  '#address-cells':
+    const: 0
+    description: Must be 0.
+
+  '#interrupt-cells':
+    const: 1
+    description: Number of cells to encode an interrupt specifier.
+
+  interrupts:
+    minItems: 1
+    maxItems: 1
+    description: Interrupt line to which the QE I/O Ports controller is connected.
+
+  interrupt-parent:
+    description: Phandle to the parent interrupt controller.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-parent
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
-- 
2.49.0


