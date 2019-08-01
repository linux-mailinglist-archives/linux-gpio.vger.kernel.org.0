Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A401B7E137
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 19:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfHARjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 13:39:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:32507 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728404AbfHARjm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Aug 2019 13:39:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Aug 2019 10:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; 
   d="scan'208";a="324314103"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 01 Aug 2019 10:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7952710B; Thu,  1 Aug 2019 20:39:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] gpio: pca953x: Remove explicit comparison with 0
Date:   Thu,  1 Aug 2019 20:39:37 +0300
Message-Id: <20190801173938.36676-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
References: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to explicitly compare return code with 0.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index aaba0b394d2f..454bbe2fb41f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -850,12 +850,12 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->output,
 				   chip->regs->output + NBANK(chip));
-	if (ret != 0)
+	if (ret)
 		goto out;
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
 				   chip->regs->direction + NBANK(chip));
-	if (ret != 0)
+	if (ret)
 		goto out;
 
 	/* set platform specific polarity inversion */
@@ -1061,14 +1061,14 @@ static int pca953x_regcache_sync(struct device *dev)
 	 */
 	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
 				   chip->regs->direction + NBANK(chip));
-	if (ret != 0) {
+	if (ret) {
 		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
 		return ret;
 	}
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->output,
 				   chip->regs->output + NBANK(chip));
-	if (ret != 0) {
+	if (ret) {
 		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
 		return ret;
 	}
@@ -1077,7 +1077,7 @@ static int pca953x_regcache_sync(struct device *dev)
 	if (chip->driver_data & PCA_PCAL) {
 		ret = regcache_sync_region(chip->regmap, PCAL953X_IN_LATCH,
 					   PCAL953X_IN_LATCH + NBANK(chip));
-		if (ret != 0) {
+		if (ret) {
 			dev_err(dev, "Failed to sync INT latch registers: %d\n",
 				ret);
 			return ret;
@@ -1085,7 +1085,7 @@ static int pca953x_regcache_sync(struct device *dev)
 
 		ret = regcache_sync_region(chip->regmap, PCAL953X_INT_MASK,
 					   PCAL953X_INT_MASK + NBANK(chip));
-		if (ret != 0) {
+		if (ret) {
 			dev_err(dev, "Failed to sync INT mask registers: %d\n",
 				ret);
 			return ret;
@@ -1117,7 +1117,7 @@ static int pca953x_resume(struct device *dev)
 
 	if (!atomic_read(&chip->wakeup_path)) {
 		ret = regulator_enable(chip->regulator);
-		if (ret != 0) {
+		if (ret) {
 			dev_err(dev, "Failed to enable regulator: %d\n", ret);
 			return 0;
 		}
@@ -1130,7 +1130,7 @@ static int pca953x_resume(struct device *dev)
 		return ret;
 
 	ret = regcache_sync(chip->regmap);
-	if (ret != 0) {
+	if (ret) {
 		dev_err(dev, "Failed to restore register map: %d\n", ret);
 		return ret;
 	}
-- 
2.20.1

