Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66B6348CAE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfFQSlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:55 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58913 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728799AbfFQSly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:54 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MRTEp-1hxThR0fuX-00NOxf; Mon, 17 Jun 2019 20:41:40 +0200
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
Subject: [PATCH 11/30] drivers: gpio: stmpe: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:52 +0200
Message-Id: <1560796871-18560-11-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:7YUAmuuIb36tOmML+CuZG3gueQCIO11o+yMbjFCLCRWDWJnjITO
 EE2RrNvSLPil8KexSJ6NLygnc/2xNpY1/8+ZW3xXQxoHinWM1O6n6e5lAa/iUJ8KKJWaS1V
 aaAtHjPoGIi7q4vqIjXnzKdFH0Rf+r8InWPpZ9fCdT4lt337pcEEzclqjiAMrAtuJMsPXOC
 A5iBq7ujXBkwYMlBHLknQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1vqbZGDS+eg=:nLGYJ+RktPeqACPzOrNBld
 OQBpWBTICAbRKNgWfqwP88ppIfh2N5aoF34MyGT798E9107cfm+tYBEaRv++qptby75DBfjO9
 o3p1tuiHmJRV3ROCUT2Sux0+XdJUmJX9OBCUQYJWeCljwqTGcivBarCQg1SpmSPJNidY6b50R
 +m2wGGo5d3HUR3CbZXncRUP20zH9JzxpKguv8gWvjVFzKNji9Ibh1NQ/AjWZP8JJvgQAAyR7+
 9lUf39AUizOInqywLyJKeA7NJWTKJA9BEczCm3VuPBOTzxKvv8JUfnDqzQV6t8pisl/bDzTdg
 TMhOeQzTEyvh8gRyiqcGCyvnMJQeX9MiZOLpA08Ce24YfKNAQynexzfKTWw7krTr1EVNwRP6V
 I8tBvqfX9k/ptCfSUBcJ/fzUQDwgDRVaMsXXj/OUKVzAgD3PVAZDvi8GPLmwBIgAzwQxWBFmq
 rk4R/nof4WUW3JyStnSNpE0VlMxB/qQ2PQNsaZLEglxOi3GQlx3rIEYU8NvRs/XyTaR28Wt0H
 Lz3yFqL0Rt6KpFjoPwPUqBwAAcWFDzSUdIIRPj09hDv5JZl4R4w7l2/UW58ejoRNQ9y2p8EWt
 nVu9vPm9KiD0BEZFT9PsmRrPi4CQRpJD62rjtuuuCaVr4l3d99IniyQbGf2pA8+VtzuiLNNk6
 taexxYgfa4jTqNNlzE61CLQcugUZLmr2ykalHhRjAEoX4dQzCRcDfvia7iwTyWkExYpMdt3g8
 gnzYYaMAuj3kqcdPd1dV62pxtiTNrV9N0Nfucw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-stmpe.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 65a2315..bb34f34 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -530,9 +530,4 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	},
 	.probe		= stmpe_gpio_probe,
 };
-
-static int __init stmpe_gpio_init(void)
-{
-	return platform_driver_register(&stmpe_gpio_driver);
-}
-subsys_initcall(stmpe_gpio_init);
+subsys_platform_driver(stmpe_gpio_driver);
-- 
1.9.1

