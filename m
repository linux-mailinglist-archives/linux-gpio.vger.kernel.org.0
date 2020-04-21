Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1F61B2FB0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 21:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgDUTAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 15:00:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:45185 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbgDUTAx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 15:00:53 -0400
IronPort-SDR: yeshGDmBQ36LAZBtsjdCSSnh44g6PuihyfDquU2EIfGRIi3GoPUZy1NVb/PJd6w4qZQzI00zAt
 bzhc5RgMG/JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 12:00:53 -0700
IronPort-SDR: LrO8mYSDhC99GzruOLK3YLQk+rbl3E43nVWZ3Dsti3h25EFSbkuogjfAAKDkLXT1PHTlPsFnBR
 8b9EdB110XfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; 
   d="scan'208";a="273623805"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2020 12:00:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6FBAF11D; Tue, 21 Apr 2020 22:00:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: intel: Update description in struct intel_community
Date:   Tue, 21 Apr 2020 22:00:48 +0300
Message-Id: <20200421190049.44888-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that most of the drivers, that are using struct intel_community,
utilize gpps rather than gpp_size. Update comment accordingly.

While here, correct the description of gpp_size, i.e. remove double space
and drop redundant 'etc.' part.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 87fc0555ef90e..058bf2b6d9f0e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -94,8 +94,8 @@ enum {
  * @ie_offset: Register offset of GPI_IE from @regs.
  * @features: Additional features supported by the hardware
  * @pin_base: Starting pin of pins in this community
- * @gpp_size: Maximum number of pads in each group, such as PADCFGLOCK,
- *            HOSTSW_OWN,  GPI_IS, GPI_IE, etc. Used when @gpps is %NULL.
+ * @gpp_size: Maximum number of pads in each group, such as GPI_IS, GPI_IE,
+ *            PADCFGLOCK, HOSTSW_OWN. Used when @gpps is %NULL.
  * @gpp_num_padown_regs: Number of pad registers each pad group consumes at
  *			 minimum. Use %0 if the number of registers can be
  *			 determined by the size of the group.
@@ -106,8 +106,8 @@ enum {
  * @regs: Community specific common registers (reserved for core driver)
  * @pad_regs: Community specific pad registers (reserved for core driver)
  *
- * Most Intel GPIO host controllers this driver supports each pad group is
- * of equal size (except the last one). In that case the driver can just
+ * In some of Intel GPIO host controllers this driver supports each pad group
+ * is of equal size (except the last one). In that case the driver can just
  * fill in @gpp_size field and let the core driver to handle the rest. If
  * the controller has pad groups of variable size the client driver can
  * pass custom @gpps and @ngpps instead.
-- 
2.26.1

