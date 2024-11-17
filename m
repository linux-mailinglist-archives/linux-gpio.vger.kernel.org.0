Return-Path: <linux-gpio+bounces-13059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 161609D035E
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2024 13:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2FCB284131
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2024 12:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E34317A58F;
	Sun, 17 Nov 2024 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RA6qYfnM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4CA937;
	Sun, 17 Nov 2024 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731845039; cv=none; b=BIG4olsoJRRnVUwYE22ECiNIUR75fW5V5t4hP0WCN1379tu0D4seCSAHsIpRJWrXADt69xtKAFqrksBb9TbDlKF/7uFHM6mKxZoEPr2fdQvd6Wn7bY1wxx5Gy0SS7RPJf7Aft+Npckeh6bjX2rYlnKfU6SZwLBoMOm6ZN/tXASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731845039; c=relaxed/simple;
	bh=U44pX1OyuYqTVUwfaSVxarNW1wSY/enpy9dFasbbbqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uljfwCjnOpaC8TR1crB95tp8d1/HSNIp/VXC6bCUUFmsbMUIJsLiT4byj0b4Ic9WnvgdEP1Wbk/7Syf8jPd+Hd3cG+wDblGWiE+8mVRqg5YA2hPGck5ss1K3L2qEQAHAW+yLwA36kWzO5kLXRIm+WYMx96p4ZrAQHCpoJRdZdis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=RA6qYfnM; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Ce0FtKvGCPqyaCe0GtWgzY; Sun, 17 Nov 2024 13:03:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731845028;
	bh=F86dYHhTvuTsM0pNGR7yup3yM38zQaZLLpJ4MuMSPEk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RA6qYfnMtS4P7V9Zq0yBEygn8/KuBN1SNPfWjxCqVfhLZr2rNX044LTOu2zPQvQsV
	 ZvajoS82pGIMDAyx0scSznzvcZWKoJ73xGGChp8RcKsmuW20UcjNTUo/3i0tR/k7Z5
	 eWkvkp2BvbuuL7WtJRdllnGUzVZae9YRrkAaPrwzXKIt33FNTpkDahi7Syo3sDlSmK
	 dwORZ6R37qho4XntvmGu2/2nam4cLTXbdVngwZKJ9Y1gsiGSW5rSOp85mhVTz9Rplw
	 WH8a65A3n3JA8zUBzgqHg9bK3e0LX73+iOB/XdAvowMObmzP4UelQd5M1rD4q/d6Tt
	 BjLBfdpEjZfFw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Nov 2024 13:03:48 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()
Date: Sun, 17 Nov 2024 13:03:32 +0100
Message-ID: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

chained_irq_enter(() should be paired with a corresponding
chained_irq_exit().

Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
is not called.

Add a new label and a goto for fix it.

Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Review with care, irq handling is sometimes tricky...
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index b79c211c0374..ac6dc22b37c9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -636,7 +636,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 		if (clk_enable(b->drvdata->pclk)) {
 			dev_err(b->gpio_chip.parent,
 				"unable to enable clock for pending IRQs\n");
-			return;
+			goto out;
 		}
 	}
 
@@ -652,6 +652,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 	if (eintd->nr_banks)
 		clk_disable(eintd->banks[0]->drvdata->pclk);
 
+out:
 	chained_irq_exit(chip, desc);
 }
 
-- 
2.47.0


