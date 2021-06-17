Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320063AAAC6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFQFUK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhFQFUF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:20:05 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C40C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:17:58 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso3136392pjb.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAYIayTyQWOR4kwnnPVSbR+poJOlYjZtcTLhmbfPzAQ=;
        b=JXUfqMzbk4vTdFXd7JVYXz/J3FA+a4JJ8hFZTrrJH45zYhi9hpJQ5Jjs/ODCqdaLI/
         GHJ0C4A1aZOmalQRR+HRIFhlzhAZmnIUsKawZkBSaSE+lcapV+DfYAnXeHtu9evbdVP3
         Uoo2vfMue6SjRzfjVOrbaQnHt/mqC04rvlvFjd8Kf8KO8pDo1ZvaorXqJ/WZd+F9L59C
         d6nAN1lnGp+6wr0JtMlrVF+RE1jWUJSu4KUckItYyqjol8VIcGBekw1au+1yb8YvGtk/
         mbd1ry5wVvg85evMjSvaKgP+ejoIc24+v82F2//+c0JPCUaEysQzlvX50XDc8QNz6ZYm
         W/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAYIayTyQWOR4kwnnPVSbR+poJOlYjZtcTLhmbfPzAQ=;
        b=etIpKtkCgvbUhpLx43dsfgICCdQoBrbT/nygXn6pAq3WQR31VhuywFyqFJdvbrUG1o
         /wvVlkUW38zeXF4mUQwfP7kKGEGSyYuL9eeWhxtUcYCXn9+4X8QV/YyErKTYjv/gDbZ2
         UD/6Pe9b3ebEZKYG6h0xLs7WktqHb1xq5Pl4bIMZFiRQSzX4kOxZpxWRLrA6Ods6N5hM
         1SKbDjkHWG4jRpP0b+jBdn58KECU3/m0YTekmvzJskSsNuuQ8CajHv5I5P/ENXhhG4Op
         hqPKtb/4KQTwwKoPkgMH6w/7+Q9JtkLBHswEXuzWU92QtlFyI3efKf/uIqs9cTblwoqD
         NGdQ==
X-Gm-Message-State: AOAM530HXWkBKk/1vkaeAzQ644ABdDAqw4t+q9ZreiAY7oOycX4eVVA/
        WFa/LgvP8d9IllYiaHfZbzg0/g==
X-Google-Smtp-Source: ABdhPJx+sZ2dJXNI8fLLjYkjBGfkdJ1HXNYG5KHK0JRdn/NvwrIUfcuMdFPuKrJvDqocnDg2mM9KWw==
X-Received: by 2002:a17:903:31c9:b029:ed:6f56:9d1e with SMTP id v9-20020a17090331c9b02900ed6f569d1emr2930145ple.46.1623907077816;
        Wed, 16 Jun 2021 22:17:57 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id 188sm3900893pfz.146.2021.06.16.22.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:17:57 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 5/5] regulator: qcom-rpmh: Add new regulator found on SA8155p adp board
Date:   Thu, 17 Jun 2021 10:47:12 +0530
Message-Id: <20210617051712.345372-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SA8155p-adp board supports a new regulator - pmm8155au.

The output power management circuits in this regulator include:
- FTS510 smps,
- HFS510 smps, and
- LDO510 linear regulators

Add support for the same.

Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index af41a517da99..6cca910a76de 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -883,6 +883,38 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmm8155au_vreg_data[] = {
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
+	{}
+};
+
 static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
@@ -1177,6 +1209,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmc8180c-rpmh-regulators",
 		.data = pm8150l_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmm8155au-rpmh-regulators",
+		.data = pmm8155au_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmx55-rpmh-regulators",
 		.data = pmx55_vreg_data,
-- 
2.31.1

