Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A961F4636
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 20:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389161AbgFISY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 14:24:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:29300 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731989AbgFISYx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:24:53 -0400
IronPort-SDR: 9cAfCwWdkaXCrdrAGUuMqlgTvZdwF4b+113l6df3ofxuILBNZPsK4Q2U7BbYHLaSDJNd7mD+zu
 daX5zAkZL3DQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 11:24:52 -0700
IronPort-SDR: EhYzjBWz4BTPFgwtNSe7EAuky5P1b73WwD6kIrkkGPX9Olky+GW0xQr0Ow9OjgD+vtD5M7X5hM
 a3pfMudlBM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; 
   d="scan'208";a="274692801"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2020 11:24:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DDB214B9; Tue,  9 Jun 2020 21:24:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/6] pinctrl: intel: Allow drivers to define total amount of IRQs per community
Date:   Tue,  9 Jun 2020 21:24:47 +0300
Message-Id: <20200609182449.45813-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some of the pin control devices may not be capable to generate IRQ
per each pin in the community. Allow individual drivers to define
total amount of IRQs per community.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index cc78c483518f..0f01ef3fdfdd 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -103,6 +103,7 @@ enum {
  * @gpps: Pad groups if the controller has variable size pad groups
  * @ngpps: Number of pad groups in this community
  * @pad_map: Optional non-linear mapping of the pads
+ * @nirqs: Optional total number of IRQs this community can generate
  * @regs: Community specific common registers (reserved for core driver)
  * @pad_regs: Community specific pad registers (reserved for core driver)
  *
@@ -127,6 +128,7 @@ struct intel_community {
 	const struct intel_padgroup *gpps;
 	size_t ngpps;
 	const unsigned int *pad_map;
+	unsigned short nirqs;
 
 	/* Reserved for the core driver */
 	void __iomem *regs;
-- 
2.27.0.rc2

