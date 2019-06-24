Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA6515010F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 07:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfFXFkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 01:40:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:43549 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfFXFkl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 01:40:41 -0400
Received: from orion.localdomain ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MA7X0-1hqo3A0sgc-00BaCj; Mon, 24 Jun 2019 07:40:38 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        t.scherer@eckelmann.de
Subject: [PATCH 2/2] drivers: gpio: siox: use module_siox_driver()
Date:   Mon, 24 Jun 2019 07:40:34 +0200
Message-Id: <1561354834-22617-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561354834-22617-1-git-send-email-info@metux.net>
References: <1561354834-22617-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:NGkg9h4n5WFd9Dz8Y9bh4rSvV6psRZvE+7zlcGYFgJQTp8wa6F+
 45L/O+tdyJoPVNcLE+FeC0/v7V5FfGV/f6C2FCBKYEWA5ldEYGHAmaclzTWa4mmOnMGFWwh
 0IAjSgGk2DiZKtL/Z23+euT02kW41ZseYXFMnG8cznBTZj6txrJ37w/fVEbQxLsnN130Y9X
 EZOdfrEGCUGWeMEKN+DtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IIoj4F1nWws=:yMSRfeuGavw5Ah8l776Hdf
 wMmoCtcnfGdXOFqdVAkwKQDYBTRr/Nf+Dt46oy9doHUMPRH1ItAe2ER7e/pI8YTj8pqMWAxeX
 qsMgzl8chmxrrRzuIYegc8F+LZiErp9eRK4goAHQrCvo8kYXWP6YqMuavFDTFki5VGSe/3W8+
 q0b6yoSlhPucnPuPHuxqDruZ1BOtGua3sIvyqahDWWN6zImnRIemykjTH5DOK8NMKe7ajPHwC
 03vY4RkRifzNKzeQeKHVIzm0D9tW74qPBgGBlRt6zuITLJvcqqnuIntonwXFgUMD4WH/Ig4QU
 jnAUDL2LY4O4NALld3ScQhouvAWx0JqKM3EtmJEWKDsQpIY/d3brRXrAu17MYMyTTAyZ43TaF
 UhoF7NPLI1Mb3nMWiCCVfb/pebNi1z3clU7/61HOoGYgup+HwM0cxfyjCtvLNnDn4mXmlpacD
 LNIpwGgrgfb1zA7AHEnzHinrm7sboCOQFfW/ifhUahbxh6ICo4HPwXfsdTuwkOmIZO9Gq4qBk
 8mwHB88lrExUWY0ijdxhSkgXaYkrfwK1a6S1JUREKXHEOb6YiHrQnh7/82wlSMjCYnzkU0VAx
 g/nC1yuqf2kT84FDugxXfDTm08dfhlCHtfe8xzas7ZFbZsjpoLk8bV5tAKHQ0mck4QMQeSCIv
 wnwjbsOwMe+NFc8HTehxNxyeyuZS8ZGQX85Mxvcr1ym1aY5fjwzXGINSDZ1w1oNjfBqJHrvHj
 dYZ0BJEgNmvIWQkmYvOIDOaMfrTCdtZeOnznSA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
module_siox_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-siox.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 571b2a8..fb4e318 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -275,18 +275,7 @@ static int gpio_siox_remove(struct siox_device *sdevice)
 		.name = "gpio-siox",
 	},
 };
-
-static int __init gpio_siox_init(void)
-{
-	return siox_driver_register(&gpio_siox_driver);
-}
-module_init(gpio_siox_init);
-
-static void __exit gpio_siox_exit(void)
-{
-	siox_driver_unregister(&gpio_siox_driver);
-}
-module_exit(gpio_siox_exit);
+module_siox_driver(gpio_siox_driver);
 
 MODULE_AUTHOR("Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>");
 MODULE_DESCRIPTION("SIOX gpio driver");
-- 
1.9.1

