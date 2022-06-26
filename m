Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA0455B486
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jun 2022 02:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiFZX7w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 19:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiFZX7w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 19:59:52 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C557B2AFC
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 16:59:49 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a39so7948484ljq.11
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 16:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G/rsSvjEVx9HxUqXuN5EYDZnuHtx7IRYN8I0QYKvnmE=;
        b=srl3ZbmUKUMgcReSKBJ25Qt6Sku6rI7lXWu3wvhulM6+DSOZbj5qjPtZ6N6++8oqiw
         PmXIDAXrBqRDf8algNvwJHSa7zzThspUnxwK1OLq6ItWSIcVD1sDCiFarNCfRcWCi8/G
         /dVaE7+mMV1TKazQ1TZpyfPa5M1cHR0nwBHSl2cZovJKC4RH6wCFVesn08HJ0OisLV+r
         U4XR+W7mCekojKf+0fxYW4KbZKnovSWxTzz/XDY3/8DNT/xk6axFpP5vT2peiXnUeu5O
         u6dy9/NW2KpmW1OGzxLNWVeEVsfUlf+XgBBwlkkBF5Lffe6gv+P+woEQxGCvpoG6VZLZ
         /s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G/rsSvjEVx9HxUqXuN5EYDZnuHtx7IRYN8I0QYKvnmE=;
        b=EKPaGbT4sSwtv1LFBySD8Qlh/yoYSpdbBiP5QpuvgcYKeojcM9p0wVe1tjXwzze4LY
         wZwyQFMwcEjAeQFjoewOmb9NnbKlppeCz6oi+Ybs45DHJm7fyRwxL03lgq6QmwRfWrzH
         Rz3GvZxAmcoIOz0V0h9H0hgmFn1LDiLIypF/yNDt+D9TV2VRyeNl1gdJRFWllcSqhKkE
         Os+d/4vep4gY1Gk2zvStaXZIsl4L6NPlgd94bIhsM9PdO549UzxfLx/Zkztgc/WDNZ4U
         YxxEeiKMP2t2RafKzE7mdCltyWUtxmpZp8PFwL8qwBmmYJaR1+JXbABUjSf+4U10xmuD
         qDbA==
X-Gm-Message-State: AJIora+3S0gPFKAh90U3Ovx1yX3UgigQ5qZP/QGRpcUuRNmhbFK4nWHB
        tMeOsHWCPk6C/oENzKU2n99xlMMEi/LskQ==
X-Google-Smtp-Source: AGRyM1sx+Q0GCDMwftBo4jZ8VcV3LFn7MtEcY4TEqcEHPHcr066ziW6XZ1OCAn2kRCzoIO0qZCf4BQ==
X-Received: by 2002:a2e:a783:0:b0:25b:c52f:10ef with SMTP id c3-20020a2ea783000000b0025bc52f10efmr641671ljf.137.1656287987952;
        Sun, 26 Jun 2022 16:59:47 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b0047f987cc158sm1546051lfr.45.2022.06.26.16.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 16:59:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Guodong Liu <guodong.liu@mediatek.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH] pinctrl: mediatek: mt8192: Fix compile warnings
Date:   Mon, 27 Jun 2022 01:57:43 +0200
Message-Id: <20220626235743.87821-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After applying patches I get these warnings:

  drivers/pinctrl/mediatek/pinctrl-mt8192.c:1302:56:
  warning: "/*" within comment [-Wcomment]
  drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56:
  warning: "/*" within comment [-Wcomment]

Something is wrong with the missing end-slashes. Add them.

Cc: Guodong Liu <guodong.liu@mediatek.com>
Cc: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index a66394c6f443..78c02b7c81f0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1299,15 +1299,15 @@ static const unsigned int mt8192_pull_type[] = {
 	MTK_PULL_PU_PD_TYPE,/*94*/ MTK_PULL_PU_PD_TYPE,/*95*/
 	MTK_PULL_PU_PD_TYPE,/*96*/ MTK_PULL_PU_PD_TYPE,/*97*/
 	MTK_PULL_PU_PD_TYPE,/*98*/ MTK_PULL_PU_PD_TYPE,/*99*/
-	MTK_PULL_PU_PD_TYPE,/*100* MTK_PULL_PU_PD_TYPE,/*101*/
-	MTK_PULL_PU_PD_TYPE,/*102* MTK_PULL_PU_PD_TYPE,/*103*/
-	MTK_PULL_PU_PD_TYPE,/*104* MTK_PULL_PU_PD_TYPE,/*105*/
-	MTK_PULL_PU_PD_TYPE,/*106* MTK_PULL_PU_PD_TYPE,/*107*/
-	MTK_PULL_PU_PD_TYPE,/*108* MTK_PULL_PU_PD_TYPE,/*109*/
-	MTK_PULL_PU_PD_TYPE,/*110* MTK_PULL_PU_PD_TYPE,/*111*/
-	MTK_PULL_PU_PD_TYPE,/*112* MTK_PULL_PU_PD_TYPE,/*113*/
-	MTK_PULL_PU_PD_TYPE,/*114* MTK_PULL_PU_PD_TYPE,/*115*/
-	MTK_PULL_PU_PD_TYPE,/*116* MTK_PULL_PU_PD_TYPE,/*117*/
+	MTK_PULL_PU_PD_TYPE,/*100*/ MTK_PULL_PU_PD_TYPE,/*101*/
+	MTK_PULL_PU_PD_TYPE,/*102*/ MTK_PULL_PU_PD_TYPE,/*103*/
+	MTK_PULL_PU_PD_TYPE,/*104*/ MTK_PULL_PU_PD_TYPE,/*105*/
+	MTK_PULL_PU_PD_TYPE,/*106*/ MTK_PULL_PU_PD_TYPE,/*107*/
+	MTK_PULL_PU_PD_TYPE,/*108*/ MTK_PULL_PU_PD_TYPE,/*109*/
+	MTK_PULL_PU_PD_TYPE,/*110*/ MTK_PULL_PU_PD_TYPE,/*111*/
+	MTK_PULL_PU_PD_TYPE,/*112*/ MTK_PULL_PU_PD_TYPE,/*113*/
+	MTK_PULL_PU_PD_TYPE,/*114*/ MTK_PULL_PU_PD_TYPE,/*115*/
+	MTK_PULL_PU_PD_TYPE,/*116*/ MTK_PULL_PU_PD_TYPE,/*117*/
 	MTK_PULL_PU_PD_RSEL_TYPE,/*118*/ MTK_PULL_PU_PD_RSEL_TYPE,/*119*/
 	MTK_PULL_PU_PD_RSEL_TYPE,/*120*/ MTK_PULL_PU_PD_RSEL_TYPE,/*121*/
 	MTK_PULL_PU_PD_RSEL_TYPE,/*122*/ MTK_PULL_PU_PD_RSEL_TYPE,/*123*/
-- 
2.36.1

