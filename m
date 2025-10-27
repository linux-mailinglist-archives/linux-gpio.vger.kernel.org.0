Return-Path: <linux-gpio+bounces-27666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DFC0DA80
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E567F4FE70E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8AE3009F7;
	Mon, 27 Oct 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eJ9GXQa2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D91991B6;
	Mon, 27 Oct 2025 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568599; cv=none; b=bKnrx3Xlcx5pbky/CQgnTyp0IBVSITpBgOKeVWTsSYlKascUx58RwOpxMi0qLyeAh/3kVL9zWJgDspSnm0iHRxg3S9WoTBOskDj/8fSdl9kPZJE8TLaelPlXV0t40KtHG34nQb5nqvM6pG6F9Rn6wI+dDWS59L2kf4v4uh2tPuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568599; c=relaxed/simple;
	bh=kWTBO9iv5flSQArPR6Uly05WJ2rUoYXHRSpT4+4BwNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7kZJqARX+ydVKoVlbbrkZqskO92T2kwvRd+9UI0BRn1WIsjgHVTO0rCSOnOif1wZwRZgbDGZ79pNjOYSkkSlVHyjvswWp9GYAx9oYGKQL8+2yfwJonrXOtLefdYEasRK2VIbBxC11MrNY14yg0MItf61oAq5BNqXVlJwmG3Xoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eJ9GXQa2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C5DE4E41367;
	Mon, 27 Oct 2025 12:36:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6B006062C;
	Mon, 27 Oct 2025 12:36:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CCE0102F24F1;
	Mon, 27 Oct 2025 13:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761568588; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+0CPeaUtC1rWE7IeaEm7zMzdR6dkj4e4oBvZPWzU0Xk=;
	b=eJ9GXQa2PO1Bq3Ab7prt9teF+d9OvMg73jim1HBjno0mn3iHvYuE9/1wnfJ1Kugm53tYlO
	Xs2QMvAWlbpSUFMDCwZJLlmWoyA++RtNyfCDtrrF2BqdFf+jY2QQlhmAPFH1TRFSvF4jpf
	N+a4NIhF06hwridvyqJdQVlJCUsKjjXRhStarMEokAq9ohrjmKjZ7vrd+rcPdWf73KceU+
	HUfNbPh+g8f4N0EK9DpxDKWVJGwV6oo6DSFMWY4BC/PxbCT89NWESsOfwOQAyfjt4qD/tS
	pH3kUEJgZ9XQ1xFTie41GtnFmqwOrvji2D5LT4ldZs68UnzePLOrMqxaCTW2sg==
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
Subject: [PATCH v6 1/8] of/irq: Introduce for_each_of_imap_item
Date: Mon, 27 Oct 2025 13:35:53 +0100
Message-ID: <20251027123601.77216-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027123601.77216-1-herve.codina@bootlin.com>
References: <20251027123601.77216-1-herve.codina@bootlin.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h | 41 ++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 65c3c23255b7..ca7d51d07047 100644
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
index 1db8543dfc8a..7edb64edb0d6 100644
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
@@ -85,7 +114,17 @@ static inline void *of_irq_find_parent(struct device_node *child)
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


