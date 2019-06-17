Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238BC48BD0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbfFQSVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:21:35 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:48085 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfFQSVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:21:33 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MjSHa-1iMTL93eo6-00kvbx; Mon, 17 Jun 2019 20:21:29 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] drivers: gpio: pca953x: use module_siox_driver()
Date:   Mon, 17 Jun 2019 20:21:28 +0200
Message-Id: <1560795688-10496-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560795688-10496-1-git-send-email-info@metux.net>
References: <1560795688-10496-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:0ie3s1nCjn6NmtpKKNlVhkpPRbjJHd2LKLuZjCMzRpZziBJPY5B
 d6oA52M77dkVgLabMbfXiVJK+CgNH2QKKHddKcYHMKIUjsU9q7IYUk2e7361Aqc3mS1V4sr
 Gg7DqWMl91ASY+nQakVhbrqgi6co6S/6CQP9iZDckdu4BOqYfbeaeCuBYKylLJuIsU/mHlT
 LDNhxAAByJHva1Pxp8aMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:78uZd2QWGng=:Gm52anksvoON5a6broDqyG
 OyWxDQKZ155LM8ybq4XzQL0i0lywbCbeXqB48hJ1sWjuRs8t5GHPpbh5Z6OqBkyEahEztZp4d
 uE7xKSYEWbYdWvIkPZzRQrn7HT/38Op/mN2yUXjWKmtihIw96ip2XjBkCInogN53DL1dtgTqn
 Rz20qxrOriDjtv71zytL3LjizP4atf3qIbYlEOSb88ICDumBn+3npsm1gJ7wwWaOMrOvOeKUX
 64kv0vmp2gmnaEiJYEvJrpeJiaUwUsBdHfNVW5PjltONnypIp5mydgVQ1qfb2onoAi9GCz7vj
 sFolFKAxCOLBDRS3a5lLZ0EXZuUvCTVxU0Bk3cjOJlYHqoceLJ2dUw9b+mZWaU1L17jpEAQ93
 NOCcboy8XMR566keNsC5jzxePHr93AtjEjs6HvscKVsOhxEgymj0LmtSQMI8T4gfuoP9I6XnV
 uTmI+ovWWjYG04vFCb4B4zxwDvSH0wBcqxj9sizvaHExN3OXuaHrpLk7L3kzq1qB8ww45Eotu
 CfIpwSXccZCtxVdOlTZeBziiHgtipO7xGX/rj65wLl8A1AJAU9yitv/QqXKnjnr278ek506w8
 e0kl22jMEPRIKSrda/HFdExtXDlTytdx8hgrxnikr6Vb8367wjeLKhBN8r7Jdh1ExqrYE4kn8
 4SJQ/nhPy4GE8DDtbo2SAZ9QFAjPqn+ezt8IBAvxGFI0ICC0ZAo2xsufU834eFB/KlDXQsP4x
 R7fNJow2XBqiToDL6SmNzqHcjeKt08Xuq4Fngg==
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

