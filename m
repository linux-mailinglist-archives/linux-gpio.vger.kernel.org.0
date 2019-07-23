Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488A671C48
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 17:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732311AbfGWP4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 11:56:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:47154 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731508AbfGWP4h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 11:56:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 08:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="171201687"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jul 2019 08:56:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9768181; Tue, 23 Jul 2019 18:56:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/8] pinctrl: broxton: Provide Interrupt Status register offset
Date:   Tue, 23 Jul 2019 18:56:26 +0300
Message-Id: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since some of the GPIO controllers use different Interrupt Status offset,
it make sense to provide it explicitly in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index e2d4505d6747..2be7e414f803 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -15,8 +15,9 @@
 #include "pinctrl-intel.h"
 
 #define BXT_PAD_OWN	0x020
-#define BXT_HOSTSW_OWN	0x080
 #define BXT_PADCFGLOCK	0x060
+#define BXT_HOSTSW_OWN	0x080
+#define BXT_GPI_IS	0x100
 #define BXT_GPI_IE	0x110
 
 #define BXT_COMMUNITY(s, e)				\
@@ -24,6 +25,7 @@
 		.padown_offset = BXT_PAD_OWN,		\
 		.padcfglock_offset = BXT_PADCFGLOCK,	\
 		.hostown_offset = BXT_HOSTSW_OWN,	\
+		.is_offset = BXT_GPI_IS,		\
 		.ie_offset = BXT_GPI_IE,		\
 		.gpp_size = 32,                         \
 		.pin_base = (s),			\
-- 
2.20.1

