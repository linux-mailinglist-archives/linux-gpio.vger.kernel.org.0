Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2763F1AA9AD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636538AbgDOOQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:43702 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636546AbgDOOPo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:44 -0400
IronPort-SDR: Y3GRPJyz8xcY2IfK/+WotpUlaVLIMYMlmdLesf9Q2twmEECYfiGlPnfV0MBqJDfkElgHkH7b6T
 iW/o+m0nnHTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: +AgfgFkZj6N22tNCZlQJIZiO6PSYsVvTjmXEh8Nd+ufTZdvvw5StLvv3Ot+ocJPj6SZFyZsymB
 i8TpHTPF35sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="277627689"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 07:15:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F1C82EB1; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 11/14] gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
Date:   Wed, 15 Apr 2020 17:15:31 +0300
Message-Id: <20200415141534.31240-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we always have a table of IDs compiled in, there is no use
for of_match_ptr() nor ACPI_PTR() call. Besides that it brings
a warning (depending on configuration):

.../gpio-dwapb.c:638:34: warning: ‘dwapb_of_match’ defined but not used [-Wunused-const-variable=]
  638 | static const struct of_device_id dwapb_of_match[] = {
      |                                  ^~~~~~~~~~~~~~

Get rid of them for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index ae4c4db8b156..98e1ffcd432b 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -805,8 +805,8 @@ static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {
 		.name	= DWAPB_DRIVER_NAME,
 		.pm	= &dwapb_gpio_pm_ops,
-		.of_match_table = of_match_ptr(dwapb_of_match),
-		.acpi_match_table = ACPI_PTR(dwapb_acpi_match),
+		.of_match_table = dwapb_of_match,
+		.acpi_match_table = dwapb_acpi_match,
 	},
 	.probe		= dwapb_gpio_probe,
 	.remove		= dwapb_gpio_remove,
-- 
2.25.1

