Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC342AFADE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 22:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgKKVyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 16:54:05 -0500
Received: from mga14.intel.com ([192.55.52.115]:38335 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbgKKVyF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 16:54:05 -0500
IronPort-SDR: C6KYX9vnNGGp2z/HEtn9eatQbfvklf7EzLlpU625tw4IHIHwFzc4pPtwFO5lylOlO5M1FiOL47
 zWHCCDk7+IJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="169439089"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="169439089"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 13:54:04 -0800
IronPort-SDR: WXjCrCCggz/t/GGSi88usyFnaz8cp9UwNgI1F+OkWidL87qavkgneI4e/xk5Zm4waLhY1KLl6d
 S7MIs7groJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366089330"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2020 13:54:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 90C8DD2; Wed, 11 Nov 2020 23:54:02 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>
Subject: [PATCH v1] pinctrl: jasperlake: Fix HOSTSW_OWN register offset
Date:   Wed, 11 Nov 2020 23:54:01 +0200
Message-Id: <20201111215401.34449-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Jasper Lake uses different offset for HOSTSW_OWN register.
Fix it here.

Fixes: e278dcb7048b ("pinctrl: intel: Add Intel Jasper Lake pin controller support")
Reported-by: Evan Green <evgreen@chromium.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
I have got a confirmation that PADCFGLOCK is still 0x80.
I updated my patch and put your name as Reported-by. If you want me
to have your patch instead, I can review it (it needs some massage
of the commit message)

 drivers/pinctrl/intel/pinctrl-jasperlake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-jasperlake.c b/drivers/pinctrl/intel/pinctrl-jasperlake.c
index c5e204c8da9c..ec435b7ab392 100644
--- a/drivers/pinctrl/intel/pinctrl-jasperlake.c
+++ b/drivers/pinctrl/intel/pinctrl-jasperlake.c
@@ -16,7 +16,7 @@
 
 #define JSL_PAD_OWN	0x020
 #define JSL_PADCFGLOCK	0x080
-#define JSL_HOSTSW_OWN	0x0b0
+#define JSL_HOSTSW_OWN	0x0c0
 #define JSL_GPI_IS	0x100
 #define JSL_GPI_IE	0x120
 
-- 
2.28.0

