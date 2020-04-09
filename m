Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8A61A357E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgDIOMg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:40330 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727181AbgDIOMg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:36 -0400
IronPort-SDR: ykxZSLANp6yCz3B2pg07WarD5VhL0cEf/6pEBQj47+L8H5tbrGYlfb/esnm8iu3ChA7BdQcFKC
 M9p+1JApeb2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:35 -0700
IronPort-SDR: 7Lm/Ac4SSp3IW9ZaJqdO+uveDmW+J+9vAQwPz0kwTTW9+Ol5OrmluCeLmszXZ8EYWbL75MA9hQ
 jlHioBuZh4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="398581426"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Apr 2020 07:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BC63DA1C; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 10/13] gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
Date:   Thu,  9 Apr 2020 17:12:25 +0300
Message-Id: <20200409141228.49561-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
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
---
 drivers/gpio/gpio-dwapb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c03d856be703..5b93967a4c96 100644
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

