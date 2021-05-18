Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64ADD387454
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 10:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344473AbhERIrU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 04:47:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:7956 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241591AbhERIrU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 04:47:20 -0400
IronPort-SDR: 8m2V8OvAnkkuCncGQQxPx1ysS0dtfjRIvoLCPcq8TBjA5MwaBwQE5NBfibdQxW6himuDlx1Ae2
 OPVTh62bQpyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198709108"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="198709108"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 01:46:02 -0700
IronPort-SDR: 1OhvR54lf+z3hOso0yxPAraZUYsiKZGue2FajJF2hyKCwgZ0pJfSi8257SJuDLNvd3xCQIped7
 Yhg5Q8/74PPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="438570309"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 18 May 2021 01:46:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 19A6D12F; Tue, 18 May 2021 11:46:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/1] gpiolib: Make use of assign_bit() API (part 2)
Date:   Tue, 18 May 2021 11:46:19 +0300
Message-Id: <20210518084619.29949-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have for some time the assign_bit() API to replace open coded

	if (foo)
		set_bit(n, bar);
	else
		clear_bit(n, bar);

Use this API in GPIO library code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-sysfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 41b3b782bf3f..7c5afd999210 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -312,10 +312,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
 		return 0;
 
-	if (value)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-	else
-		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	assign_bit(FLAG_ACTIVE_LOW, &desc->flags, value);
 
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
-- 
2.30.2

