Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51A948C9D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbfFQSmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45181 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728838AbfFQSmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:00 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2E9Y-1ictzX48Sc-013cKu; Mon, 17 Jun 2019 20:41:34 +0200
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
Subject: [PATCH 07/30] drivers: gpio: msic: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:48 +0200
Message-Id: <1560796871-18560-7-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:yJFhu1QLeFAijmsii3GfgqPjU9KlJQygg8gkAZ0J/CfjZ+vPBSK
 7fBgwp7EjQh6jTbruay/xqHtivSQ0Uv/nAW+mi5jJunWoPnC50t8sA/xx1SQfZ72EeVQJ1n
 vcCW7Kq2aysbfI7g3No2PAn83tXYmWQy8CaCHfrzukXXeODDK8RUWkm2PqWGosWTatJ+jib
 i2JRRuLw56VW53N7pP47w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R0ukR3VM6a8=:WbmrvP/nlyY8CXTo7mO+Md
 OLSbVdWEQevXhDeqfMRASVVB1cMt7jRLmjRfAFK81n92GAUuDIyypvIrkPTUw8dun53KwTEU8
 j8A2O3d9COwEnY6jwb2riTww4dc9Y/vY9dULuNoeF0b41l4PpEXXvZ1gItgaAsT7/Zu0VTOaO
 hBCkNUl+O52kGmpMT8vOudiXxlts4FSMLFeJvjUNdtmLEVWLEazzgwdeSDMN+X4HTYMxDArB4
 rrlvhIgvf4mrzciIX/xcAGP9UwFe/gcnxwImUY6TFjbvBXx5XRxIOPzgyqRsz2a5+CrmBHVo+
 6qxgZJ+yhp6rEdBC5HpdTXNNZw66b7FYUNDBwDOOJ2KAfYx4okW5dpsXqtdW/SNq2SW5+YRlx
 3KN+X4iyxsTjaxBg6Q+Bza3uYRu8iC2vpVjXXVzETydSvP20WvKdFpaLb6I0VP05XlACzS/v9
 x34mYJh0mTmzdoNx+PeEM+xRmZxaIja7qrJxLnFbuYLJfGDvQquHHkfhx+zABcAF5UIqyRBNQ
 GlIcrP8MSjYNchWh+e1WpdhsnmQRcAEpWqVwszLd6w7MiU18xrhsSXFYIbfMvtzLtF9bgMlqh
 jvpGUE9Sceu10XJ89A+gEt/Q5TUL4P1iLKbkZV5okzAG0056aK04eI1+vwFhDTrwrqgmTm0CD
 3VyROm1p1k66LE7h/U4djCsv6bDlA5C/pznVj0HVcBkFotykWsg1ZwAFeasGVMMPzyKsdPht+
 cmir0Mt3XXrn71blSgnKuudIKvt6M6F68dVmXw51rT+caqIgtP1XljT8FnU=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-msic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 7e3c96e..5903ce3 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -306,9 +306,4 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
 	},
 	.probe		= platform_msic_gpio_probe,
 };
-
-static int __init platform_msic_gpio_init(void)
-{
-	return platform_driver_register(&platform_msic_gpio_driver);
-}
-subsys_initcall(platform_msic_gpio_init);
+subsys_platform_driver(platform_msic_gpio_driver);
-- 
1.9.1

