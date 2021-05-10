Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A4A379800
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhEJTxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:53:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:10138 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhEJTxL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:53:11 -0400
IronPort-SDR: RXdziPnBH7uiEZ5bmQ0JfFg/nG0iiIYJDtznG+cnVE1f+xx/jKEL/CGTmCsM4g5uqBeeCfRkSM
 +zVC6rQH0FKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284762058"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="284762058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:52:06 -0700
IronPort-SDR: i0oh1TxSKvz/A0jUMFVC1bZZpRrhnipd+rLbelXClpRmFNIsyY48vwywi24stPfHQJ2pG5qbhX
 nZYjacj2hJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="461431610"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2021 12:52:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EB6C5D7; Mon, 10 May 2021 22:52:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Drop duplicate offset check in gpiochip_is_requested()
Date:   Mon, 10 May 2021 22:52:21 +0300
Message-Id: <20210510195221.12350-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip_get_desc() already does the check, drop a duplicate in
gpiochip_is_requested().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1427c1be749b..220a9d8dd4e3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2004,9 +2004,6 @@ const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
-	if (offset >= gc->ngpio)
-		return NULL;
-
 	desc = gpiochip_get_desc(gc, offset);
 	if (IS_ERR(desc))
 		return NULL;
-- 
2.30.2

