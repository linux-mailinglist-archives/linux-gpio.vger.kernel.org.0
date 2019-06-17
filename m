Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C396D4894C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfFQQtg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:49:36 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51765 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbfFQQtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:49:24 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M3UIe-1hcMr23CWg-000dXq; Mon, 17 Jun 2019 18:49:22 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 5/7] drivers: gpio: grgpio: use devm_platform_ioremap_resource()
Date:   Mon, 17 Jun 2019 18:49:18 +0200
Message-Id: <1560790160-3372-5-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560790160-3372-1-git-send-email-info@metux.net>
References: <1560790160-3372-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Hmq0T1rLoSViSCrvNG5bce5XgCMtZroN6pQn0fzfUOYc/m7ESsm
 bEYHVCDm4BbxLfYpJ+9D9xQuOsYKqZT/UvdI0hdLGFqtXQcq4zqi9ZuNXDU9Iob8x5BKm9l
 p6Gj3RNCi0BSQkBjDYMHOsgO0WV4zuT8g8YYxYbdnxpUxuVrcsw2is9NJAQB2zHcZfyPjIC
 V4pIpMznfVJtFxutDz5zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6VQqVWWucyw=:nOAg7etMc3df8rPvyEq0L6
 /7mb/J43FeGXhvcb549JCTP5nf3B0UEAflBOaUKVxYdXDgKOrq35M0GjBvE3LQr0EVtkHvEzs
 jYUuvWVORjyjWOEJBUkly8OrUlYY7jbyLCLkVi4CjBPHNlz8hgtXFb8yq6Yce2ePdALoOigP0
 MHdETXf5Lu+V76476a2TXdLiA5AkQ38zNfD8t3XTQSiKJfs/A8hzlZLKPPmgyIGJYM940CU/G
 abyXJpubI8emb9NAezUg1I7ysyhB4dP3FyRsYdCogsiOFTTjSEwgdxm+HN54tMHZ9+TOpU1sz
 oLLKr+bFQzt6jI8UOrrRJrba+P3KzqNijst+rvv7WNzeBka4BReNoHRF3TEfofqGzn+O3EdDJ
 CaKVu9QnCQQzOp7cVWaOQZH1EGLy1YpSFQqKeyrtiEjB6giNsV9nggjUm7SlHKjeoAIdoxuOW
 +KPDqcE6rjWrW945HbNpdbiEJmoWvgzS9O7am8IhlWOoP9XZWkMX/TN/kufL9tUwmqKJ/jPY2
 Bu32x0JlKvMciCk5mZlB5JG1O8zwIE3d5a4XA+GT9W0kNpkriDa5FDHZEsUKUr3hx8mjmxDGt
 dkxZBbk3S2HyyE08kLmz1ONgE4SOYmpG7M6JGVcWkAvBSwwsm4FVGVb3VKNHD6axyL7qHKSc1
 BAFnlSp5TaYCUKRuT7QQ7C986u/v+xhWMb8zeBopU5h+TtIz/YY56cOh54F4Vq+7RUK2PNzHe
 Qcqu19WxpNO1hxPgWwcfiJpEXMTiuC8AknXy6g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-grgpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 7df48e7..0937b60 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -329,7 +329,6 @@ static int grgpio_probe(struct platform_device *ofdev)
 	void  __iomem *regs;
 	struct gpio_chip *gc;
 	struct grgpio_priv *priv;
-	struct resource *res;
 	int err;
 	u32 prop;
 	s32 *irqmap;
@@ -340,8 +339,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(&ofdev->dev, res);
+	regs = devm_platform_ioremap_resource(ofdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-- 
1.9.1

