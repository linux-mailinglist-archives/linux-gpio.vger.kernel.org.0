Return-Path: <linux-gpio+bounces-26339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09903B861AD
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 18:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEDCD7AC5F0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 16:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FE42512D8;
	Thu, 18 Sep 2025 16:50:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB86D221F29;
	Thu, 18 Sep 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758214242; cv=none; b=j11H9edmHXgbTAMdEYoREqjFYOJ/N2AiP8dPIAEspHtnFHPluZtZtQ489kMHiEmCs31kGwyjFvdHazL4Iau9GsElJA4uIqSDTJxuRv8HMoDr4oNrlWDtBU1/yK5aERUfuyM6NwaQeHWjpihCg5B9H+6P488lH6ltZvU81loob5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758214242; c=relaxed/simple;
	bh=Dvuwwh8MSNUgRklML1mjdeLSnlO6YfBO8ze0l2VRvwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W58dyZfUXyfi3JKVg7QOeAzBR4PpRK3HWXApE0UgK6MG58dyfyrnYIHEYMfcz74vIPUljFU8RI2afKeasRVyVYpLq9KmIH+gN3G3chWpO4ebmXx5de/EsC3DYlMOxVdArt3enmSS7OqqKnDvXFzwhSPU86JYN6U2Vgy7uy+g9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY71M6Mz9sg6;
	Thu, 18 Sep 2025 18:23:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39bHytEGPYRx; Thu, 18 Sep 2025 18:23:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY53wZdz9sfx;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 768F88B767;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MPO8j3rwFKzz; Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B88608B776;
	Thu, 18 Sep 2025 18:23:36 +0200 (CEST)
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
Subject: [PATCH v6 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
Date: Thu, 18 Sep 2025 18:23:26 +0200
Message-ID: <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212606; l=3281; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Dvuwwh8MSNUgRklML1mjdeLSnlO6YfBO8ze0l2VRvwk=; b=772HlsH6h7UbPeuqAuXNjZe1qUDYjxe+koslvNmvWWXiaDk343uXnAoM6Ktsbnm/d8eLZYDLB GfJSIX1NDfkAW8rn07MXW6bSNkPxrqaok3BYmgU4ZotlEFyuJ2gkImU
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Convert QE QPIO devicetree binding to DT schema.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v6: Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.
---
 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 49 +++++++++++++++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +---------
 2 files changed, 50 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
new file mode 100644
index 000000000000..0dd9c0e6ca39
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
@@ -0,0 +1,49 @@
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
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,chip-qe-pario-bank
+      - const: fsl,mpc8323-qe-pario-bank
+
+  reg:
+    maxItems: 1
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
+    gpio-controller@1400 {
+        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    gpio-controller@1460 {
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


