Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8611630D8B0
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 12:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhBCLbN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 06:31:13 -0500
Received: from mga04.intel.com ([192.55.52.120]:46960 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234015AbhBCLbM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Feb 2021 06:31:12 -0500
IronPort-SDR: +UVyon0d+vSJDllJUZIhp98KbnKo43gSX9WLjXPchxLryluxu+xaPSXxIyCl+6LzhcStDDEMv3
 KUcplFADJe6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="178464944"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="178464944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:29:26 -0800
IronPort-SDR: dAFKMcwgDINWpm6L8V8gMkRlXoYQIbuSdIJwkSGzO8mI435DBEwV8g8NYwN2O8IuO3y/PvrNvc
 sVRe0so85Z5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="480312309"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2021 03:29:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CB811212; Wed,  3 Feb 2021 13:29:23 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1] gpio: msic: Drop driver from Makefile
Date:   Wed,  3 Feb 2021 13:29:22 +0200
Message-Id: <20210203112922.48629-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Driver is gone, no need to keep a Makefile entry for it. Remove.

Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a2106d667fb3..3ce50c1e339c 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -102,7 +102,6 @@ obj-$(CONFIG_GPIO_MOXTET)		+= gpio-moxtet.o
 obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
 obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
-obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
-- 
2.30.0

