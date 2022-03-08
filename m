Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129DD4D145C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 11:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345700AbiCHKL1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 05:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345717AbiCHKLZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 05:11:25 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58826427E6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 02:10:27 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so1937358pjl.4
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zXk7G6JY4X+JwjWY48i+9FfgXzOs0xnKY40nTgz7InE=;
        b=Iih/7wB0+IpP36es4iTqigsioyu2iHjzDuVZnq/qs9MyOXwxGmVBx7sOTDb5AhnyO+
         2sZwP/aYAtauLIJACxh4+PVzOkF3OJzIatEGocvS1oRGisfVTo3n/ESZu+QrMRY72nDH
         We3fU8biGRDQ2jLWN1UagC6QXVPE59SclSHNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zXk7G6JY4X+JwjWY48i+9FfgXzOs0xnKY40nTgz7InE=;
        b=uFHI1n3FZnnkHmQQYaDkOBWp/29iENbd9tjP6kIGewP6z0pAN4qfgfSOtLXxG4m65F
         uHnfVS16EN1azzkh3yRoQq1n9IhFp4u4fB+uGMYWfroExSl+BmKrbX4wQG/oyOLFeaU4
         vGrrDzWlH/y3WDpDt50BV85bsF6kg5AvRcCapANioDzmVxctxnEdsVHqYi39BCiw7D2h
         j0SkWWBQuQzDSzN8Q7L/Sa8WPkznQA51vn1ZNHgv+Ukfqq8uRqs6qaze2hrOUZR98IWr
         i6jTYr5qt2GkV378wz6/at12PybXKcHGbqGXHJsXmuqz9pox2WxRF/iRi8Gxr1bnF66Q
         8+Mg==
X-Gm-Message-State: AOAM531kSDeD7hk1spv6SwS6/yV5KuT6bPeLDNBh8VcsgelbUoF5l5Y2
        csXzngx176MrR47PfqrJ980szw==
X-Google-Smtp-Source: ABdhPJw/CHBw7tkeZMpzpsFv+JZ9TCc08ybAM2WlWG6+8xZ5vVVTWpE3LRP4Tr6krv+ObbHBQi9ZPA==
X-Received: by 2002:a17:903:291:b0:14d:522c:fe3d with SMTP id j17-20020a170903029100b0014d522cfe3dmr16734037plr.100.1646734226709;
        Tue, 08 Mar 2022 02:10:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
        by smtp.gmail.com with ESMTPSA id k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:10:26 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 11/11] pinctrl: mediatek: pinctrl-mtk-common: Simplify with dev_err_probe()
Date:   Tue,  8 Mar 2022 18:09:56 +0800
Message-Id: <20220308100956.2750295-12-wenst@chromium.org>
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
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 5f7c421ab6e7..6f8dfa6ae5a0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1013,10 +1013,12 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	return mtk_eint_do_init(pctl->eint);
 }
 
+/* This is used as a common probe function */
 int mtk_pctrl_init(struct platform_device *pdev,
 		const struct mtk_pinctrl_devdata *data,
 		struct regmap *regmap)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *pctl;
 	struct device_node *np = pdev->dev.of_node, *node;
@@ -1030,10 +1032,9 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	platform_set_drvdata(pdev, pctl);
 
 	prop = of_find_property(np, "pins-are-numbered", NULL);
-	if (!prop) {
-		dev_err(&pdev->dev, "only support pins-are-numbered format\n");
-		return -EINVAL;
-	}
+	if (!prop)
+		return dev_err_probe(dev, -EINVAL,
+				     "only support pins-are-numbered format\n");
 
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
 	if (node) {
@@ -1043,8 +1044,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	} else if (regmap) {
 		pctl->regmap1  = regmap;
 	} else {
-		dev_err(&pdev->dev, "Pinctrl node has not register regmap.\n");
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL, "Cannot find pinctrl regmap.\n");
 	}
 
 	/* Only 8135 has two base addr, other SoCs have only one. */
@@ -1057,10 +1057,8 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	pctl->devdata = data;
 	ret = mtk_pctrl_build_state(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "build state failed: %d\n", ret);
-		return -EINVAL;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "build state failed\n");
 
 	pins = devm_kcalloc(&pdev->dev, pctl->devdata->npins, sizeof(*pins),
 			    GFP_KERNEL);
@@ -1081,10 +1079,9 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, &pctl->pctl_desc,
 					       pctl);
-	if (IS_ERR(pctl->pctl_dev)) {
-		dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
-		return PTR_ERR(pctl->pctl_dev);
-	}
+	if (IS_ERR(pctl->pctl_dev))
+		return dev_err_probe(dev, PTR_ERR(pctl->pctl_dev),
+				     "Couldn't register pinctrl driver\n");
 
 	pctl->chip = devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL);
 	if (!pctl->chip)
-- 
2.35.1.616.g0bdcbb4464-goog

