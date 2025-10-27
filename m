Return-Path: <linux-gpio+bounces-27667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D47C0DA53
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25090421731
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750142DECC6;
	Mon, 27 Oct 2025 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OxGNVlRU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8085E29A9F9
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568601; cv=none; b=OzC63LfxwyQ7SBLDwsZ4gFcNqAMsNzGPiqp5du8o66A4WS34DbL1GswynVgzN5jt2uq4VVy9tz96tK4pUJKal7klgT/jb/lF/QBaYIETtcfRDnpwoZKUX93cb80oRhvFPpjw6/wHZx1u5gT3XBIaqO++T0DhjiicSojaCQ2fv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568601; c=relaxed/simple;
	bh=W9m+J89nGWrUIyyZHLJwvhX+zZwaJTQAbU1Ln6pRJNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIrEioNmsbrgXG+LZ5+LWnEhcUBkLEnkobHDtBfH1sGbiFobFCXk5kAoQha6D82Efb2n6BVNKIrdnbxY1Xos9DBZ0p11Jyacet4Lz/RVyZ3AoiQCXzGtNkY9XjarGfN4NSXjSDH3QykGHaKvCX05/hmDuJRWGSCFXpM3kbN4org=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OxGNVlRU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB7CBC0B899;
	Mon, 27 Oct 2025 12:36:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 245506062C;
	Mon, 27 Oct 2025 12:36:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD0B4102F2502;
	Mon, 27 Oct 2025 13:36:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761568597; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=f/4cj1bDsU6M4PV7CIM7bFFH41vdf6crKnVyzWu+hS0=;
	b=OxGNVlRUizXHIoAoWcn/sCk6iZF3RNkxiiHQH5vBnNgEY0CZZ7VkPy3j0icwSZE+JjQYg0
	vUMF0B6uW7sJJGzL0r3WvS9rlZMCXeHAWaXbRIu6FrUdl3wXtv19CdAcnDhz2wbsal2gfh
	iiC16n3Vijh/F7hfp+GXNEtN9cSZBjsUDcKzxd7mVLPd0HUxq6z7Q1DkNza2W5a5DvEbO6
	CQfSm0/6+vRimF0wYLRxvn9Zqg8VGppoH7zfJA13EjswHkvdRaOKBRsxwqc3u8cikRFyMZ
	odwp0mPSthbDKS89KBzWro9me9fdZ6UJQXJez425bdaY9ojqODny5tZK+E+0Zg==
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
Subject: [PATCH v6 4/8] irqchip/renesas-rza1: Use for_each_of_imap_item iterator
Date: Mon, 27 Oct 2025 13:35:56 +0100
Message-ID: <20251027123601.77216-5-herve.codina@bootlin.com>
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

The renesas-rza1 driver parses the interrupt-map property. It does it
using open code.

Recently for_each_of_imap_item iterator has been introduce to help
drivers in this parsing.

Convert the renesas-rza1 driver to use the for_each_of_imap_item
iterator instead of open code.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/irqchip/irq-renesas-rza1.c | 43 +++++++++++-------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas-rza1.c
index 6047a524ac77..370d968b2398 100644
--- a/drivers/irqchip/irq-renesas-rza1.c
+++ b/drivers/irqchip/irq-renesas-rza1.c
@@ -142,47 +142,36 @@ static const struct irq_domain_ops rza1_irqc_domain_ops = {
 static int rza1_irqc_parse_map(struct rza1_irqc_priv *priv,
 			       struct device_node *gic_node)
 {
+	struct of_imap_parser imap_parser;
 	struct device *dev = priv->dev;
-	unsigned int imaplen, i, j;
+	struct of_imap_item imap_item;
 	struct device_node *ipar;
-	const __be32 *imap;
-	u32 intsize;
+	unsigned int j;
+	u32 i = 0;
 	int ret;
 
-	imap = of_get_property(dev->of_node, "interrupt-map", &imaplen);
-	if (!imap)
-		return -EINVAL;
-
-	for (i = 0; i < IRQC_NUM_IRQ; i++) {
-		if (imaplen < 3)
-			return -EINVAL;
+	ret = of_imap_parser_init(&imap_parser, dev->of_node, &imap_item);
+	if (ret)
+		return ret;
 
+	for_each_of_imap_item(&imap_parser, &imap_item) {
 		/* Check interrupt number, ignore sense */
-		if (be32_to_cpup(imap) != i)
+		if (imap_item.child_imap[0] != i) {
+			of_node_put(imap_item.parent_args.np);
 			return -EINVAL;
+		}
 
-		ipar = of_find_node_by_phandle(be32_to_cpup(imap + 2));
+		ipar  = imap_item.parent_args.np;
 		if (ipar != gic_node) {
 			of_node_put(ipar);
 			return -EINVAL;
 		}
 
-		imap += 3;
-		imaplen -= 3;
-
-		ret = of_property_read_u32(ipar, "#interrupt-cells", &intsize);
-		of_node_put(ipar);
-		if (ret)
-			return ret;
-
-		if (imaplen < intsize)
-			return -EINVAL;
-
-		priv->map[i].args_count = intsize;
-		for (j = 0; j < intsize; j++)
-			priv->map[i].args[j] = be32_to_cpup(imap++);
+		priv->map[i].args_count = imap_item.parent_args.args_count;
+		for (j = 0; j < priv->map[i].args_count; j++)
+			priv->map[i].args[j] = imap_item.parent_args.args[j];
 
-		imaplen -= intsize;
+		i++;
 	}
 
 	return 0;
-- 
2.51.0


