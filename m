Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAF62A2AD3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 13:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgKBMjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 07:39:15 -0500
Received: from mga04.intel.com ([192.55.52.120]:29208 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728582AbgKBMjO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 07:39:14 -0500
IronPort-SDR: nAhneD7GUwl0gNS8N5ajKPwZIBqhHDCyjKBdKB7Q17PrTtdGIZsL+h9dLtKSQYLAQF9FfDjVvJ
 p0jNEP/f5GYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="166284744"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="166284744"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 04:39:14 -0800
IronPort-SDR: SMgwJ+e77njLrrXZNQSI3VRAwu3vd+XQe7sTz9VGOnmbWSsqWg8NYp9wNMJjtkl+p0+iiS3Bqd
 Z7CCo+UTlqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="351991435"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 02 Nov 2020 04:39:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C904B12A; Mon,  2 Nov 2020 14:39:11 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: lynxpoint: Unify initcall location in the code
Date:   Mon,  2 Nov 2020 14:39:11 +0200
Message-Id: <20201102123911.58337-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Like in the other Intel pin control drivers, attach initcalls
to the corresponding functions. No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 96589d01fe35..849979d5d646 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -967,13 +967,12 @@ static int __init lp_gpio_init(void)
 {
 	return platform_driver_register(&lp_gpio_driver);
 }
+subsys_initcall(lp_gpio_init);
 
 static void __exit lp_gpio_exit(void)
 {
 	platform_driver_unregister(&lp_gpio_driver);
 }
-
-subsys_initcall(lp_gpio_init);
 module_exit(lp_gpio_exit);
 
 MODULE_AUTHOR("Mathias Nyman (Intel)");
-- 
2.28.0

