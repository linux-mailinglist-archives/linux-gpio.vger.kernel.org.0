Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610F73E2021
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 02:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241339AbhHFAn2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 20:43:28 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46002 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241490AbhHFAn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 20:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1628210593; x=1659746593;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SfYCrpZr5PyZzo73q36HdKbLa3BC6t616PMbQxgDuBQ=;
  b=m8g6jrnhj5lTjL2uUCclFgPXzNnqg7POuL+QN5QnBWffY7KBovegWO39
   zQ+U19mcGRtCJCEycRhMQTX9dbwhQbLpmba4BDC1HD2z75WuDiPxwXl9R
   qWrXpiNA2MOsJpE+PYJmyDH8A7kBuSJCxfGgSdwaztPUzlbHvbWix4WVP
   +8KrLUDIE7SFHjgL68S8grWSYNkuoBjtZUJ2p/3j5JxnSovquPRfVMCsJ
   RYq4g2N4EH7Ihq/dsK2Qkr3U+SRWi4FTgIXlI8V1K+pny7n9+e+4GWpoM
   HQBt2Wra9o7FPMi7udp+08KIELBtVVsvL+LLutt8U0F5T8FkgmPfKdKW3
   w==;
X-IronPort-AV: E=Sophos;i="5.84,299,1620662400"; 
   d="scan'208";a="176455620"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 08:43:13 +0800
IronPort-SDR: f3uiLj9DJwOTBDdLtmYru+VaHqlsWx5c3MGd72GJZwMFmhqGxeHmvFMrSbD6jfDwmDM/2yYL2d
 Dc5DRGSEzroaZ9+88vHt3x1Cs/nBiMGcW7kXqkdxDweDmPKWjYZduq8iy2fY2JgQGnbw5RWTQ7
 xLoE3oJ/G6nQejwKKHac4H2Lks1PMnYhKMsHq2qrLWNVzAhlXpm9Lm76C5AZh5Hkya/uI0j4La
 s1JlhWiQ77yTvNHWNxYx8DovjmShZTCPv2XAXkQq/15Y9eerVkC0DZo9IfMto+ReaUwC4mxh5f
 LuYIDNpTCZLsMdIFlqVA1Jam
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 17:20:42 -0700
IronPort-SDR: rSwYUbW5gotH32ZkP8gMJps5GKoU0fexTeoOJw4Pdk1MOq1fz5lyQCxa4oH9PJcThfdH62qqEC
 nz459ppCEGv8jn0dYOy2aBfV1EYq/kFfc5ZUMxsBE14bbP8UT7QnvrxwL/PX0DSEehXmbRk3sN
 Aaply430bK+zt2CSMagL7dPhhN84BN2mrno2xULdYuMn11WFh4AIU5++yABp/B07wGwCntjlS2
 ZXXCrJ3zIDLed6w6rMDC9mPz6+CsZhMtS4p0UN0FgvGgYwxIeuX9kPGrkv34f8mFO/G3s8OE1/
 hso=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.81])
  by uls-op-cesaip02.wdc.com with ESMTP; 05 Aug 2021 17:43:12 -0700
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] pinctrl: k210: Fix k210_fpioa_probe()
Date:   Fri,  6 Aug 2021 09:43:11 +0900
Message-Id: <20210806004311.52859-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In k210_fpioa_probe(), add missing calls to clk_disable_unprepare() in
case of error after cenabling the clk and pclk clocks. Also add missing
error handling when enabling pclk.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/pinctrl/pinctrl-k210.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index f831526d06ff..49e32684dbb2 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -950,23 +950,37 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 		return ret;
 
 	pdata->pclk = devm_clk_get_optional(dev, "pclk");
-	if (!IS_ERR(pdata->pclk))
-		clk_prepare_enable(pdata->pclk);
+	if (!IS_ERR(pdata->pclk)) {
+		ret = clk_prepare_enable(pdata->pclk);
+		if (ret)
+			goto disable_clk;
+	}
 
 	pdata->sysctl_map =
 		syscon_regmap_lookup_by_phandle_args(np,
 						"canaan,k210-sysctl-power",
 						1, &pdata->power_offset);
-	if (IS_ERR(pdata->sysctl_map))
-		return PTR_ERR(pdata->sysctl_map);
+	if (IS_ERR(pdata->sysctl_map)) {
+		ret = PTR_ERR(pdata->sysctl_map);
+		goto disable_pclk;
+	}
 
 	k210_fpioa_init_ties(pdata);
 
 	pdata->pctl = pinctrl_register(&k210_pinctrl_desc, dev, (void *)pdata);
-	if (IS_ERR(pdata->pctl))
-		return PTR_ERR(pdata->pctl);
+	if (IS_ERR(pdata->pctl)) {
+		ret = PTR_ERR(pdata->pctl);
+		goto disable_pclk;
+	}
 
 	return 0;
+
+disable_pclk:
+	clk_disable_unprepare(pdata->pclk);
+disable_clk:
+	clk_disable_unprepare(pdata->clk);
+
+	return ret;
 }
 
 static const struct of_device_id k210_fpioa_dt_ids[] = {
-- 
2.31.1

