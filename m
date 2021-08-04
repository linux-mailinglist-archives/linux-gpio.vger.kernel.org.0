Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4004C3E05B0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 18:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbhHDQQI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 12:16:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:15755 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234543AbhHDQQH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 12:16:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="194232992"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="194232992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 09:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="441807879"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2021 09:15:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9827E169; Wed,  4 Aug 2021 19:16:10 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/4] gpio: dwapb: Read GPIO base from gpio-base property
Date:   Wed,  4 Aug 2021 19:00:17 +0300
Message-Id: <20210804160019.77105-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For backward compatibility with some legacy devices introduce
a new (*) property gpio-base to read GPIO base. This will allow
further cleaning up of the driver.

*) Note, it's not new for the GPIO library since the mockup driver
   is using it already.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added check to ensure that the property won't be used by FW (Serge)
 drivers/gpio/gpio-dwapb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 4c7153cb646c..674e91e69cc5 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -584,6 +584,10 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 
 		pp->gpio_base	= -1;
 
+		/* For internal use only, new platforms mustn't exercise this */
+		if (is_software_node(fwnode))
+			fwnode_property_read_u32(fwnode, "gpio-base", &pp->gpio_base);
+
 		/*
 		 * Only port A can provide interrupts in all configurations of
 		 * the IP.
-- 
2.30.2

