Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC6B48CCA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbfFQSlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33781 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfFQSln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:43 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Md6V3-1iBB3Y2vZr-00aF6z; Mon, 17 Jun 2019 20:41:23 +0200
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
Subject: [PATCH 04/30] drivers: gpio: htc-egpio: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:45 +0200
Message-Id: <1560796871-18560-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:RwgFmAEyv1n2hFnjBFxldqdtVTz9NuzsBFs1rsWBuAG7a6EOF8U
 D0jzZGXTuPhFo5yWwS4c1Rl8RjJfm5APncOEUECZb6Z2LtYnP76UnbflJORhV4hH0Lwp5O7
 LcAIMOqIHwcJBp2QNLl60mWH37OrPFS5pE1cVZQxH8RU8HEWJFVnEyEut4Ki3yVQ1KD3Cl/
 uigegXYy47qr7vxzBqxvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TpXdJMxOdO4=:gAmkSvXxjg2hwntDW2JfUu
 ATMMTR7e6Aw+bP4NLJWmVtwxoChPtzJNJQtRD+JyzOya06sYBXVGKoo1fQZUdCQRNXW98MJVf
 KMAupSauqqLD4CQGmgERW6yu1GqtGnZQWZ6ITPJbP7qKya32N+a68saJYpHdIr/zeU8uyi4zt
 po9c2CNC49Tl7YuG6otKslk+naxq+aQJ9l7eLp/Ln+qnf0XoMV7zaOYca6KpB3lNJxIJ15iQW
 2PefcO3IsliP66nNKBEvY+SBhc1PptTmITwOB00hVmzpi5Ib0mQv1XhTuIS0SGf78wcWRZ+hp
 hemPTLklcu70zbUesvMzz3kmW2wTf1oMkax4fzc5rgPAauHSu8hLyU2Q/9mdDZ5H2IJG1NdgA
 0j6+gUfn1brZ6LjRqkLT2Z078y1CICMSQf+warTDpQ+RZKSa6J5RhgTezwTgvJeGzbpeN88XA
 boHGVk5oaLdHOe5cXpDlzGWhd9vBn1ZR+tiUzGEpEVc7O2bXIqQ5dSj5M/HTUtKODXxpL+Hve
 8LU/Q9uUnSXu4mTeg0IAM6JZG31IqAPu6aRNSd50nWgoeo8q92Xv/3CijhqkkYJS4SZEAj31a
 jSborxLHhPm6InAZUuAwLJisXFcxO50jfUGjqPDMBHktCRLB0jV4+hmE1huSfsC8UICDsngEE
 wubFcljAehhjTZrT/7/G4f7W7AnsDvWNPBZJGQk78E2lKCh7AJ0tF4/dtYzql2fS/zIFLJhkN
 Q2Bg2gWqalQPdJW+SJq1zdWfCNv7JIF+NYi0yA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-htc-egpio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 9d3ac51..cc7a655 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -422,10 +422,4 @@ static int egpio_resume(struct platform_device *pdev)
 	.suspend      = egpio_suspend,
 	.resume       = egpio_resume,
 };
-
-static int __init egpio_init(void)
-{
-	return platform_driver_probe(&egpio_driver, egpio_probe);
-}
-/* start early for dependencies */
-subsys_initcall(egpio_init);
+subsys_platform_driver(egpio_driver);
-- 
1.9.1

