Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD654221CF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhJEJME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:12:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:1287 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233071AbhJEJME (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Oct 2021 05:12:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="205814882"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="205814882"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 02:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="483708516"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2021 02:10:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1A2E5183; Tue,  5 Oct 2021 12:10:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v1 1/1] gpio: mockup: Convert to use software nodes
Date:   Tue,  5 Oct 2021 12:10:16 +0300
Message-Id: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio-mockup driver creates a properties that are shared between
platform and GPIO devices. Because of that, the properties may not
be removed at the proper point of time without provoking use-after-free
as shown in the backtrace:

  refcount_t: underflow; use-after-free.
  WARNING: CPU: 0 PID: 103 at lib/refcount.c:28 refcount_warn_saturate+0xd1/0x120
  ...
  Call Trace:
  kobject_put+0xdc/0xf0
  software_node_notify_remove+0xa8/0xc0
  device_del+0x15a/0x3e0

That's why the driver has to manage lifetime of the software nodes by itself.

The problem originates by the old device_add_properties() API, but has been
only revealed after the commit 5aeb05b27f81 ("software node: balance refcount
for managed software nodes"). Hence, it's used as landmark for the backporting.

Fixes: 5aeb05b27f81 ("software node: balance refcount for managed software nodes")
Reported-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0a9d746a0fe0..8b147b565e92 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -478,8 +478,18 @@ static void gpio_mockup_unregister_pdevs(void)
 {
 	int i;
 
-	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++)
-		platform_device_unregister(gpio_mockup_pdevs[i]);
+	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++) {
+		struct platform_device *pdev;
+		struct fwnode_handle *fwnode;
+
+		pdev = gpio_mockup_pdevs[i];
+		if (!pdev)
+			continue;
+
+		fwnode = dev_fwnode(&pdev->dev);
+		platform_device_unregister(pdev);
+		fwnode_remove_software_node(fwnode);
+	}
 }
 
 static __init char **gpio_mockup_make_line_names(const char *label,
@@ -508,6 +518,7 @@ static int __init gpio_mockup_register_chip(int idx)
 	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
 	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
 	char **line_names = NULL;
 	char chip_label[32];
 	int prop = 0, base;
@@ -536,13 +547,18 @@ static int __init gpio_mockup_register_chip(int idx)
 					"gpio-line-names", line_names, ngpio);
 	}
 
+	fwnode = fwnode_create_software_node(properties, NULL);
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
+
 	pdevinfo.name = "gpio-mockup";
 	pdevinfo.id = idx;
-	pdevinfo.properties = properties;
+	pdevinfo.fwnode = fwnode;
 
 	pdev = platform_device_register_full(&pdevinfo);
 	kfree_strarray(line_names, ngpio);
 	if (IS_ERR(pdev)) {
+		fwnode_remove_software_node(fwnode);
 		pr_err("error registering device");
 		return PTR_ERR(pdev);
 	}
-- 
2.33.0

