Return-Path: <linux-gpio+bounces-29559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4DCBE556
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B5813014707
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 14:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EABF33F385;
	Mon, 15 Dec 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w2uWsUdG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5873033DEE7;
	Mon, 15 Dec 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808950; cv=none; b=TW/hVt13s6cPyTm4KNOFJblF0HZBug1EbSDe+4dTru8vQzYTDVvIURvTdSM/1BRg84Eh5kvpyqxgBjN+clBDx75RSpJxPCbz1GDtSqA1OmH/Y/F/TopB1D5FUenahbz/igaMd0VXmvz9CY99GkMxlJ1ji4WJ/SvDbQqWig0TRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808950; c=relaxed/simple;
	bh=pkHYFhneP/QcwzSSuUU2RRndmpCI+0dWRXesaXlZDg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0M5pRCLwgA3kKmkY8VJMCEzV7xYagV2by7uet78+Y7b6/oU1DJE1YSW2bvWGmd21vF+NUid/QpI1CcdTKmfob0nPflWhSmydZ83E1y84rn4P1qRoIfiwEcEBgfBMDV9E0GyE07+kE/CZoayfGIIZS03oIR4xZ4o+RM4QK9mAPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w2uWsUdG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C8B8B4E41BF5;
	Mon, 15 Dec 2025 14:29:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E58A60664;
	Mon, 15 Dec 2025 14:29:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33B0A119422BD;
	Mon, 15 Dec 2025 15:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765808945; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uvqB8EXIwm8yUwJOSkCvzDM0SmaeJRSPO5ef2FNPe1I=;
	b=w2uWsUdGxDTXYgEl91gtyDqT7djlzBnCQ2R6EPolV1EcQs48lUG/VlDW6bhPDwY8ASjm/S
	l+lHpOpP87aSdrXruVn20GOviRYjnmZP6n1SoAoAzzvCuJ/BoqWNbb88hHhDgyI3kijrZm
	6AygDeRYkdwRBjaY7DyOWCbj9BmOxHjKHd87/bBBwKjbvHiWfGo/y2mELHf6Cg4/NHhi62
	sgRlxyaiG4UfcpWiS30lWSmY8N+JenergsJcPQVslbufC47o3Q+VZ6MKTfaFzN8vJFlCAw
	baeDhTBWxb2o0Kqt8mzSoQr/rLSzNyEl1WuQYMdIixSeDF60BttR7Lzp5msaRA==
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
Subject: [PATCH v7 3/8] irqchip/ls-extirq: Use for_each_of_imap_item iterator
Date: Mon, 15 Dec 2025 15:28:25 +0100
Message-ID: <20251215142836.167101-4-herve.codina@bootlin.com>
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

The ls-extirq driver parses the interrupt-map property. It does it using
open code.

Recently for_each_of_imap_item iterator has been introduce to help
drivers in this parsing.

Convert the ls-extirq driver to use the for_each_of_imap_item
iterator instead of open code.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
2.52.0


