Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503FF2C82B6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 12:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgK3K67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 05:58:59 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:54135 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgK3K67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 05:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606733939; x=1638269939;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lG24qXnTMPWdHovPB8UQbhB99rbvgeaUYvp+Yjrdx4c=;
  b=Q5PDI0pl/ccdYT1rDZ0utZFtv31FYy1ubAngDZyALV74+hihLg92AJb6
   Klc/gYTOxgXFg+RZemVp59MoZT14bgaPJIspdEXAd9GXtao6427Gh1Ssb
   rcigFoU0ORK7ilWuNN5GdUbIvTR8lNrjDNWfE4lLk8QAJ9K43m0M9J+Rr
   w9jn85Yx3KDHHpyb6atj5qkIkHEIseS6O9M6U5sfGCoplio8ADGE4mzmA
   tqi9C52szHKwNT98bcTrTbTLyKPSaKMNvIFSFjZorOwlBRH7WLJVk62dR
   05rzRKTXg4Gk9XuqLojYpnBOY8T1scsuIDFUtJdnI/w91/oxmZO2Yg5LT
   A==;
IronPort-SDR: DCtnSZI4e2rum7te2ZtztgNwdB+poyNWSBY/FN1x95iV+eYlCxajISsOFfnCB8jfEEJDBo0vBU
 3hm6GAUVy+zrFHVXJaYJgYc0VbK72Vs7oL/1nIf5ymqS0zc8XPttgpiMCFEnzbnXkKCB7FJYeH
 AEY0RPs5zm6wcOxkcSOdOMu6NuIYSFNNFqjYYaZx86YH/n1Yf2u7roUSyCjVdeUxWJRDOt8jiZ
 LNfS2PPlbxpguCIVKDgpPlJ7csJJxLQm4Baw4PKk/7HpTsl3golCLKCdFG3UtmRHN97VZYFAYS
 yjs=
X-IronPort-AV: E=Sophos;i="5.78,381,1599494400"; 
   d="scan'208";a="263923357"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2020 18:57:53 +0800
IronPort-SDR: DuXZc3hp+bIZ0cIy+BCoLQ9mKNnGrj/DFNrIdHh3EaDpkgm4F6NQelWHcVsjAVYCElPSs0vKmG
 3f54cL0JCMM9PzY5+H72o+0XbrW/FfVfo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 02:43:31 -0800
IronPort-SDR: hbjZWYItIXeH2T41eZaFii0vsEjZkNBJ5D+25/LKeFHeRHlgDgGDfz/NAJaCHLoqb1GVTwZbbf
 9E4uPRhH9kQg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 30 Nov 2020 02:57:53 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: dwapb: Remove unnecessary error message
Date:   Mon, 30 Nov 2020 19:57:49 +0900
Message-Id: <20201130105749.71659-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In dwapb_get_reset(), if devm_reset_control_get_optional_shared() fails,
an error message is printed even if the failure is the benign
EPROBE_DEFER error due to the reset controller not yet being
initialized. Use dev_err_probe() to handle
devm_reset_control_get_optional_shared() errors to avoid unnecessarilly
printing an error message for the deferred probe error.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/gpio/gpio-dwapb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2a9046c0fb16..ec4f6ceaae68 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -616,10 +616,9 @@ static int dwapb_get_reset(struct dwapb_gpio *gpio)
 	int err;
 
 	gpio->rst = devm_reset_control_get_optional_shared(gpio->dev, NULL);
-	if (IS_ERR(gpio->rst)) {
-		dev_err(gpio->dev, "Cannot get reset descriptor\n");
-		return PTR_ERR(gpio->rst);
-	}
+	if (IS_ERR(gpio->rst))
+		return dev_err_probe(gpio->dev, PTR_ERR(gpio->rst),
+				     "Cannot get reset descriptor\n");
 
 	err = reset_control_deassert(gpio->rst);
 	if (err) {
-- 
2.28.0

