Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8BF1B2FAF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 21:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgDUTAx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 15:00:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:20216 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbgDUTAx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 15:00:53 -0400
IronPort-SDR: 8VZuz6ZQjo7b1KysCTZHn3LON9mMIydHkHh1gyn2Abrg5EDJSHTN08/NtPG9ZNa4ZtSlbjxjkS
 AFL1eB8qA8wA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 12:00:52 -0700
IronPort-SDR: S3g3CSpZauoFNqcFLwrU4Kb8UHjnqFs+3FcwLrWWWNCrX02Xl0buowUpvcxvRAG0iNfbZuY5zN
 hTFyFImVt3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; 
   d="scan'208";a="290571448"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2020 12:00:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7E92394; Tue, 21 Apr 2020 22:00:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: intel: Move npins closer to pin_base in struct intel_community
Date:   Tue, 21 Apr 2020 22:00:49 +0300
Message-Id: <20200421190049.44888-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421190049.44888-1-andriy.shevchenko@linux.intel.com>
References: <20200421190049.44888-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's common across the drivers to use the (pin_base, npins) pair to describe
community characteristics. Thus, move them in the struct intel_community
to be closer to each other.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 058bf2b6d9f0e..bd653f2a07382 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -94,12 +94,12 @@ enum {
  * @ie_offset: Register offset of GPI_IE from @regs.
  * @features: Additional features supported by the hardware
  * @pin_base: Starting pin of pins in this community
+ * @npins: Number of pins in this community
  * @gpp_size: Maximum number of pads in each group, such as GPI_IS, GPI_IE,
  *            PADCFGLOCK, HOSTSW_OWN. Used when @gpps is %NULL.
  * @gpp_num_padown_regs: Number of pad registers each pad group consumes at
  *			 minimum. Use %0 if the number of registers can be
  *			 determined by the size of the group.
- * @npins: Number of pins in this community
  * @gpps: Pad groups if the controller has variable size pad groups
  * @ngpps: Number of pad groups in this community
  * @pad_map: Optional non-linear mapping of the pads
@@ -121,12 +121,13 @@ struct intel_community {
 	unsigned int ie_offset;
 	unsigned int features;
 	unsigned int pin_base;
+	size_t npins;
 	unsigned int gpp_size;
 	unsigned int gpp_num_padown_regs;
-	size_t npins;
 	const struct intel_padgroup *gpps;
 	size_t ngpps;
 	const unsigned int *pad_map;
+
 	/* Reserved for the core driver */
 	void __iomem *regs;
 	void __iomem *pad_regs;
-- 
2.26.1

