Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687B339BFE3
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 20:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFDSvm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 14:51:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:47258 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229791AbhFDSvm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Jun 2021 14:51:42 -0400
IronPort-SDR: vvlIBPi6HBrffSOizuSc0WMKAKPZuJyjiEqgc9nEMjc+cyiFRkFCSSdK8tTdOVK+uUvLGyfSY2
 kOGCUBEUviEw==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="204163330"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="204163330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 11:49:55 -0700
IronPort-SDR: d54UjbKZis1Is+b9A2p4cBYumeA3ricNkhihPMbZZTaJvstuf/6NtmNfcg5wqf5vRTddqi+3N8
 0CkECt0wAuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="448357589"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2021 11:49:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B0BDB1C8; Fri,  4 Jun 2021 21:50:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v1 1/1] gpio-dwapb: Drop unused headers and sort the rest
Date:   Fri,  4 Jun 2021 21:50:13 +0300
Message-Id: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop unused headers and drop the rest.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7d61f5821e32..3eb13d6d31ef 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -13,17 +13,15 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/platform_data/gpio-dwapb.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/reset.h>
-#include <linux/spinlock.h>
-#include <linux/platform_data/gpio-dwapb.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #include "gpiolib.h"
 #include "gpiolib-acpi.h"
-- 
2.30.2

