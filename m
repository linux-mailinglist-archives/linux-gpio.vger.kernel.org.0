Return-Path: <linux-gpio+bounces-8402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24793E43C
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2024 11:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D36631C20E68
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2024 09:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F326182D2;
	Sun, 28 Jul 2024 09:09:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5614F8F62;
	Sun, 28 Jul 2024 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722157778; cv=none; b=XOou5kar8N+Dcbekku0Ix7ZKPbro5EZua8LPakkdp0zlOHxVxHLugkXhd9h5d/bGR2bIm94y54aPDtTItG2AdiUhv/YIBX8RVJL9Wwxwapjb+FrszykPILdhiv2oE9w6Oz5qSjjF+Sge+uzxBbHCTa4GPC7A+TZy9wnc1KCqh90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722157778; c=relaxed/simple;
	bh=7/7FMScEAXCexBgKIe8WnYVYP8/6bsuZT+pxnkLEit0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swj1MS6oLO5Mvg8K7gZZiKclHr3uESzbFqBfvpKNFbbU/0uzw79IxHdTf0laKyLB4ut7CjgR6LaPhMDKXlQyIRVy++rUrS05q8EXj3lIqy9TR5sg6A9/YSS2sdh1Bo930UDiVghVU4tvxzYiBGjG3CVho6o/2OvoeCXc9rG+zr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,243,1716217200"; 
   d="scan'208";a="217379659"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2024 18:04:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.33])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 566494001B7C;
	Sun, 28 Jul 2024 18:04:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Use dev_err_probe()
Date: Sun, 28 Jul 2024 10:04:16 +0100
Message-ID: <20240728090421.7136-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace dev_err()->dev_err_probe() to simpilfy probe
helper functions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 37 +++++++++----------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 632180570b70..4de86388276d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2596,16 +2596,13 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 		return -EPROBE_DEFER;
 
 	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &of_args);
-	if (ret) {
-		dev_err(pctrl->dev, "Unable to parse gpio-ranges\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(pctrl->dev, ret, "Unable to parse gpio-ranges\n");
 
 	if (of_args.args[0] != 0 || of_args.args[1] != 0 ||
-	    of_args.args[2] != pctrl->data->n_port_pins) {
-		dev_err(pctrl->dev, "gpio-ranges does not match selected SOC\n");
-		return -EINVAL;
-	}
+	    of_args.args[2] != pctrl->data->n_port_pins)
+		return dev_err_probe(pctrl->dev, -EINVAL,
+				     "gpio-ranges does not match selected SOC\n");
 
 	chip->names = pctrl->data->port_pins;
 	chip->request = rzg2l_gpio_request;
@@ -2637,10 +2634,8 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	pctrl->gpio_range.name = chip->label;
 	pctrl->gpio_range.gc = chip;
 	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to add GPIO controller\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(pctrl->dev, ret, "failed to add GPIO controller\n");
 
 	dev_dbg(pctrl->dev, "Registered gpio controller\n");
 
@@ -2726,22 +2721,16 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 
 	ret = devm_pinctrl_register_and_init(pctrl->dev, &pctrl->desc, pctrl,
 					     &pctrl->pctl);
-	if (ret) {
-		dev_err(pctrl->dev, "pinctrl registration failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(pctrl->dev, ret, "pinctrl registration failed\n");
 
 	ret = pinctrl_enable(pctrl->pctl);
-	if (ret) {
-		dev_err(pctrl->dev, "pinctrl enable failed\n");
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");
 
 	ret = rzg2l_gpio_register(pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to add GPIO chip: %i\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(pctrl->dev, ret, "failed to add GPIO chip\n");
 
 	return 0;
 }
-- 
2.43.0


