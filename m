Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF53739DB9F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 13:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhFGLmf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 07:42:35 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:43577 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbhFGLmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 07:42:35 -0400
Received: by mail-pg1-f176.google.com with SMTP id e22so13571228pgv.10
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KI3tTCluotO+HmvYcfUBTi934M7YmjMqNpLlbV1t4KU=;
        b=XaTWaIIY2PCj+spbqrB9N4s+slLdiAKp28JmsLJfi5Pu/M5A9amdLfbp0xhsMUg+WZ
         cGhEdPgo5Hb5qZ7oonQYajxNpsMjUAe0hJhUAUNWau7pkxRcGr2Rsm4qfW84zqp3JZv8
         NGBlCuGU/XgXgPNJbEAGPo4nA+b/Fgs52Emq5S3ylgViQZZMnq0oSyzUsDMZMwYK+9jh
         HFDBj1rZCh6/KBLFFdTkPWcWZxTPbyhtqyBa7Gf2yxt7oGRNSROle8oaevBaVZ63slBs
         I94OeXBESwJV7CwfFAE4LHFAQeIKp9+mMqR/XirqVe2H2ImHij6wtBypjekr8HELYCoZ
         XBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KI3tTCluotO+HmvYcfUBTi934M7YmjMqNpLlbV1t4KU=;
        b=tAfDBcRqlzIv9R6z59KvcOmBLdFdsu8X18Hm62tQ3feZ/+P+gl9KbqV+LU2nSuG5iP
         EfjBCtlLJTKaH9O0iWdrluxmyrLjPmlfsHoy9khqZzR7ROOMH48Kd+9SKBJWMoFbub/D
         SECiezEGPHjPwQg4nvSG7VJq6KVo++WOBF7x4USoYa+FSG1AnEFzk6anNx8QNkzgrKd7
         50tbuQ09M8yhtL68FVhwcG1EFu9OlUlhBYzXL1LrJRCZUaJAI8mgRUtts07n/pBqJxEK
         +8aHhClQZmThiCXU+2OEJFRkbSOJmYn7Ku9rRWULv2D8pSBlB+/ATTGAZeMkbkRWvSoB
         Atjw==
X-Gm-Message-State: AOAM533J3afoDkVqBvZc/OrUjCrX6MO5uq83MB3lzFvyje3u32Q+jYx8
        FOKA0HOYdinxHJ96ZcgZEsuCmg==
X-Google-Smtp-Source: ABdhPJwuWOaZmc2dk5nIa5s+bfjSOisxr6iSvNK2zsSt5V6jf+cOkbQxMKK01MFYnL2sxtXcuDXWNQ==
X-Received: by 2002:a63:d709:: with SMTP id d9mr17511794pgg.337.1623065968803;
        Mon, 07 Jun 2021 04:39:28 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.177.211])
        by smtp.gmail.com with ESMTPSA id j7sm7223939pjf.0.2021.06.07.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:39:28 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 4/8] regulator: qcom-rpmh: Add new regulator types found on SA8155p adp board
Date:   Mon,  7 Jun 2021 17:08:36 +0530
Message-Id: <20210607113840.15435-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SA8155p-adp board has two new regulator types - pmm8155au_1 and
pmm8155au_2.

The output power management circuits in these regulators include:
- FTS510 smps,
- HFS510 smps, and
- LDO510 linear regulators

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 22fec370fa61..d0a3c6527568 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -883,6 +883,70 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
 	{},
 };
 
+static const struct rpmh_vreg_init_data pmm8155au_1_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	{},
+};
+
+static const struct rpmh_vreg_init_data pmm8155au_2_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,	 "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	{},
+};
+
 static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
@@ -1143,6 +1207,14 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8150l-rpmh-regulators",
 		.data = pm8150l_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmm8155au-1-rpmh-regulators",
+		.data = pmm8155au_1_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmm8155au-2-rpmh-regulators",
+		.data = pmm8155au_2_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8350-rpmh-regulators",
 		.data = pm8350_vreg_data,
-- 
2.31.1

