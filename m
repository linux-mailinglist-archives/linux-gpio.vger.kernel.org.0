Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362A42ED720
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 20:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbhAGTEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 14:04:07 -0500
Received: from mga05.intel.com ([192.55.52.43]:25898 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbhAGTEH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 14:04:07 -0500
IronPort-SDR: OMg3qc0+dsj2v6tMMfFQ97X6+AN8SnB4ma9jI1XWYf1UCOziekxKUh1lQAjbmUdtkGfmcHUxcn
 fgP3gFxa4qJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="262249095"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="262249095"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 11:02:03 -0800
IronPort-SDR: Ka1ekfhe5VwjOxI2Or+WsnpC05mM0mLl9CnhFxF6fDsiieH9x7cNaJmWP5y7mV3LNa5iOK0LRa
 QlMG3+6tCCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="567857856"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jan 2021 11:02:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C1443233; Thu,  7 Jan 2021 21:02:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] pinctrl: intel: Convert revision conditional to switch-case
Date:   Thu,  7 Jan 2021 21:01:59 +0200
Message-Id: <20210107190200.41221-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

switch-case is slightly better to maintain in case some new features will come
in new revisions of the hardware.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 1a479112ed85..00979acb0203 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1483,9 +1483,13 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 
 		/* Determine community features based on the revision */
 		value = readl(regs + REVID);
-		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
+		switch ((value & REVID_MASK) >> REVID_SHIFT) {
+		case 0x0094 ... 0xffff:
 			community->features |= PINCTRL_FEATURE_DEBOUNCE;
 			community->features |= PINCTRL_FEATURE_1K_PD;
+			break;
+		default:
+			break;
 		}
 
 		/* Read offset of the pad configuration registers */
-- 
2.29.2

