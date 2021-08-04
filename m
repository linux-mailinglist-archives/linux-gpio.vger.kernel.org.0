Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7807C3E0294
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 16:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237156AbhHDOCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 10:02:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:25600 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236956AbhHDOCk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 10:02:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="201090838"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="201090838"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 07:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="670959569"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2021 07:02:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AD828B9; Wed,  4 Aug 2021 17:02:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Riccardo Mori <patacca@autistici.org>,
        Lovesh <lovesh.bond@gmail.com>
Subject: [PATCH v1 1/1] pinctrl: tigerlake: Fix GPIO mapping for newer version of software
Date:   Wed,  4 Aug 2021 17:02:46 +0300
Message-Id: <20210804140246.64856-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The software mapping for GPIO, which initially comes from Microsoft,
is subject to change by respective Windows and firmware developers.
Due to above the driver had been written and published way ahead of
the schedule, and thus the numbering schema used in it is outdated.

Fix the numbering schema in accordance with the real products on market.

Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
Reported-and-tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Reported-by: Riccardo Mori <patacca@autistici.org>
Reported-and-tested-by: Lovesh <lovesh.bond@gmail.com>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213463
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213579
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213857
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 3e4ef2b87526..0bcd19597e4a 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -701,32 +701,32 @@ static const struct pinctrl_pin_desc tglh_pins[] = {
 
 static const struct intel_padgroup tglh_community0_gpps[] = {
 	TGL_GPP(0, 0, 24, 0),				/* GPP_A */
-	TGL_GPP(1, 25, 44, 128),			/* GPP_R */
-	TGL_GPP(2, 45, 70, 32),				/* GPP_B */
-	TGL_GPP(3, 71, 78, INTEL_GPIO_BASE_NOMAP),	/* vGPIO_0 */
+	TGL_GPP(1, 25, 44, 32),				/* GPP_R */
+	TGL_GPP(2, 45, 70, 64),				/* GPP_B */
+	TGL_GPP(3, 71, 78, 96),				/* vGPIO_0 */
 };
 
 static const struct intel_padgroup tglh_community1_gpps[] = {
-	TGL_GPP(0, 79, 104, 96),			/* GPP_D */
-	TGL_GPP(1, 105, 128, 64),			/* GPP_C */
-	TGL_GPP(2, 129, 136, 160),			/* GPP_S */
-	TGL_GPP(3, 137, 153, 192),			/* GPP_G */
-	TGL_GPP(4, 154, 180, 224),			/* vGPIO */
+	TGL_GPP(0, 79, 104, 128),			/* GPP_D */
+	TGL_GPP(1, 105, 128, 160),			/* GPP_C */
+	TGL_GPP(2, 129, 136, 192),			/* GPP_S */
+	TGL_GPP(3, 137, 153, 224),			/* GPP_G */
+	TGL_GPP(4, 154, 180, 256),			/* vGPIO */
 };
 
 static const struct intel_padgroup tglh_community3_gpps[] = {
-	TGL_GPP(0, 181, 193, 256),			/* GPP_E */
-	TGL_GPP(1, 194, 217, 288),			/* GPP_F */
+	TGL_GPP(0, 181, 193, 288),			/* GPP_E */
+	TGL_GPP(1, 194, 217, 320),			/* GPP_F */
 };
 
 static const struct intel_padgroup tglh_community4_gpps[] = {
-	TGL_GPP(0, 218, 241, 320),			/* GPP_H */
+	TGL_GPP(0, 218, 241, 352),			/* GPP_H */
 	TGL_GPP(1, 242, 251, 384),			/* GPP_J */
-	TGL_GPP(2, 252, 266, 352),			/* GPP_K */
+	TGL_GPP(2, 252, 266, 416),			/* GPP_K */
 };
 
 static const struct intel_padgroup tglh_community5_gpps[] = {
-	TGL_GPP(0, 267, 281, 416),			/* GPP_I */
+	TGL_GPP(0, 267, 281, 448),			/* GPP_I */
 	TGL_GPP(1, 282, 290, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
-- 
2.30.2

