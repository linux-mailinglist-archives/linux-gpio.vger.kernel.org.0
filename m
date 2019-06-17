Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C68F248C65
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfFQSmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:21 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33399 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbfFQSmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:19 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0G5h-1iVzAa3H2l-00xHk9; Mon, 17 Jun 2019 20:42:03 +0200
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
Subject: [PATCH 22/30] drivers: gpio: em: use postcore_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:03 +0200
Message-Id: <1560796871-18560-22-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:+XdyFKamGFWUFxEeDb6N68e30kmuta1qkOj7bQND+1fkqKnd3Cy
 va4HUJ8iu1/u0Fu0O2Oxm6ABjgPG1mXo+VlLjSrbBe0qfckPTug2IhG3xb61B3brYGMQ9wp
 DxtjcUlJn7GQR00z+CWCLXlJwkbuBAexBjV0piNOiJcQ8mv/G15iKL69YuHosSYE8Qjk3F9
 UJCkn7fyFAX8S2LrAWhCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gcFXNkZP8ic=:BkVRsM0TzQA0vzTsksV/IA
 BnkI/ebLbVIaU5UHw6ZC0jgAAAlyHpnKYbNkjQRR5QkG5FClMxVB9RKiIj2n8QyFcCo5wJr76
 6yqpacv9YnQgWBmrTwHPItHrYO0VsxsbucJMNYzMJ4ugBY+DbZlRTKe0tJI2uiGH5WxuPgdqk
 qIPsejPYGmyHrnknI9Yd7rBgaws7F0By6g4EVTkXpyAzPljDeeHMRzbeNFJC+GdkeOKrHgyZK
 L4NV0m7sUJO15tbCRtuonbyhv12SA/ycHni0fmfotq4oWav4nUPKcifbWseIBBZ+CsCGuRgOf
 7XkzPl57gyeWHOkSy2vBiBVY4UBt/IjiihPwcGVoV0NMyA13JH8Tq8YBmiaDXq6RrZ11NO5ac
 onvjWA7yVW+0J3OMzXnmjoHdFjX3/3W/HK8Ls2j39sIAs0aDREP/RY8aUYhEoi9+4uPsYtJEq
 bZDu3qGSaC3PohJI6ARiN7+Qew0XkGllDSRLMk4O3Zm0mhFBPHA2CK47FbxuH3dYK4/i4MIsp
 35fmssGD8MY8ezcNVgNZHveVNOC/J/an/LDtlDgsBBcKPM/mrOYy5VLmseIN08AYGsS92ouub
 Y6M/XiJQ6jrY13zblbYyxF1bBwQ5F3bdshcrUehxinm6H0CK8zsoQAeVdJoaz8Poh8CUR24FH
 O8Jkwsq05vHIhMQ57J3wP3eoKBPh8emGs6GRKaL9W/NF+DUYUXkeWOUhEWJ75Fa++8OBGyQ87
 Fh1y5a8mWoXJ+8yyiuiL339Dvj5/pEIBjwVmuQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
postcore_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-em.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 84a7375..8b8037c 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -396,18 +396,7 @@ static int em_gio_remove(struct platform_device *pdev)
 		.of_match_table = em_gio_dt_ids,
 	}
 };
-
-static int __init em_gio_init(void)
-{
-	return platform_driver_register(&em_gio_device_driver);
-}
-postcore_initcall(em_gio_init);
-
-static void __exit em_gio_exit(void)
-{
-	platform_driver_unregister(&em_gio_device_driver);
-}
-module_exit(em_gio_exit);
+postcore_platform_driver(em_gio_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("Renesas Emma Mobile GIO Driver");
-- 
1.9.1

