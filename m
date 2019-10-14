Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50825D5DBE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730439AbfJNInw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 04:43:52 -0400
Received: from mga03.intel.com ([134.134.136.65]:41881 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730469AbfJNInw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Oct 2019 04:43:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 01:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="188966877"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2019 01:43:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6C880EB; Mon, 14 Oct 2019 11:43:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] pinctrl: intel: Introduce intel_restore_intmask() helper
Date:   Mon, 14 Oct 2019 11:43:48 +0300
Message-Id: <20191014084348.42489-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
References: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor restoring GPI_IE registers by using an introduced helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index e59ac31921e7..b9df243e19cf 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1607,6 +1607,15 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	dev_warn(dev, "restored hostown %u/%u %#8x->%#8x\n", c, gpp, value, saved);
 }
 
+static void intel_restore_intmask(struct intel_pinctrl *pctrl, unsigned int c,
+				  void __iomem *base, unsigned int gpp, u32 saved)
+{
+	struct device *dev = pctrl->dev;
+
+	writel(saved, base + gpp * 4);
+	dev_dbg(dev, "restored mask %u/%u %#08x\n", c, gpp, readl(base + gpp * 4));
+}
+
 static void intel_restore_padcfg(struct intel_pinctrl *pctrl, unsigned int pin,
 				 unsigned int reg, u32 value)
 {
@@ -1657,11 +1666,8 @@ int intel_pinctrl_resume_noirq(struct device *dev)
 		unsigned int gpp;
 
 		base = community->regs + community->ie_offset;
-		for (gpp = 0; gpp < community->ngpps; gpp++) {
-			writel(communities[i].intmask[gpp], base + gpp * 4);
-			dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
-				readl(base + gpp * 4));
-		}
+		for (gpp = 0; gpp < community->ngpps; gpp++)
+			intel_restore_intmask(pctrl, i, base, gpp, communities[i].intmask[gpp]);
 
 		base = community->regs + community->hostown_offset;
 		for (gpp = 0; gpp < community->ngpps; gpp++)
-- 
2.23.0

