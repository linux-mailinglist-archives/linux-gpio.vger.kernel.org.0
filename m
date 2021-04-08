Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A0C3589A6
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 18:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhDHQYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 12:24:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:20635 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232305AbhDHQYd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 12:24:33 -0400
IronPort-SDR: NhwO+HoaHOFfk+U5LyXwlscehcUqKDQP9TGnF/PeS4C34Slv16z3iPl90HGSl6zXw5EIxvugHD
 b8Ve2C9Hy1Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="213990972"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="213990972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 09:24:21 -0700
IronPort-SDR: d/IE0sWcHZh5xgKihrQ2CewyAwpUg+gzsh7bStmHK//u84plAhrj2epd8SP5CmIKBfc3urM4vK
 NxFCiVDxTTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="448724413"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2021 09:24:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 80BFDFC; Thu,  8 Apr 2021 19:24:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH v1 1/1] gpio: sim: Initialize attribute allocated on the heap
Date:   Thu,  8 Apr 2021 18:55:06 +0300
Message-Id: <20210408155506.12636-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The attributes on the heap must be initialized before use.
Neglecting that will produce an Oops in some configurations:

  BUG: key ffff000800eba398 has not been registered!

Initialize attribute allocated on the heap.

Fixes: 3f0279eb9e37 ("gpio: sim: new testing module")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index ea17289a869c..92493b98c51b 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -284,6 +284,7 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 		line_attr->offset = i;
 
 		dev_attr = &line_attr->dev_attr;
+		sysfs_attr_init(&dev_attr->attr);
 
 		dev_attr->attr.name = devm_kasprintf(dev, GFP_KERNEL,
 						     "gpio%u", i);
-- 
2.30.2

