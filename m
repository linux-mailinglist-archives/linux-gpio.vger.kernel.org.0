Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14081E1C15
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 15:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733136AbfJWNQ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 09:16:28 -0400
Received: from mga17.intel.com ([192.55.52.151]:5419 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732090AbfJWNQ2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Oct 2019 09:16:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 06:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="188249192"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 23 Oct 2019 06:16:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 82B201F5; Wed, 23 Oct 2019 16:16:25 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] spi: Fix spelling in the comments
Date:   Wed, 23 Oct 2019 16:16:25 +0300
Message-Id: <20191023131625.61132-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Two spelling mistakes are being fixed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1b68acc28c8f..b837d04cf7af 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -92,7 +92,7 @@ static ssize_t driver_override_store(struct device *dev,
 	if (len) {
 		spi->driver_override = driver_override;
 	} else {
-		/* Emptry string, disable driver override */
+		/* Empty string, disable driver override */
 		spi->driver_override = NULL;
 		kfree(driver_override);
 	}
@@ -469,7 +469,7 @@ static LIST_HEAD(board_list);
 static LIST_HEAD(spi_controller_list);
 
 /*
- * Used to protect add/del opertion for board_info list and
+ * Used to protect add/del operation for board_info list and
  * spi_controller list, and their matching process
  * also used to protect object of type struct idr
  */
-- 
2.23.0

