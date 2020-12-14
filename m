Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA312D9D15
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 18:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440279AbgLNQ5v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 11:57:51 -0500
Received: from mga01.intel.com ([192.55.52.88]:17259 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440301AbgLNQ5j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 11:57:39 -0500
IronPort-SDR: 3H+mYmo8XU8MCJopS90Lg99F3sz42r13izgnShVDrs9ZDBUQh5RHXpWCfit2RAWWsHzue62m4F
 aMLAz4A+Zfqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="193100459"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="193100459"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 08:55:28 -0800
IronPort-SDR: mfFA5lfU3cK9R+R+RFQNHNQvr1sElFEeDqcjDpECEyWnwZ5WqmxUat1FYIaqFxT5oWhISu/QKJ
 90XMVFlPk+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="389070901"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2020 08:55:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5873014A; Mon, 14 Dec 2020 18:55:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Luo Jiaxing <luojiaxing@huawei.com>, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: hisi: Do not require ACPI for COMPILE_TEST
Date:   Mon, 14 Dec 2020 18:55:23 +0200
Message-Id: <20201214165524.43843-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make it clear that ACPI needs to be present only to get driver functional.
It is not required for compilation.

Fixes: 356b01a986a5 ("gpio: gpio-hisi: Add HiSilicon GPIO support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9d198be2840c..a6987ff28d7c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -300,7 +300,7 @@ config GPIO_GRGPIO
 
 config GPIO_HISI
 	tristate "HiSilicon GPIO controller driver"
-	depends on (ARM64 || COMPILE_TEST) && ACPI
+	depends on (ARM64 && ACPI) || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
-- 
2.29.2

