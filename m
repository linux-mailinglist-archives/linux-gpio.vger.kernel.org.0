Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1124E497E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 00:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbiCVXHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 19:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235062AbiCVXHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 19:07:12 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B076EB27
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 16:05:40 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q14so12706053ljc.12
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qf/kqcDMmHbyYo2Rbe5+o7qZqSRG+DmsnKukRoh4oH0=;
        b=UZT0NOaf3flGqKweNxlWSWyX6GKVmVI9M+IvDu5KwRDC3RKM32YWQiAxYM1AsEXj7P
         SEUgFHa3OIeTgh1gDjhBa4G95gUHZtamgmw8mDWXloE9yp73ZFQeAa+Btl/xfql/57RQ
         UryScEfyW2IYrRJ/MmUBcAlGKWwg/BSsWI/6ybgUO0tI4LAoFRCXG6ucHqFZcS0lzRRb
         dy5D0QVHRZ2KwfwgP6mJoCd1DbHoYSYqR52iTu+iShR6Oon1fMsWVWii3KGLfnbtJj/6
         00Y4Q1mpmzaeygxeqICMhlfPrcDADlu+45hoiXY6IVkG3ql8zafHW0X0+caCajXMhllR
         ojXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qf/kqcDMmHbyYo2Rbe5+o7qZqSRG+DmsnKukRoh4oH0=;
        b=Aqm7H8Kv+ZpLS3/XIlpLLNshVw+fUJ6e9NxwiOLEgsUhQEn3HAE2g2F3WYejTBUleX
         bYjYTWKpN9g+FJxBdp/pPv75f+fx6bYv/0tYr9/ImWEtSYciHa33GpRQe4bS56kVzXoA
         mj59w1Ec7h7Rsc4mUY1NOXKz4Mdtcudq6znPBkvroEm1huw5S4HuulJ5M2HRrEpYreRQ
         7AzAzdHHtGzLIYKJ1hGuWWTcknv7Y1YuH4MrVmmWZK505GgJuJsNMOwGiO3512ealMVT
         dL9riHvdfANzuMUYLLif+oErvDEA3wM+YMaQ6JZgg31Udc53CCvs72IKp2RB4aR34ZGi
         d4Uw==
X-Gm-Message-State: AOAM530WN5pjkZpiaaACZol9jtbIfblHXseELL9gGswOgO6VWFkmZfs6
        EqsuyNzs0teyWA3pN7YO1/P5DWCbJM3TLA==
X-Google-Smtp-Source: ABdhPJy/83WYJA794lJ2OAIrp7VyL/smaArVx5ujKXBvQCl47bwoaerN8cdU85rIxh164AVs1sULSA==
X-Received: by 2002:a2e:2e0e:0:b0:249:677d:8333 with SMTP id u14-20020a2e2e0e000000b00249677d8333mr18747811lju.37.1647990338304;
        Tue, 22 Mar 2022 16:05:38 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a8-20020a19ca08000000b0044a2d9a3ecasm770573lfg.155.2022.03.22.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 16:05:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Guodong Liu <guodong.liu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] pinctrl: mediatek: mt8186: Account for probe refactoring
Date:   Wed, 23 Mar 2022 00:03:35 +0100
Message-Id: <20220322230335.462965-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

The new MT8186 drive came in and the probe calls were
refactored at the same time. Fix it up. Fixes a build issue.

Cc: Guodong Liu <guodong.liu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8186.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
index eeedab38c2b8..a4dd5197abc1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8186.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
@@ -1246,13 +1246,9 @@ static const struct mtk_pin_soc mt8186_data = {
 };
 
 static const struct of_device_id mt8186_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt8186-pinctrl", },
+	{ .compatible = "mediatek,mt8186-pinctrl", .data = &mt8186_data },
 	{ }
 };
-static int mt8186_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt8186_data);
-}
 
 static struct platform_driver mt8186_pinctrl_driver = {
 	.driver = {
@@ -1260,7 +1256,7 @@ static struct platform_driver mt8186_pinctrl_driver = {
 		.of_match_table = mt8186_pinctrl_of_match,
 		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
-	.probe = mt8186_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt8186_pinctrl_init(void)
-- 
2.35.1

