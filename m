Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935004D1469
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 11:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345710AbiCHKL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 05:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345693AbiCHKLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 05:11:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC043B3D4
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 02:10:23 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v4so16704891pjh.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 02:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2QEmSIEQFxB2Wc84ArL948mjUQ6bp5HIyQKnBGn7bWA=;
        b=e5hlsZ8M6FrXSm5O1f+PV6XxTqqhgfqU73P/IYJh4E0hSqqWGYVO0tRmckACGlOYw7
         /UOEQpi/SLYAuvbg6741+WVuaxEb1MV6seNKX4C0R7k/xBIHIXhx+GyyjIUl/PxX9nq+
         Gio7RkFHIVNjGn7Ma5LMRTdCDaTpZuUesPNVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2QEmSIEQFxB2Wc84ArL948mjUQ6bp5HIyQKnBGn7bWA=;
        b=ZfwWcVjHzK/KkCqJQddV2qkdcy1ZuV9pHg39eH1WQtFy3rEZfhM71d2D9SnWQGseRc
         OJaJNA2u/5+N4iAO74LuG3elHanwriAzk642F2NZ2wCzsORDPyBpy/mPPULmVxxXxpz8
         LStv/umSK0sh42OO+kkquv9WCpqDQOP62SMU/yRl2KuO/HvNOHIzhFd922oNXiyE/2lH
         nFyH/HjPgskudl2sCVdlutg/nCugE6lozM1NYxsHVjnntdQ8EdRl/ly0NbPSxULKoI18
         4TVcxrt1q7s+QSkXhAKJZjVy9PCdTAnvFoA6JJUKYfS9aL/lkGmihpJtRdURa74DYzRD
         2Fwg==
X-Gm-Message-State: AOAM532ftNt70tPrdASiouro0mt1eVUrOwQ4y9iv7PQqKpU9Ehl02U9x
        pBnZpPeccNOjkXNLprBjfeU1xA==
X-Google-Smtp-Source: ABdhPJzUIGM7/aLnoqVgZbi6x5gKdbjCUJrwbdnqiMSuTVYjMyywx1haZYeF+oYRHLRbmkLV6lNEOg==
X-Received: by 2002:a17:902:f785:b0:14d:d2b6:b7c with SMTP id q5-20020a170902f78500b0014dd2b60b7cmr16603240pln.68.1646734222911;
        Tue, 08 Mar 2022 02:10:22 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
        by smtp.gmail.com with ESMTPSA id k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:10:22 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 09/11] pinctrl: mediatek: pinctrl-moore: Simplify with dev_err_probe()
Date:   Tue,  8 Mar 2022 18:09:54 +0800
Message-Id: <20220308100956.2750295-10-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 25 +++++++++---------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 5bfaa84839c7..526faaebaf77 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -605,6 +605,7 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
 	int err, i;
@@ -616,11 +617,9 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 	hw->soc = soc;
 	hw->dev = &pdev->dev;
 
-	if (!hw->soc->nbase_names) {
-		dev_err(&pdev->dev,
+	if (!hw->soc->nbase_names)
+		return dev_err_probe(dev, -EINVAL,
 			"SoC should be assigned at least one register base\n");
-		return -EINVAL;
-	}
 
 	hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
 				      sizeof(*hw->base), GFP_KERNEL);
@@ -665,17 +664,13 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	/* Setup groups descriptions per SoC types */
 	err = mtk_build_groups(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to build groups\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to build groups\n");
 
 	/* Setup functions descriptions per SoC types */
 	err = mtk_build_functions(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to build functions\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to build functions\n");
 
 	/* For able to make pinctrl_claim_hogs, we must not enable pinctrl
 	 * until all groups and functions are being added one.
@@ -691,10 +686,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	/* Build gpiochip should be after pinctrl_enable is done */
 	err = mtk_build_gpiochip(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to add gpio_chip\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
 
 	platform_set_drvdata(pdev, hw);
 
-- 
2.35.1.616.g0bdcbb4464-goog

