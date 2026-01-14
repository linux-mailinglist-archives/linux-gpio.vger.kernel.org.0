Return-Path: <linux-gpio+bounces-30522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BDCD1DA79
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 543EC3022D29
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 09:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3666F38A9A6;
	Wed, 14 Jan 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jgxA5TGo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9338A723
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383653; cv=none; b=QJCN14KkQvSXNvq55c8MulfIJUA6c1n4A4hBi9FVHsIDVwfgy+PuGqzuP+Eai/dJMqqQHVTaOWIadJIF+rS1JxMEwCwwAnhigkxRVhZSUaL3jOsf6OIBpZ2YHcGLWpjxLrWPH7mE7OmfRcCzO5XbAg68mbDpwhbdUpULKq/uzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383653; c=relaxed/simple;
	bh=3fifJH6jPhjpUsOkz3ncUoHMaDbVCkbvrHplYvH2Uyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taFIXY0LH6S6AE1632ZnPGwTD3CsjzaqQ27aYJYizf6cioMFeW0VhsrAr3mrTx6LfjWXNOsYyDpOO5hbjPUmuTfVhPihhGgNmYrJP9Ld+QgcuwWkHzfmJcLjSw20Cs5UJGyIEKOooq5SHY/RnSS/7dEzQdwXFMOSekThY+dTJzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jgxA5TGo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 35B761A2865;
	Wed, 14 Jan 2026 09:40:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BEC26074A;
	Wed, 14 Jan 2026 09:40:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 338CC103C89EC;
	Wed, 14 Jan 2026 10:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768383648; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fQCpmqi0I/63GrT0ubc5oAKlmvHMRk4TMDR9BqlL+NY=;
	b=jgxA5TGoVwWjBqutwlc+I6gW+2cmXyjgEuiXXlZFLGEtVzOd7IUM5baXiUR32XFNi+NqRP
	ZVGT5dMuUFPmawCHThbBKk4p06v5BZjgkSJVPulIkLJ9XTORH433U+yT8Ht0WO6q2g4EmD
	4Nsjjf2VBqH2KPyaKkkKhhvZ1Rs4SCpJecHzCpYbzRWDq3hLk38uR9VBubLj4K07siw2j0
	JpUNV0NcRhyFGavaIotUcif61VqQ9G55RNkNAfwc+ttV7NZdy3Ze/yp67bK+Ei5MD3L/W7
	fcX2/2GP/VetPTk2H5n7r8C1kwbLVJSBkvyOgsfElkwT/BnexrbvBMOud36inQ==
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
Subject: [PATCH v8 4/8] irqchip/renesas-rza1: Use for_each_of_imap_item iterator
Date: Wed, 14 Jan 2026 10:39:33 +0100
Message-ID: <20260114093938.1089936-5-herve.codina@bootlin.com>
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

The renesas-rza1 driver parses the interrupt-map property. It does it
using open code.

Recently for_each_of_imap_item iterator has been introduce to help
drivers in this parsing.

Convert the renesas-rza1 driver to use the for_each_of_imap_item
iterator instead of open code.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
2.52.0


