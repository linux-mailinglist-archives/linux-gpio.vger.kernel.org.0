Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CEA27C31D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 13:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgI2LDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 07:03:20 -0400
Received: from mga07.intel.com ([134.134.136.100]:55529 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgI2LDK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 07:03:10 -0400
IronPort-SDR: ZWvaR3TlZxFoRz1XTqYJ9Y6IEgP76HuzSCm4mflbrX37sQUYcIttXUAy3VimVpiPlBjSN55u8i
 pO2sL4KwGyUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226310784"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="226310784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 04:03:08 -0700
IronPort-SDR: 89bo2wXbpWomoYpfGabtDQkgOP5cDZrwcB6bC6kxMELaqy+x7DRFNUylg1KmZqynlQ7ayjHlSo
 9wsL8h553kOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="307723176"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 29 Sep 2020 04:03:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 737B6176; Tue, 29 Sep 2020 14:03:06 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] pinctrl: cannonlake: Modify COMMUNITY macros to be consistent
Date:   Tue, 29 Sep 2020 14:03:05 +0300
Message-Id: <20200929110306.40852-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Modify COMMUNITY macros to be consistent with Tiger Lake and others.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cannonlake.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index 515f57a0d180..8078c7739d6a 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -30,12 +30,12 @@
 		.gpio_base = (g),			\
 	}
 
-#define CNL_COMMUNITY(b, s, e, o, g)			\
+#define CNL_COMMUNITY(b, s, e, ho, g)			\
 	{						\
 		.barno = (b),				\
 		.padown_offset = CNL_PAD_OWN,		\
 		.padcfglock_offset = CNL_PADCFGLOCK,	\
-		.hostown_offset = (o),			\
+		.hostown_offset = (ho),			\
 		.is_offset = CNL_GPI_IS,		\
 		.ie_offset = CNL_GPI_IE,		\
 		.pin_base = (s),			\
@@ -44,10 +44,10 @@
 		.ngpps = ARRAY_SIZE(g),			\
 	}
 
-#define CNLLP_COMMUNITY(b, s, e, g)			\
+#define CNL_LP_COMMUNITY(b, s, e, g)			\
 	CNL_COMMUNITY(b, s, e, CNL_LP_HOSTSW_OWN, g)
 
-#define CNLH_COMMUNITY(b, s, e, g)			\
+#define CNL_H_COMMUNITY(b, s, e, g)			\
 	CNL_COMMUNITY(b, s, e, CNL_H_HOSTSW_OWN, g)
 
 /* Cannon Lake-H */
@@ -449,10 +449,10 @@ static const struct intel_function cnlh_functions[] = {
 };
 
 static const struct intel_community cnlh_communities[] = {
-	CNLH_COMMUNITY(0, 0, 50, cnlh_community0_gpps),
-	CNLH_COMMUNITY(1, 51, 154, cnlh_community1_gpps),
-	CNLH_COMMUNITY(2, 155, 248, cnlh_community3_gpps),
-	CNLH_COMMUNITY(3, 249, 298, cnlh_community4_gpps),
+	CNL_H_COMMUNITY(0, 0, 50, cnlh_community0_gpps),
+	CNL_H_COMMUNITY(1, 51, 154, cnlh_community1_gpps),
+	CNL_H_COMMUNITY(2, 155, 248, cnlh_community3_gpps),
+	CNL_H_COMMUNITY(3, 249, 298, cnlh_community4_gpps),
 };
 
 static const struct intel_pinctrl_soc_data cnlh_soc_data = {
@@ -810,9 +810,9 @@ static const struct intel_padgroup cnllp_community4_gpps[] = {
 };
 
 static const struct intel_community cnllp_communities[] = {
-	CNLLP_COMMUNITY(0, 0, 67, cnllp_community0_gpps),
-	CNLLP_COMMUNITY(1, 68, 180, cnllp_community1_gpps),
-	CNLLP_COMMUNITY(2, 181, 243, cnllp_community4_gpps),
+	CNL_LP_COMMUNITY(0, 0, 67, cnllp_community0_gpps),
+	CNL_LP_COMMUNITY(1, 68, 180, cnllp_community1_gpps),
+	CNL_LP_COMMUNITY(2, 181, 243, cnllp_community4_gpps),
 };
 
 static const struct intel_pinctrl_soc_data cnllp_soc_data = {
-- 
2.28.0

