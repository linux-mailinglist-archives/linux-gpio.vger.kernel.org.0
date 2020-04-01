Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92B3519A7F6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 10:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgDAIz5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 04:55:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:61026 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgDAIz4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 04:55:56 -0400
IronPort-SDR: wGnovPNHb+ZkH9lb8JMsETzYEuSCKCcSkrh/VxJ2E5+CYKHyrUz8gFl5FJ4Ze2t1SygiJtXsJ/
 HeNQZCJGdY9Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 01:55:56 -0700
IronPort-SDR: ENMgeQ42FCi6T6GUAsh4ovAcLkGESv0r+cn2iiZW3UCgFAYM2vhvePoXhUli6RGq1CP9feyMEa
 kvxkX55ZpOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; 
   d="scan'208";a="252542068"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 01 Apr 2020 01:55:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4913623D; Wed,  1 Apr 2020 11:55:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: sunrisepoint: Fix PAD lock register offset for SPT-H
Date:   Wed,  1 Apr 2020 11:55:53 +0300
Message-Id: <20200401085553.8770-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that SPT-H variant has different offset for PAD locking registers.
Fix it here.

Fixes: 551fa5801ef1 ("pinctrl: intel: sunrisepoint: Add Intel Sunrisepoint-H support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index 330c8f077b73..4d7a86a5a37b 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -15,17 +15,18 @@
 
 #include "pinctrl-intel.h"
 
-#define SPT_PAD_OWN	0x020
-#define SPT_PADCFGLOCK	0x0a0
-#define SPT_HOSTSW_OWN	0x0d0
-#define SPT_GPI_IS	0x100
-#define SPT_GPI_IE	0x120
+#define SPT_PAD_OWN		0x020
+#define SPT_H_PADCFGLOCK	0x090
+#define SPT_LP_PADCFGLOCK	0x0a0
+#define SPT_HOSTSW_OWN		0x0d0
+#define SPT_GPI_IS		0x100
+#define SPT_GPI_IE		0x120
 
 #define SPT_COMMUNITY(b, s, e)				\
 	{						\
 		.barno = (b),				\
 		.padown_offset = SPT_PAD_OWN,		\
-		.padcfglock_offset = SPT_PADCFGLOCK,	\
+		.padcfglock_offset = SPT_LP_PADCFGLOCK,	\
 		.hostown_offset = SPT_HOSTSW_OWN,	\
 		.is_offset = SPT_GPI_IS,		\
 		.ie_offset = SPT_GPI_IE,		\
@@ -47,7 +48,7 @@
 	{						\
 		.barno = (b),				\
 		.padown_offset = SPT_PAD_OWN,		\
-		.padcfglock_offset = SPT_PADCFGLOCK,	\
+		.padcfglock_offset = SPT_H_PADCFGLOCK,	\
 		.hostown_offset = SPT_HOSTSW_OWN,	\
 		.is_offset = SPT_GPI_IS,		\
 		.ie_offset = SPT_GPI_IE,		\
-- 
2.25.1

