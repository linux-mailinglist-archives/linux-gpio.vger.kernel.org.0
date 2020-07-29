Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D66231DBB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgG2L5O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 07:57:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:56199 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2L5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jul 2020 07:57:13 -0400
IronPort-SDR: t0mhqcTXzkYgFtSt16+BxPgbz+LZ/XqS0qdhZldHh62FjU+atj9NljnZIPCQKf8RxNAjKTzC8U
 j7yxTvD8fsMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="215897152"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="215897152"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 04:57:12 -0700
IronPort-SDR: YwUBCGpsDrtutIWfJWtRna45qvwqrZdTEkFJId77tNS3h/1vysYArhxTJNT0wHfghGK+7DSPXg
 TsBkDzrO7EmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="312998954"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2020 04:57:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DE427F4; Wed, 29 Jul 2020 14:57:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] pinctrl: intel: Extract intel_pinctrl_get_soc_data() helper for wider use
Date:   Wed, 29 Jul 2020 14:57:06 +0300
Message-Id: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

intel_pinctrl_get_soc_data() helper can be used in few driver instead of
open-coded variants. Thus, extract it as a standalone API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 24 ++++++++++++++++++------
 drivers/pinctrl/intel/pinctrl-intel.h |  2 ++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 5a39e6ce6786..6e11d16a8684 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1424,9 +1424,6 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 	struct intel_pinctrl *pctrl;
 	int i, ret, irq;
 
-	if (!soc_data)
-		return -EINVAL;
-
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
@@ -1534,11 +1531,26 @@ int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
 	const struct intel_pinctrl_soc_data *data;
 
 	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODATA;
+
 	return intel_pinctrl_probe(pdev, data);
 }
 EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_hid);
 
 int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
+{
+	const struct intel_pinctrl_soc_data *data;
+
+	data = intel_pinctrl_get_soc_data(pdev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return intel_pinctrl_probe(pdev, data);
+}
+EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
+
+const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *data = NULL;
 	const struct intel_pinctrl_soc_data **table;
@@ -1561,15 +1573,15 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
 
 		id = platform_get_device_id(pdev);
 		if (!id)
-			return -ENODEV;
+			return ERR_PTR(-ENODEV);
 
 		table = (const struct intel_pinctrl_soc_data **)id->driver_data;
 		data = table[pdev->id];
 	}
 
-	return intel_pinctrl_probe(pdev, data);
+	return data ?: ERR_PTR(-ENODATA);
 }
-EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
+EXPORT_SYMBOL_GPL(intel_pinctrl_get_soc_data);
 
 #ifdef CONFIG_PM_SLEEP
 static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned int pin)
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 2e283247f3ba..38a1d6af7427 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -198,6 +198,8 @@ struct intel_pinctrl_soc_data {
 	size_t ncommunities;
 };
 
+const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev);
+
 struct intel_pad_context;
 struct intel_community_context;
 
-- 
2.27.0

