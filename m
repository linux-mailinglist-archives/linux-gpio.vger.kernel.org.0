Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE2B3D59DC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 14:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbhGZMNv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 08:13:51 -0400
Received: from mga01.intel.com ([192.55.52.88]:41724 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234253AbhGZMNv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jul 2021 08:13:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="234080734"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="234080734"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 05:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="463926464"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 26 Jul 2021 05:54:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8A4C349; Mon, 26 Jul 2021 15:54:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base property
Date:   Mon, 26 Jul 2021 15:54:34 +0300
Message-Id: <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For backward compatibility with some legacy devices introduce
a new (*) property gpio-base to read GPIO base. This will allow
further cleanup of the driver.

*) Note, it's not new for GPIO library since mockup driver is
   using it already.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index f6ae69d5d644..e3011d4e17b0 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -581,7 +581,8 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			pp->ngpio = DWAPB_MAX_GPIOS;
 		}
 
-		pp->gpio_base	= -1;
+		if (fwnode_property_read_u32(fwnode, "gpio-base", &pp->gpio_base))
+			pp->gpio_base = -1;
 
 		/*
 		 * Only port A can provide interrupts in all configurations of
-- 
2.30.2

