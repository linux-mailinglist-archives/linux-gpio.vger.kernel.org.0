Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE7928BC76
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 17:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390721AbgJLPlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 11:41:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:17387 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390658AbgJLPk5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 11:40:57 -0400
IronPort-SDR: lu2lKOVHXIjuGwiM/fONSfjn9x36J6yc8IYbSJrQEEewb/7HFtOHGTjXSx10RRYM3gPbJUBna+
 gBw3SY3oifDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="164972682"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="164972682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 08:40:55 -0700
IronPort-SDR: wjOZCdSOf/tq3kbUFuZAePjIhnSwKzaP5YyybXQwPFmGadIGKGTWjUJRHKh+vReb5aokpd7xXm
 swNGgRpl3uqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="530011339"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2020 08:40:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9A94A163; Mon, 12 Oct 2020 18:40:51 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
Date:   Mon, 12 Oct 2020 18:40:50 +0300
Message-Id: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
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

