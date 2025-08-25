Return-Path: <linux-gpio+bounces-24876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B16F8B337A8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE9721B214CF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 07:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2261288C81;
	Mon, 25 Aug 2025 07:20:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1737290DBC;
	Mon, 25 Aug 2025 07:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106445; cv=none; b=ZoWkbtJ1oIab+R9FF42+mh+FGeynA78IRt0keUu3KFU5f4wg83es5EAzpt7p8749mVc4EA5/7tTesC7XF4PUyFcMbm21RoL4BSGjdBD3rS4F7KsdQuDSP7lLqdZvEAqx/oR48EkCv8Ue7GB292B/XDWrWdoaXGgR4W7392jBmLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106445; c=relaxed/simple;
	bh=QhvZ73V/K6mLL1ZVf5apmdcoCnnEbaW/6rnCe2coUxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et6i7BwypphVajo7KkDveQQdDQfg/RnqeDAzMTsizKAxSkjBp6Qq+rliW5MghxLqRkh/AXxTmXKjpkrUoveAqVGS4qKJeo5zsR+zZW4c2vozwNrAEnLHtw2rDdtk2GevWaL8mWUoQLH0BiY5G8MUXIHbZAGUeajMoYzODU0lFTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M2F0wx2z9sSV;
	Mon, 25 Aug 2025 08:53:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJtlr8MteFdI; Mon, 25 Aug 2025 08:53:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M2934Mjz9sSW;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 563068B775;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Le2RSoDiCK6o; Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BEC28B768;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
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
Subject: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon, 25 Aug 2025 08:53:20 +0200
Message-ID: <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756104334.git.christophe.leroy@csgroup.eu>
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=2395; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QhvZ73V/K6mLL1ZVf5apmdcoCnnEbaW/6rnCe2coUxA=; b=W6xHYsyrYOAn4BTFu+CwZUgLJqa/yIwO5E6zIlNWEvIzGbrRY/khegwiLpqlOeuIDwey/zPRe mTg+QCWpd8SCrIH7+9uDPjPAp54QDCiVPc/fZdV08anMC4132ZfjU7F
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In the QE, a few GPIOs are IRQ capable. Similarly to
commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
GPIO"), add IRQ support to QE GPIO.

Add property 'fsl,qe-gpio-irq-mask' similar to
'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Here is an exemple for port B of mpc8323 which has IRQs for
GPIOs PB7, PB9, PB25 and PB27.

	qe_pio_b: gpio-controller@1418 {
		compatible = "fsl,mpc8323-qe-pario-bank";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		interrupt-parent = <&qepic>;
		gpio-controller;
		#gpio-cells = <2>;
		fsl,qe-gpio-irq-mask = <0x01400050>;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
index 09b1b05fa677..829fe9a3d70c 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
@@ -32,6 +32,15 @@ Required properties:
   "fsl,mpc8323-qe-pario-bank".
 - reg : offset to the register set and its length.
 - gpio-controller : node to identify gpio controllers.
+Optional properties:
+- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item tells
+  which ports have an associated interrupt (ports are listed in the same order
+  as in QE ports registers)
+- interrupts : This property provides the list of interrupt for each GPIO having
+  one as described by the fsl,cpm1-gpio-irq-mask property. There should be as
+  many interrupts as number of ones in the mask property. The first interrupt in
+  the list corresponds to the most significant bit of the mask.
+- interrupt-parent : Parent for the above interrupt property.
 
 Example:
 	qe_pio_a: gpio-controller@1400 {
@@ -42,6 +51,16 @@ Example:
 		gpio-controller;
 	  };
 
+	qe_pio_b: gpio-controller@1418 {
+		#gpio-cells = <2>;
+		compatible = "fsl,mpc8323-qe-pario-bank";
+		reg = <0x1418 0x18>;
+		interrupts = <4 5 6 7>;
+		fsl,qe-gpio-irq-mask = <0x01400050>;
+		interrupt-parent = <&qepic>;
+		gpio-controller;
+	  };
+
 	qe_pio_e: gpio-controller@1460 {
 		#gpio-cells = <2>;
 		compatible = "fsl,mpc8360-qe-pario-bank",
-- 
2.49.0


