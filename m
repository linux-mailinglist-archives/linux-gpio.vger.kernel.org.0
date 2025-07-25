Return-Path: <linux-gpio+bounces-23825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F642B120DE
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 17:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1478A174A18
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 15:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD222EF2A7;
	Fri, 25 Jul 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j8SFW7JL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493742EE61D;
	Fri, 25 Jul 2025 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457194; cv=none; b=mFmWExD975tM4PMzYJ5qTgCAaI1r67+bMii724P9WJgqNOJRGLEGQNhBoFMgGuvLZDA9t0aRZ2M8llTeUkZVeaMoSAZuoeGkk+e35BayspFk+SphJG8ZOv/Z2fi26eJoJo1/Ka8tv6ETpkWf43KO05MYVC3jHLqn1bvsz1Qip7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457194; c=relaxed/simple;
	bh=w66EF2r8PFDJx9D+srEE80xX+hTsCo6gdAOLoIuKaxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8WDffFHwy3yTA8c+cQZnZAWXdIlR4KsjWow5Qk/G9ofXGA5eEI8Q0OZPN4kE3qJjJMadn3XflANAmvlq2hd6qMOMA/s2pFduLkRAH73iGgM4CigIMXoFhtqYAjEi0au8pC3CMZ6H3jymtWkUSIO0/a9gBkvPN2qTVEDpp08WrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j8SFW7JL; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id A8144442A6;
	Fri, 25 Jul 2025 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KI8gIiTqmJ5104K5wsgg/sQVoQYLaSObfOOkROi20qc=;
	b=j8SFW7JLWxhRSRdoY4kSXY76G82N4PGWJUTxCohI0PyYISQIljHc4t1WPPi+hNUR6BIRO/
	RZDN6SATlGb7BuIE1957Wn1HBcAnd0ypQn7VYwREbitpQ+ILsxez50LVy9ut16Jb6Vd1Lb
	64PgHcPNeyVa/348znRqSOO8ncU5ru+HRhROtbVCNjYMjncJkuNfXXcCD9u6FZNkKWU5MT
	WyiP5mhNT4u+74wcBBJkmBVmaaAszHBBv7r26ikWABJgCnzG6aFFnhPBgiVnFKgpE+OzzE
	mcYCamqhG79MkHl7zpY5YnhPi9KK1JsddnddsG8fjhd3OULLrXLoKA8TV/wTIA==
From: Herve Codina <herve.codina@bootlin.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 4/6] of/irq: Introduce of_irq_foreach_imap
Date: Fri, 25 Jul 2025 17:26:13 +0200
Message-ID: <20250725152618.32886-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

of_irq_foreach_imap is an iterator designed to help a driver to parse
an interrupt-map property.

Indeed some drivers need to know details about the interrupt mapping
described in the device-tree in order to set internal registers
accordingly.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h | 11 +++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..863b31eb3c1a 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -157,6 +157,76 @@ const __be32 *of_irq_parse_imap_parent(const __be32 *imap, int len, struct of_ph
 	return imap;
 }
 
+/**
+ * of_irq_foreach_imap - Iterate through interrupt-map items
+ * @np: device node where interrupt-map is available
+ * @func: function called on each interrupt-map items
+ * @data: data passe to @func
+ *
+ * This function iterates through interrupt-map items and calls @func on each
+ * item. The parent interrupt described in the interrupt-map item is parsed
+ * and passed to @func using a pointer to a struct of_phandle_args.
+ * Also the imap raw value is passed in order to allow @func to look at other
+ * values of the interrupt-map (child unit address and child interrupt
+ * specificer)
+ *
+ * If @func returns an error, the iteration stops and this error is returned.
+ */
+int of_irq_foreach_imap(struct device_node *np,
+			int (*func)(void *data,
+				    const __be32 *imap,
+				    const struct of_phandle_args *parent_args),
+			void *data)
+{
+	const __be32 *imap, *imap_end, *imap_parent, *imap_next;
+	struct of_phandle_args parent_args;
+	u32 tmp, parent_offset;
+	int imaplen;
+	int ret;
+
+	/*
+	 * parent_offset is the offset where the parent part is starting.
+	 * In other words, the offset where the parent interrupt controller
+	 * phandle is present.
+	 *
+	 * Compute this offset (child #interrupt-cells + child #address-cells)
+	 */
+	parent_offset = of_bus_n_addr_cells(np);
+
+	ret = of_property_read_u32(np, "#interrupt-cells", &tmp);
+	if (ret)
+		return ret;
+
+	parent_offset += tmp;
+
+	imap = of_get_property(np, "interrupt-map", &imaplen);
+	if (!imap)
+		return -ENOENT;
+
+	imaplen /= sizeof(*imap);
+	imap_end = imap + imaplen;
+
+	while (imap + parent_offset + 1 < imap_end) {
+		imap_parent = imap + parent_offset;
+
+		imap_next = of_irq_parse_imap_parent(imap_parent,
+						     imap_end - imap_parent,
+						     &parent_args);
+		if (!imap_next)
+			return -EINVAL;
+
+		ret = func(data, imap, &parent_args);
+		of_node_put(parent_args.np);
+		if (ret)
+			return ret;
+
+		imap = imap_next;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_irq_foreach_imap);
+
 /**
  * of_irq_parse_raw - Low level interrupt tree parsing
  * @addr:	address specifier (start of "reg" property of the device) in be32 format
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 6337ad4e5fe8..b89920c6ab55 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -47,6 +47,10 @@ extern int of_irq_get_byname(struct device_node *dev, const char *name);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
 extern struct device_node *of_irq_find_parent(struct device_node *child);
+extern int of_irq_foreach_imap(struct device_node *np,
+			       int (*func)(void *data, const __be32 *imap,
+					   const struct of_phandle_args *parent_args),
+			       void *data);
 extern struct irq_domain *of_msi_get_domain(struct device *dev,
 					    const struct device_node *np,
 					    enum irq_domain_bus_token token);
@@ -85,6 +89,13 @@ static inline void *of_irq_find_parent(struct device_node *child)
 {
 	return NULL;
 }
+static inline int of_irq_foreach_imap(struct device_node *np,
+				      int (*func)(void *data, const __be32 *imap,
+						  const struct of_phandle_args *parent_args),
+				      void *data)
+{
+	return -EINVAL;
+}
 
 static inline struct irq_domain *of_msi_get_domain(struct device *dev,
 						   struct device_node *np,
-- 
2.50.1


