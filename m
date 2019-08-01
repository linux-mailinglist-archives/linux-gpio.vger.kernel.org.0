Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B797E138
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 19:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfHARjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 13:39:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:50941 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728885AbfHARjm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Aug 2019 13:39:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Aug 2019 10:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; 
   d="scan'208";a="348161609"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2019 10:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 58EAAFF; Thu,  1 Aug 2019 20:39:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] gpio: pca953x: Switch to use device_get_match_data()
Date:   Thu,  1 Aug 2019 20:39:35 +0300
Message-Id: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of open coded variants, switch to direct use of
device_get_match_data().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 378b206d2dc9..54cf01901320 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -949,19 +949,15 @@ static int pca953x_probe(struct i2c_client *client,
 	if (i2c_id) {
 		chip->driver_data = i2c_id->driver_data;
 	} else {
-		const struct acpi_device_id *acpi_id;
-		struct device *dev = &client->dev;
-
-		chip->driver_data = (uintptr_t)of_device_get_match_data(dev);
-		if (!chip->driver_data) {
-			acpi_id = acpi_match_device(pca953x_acpi_ids, dev);
-			if (!acpi_id) {
-				ret = -ENODEV;
-				goto err_exit;
-			}
-
-			chip->driver_data = acpi_id->driver_data;
+		const void *match;
+
+		match = device_get_match_data(&client->dev);
+		if (!match) {
+			ret = -ENODEV;
+			goto err_exit;
 		}
+
+		chip->driver_data = (uintptr_t)match;
 	}
 
 	i2c_set_clientdata(client, chip);
-- 
2.20.1

