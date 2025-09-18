Return-Path: <linux-gpio+bounces-26316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26FB842B6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 12:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9053A2C5B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0018A2FBE09;
	Thu, 18 Sep 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qivI2scR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909B2FABE3
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758192037; cv=none; b=dhJNcdfGv5/y20EzSEg7zFajz6q9AG5nZeK1WNQfyOpAZkHi+6MSLP3L6tPrOKwa+Ng/kHHV+xXzbKX+aluz+p2I5xFrIDqPR0Bsycr8xOnJg7swfCW1zJwx238DIPV00b7+SU5LIesPA8VPwL6U6NeDGgykp7hO73KvRMqJVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758192037; c=relaxed/simple;
	bh=wKTOuqBfnalEmfN7yoZWb6HUSWjmCULlR5vNporkClE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j15b9W+E1ybCX9y0rnDa5gv6M6XDiuyki68hI7mieK0F9e09/QzVOLGwrnSlS9E7Mkp3QHKnRPMHEkz+buEkCZerBkVfpVkN/gWbH3n0HhzX9cHmX0QojKTfbFcP8UMFDH8mzNawUHucGciQrjm9jAUomoRIJPseF8oBSpe4hR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qivI2scR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 501771A0ECF;
	Thu, 18 Sep 2025 10:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 265DF6062C;
	Thu, 18 Sep 2025 10:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F59C102F1CE5;
	Thu, 18 Sep 2025 12:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758192033; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QBlfnPJwGIXoUklEq6xYhFHnSO32edjs9JLjQGY9LrA=;
	b=qivI2scRDBJFEK5DDAVU3ozIIkeDuNXhVlTKLUcJ9fxapRg9jbyFwiEHs3OnAyAcsYi1la
	6HgZt/5okulZhrt4HLQO6WPUIe2BXCfpPxehscvg/c4B/78dZ4bFdkLSUUIbPQ1O1d68km
	Lqi7GRnCEy+QuMnmqO0bX4rpqwsYH3TTCAs2wmkWt+muSTezmGjGGVmX9+35v9XRABNJ4t
	6zwhpSiX0okTPn3Ypeab3qTW1H3aXSkjfLVIbQkiGjWxHsZVMX4CEdxbZ1iZZko1veppXC
	+4Fv8J1bwkKgKzJz05dD7bsuHsy1G4ZdPGL10mMjHITlGJwL1V+P6tvuwvJG8Q==
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
Subject: [PATCH v3 3/8] irqchip/ls-extirq: Use for_each_of_imap_item iterator
Date: Thu, 18 Sep 2025 12:40:01 +0200
Message-ID: <20250918104009.94754-4-herve.codina@bootlin.com>
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


