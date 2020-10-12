Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BB128BCDB
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 17:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389679AbgJLPrQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 11:47:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:35856 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389450AbgJLPrQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 11:47:16 -0400
IronPort-SDR: anMSmmsZHnamr3R+VotnOJCd4YKe1BePMLZLkYb8qpHVrOliBGmZ28yD6md0Nb0WHYWtvHzjYs
 RyUcVmZqdJug==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="152687167"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="152687167"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 08:47:13 -0700
IronPort-SDR: wLa4hEHqtB8brXXwwgVOCVkdENAYnE6p3JQ1y9vhq6BUyqO0u/pXyhitm3/GGpBBq0WUSkStea
 vlp+YNwIJUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="389985234"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Oct 2020 08:47:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E1679163; Mon, 12 Oct 2020 18:47:10 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
Date:   Mon, 12 Oct 2020 18:47:09 +0300
Message-Id: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
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

