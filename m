Return-Path: <linux-gpio+bounces-25318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E83B3E294
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2938E4421CD
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449DC334394;
	Mon,  1 Sep 2025 12:21:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB1C30BF7B;
	Mon,  1 Sep 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729265; cv=none; b=W8bhode5xTqFmLIYARkvEJXpw0H8AL35DhgwW0+wIPyrbE9LaP7csNN9x810bl82Gcr8XSQPg3rLO1qeRuwUra4kGPDzw5RbIJTh0GphqdJMTTEvwqF1UnVaFyl6Lgeia80/gS8QDgFdqVo/cgeCaBT3Jw/bEv1OCAcF0iXtlpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729265; c=relaxed/simple;
	bh=59wZHIxllxZcwCrUxSll7FEcA0fEA5AxS+AodcoXc0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYjyuFAp6VLMOh1NvbvR5S0FEDgpy5RV3UH/50l50xIzznOlpkDYEB6/8Nf98pXuEe5VwpN9FcHyONbgZVHJ/QJT+Zmg2ApgbzUnpoQIAexuqOO5VElQLHXf3czz0mP9yJg3V+V4py83u3YqSzRU0/YWOmIHyr9J8/I0ipAkF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndL0hyTz9sT8;
	Mon,  1 Sep 2025 14:05:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8chmUpmbiw-6; Mon,  1 Sep 2025 14:05:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndD0SFrz9sSs;
	Mon,  1 Sep 2025 14:05:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB808B77B;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vyRL5fj0VNV1; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB70F8B78C;
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
Subject: [PATCH v5 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon,  1 Sep 2025 14:05:14 +0200
Message-ID: <4d7560f77dbd60f6297958acbc0cf412d8921856.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=3640; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=59wZHIxllxZcwCrUxSll7FEcA0fEA5AxS+AodcoXc0o=; b=cy9tS21IUHMGiZz2LkFhr/4YksRHLYEUvFGDBOX1axyjBo+bzEtfYV3xtcm8RSYCvbvRHjfst 3wmxkdbNoD3BJ0zgTn8FewQGYmGd3efkqIdatLK/NyqRDmBjpdLHkdM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In the QE, a few GPIOs have an associated IRQ to notify changes.
Add IRQ support to QE GPIO.

As not all GPIOs have an associated IRQ, the driver needs to know
to which GPIO corresponds each provided IRQ. This is provided via
multiple compatible properties:

	compatible = "fsl,mpc8323-qe-pario-bank-a"
	compatible = "fsl,mpc8323-qe-pario-bank-b"
	compatible = "fsl,mpc8323-qe-pario-bank-c"

	compatible = "fsl,mpc8360-qe-pario-bank-a"
	compatible = "fsl,mpc8360-qe-pario-bank-b"
	compatible = "fsl,mpc8360-qe-pario-bank-c"
	compatible = "fsl,mpc8360-qe-pario-bank-d"
	compatible = "fsl,mpc8360-qe-pario-bank-e"
	compatible = "fsl,mpc8360-qe-pario-bank-f"
	compatible = "fsl,mpc8360-qe-pario-bank-g"

	compatible = "fsl,mpc8568-qe-pario-bank-a"
	compatible = "fsl,mpc8568-qe-pario-bank-b"
	compatible = "fsl,mpc8568-qe-pario-bank-c"
	compatible = "fsl,mpc8568-qe-pario-bank-d"
	compatible = "fsl,mpc8568-qe-pario-bank-e"
	compatible = "fsl,mpc8568-qe-pario-bank-f"

When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
the origin compatible = "fsl,mpc8323-qe-pario-bank" is still valid.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Changed to DT schema
---
 .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
index e6ba319a75c1..80f93914c779 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
@@ -17,6 +17,22 @@ properties:
     items:
       - enum:
           - fsl,chip-qe-pario-bank
+          - fsl,mpc8323-qe-pario-bank-a
+          - fsl,mpc8323-qe-pario-bank-b
+          - fsl,mpc8323-qe-pario-bank-c
+          - fsl,mpc8360-qe-pario-bank-a
+          - fsl,mpc8360-qe-pario-bank-b
+          - fsl,mpc8360-qe-pario-bank-c
+          - fsl,mpc8360-qe-pario-bank-d
+          - fsl,mpc8360-qe-pario-bank-e
+          - fsl,mpc8360-qe-pario-bank-f
+          - fsl,mpc8360-qe-pario-bank-g
+          - fsl,mpc8568-qe-pario-bank-a
+          - fsl,mpc8568-qe-pario-bank-b
+          - fsl,mpc8568-qe-pario-bank-c
+          - fsl,mpc8568-qe-pario-bank-d
+          - fsl,mpc8568-qe-pario-bank-e
+          - fsl,mpc8568-qe-pario-bank-f
       - const: fsl,mpc8323-qe-pario-bank
 
   reg:
@@ -28,6 +44,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  interrupts:
+    description: List of interrupts for lines of the port that trigger interrupts on change.
+
 required:
   - compatible
   - reg
@@ -39,15 +58,19 @@ additionalProperties: false
 examples:
   - |
     qe_pio_a: gpio-controller@1400 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-a", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1400 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <0 1 2 3>;
+        interrupt-parent = <&qepic>;
     };
 
     qe_pio_e: gpio-controller@1460 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-e", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1460 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <19 20 21 22 23 24 25>;
+        interrupt-parent = <&qepic>;
     };
-- 
2.49.0


