Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8AA2D180F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 19:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgLGSB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 13:01:29 -0500
Received: from mga02.intel.com ([134.134.136.20]:3091 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgLGSB3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Dec 2020 13:01:29 -0500
IronPort-SDR: Fk9iNsrhe+pLqXxwYWuUsm//frhVSQJeX+NTWTC1SbySru9AY7hHdxv+EaheJffb7GvyO8pZQY
 gqOdTFTNLp4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="160788005"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="160788005"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 09:59:43 -0800
IronPort-SDR: hZvcWPlywH52uWsZpERbwyJx5KG0RT++R5gzcUt+U/IS7KjeKp0X9WBisD321D5/IfoRqcCRaK
 +03g6eHYabGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="332201515"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 07 Dec 2020 09:59:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DBA0714B; Mon,  7 Dec 2020 19:59:40 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on GPIO request
Date:   Mon,  7 Dec 2020 19:59:40 +0200
Message-Id: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mistakenly the buffers (input and output) become together enabled for a little
period of time during GPIO request. This is problematic, because instead of
initial motive to disable them in the commit af7e3eeb84e2
("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
the driven value on the pin, which might be used as an IRQ line, brings
firmware of some touch pads in an awkward state that needs a full power off
to recover. Fix this by, as stated in a culprit commit, disabling the buffers.

Fixes: af7e3eeb84e2 ("pinctrl: intel: Disable input and output buffer when switching to GPIO")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210497
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

