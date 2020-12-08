Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CEA2D3219
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 19:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgLHSZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 13:25:59 -0500
Received: from mga12.intel.com ([192.55.52.136]:16108 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730894AbgLHSZ7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 13:25:59 -0500
IronPort-SDR: 5sgTmod8iM96yqqHy4/Usu9Tdum4V03fpGJON0fzUftpYHy9AHgFkDnFPt5tNhtmCq8zU7CB8b
 dGkcO/4t1LHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153183549"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="153183549"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 10:24:13 -0800
IronPort-SDR: v0S3v6Yga9o1183zujV7MH05G5qiacc+9MRWqqY2fIAAik0tZNtsAMZIKZSF1lQDIZOrWuPjGZ
 0Vw4wCSx1tPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="367875071"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2020 10:24:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5E07A14B; Tue,  8 Dec 2020 20:24:11 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v2] pinctrl: intel: Actually disable Tx and Rx buffers on GPIO request
Date:   Tue,  8 Dec 2020 20:24:03 +0200
Message-Id: <20201208182403.40435-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mistakenly the buffers (input and output) become enabled together for a short
period of time during GPIO request. This is problematic, because instead of
initial motive to disable them in the commit af7e3eeb84e2
("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
the driven value on the pin, which might be used as an IRQ line, brings
firmwares of some touch pads to an awkward state that needs a full power off
to recover. Fix this, as stated in the culprit commit, by disabling the buffers.

Fixes: af7e3eeb84e2 ("pinctrl: intel: Disable input and output buffer when switching to GPIO")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210497
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2: added tags, cosmetic fixes in the commit message
 drivers/pinctrl/intel/pinctrl-intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index e77145e3b31b..5cd720f5b0e1 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -452,8 +452,8 @@ static void intel_gpio_set_gpio_mode(void __iomem *padcfg0)
 	value |= PADCFG0_PMODE_GPIO;
 
 	/* Disable input and output buffers */
-	value &= ~PADCFG0_GPIORXDIS;
-	value &= ~PADCFG0_GPIOTXDIS;
+	value |= PADCFG0_GPIORXDIS;
+	value |= PADCFG0_GPIOTXDIS;
 
 	/* Disable SCI/SMI/NMI generation */
 	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
-- 
2.29.2

