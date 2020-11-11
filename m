Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54492AFB0B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKKWGZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:25 -0500
Received: from mga12.intel.com ([192.55.52.136]:8979 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726865AbgKKWGY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:24 -0500
IronPort-SDR: qcFPVv/vt686AVy1bKZmlk+WEM8Zjn4QQX6gxOp2DJacEsFSg6V6bDIPp2p/JSBmgqs+uDlMpm
 z/+/KRN9PyrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149498451"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="149498451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:24 -0800
IronPort-SDR: lWfMqqGTnnKkMSfY+2xJl/6pQ3fF8czfVkujVznaq9PYVLigSsYCXuB6pieHMh7GPCLNFxkNc8
 RwUrrSZb6MkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366390838"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Nov 2020 14:06:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 232BB7A1; Thu, 12 Nov 2020 00:06:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 18/18] ARM: Drop ARCH_NR_GPIOS definition
Date:   Thu, 12 Nov 2020 00:05:59 +0200
Message-Id: <20201111220559.39680-19-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The conditional by the generic header is the same,
hence drop unnecessary duplication.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/include/asm/gpio.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
index c50e383358c4..f3bb8a2bf788 100644
--- a/arch/arm/include/asm/gpio.h
+++ b/arch/arm/include/asm/gpio.h
@@ -2,10 +2,6 @@
 #ifndef _ARCH_ARM_GPIO_H
 #define _ARCH_ARM_GPIO_H
 
-#if CONFIG_ARCH_NR_GPIO > 0
-#define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
-#endif
-
 /* Note: this may rely upon the value of ARCH_NR_GPIOS set in mach/gpio.h */
 #include <asm-generic/gpio.h>
 
-- 
2.28.0

