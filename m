Return-Path: <linux-gpio+bounces-26486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0089B91E6C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF011904549
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CBE2E2DFA;
	Mon, 22 Sep 2025 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ySB6/0Rx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A62E2657;
	Mon, 22 Sep 2025 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758554819; cv=none; b=abFV7mxmZUdVN3Ihcex8mLWjeBLRpPcNdWwjRSeNOqQGsAMdoi4O9T1bs5H0W6rHww2pPLcnUzypGmX6bZpsqGOfvjRzN4JT5hLE8qsP7nm/EoPBFo78VYxIZP8jo0UFb1EctbalTrIfrcNbd4wKHlms7Sj7pvyaKR7j8iTBvsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758554819; c=relaxed/simple;
	bh=x82edboHuEX/oiaptkepn9YFZF5imyc7ahdB1bAKFhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krO08klSw52jDcZM1cG+QkmmYs2Na3nPbjJTsw9IXoykNNaJnupmF3iViO0cLoQ1WzGG6sp1xEOKthXfAZ63sAQtwqqdJCrEwrRvjW+jKul6q5aLjK8IiNK7hUwyA++Px7EyRDvbUThF+sBCaC6QukopOlYyaTIW3ODZNqqLwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ySB6/0Rx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C105CC01F8F;
	Mon, 22 Sep 2025 15:26:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C381960635;
	Mon, 22 Sep 2025 15:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E898B102F195E;
	Mon, 22 Sep 2025 17:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758554814; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lBnLFpFar6l80994nn1XUfWDPxrWJQZJJBDj6xOoJfU=;
	b=ySB6/0RxoI4jAWUBPvkMg4T+uqorz8URtQ0nRn5OsqMhHdyy9P7hDCyDqcHKI2kpKxIz/n
	+KVF3ebaUvLo8o3kp6lIhs/KinQtfJGHG8K75ulseI0RnVAlG8O2eLf5nVDMsHBqWqeUeB
	b3Es+4VzZzLhrQH5cWCQ0Hm8Lq6DmgyIXcQkuoHZOp9V6ODzi+Z83VfFRmpRt4GCovZFLA
	fZ4rIBG2G1gagd7a9nyZrac5nhEj/ZemCAfS1qIDFnnUpBo2uqxtkckEEwtlQ8jhLJ2RbR
	5uCmNQZRuJx4b62Lh1TL0ezv5NorV6Conh5TgXG+pyK87vbarTvcsxvAzdEdsg==
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
Subject: [PATCH v4 1/8] of/irq: Introduce for_each_of_imap_item
Date: Mon, 22 Sep 2025 17:26:32 +0200
Message-ID: <20250922152640.154092-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922152640.154092-1-herve.codina@bootlin.com>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

for_each_of_imap_item is an iterator designed to help a driver to parse
an interrupt-map property.

Indeed some drivers need to know details about the interrupt mapping
described in the device-tree in order to set internal registers
accordingly.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h | 41 ++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 74aaea61de13..0723ae4153a0 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -157,6 +157,76 @@ const __be32 *of_irq_parse_imap_parent(const __be32 *imap, int len, struct of_ph
 	return imap;
 }
 
+int of_imap_parser_init(struct of_imap_parser *parser, struct device_node *node,
+			struct of_imap_item *item)
+{
+	int imaplen;
+	u32 tmp;
+	int ret;
+
+	/*
+	 * parent_offset is the offset where the parent part is starting.
+	 * In other words, the offset where the parent interrupt controller
+	 * phandle is present.
+	 *
+	 * Compute this offset (child #interrupt-cells + child #address-cells)
+	 */
+	parser->parent_offset = of_bus_n_addr_cells(node);
+
+	ret = of_property_read_u32(node, "#interrupt-cells", &tmp);
+	if (ret)
+		return ret;
+
+	parser->parent_offset += tmp;
+
+	if (WARN(parser->parent_offset > ARRAY_SIZE(item->child_imap),
+		 "child part size = %u, cannot fit in array of %zu items",
+		 parser->parent_offset, ARRAY_SIZE(item->child_imap)))
+		return -EINVAL;
+
+	parser->imap = of_get_property(node, "interrupt-map", &imaplen);
+	if (!parser->imap)
+		return -ENOENT;
+
+	imaplen /= sizeof(*parser->imap);
+	parser->imap_end = parser->imap + imaplen;
+
+	memset(item, 0, sizeof(*item));
+	item->child_imap_count = parser->parent_offset;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_imap_parser_init);
+
+struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
+					struct of_imap_item *item)
+{
+	const __be32 *imap_parent, *imap_next;
+	int i;
+
+	/* Release previously get parent node */
+	of_node_put(item->parent_args.np);
+
+	if (parser->imap + parser->parent_offset + 1 >= parser->imap_end)
+		return NULL;
+
+	imap_parent = parser->imap + parser->parent_offset;
+
+	imap_next = of_irq_parse_imap_parent(imap_parent,
+					     parser->imap_end - imap_parent,
+					     &item->parent_args);
+	if (!imap_next)
+		return NULL;
+
+	for (i = 0; i < parser->parent_offset; i++)
+		item->child_imap[i] = be32_to_cpu(*(parser->imap + i));
+
+	parser->imap = imap_next;
+
+	return item;
+}
+EXPORT_SYMBOL_GPL(of_imap_parser_one);
+
 /**
  * of_irq_parse_raw - Low level interrupt tree parsing
  * @addr:	address specifier (start of "reg" property of the device) in be32 format
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index a480063c9cb1..65f2c97147de 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -11,6 +11,30 @@
 
 typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
 
+struct of_imap_parser {
+	struct device_node *node;
+	const __be32 *imap;
+	const __be32 *imap_end;
+	u32 parent_offset;
+};
+
+struct of_imap_item {
+	struct of_phandle_args parent_args;
+	u32 child_imap_count;
+	u32 child_imap[16]; /* Arbitrary size.
+			     * Should be #address-cells + #interrupt-cells but
+			     * avoid using allocation and so, expect that 16
+			     * should be enough
+			     */
+};
+
+/*
+ * If the iterator is exited prematurely (break, goto, return) of_node_put() has
+ * to be called on item.parent_args.np
+ */
+#define for_each_of_imap_item(parser, item) \
+	for (; of_imap_parser_one(parser, item);)
+
 /*
  * Workarounds only applied to 32bit powermac machines
  */
@@ -47,6 +71,11 @@ extern int of_irq_get_byname(struct device_node *dev, const char *name);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
 extern struct device_node *of_irq_find_parent(struct device_node *child);
+extern int of_imap_parser_init(struct of_imap_parser *parser,
+			       struct device_node *node,
+			       struct of_imap_item *item);
+extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
+					       struct of_imap_item *item);
 extern struct irq_domain *of_msi_get_domain(struct device *dev,
 					    const struct device_node *np,
 					    enum irq_domain_bus_token token);
@@ -86,7 +115,17 @@ static inline void *of_irq_find_parent(struct device_node *child)
 {
 	return NULL;
 }
-
+static inline int of_imap_parser_init(struct of_imap_parser *parser,
+				      struct device_node *node,
+				      struct of_imap_item *item)
+{
+	return -ENOSYS;
+}
+static inline struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
+						      struct of_imap_item *item)
+{
+	return NULL;
+}
 static inline struct irq_domain *of_msi_get_domain(struct device *dev,
 						   struct device_node *np,
 						   enum irq_domain_bus_token token)
-- 
2.51.0


