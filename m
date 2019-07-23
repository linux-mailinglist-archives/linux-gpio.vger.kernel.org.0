Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84D2071C46
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 17:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732232AbfGWP4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 11:56:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:13172 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728497AbfGWP4g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 11:56:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 08:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="368909706"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2019 08:56:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A56B54B; Tue, 23 Jul 2019 18:56:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/8] pinctrl: cannonlake: Provide Interrupt Status register offset
Date:   Tue, 23 Jul 2019 18:56:27 +0300
Message-Id: <20190723155633.65232-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
References: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since some of the GPIO controllers use different Interrupt Status offset,
it make sense to provide it explicitly in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cannonlake.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index 08024b065033..f51b27bbf9f1 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -19,6 +19,7 @@
 #define CNL_PADCFGLOCK		0x080
 #define CNL_LP_HOSTSW_OWN	0x0b0
 #define CNL_H_HOSTSW_OWN	0x0c0
+#define CNL_GPI_IS		0x100
 #define CNL_GPI_IE		0x120
 
 #define CNL_GPP(r, s, e, g)				\
@@ -37,6 +38,7 @@
 		.padown_offset = CNL_PAD_OWN,		\
 		.padcfglock_offset = CNL_PADCFGLOCK,	\
 		.hostown_offset = (o),			\
+		.is_offset = CNL_GPI_IS,		\
 		.ie_offset = CNL_GPI_IE,		\
 		.pin_base = (s),			\
 		.npins = ((e) - (s) + 1),		\
-- 
2.20.1

