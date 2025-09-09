Return-Path: <linux-gpio+bounces-25820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C35B4AD35
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 14:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A357A1893C14
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A0433471A;
	Tue,  9 Sep 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pdx6CR/k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1332C316
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419296; cv=none; b=DCiB+Y4VnjWE7p1Mq5WQal51x8g1mz2If7JULwiU0A9IzLud/Sj6aEcNxbYlLOQ5jvYQihhs+pzEHHYQbsTSPWxkrwrtD9Fh8c0NsSXs6n/kP+IDiO0aQVJg/IEPI0JVCDMfZ7HijUSdY0/6gnjbmhtEj1G9Ba/Gmn7d9NKxBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419296; c=relaxed/simple;
	bh=wKTOuqBfnalEmfN7yoZWb6HUSWjmCULlR5vNporkClE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9X1QUc9NYxnByLySPgwO84EUr+z3yKnu383ES/0Fnkyx0676XVjqoGJROHvPrSpcLPLQ5xHlHuQRpdStUDfed427wXBUhaYVqxAsA4G7sZ69SpFyQ6WmwcbwPO7Exo+FrPKP7TG5LSVL48gDcRQKJE6GO4eBx7NGa6J+ZhnlG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pdx6CR/k; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 290861A0E11;
	Tue,  9 Sep 2025 12:01:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 024B060630;
	Tue,  9 Sep 2025 12:01:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D09BB102F2851;
	Tue,  9 Sep 2025 14:01:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757419292; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QBlfnPJwGIXoUklEq6xYhFHnSO32edjs9JLjQGY9LrA=;
	b=Pdx6CR/kX3dljTeY6QskqhZ663SJXyWQA8YiLzMeBOHzQvCww7eTxxjnn5OYEnMdm9ZwlX
	CmqNzYM8/xL1M/FXBMHokY8dcgO47Z32+F0rA3ZijY7kSL9/VaMTcMxaLjRgM1BWtRBFJp
	3HTwbykjRKb9fVcy5pooHPuPC8CATqxohrtcUX0oWotVdxGkLr6Im/oGoraKb3yGOPpkD7
	Lnz4al3uW+H7Ldjmnh8YEadKB/wNIIe0c0LE/GkozDDTfBrECeLcGZ8NBN89z/YXC7/oTG
	TFvRrCGeNhrcGB7OZna9pxP1pKjFKJh7vC19frPTTSBrPtp/q2EOWHdGNWXAcw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH v2 5/8] irqchip/ls-extirq: Use for_each_of_imap_item iterator
Date: Tue,  9 Sep 2025 14:00:36 +0200
Message-ID: <20250909120041.154459-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120041.154459-1-herve.codina@bootlin.com>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The ls-extirq driver parses the interrupt-map property. It does it using
open code.

Recently for_each_of_imap_item iterator has been introduce to help
drivers in this parsing.

Convert the ls-extirq driver to use the for_each_of_imap_item
iterator instead of open code.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 drivers/irqchip/irq-ls-extirq.c | 47 ++++++++++++---------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/irqchip/irq-ls-extirq.c b/drivers/irqchip/irq-ls-extirq.c
index 50a7b38381b9..ed8755777349 100644
--- a/drivers/irqchip/irq-ls-extirq.c
+++ b/drivers/irqchip/irq-ls-extirq.c
@@ -125,45 +125,32 @@ static const struct irq_domain_ops extirq_domain_ops = {
 static int
 ls_extirq_parse_map(struct ls_extirq_data *priv, struct device_node *node)
 {
-	const __be32 *map;
-	u32 mapsize;
+	struct of_imap_parser imap_parser;
+	struct of_imap_item imap_item;
 	int ret;
 
-	map = of_get_property(node, "interrupt-map", &mapsize);
-	if (!map)
-		return -ENOENT;
-	if (mapsize % sizeof(*map))
-		return -EINVAL;
-	mapsize /= sizeof(*map);
+	ret = of_imap_parser_init(&imap_parser, node, &imap_item);
+	if (ret)
+		return ret;
 
-	while (mapsize) {
+	for_each_of_imap_item(&imap_parser, &imap_item) {
 		struct device_node *ipar;
-		u32 hwirq, intsize, j;
+		u32 hwirq;
+		int i;
 
-		if (mapsize < 3)
-			return -EINVAL;
-		hwirq = be32_to_cpup(map);
-		if (hwirq >= MAXIRQ)
+		hwirq = imap_item.child_imap[0];
+		if (hwirq >= MAXIRQ) {
+			of_node_put(imap_item.parent_args.np);
 			return -EINVAL;
+		}
 		priv->nirq = max(priv->nirq, hwirq + 1);
 
-		ipar = of_find_node_by_phandle(be32_to_cpup(map + 2));
-		map += 3;
-		mapsize -= 3;
-		if (!ipar)
-			return -EINVAL;
-		priv->map[hwirq].fwnode = &ipar->fwnode;
-		ret = of_property_read_u32(ipar, "#interrupt-cells", &intsize);
-		if (ret)
-			return ret;
-
-		if (intsize > mapsize)
-			return -EINVAL;
+		ipar = of_node_get(imap_item.parent_args.np);
+		priv->map[hwirq].fwnode = of_fwnode_handle(ipar);
 
-		priv->map[hwirq].param_count = intsize;
-		for (j = 0; j < intsize; ++j)
-			priv->map[hwirq].param[j] = be32_to_cpup(map++);
-		mapsize -= intsize;
+		priv->map[hwirq].param_count = imap_item.parent_args.args_count;
+		for (i = 0; i < priv->map[hwirq].param_count; i++)
+			priv->map[hwirq].param[i] = imap_item.parent_args.args[i];
 	}
 	return 0;
 }
-- 
2.51.0


