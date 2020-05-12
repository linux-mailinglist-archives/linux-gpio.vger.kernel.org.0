Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A9B1CFD38
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgELS1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:27:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:62928 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726890AbgELS1Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:27:25 -0400
IronPort-SDR: iWwGwUhi2ZuyCPlh4Rvo1EYJAldMw/dRqK6SqC0uHFBzuUtmm1b7XX/9HDukJHUHhbP0zuqmM0
 wqgtd7bFgMtg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:27:24 -0700
IronPort-SDR: f4Cy67up8F1U86jdtV6XtC3fuNAucSFu1v0io1iulk5t9BHrY0aX3/w7747lJgisbXIYg0XLd9
 jilHyHvu+7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="251537467"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2020 11:27:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 077556A; Tue, 12 May 2020 21:27:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] gpio: xgene-sb: Allow driver to be built with COMPILE_TEST
Date:   Tue, 12 May 2020 21:27:20 +0300
Message-Id: <20200512182721.55127-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
References: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow driver to be built with COMPILE_TEST for better test coverage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 739f179e28b184..8fc7893fba2b94 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -638,7 +638,7 @@ config GPIO_XGENE
 
 config GPIO_XGENE_SB
 	tristate "APM X-Gene GPIO standby controller support"
-	depends on ARCH_XGENE
+	depends on (ARCH_XGENE || COMPILE_TEST)
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.26.2

