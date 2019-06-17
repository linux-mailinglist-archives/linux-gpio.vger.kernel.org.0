Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DEB48C77
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfFQSm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:27 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37191 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbfFQSm0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:26 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MWiYo-1i9ske2RCq-00X3Ti; Mon, 17 Jun 2019 20:42:12 +0200
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
Subject: [PATCH 30/30] drivers: gpio: max732x: use subsys_i2c_driver()
Date:   Mon, 17 Jun 2019 20:41:11 +0200
Message-Id: <1560796871-18560-30-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:cCDeCfM59RF90RxmymdnnTZyFuGyFovFw66CIcAmzljQAcUCv50
 GHZdz+78OGvTtCBTcKJL1JKtM2LAYUAGqkUZqHriMkIzaNvafUq+aNA3OY0YiHro69MDLZO
 dzbzbBXy+eMl7t+QG7QOmjCDfgqFoeDxvYkR8c8FaSIw1+kNxxx8GG2B93NHJBZFBODWVDA
 fWLGs8s2d7UAj+faSe7SQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f9JpWGPh8+Q=:Prle+yo3zB8vcfwdoAK2g8
 2gzxvbqD4NKKJ2D+vj4cO6yWP8/PFEBRWr5iN+PXDLZyCbNsNXUxhNjPKPHLA/MleKDaAKAHq
 vRyvmeLVGHug2/ZCDG5xOg8Kfn/TuG9DIABDPhGru8LjN1ocaWeawNrBH0qdgMdtpLai+JCTq
 lHwZVLspVxps/zV8WoEQeGIMlyBc/+eJksIkDYaZZ6BbxFNmv1Zk+S5dkoacPYkWx7nVGKWmH
 A+KH1mOv7cbTvc8DJhJjSbHcHvhR7Xo3VLPASfFAEdtSkI7MFZRtc93r1RypaqwSRZHNU4zty
 hjoCIDx8p3cZer1X9VxiAQ8R6sIyth4oleJq6vYVmTFTpzBXpZaRRgPmhJl7XZUP0m3Kjjqan
 NYcTOPjLsplRrF4jzuOvB+kRMNlZPsKiyqNFhkrNUenAP7fQFViNMwupkjbrmGwkwA+2f2bL4
 fk99ZsSFhw9us+GK1fJBNNwY4ZHiX6+6O6gnmm9EjrKERGveNEEGehdRM9ibMts7hJ06T8Uvs
 uct1NQJDCExlFFiLE6sWZG+eEgtGzc6gfexFgnc/mNrqP0otK0WEplszhV4Cv6VdOrLPM5CKE
 gQpeep9J3O14sWRUXtFLlX+fCQXRIqWTfaUuBfA4EAE4kYrUNQ80fF8uCjWMZ0f4XEhE41Fio
 cE8tn3zxz3BV3B2GVly5P7ER/T9/5w3KX38GX49rjtPSfK0kAi1rocik3cLojD5kKNjvd2mja
 W73zWA9QHbNCRh2SMvxxy9fagBYWlWMNJ2RMxxa3TnERt6EaKgfI0NeeI5WOyZqw7eMOSR/ZI
 31NIBLNdWnFGTJeFcRrHz/lEEY5fmQPR0BJDVFxsjJ8VwhI1RNzbLxltqhayQ/ftVC1LzoxT+
 cCQvpIJA8QBJ5MQkMLd/GpDXHnO7Z2LogOqS1JLOTo/H/4snP0zZfciNYNUb1k7PStVktEUNX
 fHkDDIqKqQg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_i2c_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-max732x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 5e4102e..c340883 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -756,21 +756,10 @@ static int max732x_remove(struct i2c_client *client)
 	.remove		= max732x_remove,
 	.id_table	= max732x_id,
 };
-
-static int __init max732x_init(void)
-{
-	return i2c_add_driver(&max732x_driver);
-}
 /* register after i2c postcore initcall and before
  * subsys initcalls that may rely on these GPIOs
  */
-subsys_initcall(max732x_init);
-
-static void __exit max732x_exit(void)
-{
-	i2c_del_driver(&max732x_driver);
-}
-module_exit(max732x_exit);
+subsys_i2c_driver(max732x_driver);
 
 MODULE_AUTHOR("Eric Miao <eric.miao@marvell.com>");
 MODULE_DESCRIPTION("GPIO expander driver for MAX732X");
-- 
1.9.1

