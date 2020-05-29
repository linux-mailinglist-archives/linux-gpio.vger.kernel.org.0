Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B191E7EBE
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 15:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgE2Na5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 09:30:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:44247 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgE2Na5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 May 2020 09:30:57 -0400
IronPort-SDR: Lv/FWSOdRXVu8nbnDrTMkphuZ9U/R2008+Lkn9qDVJH96eJ5n7vHjfC0tHASOBRKh9CIak8ekZ
 pyNAGfwy9pQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 06:30:57 -0700
IronPort-SDR: R/DgnAyqYdSup2sS1m2is7jX3/qyMvvDYYJDSXUp2YWYu/V4ZVCVWBzWEWFEWhc7MGG64iffn9
 j6VL38RyWfUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; 
   d="scan'208";a="303126911"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 29 May 2020 06:30:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DE130101; Fri, 29 May 2020 16:30:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 1/2] gpio: pca953x: Drop unneeded ACPI_PTR()
Date:   Fri, 29 May 2020 16:30:53 +0300
Message-Id: <20200529133054.20136-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ACPI_PTR() becomes a no-op when !CONFIG_ACPI. This is not needed since
we always have ID table enabled. Moreover, in the mentioned case compiler
will complain about defined but not used variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v4: reincluded to the series since had not been applied yet
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 4bb3d3524bc7..1fca8dd7824f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1176,7 +1176,7 @@ static struct i2c_driver pca953x_driver = {
 		.name	= "pca953x",
 		.pm	= &pca953x_pm_ops,
 		.of_match_table = pca953x_dt_ids,
-		.acpi_match_table = ACPI_PTR(pca953x_acpi_ids),
+		.acpi_match_table = pca953x_acpi_ids,
 	},
 	.probe		= pca953x_probe,
 	.remove		= pca953x_remove,
-- 
2.26.2

