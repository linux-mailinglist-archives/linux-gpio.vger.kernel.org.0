Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D00715C4B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 12:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjE3KxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 06:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjE3KxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 06:53:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DE8F0;
        Tue, 30 May 2023 03:53:11 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96fbc74fbf1so802376366b.1;
        Tue, 30 May 2023 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685443990; x=1688035990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzg/nqvejk/K5L8YO2WtysGfybP8Q6K95OLo9jAuaj8=;
        b=WjNXWrDcTKtqRQ6jAbL84LOlONWe/kB3xvaXG8VrQHbr4GL8mrOBf3Gq/A7tLWyxjh
         4kWQksLGPm8t50CYSzZ9OfmfqIi459Av6AzcUca14uRyGJHMjIhAqW/zLUwfhhtPwqED
         jn/ofpHkrhElGVKvVOpktneFX5aEzg7Izpx9QoPpWxpRrs5D/mRjAx7zBadEMfcu3czN
         nMnTh36FE3jBQGCH6Bjno/avc+zXmAm9Gz5m3PctDkUeaK4HPE4Q0jQYzBprYhwtGDQa
         R3+nAkLHUVj7GxPGceoDT0HzOgtg9t1LzcZqDF8H2bC4e8bmiMyWmCX/3Q9aHfjyJ4ht
         jYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443990; x=1688035990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzg/nqvejk/K5L8YO2WtysGfybP8Q6K95OLo9jAuaj8=;
        b=O0WRLbYYxr9W7yTk6zeLj+3w5pnXLkdo7Gfl3Qd++8RTxyUQBYVuz5+bVMymG3opmC
         Fl/NqD5AJVer1JtqOB6LlFEvKS6djOxJ4gsYVHCDw2cjkO36cAe0JyZbF+Q6SZnJiaBq
         2DzOPUHEY5/c9dte4pgta9iVs1Q02YL6RJ0ddMSJqJfLJ21WXIvSJ2oHVUe/yi3YR+Q6
         ZO0edrdUYMQgXX0ooYC6+9Sxf66X8YHMJSvHae5TQMtzmwKIT8QOuB5zcLoLl7hbtQa/
         JaSjkyJcCpbsO5p6BpZHE/vxX39wVkpxJLnusDEcd07py/qAoF3iyDaqpUDNfaU0REgn
         Rv3A==
X-Gm-Message-State: AC+VfDxk8RsAgPSGWtqYEixBv7FqmHmxP2ZJpHHZeNLyfqog6JWpqVaK
        2oZC/FpLuMnQP4qKqJIGg5w=
X-Google-Smtp-Source: ACHHUZ6Ds+IaexgV1zFhb2rJZT6ohsvQw4Ud/6TWikVIiWqgyWfnsgOl+CgOjX6e73T6fauY6l321w==
X-Received: by 2002:a17:907:868e:b0:94f:3521:396 with SMTP id qa14-20020a170907868e00b0094f35210396mr2256021ejc.23.1685443989787;
        Tue, 30 May 2023 03:53:09 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906494700b0095807ab4b57sm7305263ejt.178.2023.05.30.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:53:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: tegra: Consistently refer to SoC data
Date:   Tue, 30 May 2023 12:53:08 +0200
Message-Id: <20230530105308.1292852-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530105308.1292852-1-thierry.reding@gmail.com>
References: <20230530105308.1292852-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SoC-specific data is stored in pmx->soc and that's used throughout
the driver to access this data. The probe function has access to a local
version of that copy and uses it in some occasions. Replace them with
the more standard pmx->soc access for more consistency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 10c28534da48..cd991bd504b9 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -792,9 +792,8 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	 * Each mux group will appear in 4 functions' list of groups.
 	 * This over-allocates slightly, since not all groups are mux groups.
 	 */
-	pmx->group_pins = devm_kcalloc(&pdev->dev,
-		soc_data->ngroups * 4, sizeof(*pmx->group_pins),
-		GFP_KERNEL);
+	pmx->group_pins = devm_kcalloc(&pdev->dev, pmx->soc->ngroups * 4,
+				       sizeof(*pmx->group_pins), GFP_KERNEL);
 	if (!pmx->group_pins)
 		return -ENOMEM;
 
@@ -805,14 +804,14 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	group_pins = pmx->group_pins;
 
-	for (fn = 0; fn < soc_data->nfunctions; fn++) {
+	for (fn = 0; fn < pmx->soc->nfunctions; fn++) {
 		struct tegra_function *func = &pmx->functions[fn];
 
 		func->name = pmx->soc->functions[fn];
 		func->groups = group_pins;
 
-		for (gn = 0; gn < soc_data->ngroups; gn++) {
-			const struct tegra_pingroup *g = &soc_data->groups[gn];
+		for (gn = 0; gn < pmx->soc->ngroups; gn++) {
+			const struct tegra_pingroup *g = &pmx->soc->groups[gn];
 
 			if (g->mux_reg == -1)
 				continue;
@@ -824,7 +823,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 				continue;
 
 			BUG_ON(group_pins - pmx->group_pins >=
-				soc_data->ngroups * 4);
+				pmx->soc->ngroups * 4);
 			*group_pins++ = g->name;
 			func->ngroups++;
 		}
-- 
2.40.1

