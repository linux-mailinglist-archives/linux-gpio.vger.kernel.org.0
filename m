Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0629715C49
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 12:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjE3KxR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 06:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjE3KxO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 06:53:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2ACEA;
        Tue, 30 May 2023 03:53:10 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96f5d651170so1064556066b.1;
        Tue, 30 May 2023 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685443989; x=1688035989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPZvPowwfei//pMDM1oCHHjhPIHrCJMT7X1KkBTfcxg=;
        b=rMVwcSOse0fBA6OOxFQkOs4cpVzuXqwX8bvoyK0B08eXTyADSrewH4xE+Vhd1xTWLA
         eVHfuI9qRDFDb5QpZ11mKha/uv3ZXlV0o2yrwHGIkS4xQ2f321mSlxZfdBhQCTjaP/d+
         jhiLXNOLluQF889pvPSUgOKIPY3AugLQiHIKKesiL34D1SeOrciNezydaesfJod+PxL1
         FQtIGVyvInC4cRuAKzbkD8LutCxilIpZHVUH8B7LW9A3Vc1xjYSjZXyYDGBi1LvHCxGq
         sBnguzC5EuCrSgUeHNk/k0MNOLqlVf0KfXnzdZ1zabhUFJNRK/6h6p1Gdzoni/5Fd43s
         eLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443989; x=1688035989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPZvPowwfei//pMDM1oCHHjhPIHrCJMT7X1KkBTfcxg=;
        b=GfrthlstjT6nwle7SAJNvkV7whpjtE9Udywi+sG8NoGUkmwHfCPxsHQvW9wtJTF3GR
         +b9pKS/NsrujaLGUHYjArcGJNVLiV1kU+ORxNwg3tMYiB2WrLPUMjW+8Ux/JdptkwIVF
         EbKI9F3aQWt6IDdhvNObHdssoDb9fjmbM1/wArKmZCKskPijfIPpXsIrj/X2mq+ziULW
         puakI7E4A6fLERRNR252UfOi2daXsruWu49nvS9rrM+ktAhZ9wlFdJnGiZlP8zAqh82r
         vcBRNDoLNW2MhpLXCKIa+0NRCdwXURpVWGYTUQwbF601E1Z0dQGY/cfq5wtYN+Pd2DN0
         6RIQ==
X-Gm-Message-State: AC+VfDyLo+SRqLdB+xNIXhdqZvSpo8q4mCUOvde3ibjTdEX+HSmLSaoc
        rOoxojSdXaOs7FdsjUkT84tdP37S23A=
X-Google-Smtp-Source: ACHHUZ6LoYEF1S54zixJI2hZ/uWuyNYVdg78TRR21Q70BhdF/Bw7YkJDziaBSeTPh2bvA+Uzecr8Ww==
X-Received: by 2002:a17:907:9286:b0:973:8edc:5a57 with SMTP id bw6-20020a170907928600b009738edc5a57mr9694143ejc.4.1685443989006;
        Tue, 30 May 2023 03:53:09 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906139300b0095fd0462695sm7134555ejc.5.2023.05.30.03.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:53:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: tegra: Duplicate pinmux functions table
Date:   Tue, 30 May 2023 12:53:07 +0200
Message-Id: <20230530105308.1292852-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
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

The function table is filled with group information based on other
instance-specific data at runtime. However, the function table can be
shared between multiple instances, causing the ->probe() function for
one instance to overwrite the table of a previously probed instance.

Fix this by sharing only the function names and allocating a separate
function table for each instance.

Fixes: 5a0047360743 ("pinctrl: tegra: Separate Tegra194 instances")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 15 +++++++++++----
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++-
 drivers/pinctrl/tegra/pinctrl-tegra114.c |  7 ++-----
 drivers/pinctrl/tegra/pinctrl-tegra124.c |  7 ++-----
 drivers/pinctrl/tegra/pinctrl-tegra194.c |  7 ++-----
 drivers/pinctrl/tegra/pinctrl-tegra20.c  |  7 ++-----
 drivers/pinctrl/tegra/pinctrl-tegra210.c |  7 ++-----
 drivers/pinctrl/tegra/pinctrl-tegra30.c  |  7 ++-----
 8 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 802801dbeb18..10c28534da48 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -236,7 +236,7 @@ static const char *tegra_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 
-	return pmx->soc->functions[function].name;
+	return pmx->functions[function].name;
 }
 
 static int tegra_pinctrl_get_func_groups(struct pinctrl_dev *pctldev,
@@ -246,8 +246,8 @@ static int tegra_pinctrl_get_func_groups(struct pinctrl_dev *pctldev,
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 
-	*groups = pmx->soc->functions[function].groups;
-	*num_groups = pmx->soc->functions[function].ngroups;
+	*groups = pmx->functions[function].groups;
+	*num_groups = pmx->functions[function].ngroups;
 
 	return 0;
 }
@@ -798,10 +798,17 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx->group_pins)
 		return -ENOMEM;
 
+	pmx->functions = devm_kcalloc(&pdev->dev, pmx->soc->nfunctions,
+				      sizeof(*pmx->functions), GFP_KERNEL);
+	if (!pmx->functions)
+		return -ENOMEM;
+
 	group_pins = pmx->group_pins;
+
 	for (fn = 0; fn < soc_data->nfunctions; fn++) {
-		struct tegra_function *func = &soc_data->functions[fn];
+		struct tegra_function *func = &pmx->functions[fn];
 
+		func->name = pmx->soc->functions[fn];
 		func->groups = group_pins;
 
 		for (gn = 0; gn < soc_data->ngroups; gn++) {
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 6130cba7cce5..b3289bdf727d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -13,6 +13,7 @@ struct tegra_pmx {
 	struct pinctrl_dev *pctl;
 
 	const struct tegra_pinctrl_soc_data *soc;
+	struct tegra_function *functions;
 	const char **group_pins;
 
 	struct pinctrl_gpio_range gpio_range;
@@ -191,7 +192,7 @@ struct tegra_pinctrl_soc_data {
 	const char *gpio_compatible;
 	const struct pinctrl_pin_desc *pins;
 	unsigned npins;
-	struct tegra_function *functions;
+	const char * const *functions;
 	unsigned nfunctions;
 	const struct tegra_pingroup *groups;
 	unsigned ngroups;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index e72ab1eb2398..3d425b2018e7 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1452,12 +1452,9 @@ enum tegra_mux {
 	TEGRA_MUX_VI_ALT3,
 };
 
-#define FUNCTION(fname)					\
-	{						\
-		.name = #fname,				\
-	}
+#define FUNCTION(fname) #fname
 
-static struct tegra_function tegra114_functions[] = {
+static const char * const tegra114_functions[] = {
 	FUNCTION(blink),
 	FUNCTION(cec),
 	FUNCTION(cldvfs),
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 26096c6b967e..2a50c5c7516c 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -1611,12 +1611,9 @@ enum tegra_mux {
 	TEGRA_MUX_VIMCLK2_ALT,
 };
 
-#define FUNCTION(fname)					\
-	{						\
-		.name = #fname,				\
-	}
+#define FUNCTION(fname) #fname
 
-static struct tegra_function tegra124_functions[] = {
+static const char * const tegra124_functions[] = {
 	FUNCTION(blink),
 	FUNCTION(ccla),
 	FUNCTION(cec),
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index 277973c88434..69f58df62897 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -1189,12 +1189,9 @@ enum tegra_mux_dt {
 };
 
 /* Make list of each function name */
-#define TEGRA_PIN_FUNCTION(lid)			\
-	{					\
-		.name = #lid,			\
-	}
+#define TEGRA_PIN_FUNCTION(lid) #lid
 
-static struct tegra_function tegra194_functions[] = {
+static const char * const tegra194_functions[] = {
 	TEGRA_PIN_FUNCTION(rsvd0),
 	TEGRA_PIN_FUNCTION(rsvd1),
 	TEGRA_PIN_FUNCTION(rsvd2),
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 0dc2cf0d05b1..737fc2000f66 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -1889,12 +1889,9 @@ enum tegra_mux {
 	TEGRA_MUX_XIO,
 };
 
-#define FUNCTION(fname)					\
-	{						\
-		.name = #fname,				\
-	}
+#define FUNCTION(fname) #fname
 
-static struct tegra_function tegra20_functions[] = {
+static const char * const tegra20_functions[] = {
 	FUNCTION(ahb_clk),
 	FUNCTION(apb_clk),
 	FUNCTION(audio_sync),
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index b480f607fa16..9bb29146dfff 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1185,12 +1185,9 @@ enum tegra_mux {
 	TEGRA_MUX_VIMCLK2,
 };
 
-#define FUNCTION(fname)					\
-	{						\
-		.name = #fname,				\
-	}
+#define FUNCTION(fname) #fname
 
-static struct tegra_function tegra210_functions[] = {
+static const char * const tegra210_functions[] = {
 	FUNCTION(aud),
 	FUNCTION(bcl),
 	FUNCTION(blink),
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 7299a371827f..de5aa2d4d28d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2010,12 +2010,9 @@ enum tegra_mux {
 	TEGRA_MUX_VI_ALT3,
 };
 
-#define FUNCTION(fname)					\
-	{						\
-		.name = #fname,				\
-	}
+#define FUNCTION(fname) #fname
 
-static struct tegra_function tegra30_functions[] = {
+static const char * const tegra30_functions[] = {
 	FUNCTION(blink),
 	FUNCTION(cec),
 	FUNCTION(clk_12m_out),
-- 
2.40.1

