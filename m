Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B6E5E736
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 16:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfGCO4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 10:56:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:44669 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbfGCO4S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 10:56:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 07:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="166558302"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2019 07:56:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2398C12C; Wed,  3 Jul 2019 17:56:15 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] pinctrl: baytrail: Use devm_platform_ioremap_resource()
Date:   Wed,  3 Jul 2019 17:56:12 +0300
Message-Id: <20190703145615.74768-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index bfde1c710bd9..4fc4f9658484 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1582,12 +1582,10 @@ static int byt_set_soc_data(struct byt_gpio *vg,
 
 	for (i = 0; i < soc_data->ncommunities; i++) {
 		struct byt_community *comm = vg->communities_copy + i;
-		struct resource *mem_rc;
 
 		*comm = vg->soc_data->communities[i];
 
-		mem_rc = platform_get_resource(vg->pdev, IORESOURCE_MEM, 0);
-		comm->reg_base = devm_ioremap_resource(&vg->pdev->dev, mem_rc);
+		comm->reg_base = devm_platform_ioremap_resource(vg->pdev, 0);
 		if (IS_ERR(comm->reg_base))
 			return PTR_ERR(comm->reg_base);
 	}
-- 
2.20.1

