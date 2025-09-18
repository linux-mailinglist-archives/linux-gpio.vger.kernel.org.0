Return-Path: <linux-gpio+bounces-26317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE5B842AB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 12:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C8316745E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405632FE07E;
	Thu, 18 Sep 2025 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Is1h7xYC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48372FBDF3;
	Thu, 18 Sep 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758192040; cv=none; b=Wm/5DIyk6w15uLDtDwlbzv7hzSM/eej5WsDR4epD+vLiQmw9+xTZht3VzjoCrKwBgMkzc3MurnCKsl30PRIw1S0iCq/cy5JamNHHdq2XSP7P0aBiGuCa3/ak+dxtSI9DVtFpHdyyUgxqk2d8Su76VTd6ByAh1JZNOvB7dFWPaGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758192040; c=relaxed/simple;
	bh=piDyw/JBKCG/8fXN+QSQlF/zxGTFUxOsg8dUrAeAvbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ep9Dro5em3dkyjeK6+bh1SjIxb9sMn3rTg/h+lSW8pxY1qeSlxAmudymkRxY6OiVBCHSpR44lfSmkrybW8RPw/kbI6e6IZAsFq4vE+PUBobB2HnlInRwse+qTrzy02/DDti+m1BkygqCz2eWl+rus5OSJpaYcxYFVGmL9bWasUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Is1h7xYC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93BD3C00097;
	Thu, 18 Sep 2025 10:40:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F1246062C;
	Thu, 18 Sep 2025 10:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95E80102F1CD5;
	Thu, 18 Sep 2025 12:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758192035; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NsWsJA6GhKlZSDm7Rvg/BA2HitF/XF0eT4AqsM0ba84=;
	b=Is1h7xYCBN7h5ryzVVsd7Ppp9vCsLhiUd2lUwuYPavcHV81hn0N9DShuUTR5ETJeoMMXKm
	DlONEmNmR+XnTLzjHupXP6tfmWGnyYusCrdZ36uD5DVc6yB0j/sadX8XjpOGDI2CzM1TGY
	rCUtjsvsfs9WPEfy/Aho8y0yDpaDqTWg6Ov+rLu+Ey38H3Rhx6vBmHRmu90daAFRCBDYOf
	xUPt/Km6VZzcxkDOLls7Po+/Aj8JK2RxQPuz1qrhTQ9e7mQvun+Q+1AKm4BiJAw7yuD7tK
	izYtaGR1z6EP7GABTSY7CO38+UYSvo6a7x2KClosCAdaROq4cozZo21SustfMQ==
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
Subject: [PATCH v3 4/8] irqchip/renesas-rza1: Use for_each_of_imap_item iterator
Date: Thu, 18 Sep 2025 12:40:02 +0200
Message-ID: <20250918104009.94754-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918104009.94754-1-herve.codina@bootlin.com>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
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
---
 drivers/irqchip/irq-renesas-rza1.c | 43 +++++++++++-------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas-rza1.c
index a697eb55ac90..789196b71656 100644
--- a/drivers/irqchip/irq-renesas-rza1.c
+++ b/drivers/irqchip/irq-renesas-rza1.c
@@ -142,46 +142,35 @@ static const struct irq_domain_ops rza1_irqc_domain_ops = {
 static int rza1_irqc_parse_map(struct rza1_irqc_priv *priv,
 			       struct device_node *gic_node)
 {
-	unsigned int imaplen, i, j, ret;
+	struct of_imap_parser imap_parser;
 	struct device *dev = priv->dev;
+	struct of_imap_item imap_item;
 	struct device_node *ipar;
-	const __be32 *imap;
-	u32 intsize;
+	int j, ret;
+	u32 i = 0;
 
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


