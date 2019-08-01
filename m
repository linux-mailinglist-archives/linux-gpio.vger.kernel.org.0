Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B8F7E139
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 19:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbfHARjz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 13:39:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:5705 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728885AbfHARjz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Aug 2019 13:39:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Aug 2019 10:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,335,1559545200"; 
   d="scan'208";a="166979675"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2019 10:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8019C101; Thu,  1 Aug 2019 20:39:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] gpio: pca953x: Drop %s for constant string literals
Date:   Thu,  1 Aug 2019 20:39:38 +0300
Message-Id: <20190801173938.36676-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
References: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to use %s for constant string literals
w/o special characters inside.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 454bbe2fb41f..64d02ca60f53 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1038,8 +1038,7 @@ static int pca953x_remove(struct i2c_client *client)
 		ret = pdata->teardown(client, chip->gpio_chip.base,
 				chip->gpio_chip.ngpio, pdata->context);
 		if (ret < 0)
-			dev_err(&client->dev, "%s failed, %d\n",
-					"teardown", ret);
+			dev_err(&client->dev, "teardown failed, %d\n", ret);
 	} else {
 		ret = 0;
 	}
-- 
2.20.1

