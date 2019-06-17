Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C4B48CAA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfFQSna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:30 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45443 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728823AbfFQSl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:58 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHX3X-1hpt0735LV-00Dbt1; Mon, 17 Jun 2019 20:41:46 +0200
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
Subject: [PATCH 18/30] drivers: gpio: wm831x: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:59 +0200
Message-Id: <1560796871-18560-18-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:cIJmwh8Fqe5ge2cqLl0OEcm2AfuQvFOuJuC40AopX2Uy5NlZcOV
 ptF0Qp/nFJoffsibMdw9bHInU+1RjsT/UxHVrHzXnOh+3jKr2pBdEJjzN1AsyIaqVaO9kO2
 +jl3P2klcyI0sl8xMAvANrxLfZAnUI1ZkH+VVRLh+6kLKL/0Ac4lVb8Iu0Mcwu1ZQ6mVLRY
 KWE31PMGaiLk8Kv+Q0q/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nxqJ6QeYYzM=:D3p8zJGFDUnlY/kO1UXwlb
 10uZqbve6l74U9+uzb+B6rhLGhF2Vf9ObOwvU7x5m9HlQf5W28teHMsm262GgjMa+yN3IziRg
 vHkHFyeSo0C3yUFe8TE2F7VtLU8TIsrcOZgUT2/5JKCNnTf4xaZndgvDG0+b7olMqt8MReFrl
 /iaFz7rgMkDHA4Ay//B/W6GrjRfC6/C1SKgHp6vMJlN3dwET93Zu+Zxkb0v4OBmf+wb+P2OkR
 pO9qlzfEjGiZyL+UQZbah1Dmxox8jRhwrs/bhfqNSePydIJy8LBaNjYqGlcc2nDcXyCaDq8PG
 QdiyTXQo1WuZC69Bcd4c6rG8IsORYkGmk1MBSe/5cdB68dHN9qZpWN4shXLDGP1pEty1tKYeq
 SOu8bEuZsRdvBsFEe5QsgECxgfRP4SVCXHGbBzv9xMj2XvOhg/NG+6D20a/VsPebAmntQo0LY
 xAyT6PNHRPGZw38gGaxfwdXkKzKEXpI3O9q+o5dIZE7rw+p0qsw6Vq3HEQETiRS926/atKdOA
 Exnf91c2pcbmemkln5799w4piR3K9Gz2sfzeTSEc9pcLuwUOae5DAApUSuWDq4H1xGalivBmv
 yKwZdCru6ZDqvW8Vwp5ye+Q7xXGEQoFysx7s2UhwMjN+v2KvQrFgdBmqAkZ10BopUn/R1aNvy
 97poPvr160S9g+d3Kj5XSgBq/lLXoR1o1XgFUvLIcG1guclpK1m0hIYFxYiMU7lPqdfl70+3m
 kH0Sw/lU7YJSROo84gUJQ8VZGcXcHo0MjC4O+NLesCzHc0lKY8QBRSN2h++xbvMEGg2Si1CMm
 ruSpI+hhTuYCKEOntz5HauQoBpRiVVCO4sEXUHp3yWmVoKQA8N52+VsaKQr0fyuZYB7EPSAAF
 sUUrl+MDWCk7Lh2xFQLJ2gTYaAgrWk1N411mK2NH+gILRk3YWYjVTcF0nQm0l2KKFPOERcBPO
 2fgJZmq+13w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-wm831x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index a3a32a7..324f811 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -296,18 +296,7 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	.driver.name	= "wm831x-gpio",
 	.probe		= wm831x_gpio_probe,
 };
-
-static int __init wm831x_gpio_init(void)
-{
-	return platform_driver_register(&wm831x_gpio_driver);
-}
-subsys_initcall(wm831x_gpio_init);
-
-static void __exit wm831x_gpio_exit(void)
-{
-	platform_driver_unregister(&wm831x_gpio_driver);
-}
-module_exit(wm831x_gpio_exit);
+subsys_platform_driver(wm831x_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM831x PMICs");
-- 
1.9.1

