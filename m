Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C66048CC6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbfFQSlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33549 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfFQSlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:44 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1My3AX-1iYB1C1P6F-00zTbF; Mon, 17 Jun 2019 20:41:29 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     thloh@altera.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 06/30] drivers: gpio: lantiq: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:47 +0200
Message-Id: <1560796871-18560-6-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:GNYirr7jJEU69T27OYUit3DCM2eQ50qRxRzE0yyrJ7VYcGGI0FQ
 tSb1LqO5HXvshCPpgNlHKsFwE9pjMgdLUghNSIZGWhdBKZUFPs/UX2lVoKqNPJd4OOOCyuu
 QvH5XsWZrprwyKtNza7TVZrjRyaVDmsHXpdFouFyS4/1Wvo2ed3bxgLaZplkQlTvmOtZrTR
 2owe9fm1A5TvMl0zxZquw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mw4fZ2uihQA=:FMr4oJjRvghnAVG6L0uOCz
 gQKTXO9RJ/eO3egisxNa+n460m7XGrsy+n9BK2yOXzE1H9RJuHD5SXncy5WXGIVkXK9/Zq56A
 K6mhJCiCGm9z7uwg5CoZuZlgPnEKs+JByB2yI8eRgaJAFS3+qRGaZA/qrI+cjxcnXDxsXlIEi
 9bnOXrB0DQQsDhzFGf56uyicfyUjzNjkiyo+9CmGQZWsVytUtbIVQaq2TH5tDIgpLv55EbqbA
 QB/iL3neyNeXqq4Ec8t6Oo0KUjZ2VAIXxlwHd7pJW6g+558sFg9+hYSFfD5eCbxbdDl31E9tT
 0IqxMJUOSds2Gyn1e50sx1nrtvQQQVaJRdxsHPdLgSFkHsreL3GXAlps88Ep+782300yWXsh1
 6BlhEhIny9fqeDz7PsHLNOgu06SRaIXTaOnw+jOfeG72GhWDyN1bM1Xiwk1nrxgmXVfWhvRdL
 Qbg/1GIOXfNTB5dsEvooRieWO2vCM6Fp2CCFXkaontZ49YbOt450n5IxrvIcu+7bd6on+lGhF
 d7sfcpXac9mfeI5FD6SK0xYrv2/vPzlajvGyX0h/laQzkYSbwJEE3RB8hi6AGsWPTY1ihS4xR
 JjqwebsqEipXA9wneLyd4B2flndTmtIkWkoX9DY2gR5sWCT02pUTiBZMpiTy28uNYY3UsT7B3
 VgLPCwiPkvqG2XuGdFYQJsI0PFD5QJUqFqlOhjOuTd2l2QI4+3Zc8Y3+O1gML9V6iy/2C9tnh
 nyu4lDFtepgVaQxIPWB6M3vZ+Qu7DFcdxNIuPw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-mm-lantiq.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index b0754fe..3e5ef46 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -146,16 +146,4 @@ static int ltq_mm_remove(struct platform_device *pdev)
 		.of_match_table = ltq_mm_match,
 	},
 };
-
-static int __init ltq_mm_init(void)
-{
-	return platform_driver_register(&ltq_mm_driver);
-}
-
-subsys_initcall(ltq_mm_init);
-
-static void __exit ltq_mm_exit(void)
-{
-	platform_driver_unregister(&ltq_mm_driver);
-}
-module_exit(ltq_mm_exit);
+subsys_platform_driver(ltq_mm_driver);
-- 
1.9.1

