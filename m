Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3827283652
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 15:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgJENNA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 09:13:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:10137 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgJENNA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Oct 2020 09:13:00 -0400
IronPort-SDR: h6VG0Ji25ddIO+roW5MDsDH6O/T7F24iqcTgTGT/V1R/uxTBx1f9LbgrxbkNrQu0IihCGqQO/s
 0l6ZZfg/q3Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="227618524"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="227618524"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 06:10:47 -0700
IronPort-SDR: 3K4IOF18f21GA4Rcaq8kkMchhGELsGPwPy8yLTLOTCpWM9EP3pu0Ac13GvjYjRHua/+sb0COv8
 qKAHG4Gs/JJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="352430590"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2020 06:10:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DB67A1EF; Mon,  5 Oct 2020 16:10:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v1] gpiolib: Disable compat ->read() code in UML case
Date:   Mon,  5 Oct 2020 16:10:44 +0300
Message-Id: <20201005131044.87276-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that UML (arch/um) has no compat.h header defined and hence
can't compile a recently provided piece of code in GPIO library.

Disable compat ->read() code in UML case to avoid compilation errors.

While at it, use pattern which is already being used in the kernel elsewhere.

Fixes: 5ad284ab3a01 ("gpiolib: Fix line event handling in syscall compatible mode")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 76c36b05aef6..fed5a3b2172f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -425,7 +425,7 @@ static __poll_t lineevent_poll(struct file *file,
 
 static ssize_t lineevent_get_size(void)
 {
-#ifdef __x86_64__
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
 	/* i386 has no padding after 'id' */
 	if (in_ia32_syscall()) {
 		struct compat_gpioeevent_data {
-- 
2.28.0

