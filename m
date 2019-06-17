Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A289648C5C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfFQSmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:06 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:53437 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfFQSmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:05 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MjSHc-1iMTao45Na-00kzYa; Mon, 17 Jun 2019 20:41:41 +0200
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
Subject: [PATCH 12/30] drivers: gpio: stp-xway: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:53 +0200
Message-Id: <1560796871-18560-12-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:dT3uRABFS0LCiG7s1U7q3nGf/2a0ASckiTEOKLXOYnnfgA7OHZB
 khNvDFh0WSuZo3sx9EzH1v4pwUtmCnUx8+yZKGS92xqtasNDk2YCaGg6b8IKhHzYuxexo0Y
 wHC38Ds5/US63cBfXEJJPg/iR8aNjOxE1scwYrl4MmNLk7SHxanRyG+5o8nBaJtDHdpx+BT
 0j4p24g1uWpb7eoKGmCJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ECsY8i4iHY8=:2q+L124zG9xrKP0LAEPhfN
 ASqnqFzsop8gYZmbgo53tw4T7qDXMVzNza/v/SgvoB5hR3VjvafiXE3KJ2dxb3H97ZQpNInBC
 tGPGo0npikJGvGe8o2vDzCqz+gjAhvXbHRRINPa9+Vz60vMKvyju/CEAp91aynkCSVj4Gk6am
 GpjIvOUsjYrcox4Y3Wx1Sud0BLcdLsY7qG4tCG1cyo32QyvaRQmzLNDXfiYMlkOBCKP1zJzMG
 vPrk88Rf8ZJhE35kMaRrU3cNh2GdhiDdEpJxTUznct9kYErfrRLQVlmjAyKeDM9NCGnFvTtTp
 y+YOTvf27NmEukQXOWnB33QlkQxYLFp0f+IHWgJ1w2qxfP6QnIUX1dLZGQQwUBKdjACmqN7ry
 W4/81AzT3L0rO6A1BD3hm218J9/X68t0RTBrsR9fULKK5srwkDHYm3+IUFZKvft+UxJ0ljIt9
 k/OaXy4RCaXzQqFtZ36EatNgWfQ5AX30/uw2ZhUSzLbRD5hZJ3JlIGdZ5L21DbpKJi2TFzd5t
 GIDgSCl2QNrbsGjaIpSupzc8pzb40iDDs+KPOYCiiURS8W3hPm8DNtX+9mgLbLWblgn0Z4c/A
 dOVzS/882Wouf8O0mllLBwYdnFlS5AmZ39NoBVSgfGdLGLqO+yDGWX+5pJGqgeYdwP+XIoWVs
 Uoh7idNLZnKDperYhzCo1z4iCWLyytrL63GNKDzAY3wzZ60UhH0TNUomkbKTejeqwmqibb/er
 5zvmMAC9BX/3J93ZTT75W26IWeW8//4afUl4Kg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-stp-xway.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 8a319d5..3f5c039 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -291,10 +291,4 @@ static int xway_stp_probe(struct platform_device *pdev)
 		.of_match_table = xway_stp_match,
 	},
 };
-
-static int __init xway_stp_init(void)
-{
-	return platform_driver_register(&xway_stp_driver);
-}
-
-subsys_initcall(xway_stp_init);
+subsys_platform_driver(xway_stp_driver);
-- 
1.9.1

