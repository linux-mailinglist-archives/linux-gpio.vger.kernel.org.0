Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C980133C626
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 19:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhCOSwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 14:52:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:6213 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232137AbhCOSvp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 14:51:45 -0400
IronPort-SDR: R24Ct+CiCacme321gNkbzWuTXlLbkDKbegwtPSekBoqKUJzQXy12sEurljihdPTdwdFuMn4F40
 gor20AhhVZIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="189188973"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="189188973"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 11:51:39 -0700
IronPort-SDR: Kt2uhdNATJ2/M0NRplutcjbRoGjkY8lqrmsBcGgX/QGP0b92CLtIfedP3xQZx9a97OEALZjp/8
 7XrknhXoD9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="373531209"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Mar 2021 11:51:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AF20711C; Mon, 15 Mar 2021 20:51:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] gpio: mockup: Drop duplicate NULL check in gpio_mockup_unregister_pdevs()
Date:   Mon, 15 Mar 2021 20:51:41 +0200
Message-Id: <20210315185141.18013-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since platform_device_unregister() is NULL-aware, we don't need to duplicate
this check. Remove it and fold the rest of the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 28b757d34046..d7e73876a3b9 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -479,15 +479,10 @@ static struct platform_device *gpio_mockup_pdevs[GPIO_MOCKUP_MAX_GC];
 
 static void gpio_mockup_unregister_pdevs(void)
 {
-	struct platform_device *pdev;
 	int i;
 
-	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++) {
-		pdev = gpio_mockup_pdevs[i];
-
-		if (pdev)
-			platform_device_unregister(pdev);
-	}
+	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++)
+		platform_device_unregister(gpio_mockup_pdevs[i]);
 }
 
 static __init char **gpio_mockup_make_line_names(const char *label,
-- 
2.30.2

