Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBE7231DBA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgG2L5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 07:57:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:56199 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbgG2L5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jul 2020 07:57:13 -0400
IronPort-SDR: ElFuUeDqwzsBak0kvUBk3eqACGLhjPw8Wamfb7kRC+ShP9KEuPKukq+K3B5bEC9UDmF9C/YsD0
 cdTYIGdLKr7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="215897151"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="215897151"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 04:57:12 -0700
IronPort-SDR: TvttYrq0VnAnxyBc3eGUHDKAPNNLDxX+MUXW5I5Q0dp6J6xRaE24tXkuU3QCsdtEIuL9Z3hUBS
 A/vXlttOUCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="273867520"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2020 04:57:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EA0AB73; Wed, 29 Jul 2020 14:57:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] pinctrl: baytrail: Switch to use intel_pinctrl_get_soc_data()
Date:   Wed, 29 Jul 2020 14:57:07 +0300
Message-Id: <20200729115708.38112-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have common helper to retrieve SoC data from driver data
we may switch to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index d6e35cba3065..d49aab3cfbaa 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1635,28 +1635,14 @@ static const struct acpi_device_id byt_gpio_acpi_match[] = {
 
 static int byt_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct intel_pinctrl_soc_data *soc_data = NULL;
-	const struct intel_pinctrl_soc_data **soc_table;
+	const struct intel_pinctrl_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
-	struct acpi_device *acpi_dev;
 	struct intel_pinctrl *vg;
-	int i, ret;
-
-	acpi_dev = ACPI_COMPANION(dev);
-	if (!acpi_dev)
-		return -ENODEV;
-
-	soc_table = (const struct intel_pinctrl_soc_data **)device_get_match_data(dev);
-
-	for (i = 0; soc_table[i]; i++) {
-		if (!strcmp(acpi_dev->pnp.unique_id, soc_table[i]->uid)) {
-			soc_data = soc_table[i];
-			break;
-		}
-	}
+	int ret;
 
-	if (!soc_data)
-		return -ENODEV;
+	soc_data = intel_pinctrl_get_soc_data(pdev);
+	if (IS_ERR(soc_data))
+		return PTR_ERR(soc_data);
 
 	vg = devm_kzalloc(dev, sizeof(*vg), GFP_KERNEL);
 	if (!vg)
-- 
2.27.0

