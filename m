Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A68435F8C8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 15:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfGDNCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 09:02:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:14350 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726994AbfGDNCm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jul 2019 09:02:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 06:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; 
   d="scan'208";a="175246399"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 04 Jul 2019 06:02:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EEE1F12C; Thu,  4 Jul 2019 16:02:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Drop double check for data in intel_pinctrl_probe_by_uid()
Date:   Thu,  4 Jul 2019 16:02:39 +0300
Message-Id: <20190704130239.24111-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to duplicate the check which is done in the common
intel_pinctrl_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a18d6eefe672..8014c95c649f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1421,8 +1421,6 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
 		table = (const struct intel_pinctrl_soc_data **)id->driver_data;
 		data = table[pdev->id];
 	}
-	if (!data)
-		return -ENODEV;
 
 	return intel_pinctrl_probe(pdev, data);
 }
-- 
2.20.1

