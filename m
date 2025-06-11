Return-Path: <linux-gpio+bounces-21368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0FAD5289
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA97316F158
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B322874E4;
	Wed, 11 Jun 2025 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxwd/KZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE81A27586B;
	Wed, 11 Jun 2025 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638677; cv=none; b=X4SmAvr9ezHpX+9lifhpCLygTM+zwhk/wXDdMuTRroEK7P0scZIfmI9Ra3MozKpsm9zT+1tHGbhYsC7/dMpztfRx2RITlk1mywGvg+JhgZ9/f1AuzL9j8EYB1gYsX4Jj7RZYBXaCQoEBhSTo8jDAd48UZrrqf+bUc5YfrLtr6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638677; c=relaxed/simple;
	bh=DFXb2Sd1AviR0meTWbNWr6As2FJfbh6fzCtv+oFGSEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGXjvgMmCEmeADZtctInqAZBcfd3msoY7ai19o9qr2xHqQjhH88LdRVQxjmfNblgobtJb2//dzdJrSCspn6nYzrtSAKCU6JPqFwzbBRbMfk6chv7KJjhcxFBAyDVqEwhfGv0DS9pTiRZuWGYhY2bvPuWJHBzh9M4ICi2rxYWFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxwd/KZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AB5C4CEF3;
	Wed, 11 Jun 2025 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638677;
	bh=DFXb2Sd1AviR0meTWbNWr6As2FJfbh6fzCtv+oFGSEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxwd/KZPJJwG9Ywjh1/PhRGVdKW45Lk0qDePpntE/WGmu+0Cu+8m9ZsJhmwrjm15d
	 pp0KgriTv6qpadEyjMj9KerrndYQbYAhprMi5SKtSuNmYGWRXdacFwBDwWd+S6CccU
	 xqi2pRmxylUOrjjpZnm+QhpDOWYtok/3ghf8eiB3i2CckpHXr7l28hWPvOvng9giI8
	 JHOqZZcVOEFSSG8xZdAYrrin2Ng2c/TGFsm72zZ6S7anjMveDsnWgTBpYoeS9KcUFk
	 /O093vWRxY02LXlWByH+fKEDXWdRDV8IEaUzWwsu2fRxDZeuVcNLncmyA7dlrHU7Bu
	 thZbbZf5ZCDFQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] pinctrl: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:45 +0200
Message-ID: <20250611104348.192092-17-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/pinctrl/mediatek/mtk-eint.c   | 4 ++--
 drivers/pinctrl/pinctrl-at91-pio4.c   | 6 +++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index d906a5e4101f..9f175c73613f 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -561,8 +561,8 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 			goto err_eint;
 	}
 
-	eint->domain = irq_domain_create_linear(of_fwnode_handle(eint->dev->of_node),
-						eint->hw->ap_num, &irq_domain_simple_ops, NULL);
+	eint->domain = irq_domain_create_linear(dev_fwnode(eint->dev), eint->hw->ap_num,
+						&irq_domain_simple_ops, NULL);
 	if (!eint->domain)
 		goto err_eint;
 
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index ca8a54a43ff5..57f105ac962d 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1212,9 +1212,9 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		dev_dbg(dev, "bank %i: irq=%d\n", i, ret);
 	}
 
-	atmel_pioctrl->irq_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
-			atmel_pioctrl->gpio_chip->ngpio,
-			&irq_domain_simple_ops, NULL);
+	atmel_pioctrl->irq_domain = irq_domain_create_linear(dev_fwnode(dev),
+							     atmel_pioctrl->gpio_chip->ngpio,
+							     &irq_domain_simple_ops, NULL);
 	if (!atmel_pioctrl->irq_domain)
 		return dev_err_probe(dev, -ENODEV, "can't add the irq domain\n");
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daa..a090d78a3413 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1646,7 +1646,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		}
 	}
 
-	pctl->domain = irq_domain_create_linear(of_fwnode_handle(node),
+	pctl->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
 						pctl->desc->irq_banks * IRQ_PER_BANK,
 						&sunxi_pinctrl_irq_domain_ops, pctl);
 	if (!pctl->domain) {
-- 
2.49.0


