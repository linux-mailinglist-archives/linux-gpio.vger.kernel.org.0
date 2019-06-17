Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2693648C7A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfFQSmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:43 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48307 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfFQSmn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:43 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MGz5h-1hpKew0oMN-00E9qn; Mon, 17 Jun 2019 20:42:09 +0200
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
Subject: [PATCH 28/30] drivers: gpio: mpc8xxx: use arch_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:09 +0200
Message-Id: <1560796871-18560-28-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:ZLaOl44ENja2hPsV07wwK8/JgZWjTUnVD5gFQWyGloyvEdDNaPn
 ikb7Pwa9dguuY7+IN8dNfamms2+DNi8E+5ustgyHK6njRJw3nhlqkq/XddLbCZGasf/kGKX
 E5JKYjUQCRzJEOSifSHAPjEdVKFDMQA3Sso5Yhm77xgBnZANXMQ1AYQWEza2S7goY0tRAei
 NAWAcyof+gkw+Mo7bjs+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mSSjftgRu7w=:gj6hA+IYYueJ2eFKiNwGbL
 mqjNXhwbu6eF6zBee+grZZRErJz4zUS7x8PPO7Kt6Ah5vlA8P9ynNKW679nueKZKmmzlg+2+Z
 iIJynHXipqusUNucKkWazbBXProFHlg80dAWIf1F+yl36TFfxBj/c6jfSNVgGZJXGcQ9ou6Su
 CSyp9wzlbV/XqCLyKfcVKO2mQK36VIUlyjsTn+xfmXIAzMNHAc0eMXeFj/R/fKpJhguHvdYLw
 /JyclJwBWDlx7Q3uwZhEa9TBG8HZ5znQX5XtwThlCMFIx3eKpZuCtWMylEt/7YjThXq34Sy6c
 NNSXX0W+y+rtVnsdJaUlE17fxiosLVGhE7cdap5lZV2wxEvMVSErvtclU2y5bTaqSbXZ3+0Y1
 WaKGVC3cdutIz2MFeBCT/wzSrTuUx5LCwpBrn82mC+uBUC6hS3FPnmMG8z9VwL7yJSHP8uFG6
 pUbHUpCUBh7NGavm7K362+EBsMMs9CTlxNdGNGvdb2qsZmOEn0PnDZr3GEgw/YDQ0H94WGtzQ
 FvUYXz6lRx5nx+MMgfccCpkF1FfTunVyui2ck5eTmz05kDZhEex4lfFuPwCSXAgzyNFCP0GOX
 0tux+Wvk2kUKM9w05ntMlIQJkNFpsfQVFO7xQXFb78qQQoVCTInlqtmEd6XltROxXqSBrLLbP
 nwwk6c6vMPKAVi/MgfaLk1q1jpFRCMSIe/m+z1Ec0W7DpkUv72Tneuh+kYNqniwz9/5Hxgysv
 sdVnLvVpgyRTPqMd6rlI0Yl+XWXMz1tNv1TS1w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
arch_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-mpc8xxx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c8673a5..6eef9b8 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -408,10 +408,4 @@ static int mpc8xxx_remove(struct platform_device *pdev)
 		.of_match_table	= mpc8xxx_gpio_ids,
 	},
 };
-
-static int __init mpc8xxx_init(void)
-{
-	return platform_driver_register(&mpc8xxx_plat_driver);
-}
-
-arch_initcall(mpc8xxx_init);
+arch_platform_driver(mpc8xxx_plat_driver);
-- 
1.9.1

