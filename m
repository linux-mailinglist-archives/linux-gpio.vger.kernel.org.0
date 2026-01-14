Return-Path: <linux-gpio+bounces-30520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9721FD1D9FC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D89B3300699B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 09:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A76A38A2A4;
	Wed, 14 Jan 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1bAWNE8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C138946D;
	Wed, 14 Jan 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383649; cv=none; b=q0yhNTLn4NpM4wmewVX2LDhp1RVGJguCEZfAMXjeHsGbloayra2XB9sM/lrWEF2KJM5phfcWc/LDDPSVYyEujGHjEwhm7NADgf2PevDRJFqkE/GxCsJCA8+gMOo2W5L+zEtJ+0QEJmTpKYKcQeUH9jVS/Yhpewty0yZxFkHISKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383649; c=relaxed/simple;
	bh=0Xlyw1PR4o+6+vS2gGoZ78tBAwiolEXSxjFvlBUZ5HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdYT9KOipzJuJWcYm6fV53DmbD/y6on0Ltrmlwt0KIa3Pl11wQsI3BaDWZk9BUvqVZnCSmo6fVrPjXBZ+d6dJ9cqXzbEjWM0fu7NI9eyRI+OU3L83jU3mPZ43M//o9fy2jHe7s8ifi4JMYRlbEJ1OETlOmKvKsls3Lb2aGRrNUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1bAWNE8S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E186B1A2863;
	Wed, 14 Jan 2026 09:40:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7C526074A;
	Wed, 14 Jan 2026 09:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DAB6103C80C0;
	Wed, 14 Jan 2026 10:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768383642; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T+NWUCrzZZE7w9WZkyVej7pOY9XsMvaBl3vuZX0qFVM=;
	b=1bAWNE8SIg5vzHKx2jCq3mO2Feqk2wgahgfaYwa9S2eA+ySM7g0iY/aNld0eQ1WGbyQ18h
	gY1dqReP+hq8vnh4ngjWqUE3WhYsRGPNT5QIzo8ux9LWxrM2eghHXPEV6ckv/cOnSt9kS/
	lkbR2o3g2P122loLV48wW1PyqB2vNeJVEct7G4sD4pMH6bAeXOoeqNaYf2PfdNZvW26eJz
	RmZfbvyqtlf4FvjBY2EI3y3SiivqauF1e75Y+siYSPLxq2e4yd4l8oFb2WJvLzuDKugF7I
	R0f7EvbI/EXEZ1F6w50Nn6A3i+ieBiuMatKuMgEb0H0mNifsDqUyZnc1QMwuCg==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v8 2/8] of: unittest: Add a test case for for_each_of_imap_item iterator
Date: Wed, 14 Jan 2026 10:39:31 +0100
Message-ID: <20260114093938.1089936-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114093938.1089936-1-herve.codina@bootlin.com>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Recently for_each_of_imap_item iterator has been introduce to help
drivers in parsing the interrupt-map property.

Add a test case for this iterator.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../of/unittest-data/tests-interrupts.dtsi    |   9 ++
 drivers/of/unittest.c                         | 116 ++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/of/unittest-data/tests-interrupts.dtsi b/drivers/of/unittest-data/tests-interrupts.dtsi
index 4ccb54f91c30..974f888c9b15 100644
--- a/drivers/of/unittest-data/tests-interrupts.dtsi
+++ b/drivers/of/unittest-data/tests-interrupts.dtsi
@@ -50,6 +50,15 @@ test_intmap1: intmap1 {
 				interrupt-map = <0x5000 1 2 &test_intc0 15>;
 			};
 
+			intmap2 {
+				#interrupt-cells = <2>;
+				#address-cells = <0>;
+				interrupt-map = <1 11 &test_intc0 100>,
+						<2 22 &test_intc1 200 201 202>,
+						<3 33 &test_intc2 300 301>,
+						<4 44 &test_intc2 400 401>;
+			};
+
 			test_intc_intmap0: intc-intmap0 {
 				#interrupt-cells = <1>;
 				#address-cells = <1>;
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 388e9ec2cccf..d88a12f23ad5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1654,6 +1654,121 @@ static void __init of_unittest_parse_interrupts_extended(void)
 	of_node_put(np);
 }
 
+struct of_unittest_expected_imap_item {
+	u32 child_imap_count;
+	u32 child_imap[2];
+	const char *parent_path;
+	int parent_args_count;
+	u32 parent_args[3];
+};
+
+static const struct of_unittest_expected_imap_item of_unittest_expected_imap_items[] = {
+	{
+		.child_imap_count = 2,
+		.child_imap = {1, 11},
+		.parent_path = "/testcase-data/interrupts/intc0",
+		.parent_args_count = 1,
+		.parent_args = {100},
+	}, {
+		.child_imap_count = 2,
+		.child_imap = {2, 22},
+		.parent_path = "/testcase-data/interrupts/intc1",
+		.parent_args_count = 3,
+		.parent_args = {200, 201, 202},
+	}, {
+		.child_imap_count = 2,
+		.child_imap = {3, 33},
+		.parent_path = "/testcase-data/interrupts/intc2",
+		.parent_args_count = 2,
+		.parent_args = {300, 301},
+	}, {
+		.child_imap_count = 2,
+		.child_imap = {4, 44},
+		.parent_path = "/testcase-data/interrupts/intc2",
+		.parent_args_count = 2,
+		.parent_args = {400, 401},
+	}
+};
+
+static void __init of_unittest_parse_interrupt_map(void)
+{
+	const struct of_unittest_expected_imap_item *expected_item;
+	struct device_node *imap_np, *expected_parent_np;
+	struct of_imap_parser imap_parser;
+	struct of_imap_item imap_item;
+	int count, ret, i;
+
+	if (of_irq_workarounds & (OF_IMAP_NO_PHANDLE | OF_IMAP_OLDWORLD_MAC))
+		return;
+
+	imap_np = of_find_node_by_path("/testcase-data/interrupts/intmap2");
+	if (!imap_np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	ret = of_imap_parser_init(&imap_parser, imap_np, &imap_item);
+	if (unittest(!ret, "of_imap_parser_init(%pOF) returned error %d\n",
+		     imap_np, ret))
+		goto end;
+
+	expected_item = of_unittest_expected_imap_items;
+	count = 0;
+
+	for_each_of_imap_item(&imap_parser, &imap_item) {
+		if (unittest(count < ARRAY_SIZE(of_unittest_expected_imap_items),
+			     "imap item number %d not expected. Max number %zu\n",
+			     count, ARRAY_SIZE(of_unittest_expected_imap_items) - 1)) {
+			of_node_put(imap_item.parent_args.np);
+			goto end;
+		}
+
+		expected_parent_np = of_find_node_by_path(expected_item->parent_path);
+		if (unittest(expected_parent_np,
+			     "missing dependent testcase data (%s)\n",
+			     expected_item->parent_path)) {
+			of_node_put(imap_item.parent_args.np);
+			goto end;
+		}
+
+		unittest(imap_item.child_imap_count == expected_item->child_imap_count,
+			 "imap[%d] child_imap_count = %u, expected %u\n",
+			 count, imap_item.child_imap_count,
+			 expected_item->child_imap_count);
+
+		for (i = 0; i < expected_item->child_imap_count; i++)
+			unittest(imap_item.child_imap[i] == expected_item->child_imap[i],
+				 "imap[%d] child_imap[%d] = %u, expected %u\n",
+				 count, i, imap_item.child_imap[i],
+				 expected_item->child_imap[i]);
+
+		unittest(imap_item.parent_args.np == expected_parent_np,
+			 "imap[%d] parent np = %pOF, expected %pOF\n",
+			 count, imap_item.parent_args.np, expected_parent_np);
+
+		unittest(imap_item.parent_args.args_count == expected_item->parent_args_count,
+			 "imap[%d] parent param_count = %d, expected %d\n",
+			 count, imap_item.parent_args.args_count,
+			 expected_item->parent_args_count);
+
+		for (i = 0; i < expected_item->parent_args_count; i++)
+			unittest(imap_item.parent_args.args[i] == expected_item->parent_args[i],
+				 "imap[%d] parent param[%d] = %u, expected %u\n",
+				 count, i, imap_item.parent_args.args[i],
+				 expected_item->parent_args[i]);
+
+		of_node_put(expected_parent_np);
+		count++;
+		expected_item++;
+	}
+
+	unittest(count == ARRAY_SIZE(of_unittest_expected_imap_items),
+		 "Missing items. %d parsed, expected %zu\n",
+		 count, ARRAY_SIZE(of_unittest_expected_imap_items));
+end:
+	of_node_put(imap_np);
+}
+
 #if IS_ENABLED(CONFIG_OF_DYNAMIC)
 static void __init of_unittest_irq_refcount(void)
 {
@@ -4395,6 +4510,7 @@ static int __init of_unittest(void)
 	of_unittest_changeset_prop();
 	of_unittest_parse_interrupts();
 	of_unittest_parse_interrupts_extended();
+	of_unittest_parse_interrupt_map();
 	of_unittest_irq_refcount();
 	of_unittest_dma_get_max_cpu_address();
 	of_unittest_parse_dma_ranges();
-- 
2.52.0


