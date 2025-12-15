Return-Path: <linux-gpio+bounces-29557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD25CBEB4D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15B6F3015957
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338D333CEB3;
	Mon, 15 Dec 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XODK58xK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF68E33C52E
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808945; cv=none; b=pUUTh+zBkFghptXouVOxjWDVWOmVFvBptdLIjKwCivrhmSvNFe9LpJLkmp4sa4FnjyUSPwHY7OsshkT/KxDFLXPY0z33AGSOcrKJABOFMDl+KXp1AZdikiWgnxt3SBkdgjFBt6hgK55vEBPEu0MYW5ajfMoEUUJXEgf0qpf5/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808945; c=relaxed/simple;
	bh=vVZgxFYLzHLo6Je5qo4VsC2G21fb8AVTz3FULpwqbI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2QN5YLXjAxLqlpL9D6BGL4w+niZlIvUNe7W3dNnmiYpwkkTSD/rYXs50Tjj4E72LNA+Ynqh4g5VzSis22Ibm6kdcrnmyUyWQuqj4omtMv/SVX0f2aPOyBZEz+SVW5IuHMB+gc7JL/u5w5n19gJ5HqE6C/zuo39P5egaz1pR1Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XODK58xK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9D16DC19D1C;
	Mon, 15 Dec 2025 14:28:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 050DB60664;
	Mon, 15 Dec 2025 14:29:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 943A81194241D;
	Mon, 15 Dec 2025 15:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765808936; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jozCCQDErEkxTe2vzEruUqB8SMT6ApftoG0i4EMWZJY=;
	b=XODK58xKWakdSUOdQAPohxZu3ujbOTzPtgWc1Jrca1gyJGwN3+Cb5zDlNlZDIbExoYz63B
	33WbuANEYfky79TaiYI/gmAZWCptCTV0ho3o5JshytoU9A7kBaxjy3aL1ep+dZPrWgwPwy
	InZSNgzlRVgsKr+tebsImCu9YB1rdlE/PalRShqNnpZ2cWVUL14AfGwYCTo0jyJt9Qwefo
	WfN2XDVLoTA+jS055UVSWJjx8GYwu0fxzq+i+DlVZznEMwkdQfk9A8b4fdrzuKwBHt7bxO
	liHuzyK2VubCtDilNYLxsEvdSzHMPRCjGzpUypBEz+aQ864uYL+1PQkFQzOZxA==
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
	Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 1/8] of/irq: Introduce for_each_of_imap_item
Date: Mon, 15 Dec 2025 15:28:23 +0100
Message-ID: <20251215142836.167101-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215142836.167101-1-herve.codina@bootlin.com>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h | 41 ++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e3816819dbfe..f374d8b212b8 100644
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
index 1c2bc0281807..2a64d8cecaae 100644
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
@@ -49,6 +73,11 @@ extern int of_irq_get_byname(struct device_node *dev, const char *name);
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
@@ -92,7 +121,17 @@ static inline void *of_irq_find_parent(struct device_node *child)
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
2.52.0


