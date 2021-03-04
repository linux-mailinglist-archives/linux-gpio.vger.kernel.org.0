Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D877B32D13E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbhCDK4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:56:34 -0500
Received: from mga09.intel.com ([134.134.136.24]:57040 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239104AbhCDK4Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 05:56:25 -0500
IronPort-SDR: 2b4TZsXRF5MmGfoVZBlVZBPWT2uVwKtAyuzJPFCJVZx2GxNVkTYlpiNPBFcbEfdwolrFS9s62e
 0sw2TRkqM96w==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="187502557"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="187502557"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 02:54:39 -0800
IronPort-SDR: BBjc4ASGZrl9v6kZbw0YBwGuvrIQCG30tqgAv2gDH73ac2+9gjjKz+w/OBYNvsJPBPjZI+wj2j
 qWlugjb0vdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="600483580"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 04 Mar 2021 02:54:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CB5EC1F4; Thu,  4 Mar 2021 12:54:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: No need to disable IRQs in the handler
Date:   Thu,  4 Mar 2021 12:54:32 +0200
Message-Id: <20210304105432.36544-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In IRQ handler interrupts are already disabled, hence no need
to repeat it. Even in the threaded case, which is disabled here,
it is not a problem because IRQ framework serializes descriptor
handling. Remove disabling IRQ part in the handler.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 93237d6e4316..268aaad3bb08 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1173,16 +1173,15 @@ static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 	for (gpp = 0; gpp < community->ngpps; gpp++) {
 		const struct intel_padgroup *padgrp = &community->gpps[gpp];
 		unsigned long pending, enabled, gpp_offset;
-		unsigned long flags;
 
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
+		raw_spin_lock(&pctrl->lock);
 
 		pending = readl(community->regs + community->is_offset +
 				padgrp->reg_num * 4);
 		enabled = readl(community->regs + community->ie_offset +
 				padgrp->reg_num * 4);
 
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+		raw_spin_unlock(&pctrl->lock);
 
 		/* Only interrupts that are enabled */
 		pending &= enabled;
-- 
2.30.1

