Return-Path: <linux-gpio+bounces-8095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F291D92A01D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 12:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 732E61F229F9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 10:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C1978C70;
	Mon,  8 Jul 2024 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0WpBMKB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570422E3F2
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434331; cv=none; b=YhCnqVWA4PEaCUpc6VS9WAK6lRgtTj8vL+N1JM+JLnoHX8M8NXp+9Pfxkby7CcNRvl8aK5SAu1Bw1UQgE83qWNSPHUxI4bCuYXTXF1/alwRHTUsA803ZpTw63zh8NxPuy+VhMvhNHvRA7/CPy/P50cshtA3L7XLfvUm65iZDjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434331; c=relaxed/simple;
	bh=sGBDAvNswctcuk/kjk1ua5TdJz87BTlyYVmswBU0S78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbh4BGjkJG17XettbWk6kSj7W2AaxxQGLsYquSf2MX5tlcJUHYoMhwjr4asL7dw5QDK0GPPUtjiggUry0qc65X4o6sPj2vkQUrPQEa/AeDrXZqH7ECFIpOfD4Ys0aBGCXhgWWpuYHUvSGTdqCp/Okh0nULyvJLUunQhWU6YzxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0WpBMKB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso4816913a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720434327; x=1721039127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jI6VExt196cOGjHLMIZgkrjN4DBF+pr/VqM+rA0L/Ng=;
        b=G0WpBMKBfIuP4IelHFiOo5bEjSiKfeC885eWywXecckDzdpGdxk/ROyO+vCcIDDcoe
         x9YEoX5gbSPpzvNT6myY1O4w7ZpWbCAAYH8qmKgeNS/n1WkRlxuZSq//XiYKshRd0fk/
         0XjvPFqXU4PQiKkSDP/BYqdALo/8ATYQGVZayDitXstaFCpIv+X+27XEK7ARRj8qsLJc
         FRxsGW6b9yG3aESEApy06yNW/RI47dQllczv2Tu4zbyT62g4C3bq7jIWQdPEAIEFl60q
         dlTdVIe/z0UEDD/+EkhlacEp8wmuf5SSJMKfTOrB8k0nib8JEBUBsPmTbeybT8p9Knbu
         EBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434327; x=1721039127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI6VExt196cOGjHLMIZgkrjN4DBF+pr/VqM+rA0L/Ng=;
        b=lHvsrL2lvOwwZNiAyPvBw8CD6esls6pyoDr0V+QXO+YvfTSvOsT3naUhDV8mFmpkuI
         EtHP74u3z57ePuk7yUkgBL+tcGE4qjeH4OyG22lVkkmqzCgGNALXPhsF03uJHIMaXsl1
         MacKmBxdCDVr4/s7BHudCO0yYfpr2IVbDtE+XPeAj89Sy2MX4SICgwJ9KIza5LgfGB+T
         5x0cdUR3hCrZ5iCbT0GlG0W7cTZBNFWBy+b0G6CIfAdmKrbEz8ekCx6IzqxydzYJuDJx
         Civrvt4C6wYT6QKjdqIMxxf/NP1NEH5teqFjbf/YnqRI5HlA05Rf4AvS4jH9LePECHfh
         jEPA==
X-Forwarded-Encrypted: i=1; AJvYcCXcwN1f9fnNHn+JyGNJ0tddhp7HJajxrn8bDb7uGQW3o1W5JX1oaoeqO1ZrfcNrZMRfmNVvlUCQE+s1w0dx5KwfJuOysYhccqMygQ==
X-Gm-Message-State: AOJu0YwUnh6jKgQuFpCypMYGJfDWUJfptwst3nKaJhQ0pVqpAZWP+ZqX
	iO5gfJTvQcjK+Q7j5HGrPgyydxOO6t4NnONpQ1t5upjnhaCnpgfU9xCGb88h7XM=
X-Google-Smtp-Source: AGHT+IFGnbgPOvevHxHVID3Wzld0NPCwFbKNE9rjCXjOAdsm+hZ7aEjxXKtcxeG1n3/cwquRVy1giw==
X-Received: by 2002:a05:6402:35ca:b0:58d:115c:f529 with SMTP id 4fb4d7f45d1cf-58e5a6ee3f6mr7598736a12.7.1720434326728;
        Mon, 08 Jul 2024 03:25:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b246087e0sm8045437a12.62.2024.07.08.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:25:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL] pinctrl: samsung: Use scope based of_node_put() cleanups
Date: Mon,  8 Jul 2024 12:25:19 +0200
Message-ID: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Link: https://lore.kernel.org/r/20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Hi Linus,

I got only this one in the queue, so sending directly.

Best regards,
Krzysztof


 drivers/pinctrl/samsung/pinctrl-exynos.c  | 16 ++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.c | 19 +++++--------------
 2 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ce5e6783b5b9..b79c211c0374 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -662,7 +662,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
-	struct device_node *wkup_np = NULL;
+	struct device_node *wkup_np __free(device_node) = NULL;
 	struct device_node *np;
 	struct samsung_pin_bank *bank;
 	struct exynos_weint_data *weint_data;
@@ -692,17 +692,14 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
 					      GFP_KERNEL);
-		if (!bank->irq_chip) {
-			of_node_put(wkup_np);
+		if (!bank->irq_chip)
 			return -ENOMEM;
-		}
 		bank->irq_chip->chip.name = bank->name;
 
 		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
-			of_node_put(wkup_np);
 			return -ENXIO;
 		}
 
@@ -715,10 +712,8 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		weint_data = devm_kcalloc(dev,
 					  bank->nr_pins, sizeof(*weint_data),
 					  GFP_KERNEL);
-		if (!weint_data) {
-			of_node_put(wkup_np);
+		if (!weint_data)
 			return -ENOMEM;
-		}
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
 			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
@@ -735,13 +730,10 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		}
 	}
 
-	if (!muxed_banks) {
-		of_node_put(wkup_np);
+	if (!muxed_banks)
 		return 0;
-	}
 
 	irq = irq_of_parse_and_map(wkup_np, 0);
-	of_node_put(wkup_np);
 	if (!irq) {
 		dev_err(dev, "irq number for muxed EINTs not found\n");
 		return 0;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5d6f..a7deae4afdcc 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -251,7 +251,6 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct samsung_pinctrl_drv_data *drvdata;
 	unsigned reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	drvdata = pinctrl_dev_get_drvdata(pctldev);
@@ -266,12 +265,11 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 							&reserved_maps,
 							num_maps);
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev, np, map,
 						&reserved_maps, num_maps);
 		if (ret < 0) {
 			samsung_dt_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}
@@ -849,16 +847,12 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 	 * and create pin groups and pin function lists.
 	 */
 	func_cnt = 0;
-	for_each_child_of_node(dev_np, cfg_np) {
-		struct device_node *func_np;
-
+	for_each_child_of_node_scoped(dev_np, cfg_np) {
 		if (!of_get_child_count(cfg_np)) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 							cfg_np, func);
-			if (ret < 0) {
-				of_node_put(cfg_np);
+			if (ret < 0)
 				return ERR_PTR(ret);
-			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
@@ -866,14 +860,11 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 			continue;
 		}
 
-		for_each_child_of_node(cfg_np, func_np) {
+		for_each_child_of_node_scoped(cfg_np, func_np) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 						func_np, func);
-			if (ret < 0) {
-				of_node_put(func_np);
-				of_node_put(cfg_np);
+			if (ret < 0)
 				return ERR_PTR(ret);
-			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
-- 
2.43.0


