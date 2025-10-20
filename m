Return-Path: <linux-gpio+bounces-27287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF340BEFD02
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D770F3E6DA1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2091E2E8E12;
	Mon, 20 Oct 2025 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M+jRB/ez"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D092DECAA;
	Mon, 20 Oct 2025 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947653; cv=none; b=UNNJ5fTlohmndLD/7cMHq33Jb84GI9PdNPl3MnTTTcRedreQJzmPLnw3rTAcB0e/3AYzjp/DzYYGdGWl8vaEwh4ZxbHhcFh9R1Szp3lop/3SJCy21US03N1Zk9JUDHSvUPGB0fHr2UVM/YBLbG8u2tePiL+WDMYXOF+LciDzLWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947653; c=relaxed/simple;
	bh=H+Za++qaO2+XDgpM/C92ujfB737UPNPDp0Owrfl2pBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsYmRHPpTR69GL93XSZ8nbR1iGgLHFFO3O6pvV9LRrOb0yf5hO80fQMgSh7zXlPBXj+zvbtNXRDOoVSr/ZvJVY8Xa3+H86k4ecL83yMfSRF/TKyiMHwn9BwsbXfnk+oFEFI+vPYjVfuBGGQtEWFwi1a6Rje8HaHwJwaeIl97ydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M+jRB/ez; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B58A4E411EF;
	Mon, 20 Oct 2025 08:07:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21734606D5;
	Mon, 20 Oct 2025 08:07:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E485102F23A4;
	Mon, 20 Oct 2025 10:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760947645; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sKC0uXVNM4fDMkWJSrO5UHfvdN8cARd4cAqTfHkHzGE=;
	b=M+jRB/ezm8/2TuIM2eDf3sq5HH7gN+ij0iUKOXZ0sxVuWyp6WDKvbvcwynQlFy8TF+uxHt
	qViMB0HJkTO8KsO+yJVTgth2++N8R89Vmv+iHDD+1K97c+5FiSE9Ot1rHEKEU5AQnelfzp
	iosJDreEDwTaCMOibwgF9Px1+WsTSIaEgC00sKrUZR9yYcCsMh3ECW0GZrw3NVAtyhhzuJ
	boOEKGEX1uZfszQiLF8JIuiIsNdCYdOhj1VQ6alWbuthtlYGGee6ygEe80nCa5FoBqayDl
	MHtttGt6mD9NiaJwSA0J9FDeFoj6WXbvKLglm79yxCvpwM9KHm1fKV9UVDl6qQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 2/8] of: unittest: Add a test case for for_each_of_imap_item iterator
Date: Mon, 20 Oct 2025 10:06:38 +0200
Message-ID: <20251020080648.13452-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020080648.13452-1-herve.codina@bootlin.com>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
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
2.51.0


