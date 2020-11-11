Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B80B2AFB0D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgKKWG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:26 -0500
Received: from mga02.intel.com ([134.134.136.20]:65375 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbgKKWGZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:25 -0500
IronPort-SDR: FA2UzdtB/fgA13PbfVhQqAi2Ek9VWgiwGOEcngjnJ8VKeD8JkmiXZwfIGN7UodfAUk6qcSUw/z
 GbVqhlWY2JWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157241318"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="157241318"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:24 -0800
IronPort-SDR: ydWJD01v2+d8BJzd9mb0JHa4TyJ/2EOXrxoei7uFdoD7vQxPaBI0FkeJS4seV/pkZ+Y7HtpBJk
 isOpA5dbj3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="360718177"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2020 14:06:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 15B76765; Thu, 12 Nov 2020 00:06:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 17/18] sh: Drop ARCH_NR_GPIOS definition
Date:   Thu, 12 Nov 2020 00:05:58 +0200
Message-Id: <20201111220559.39680-18-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The default by generic header is the same, hence drop unnecessary definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/sh/include/asm/gpio.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/include/asm/gpio.h b/arch/sh/include/asm/gpio.h
index 351918894e86..d643250f0a0f 100644
--- a/arch/sh/include/asm/gpio.h
+++ b/arch/sh/include/asm/gpio.h
@@ -16,7 +16,6 @@
 #include <cpu/gpio.h>
 #endif
 
-#define ARCH_NR_GPIOS 512
 #include <asm-generic/gpio.h>
 
 #ifdef CONFIG_GPIOLIB
-- 
2.28.0

