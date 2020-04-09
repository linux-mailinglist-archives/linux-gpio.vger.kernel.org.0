Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901321A357B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgDIOMf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:21920 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727181AbgDIOMf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:35 -0400
IronPort-SDR: CeBzRtUaDiLLJkAWWZmTiNujjBeKMSdcJTubngTSmxQfv2c6+A0ENn/5Budq0oy2XzD+Ek7D8g
 yk9BR7EXLfdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:34 -0700
IronPort-SDR: M5WX4nFFsQeNikSH2QUpeO19tAXKlTOu3/5bMAAXvOXSmdPdsDRQJiH7i7wDk91Lv5vlqGPbu0
 2LxG48pBHh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="362161267"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2020 07:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B7625C76; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 09/13] gpio: dwapb: Drop bogus BUG_ON()s
Date:   Thu,  9 Apr 2020 17:12:24 +0300
Message-Id: <20200409141228.49561-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no case when no context is provided in the ->suspend() and
->resume() hooks. Moreover, BUG_ON() is harmful to user and makes kernel
inoperable after the crash. Drop the BUG_ON()s for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index a15652ff9495..c03d856be703 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -723,8 +723,6 @@ static int dwapb_gpio_suspend(struct device *dev)
 		unsigned int idx = gpio->ports[i].idx;
 		struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		BUG_ON(!ctx);
-
 		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 		ctx->dir = dwapb_read(gpio, offset);
 
@@ -773,8 +771,6 @@ static int dwapb_gpio_resume(struct device *dev)
 		unsigned int idx = gpio->ports[i].idx;
 		struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		BUG_ON(!ctx);
-
 		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		dwapb_write(gpio, offset, ctx->data);
 
-- 
2.25.1

