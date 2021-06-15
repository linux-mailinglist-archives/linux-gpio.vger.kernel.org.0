Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453663A7865
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhFOHwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhFOHvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:51:53 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850F1C06124A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:44 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t9so10742702pgn.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5o1BJZHNv96VxgrgtbJGhmEx3wfhKVsvqcZbT5gssMI=;
        b=pyQytY+TI7xnBzHu2gsYLx2ksYKrv1ik4okxh7p7/90Y3xGjq1Knnl32Jcj52NegRr
         V//xd5+jKK35Gg03i+KRBFQ2wno7JvL2y5qNmhwsz+NNdn6+ONXGuTcbUNfZGfrTHxr5
         ujNWWLdDYYamVWaGsoqXtIRMj935dkR92WLMKJC+0wyT423Aye6xPizItCFPfXA5Pe7C
         5O9BFQaR4In0+NszmhQxKDRm8sGY/Fd8h13iNLDWKQ2uPDyDkGr/GVU2cPzamQEGLW5c
         A+PvzH8yn3GGunNlRj5sK2vRQrtahJT2d+2MCC6lPloCA2QUb2OnvOItdQf2KnAS8TAh
         xMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5o1BJZHNv96VxgrgtbJGhmEx3wfhKVsvqcZbT5gssMI=;
        b=Al5pmEcdraEbX3cqUOW2Rz+ImTXjOFzEraEIm+FQBXRpc+sLmPJichMrbkWdlzYXbS
         QdA02R/emt3vkf0Btu2AGtjoGJmk9FU/Gn5vEBYAxEL1/eIQFJMptY6tEnCklWx+b8OB
         xmjOH6vIiHkKATAoIFV3STanl/Nf5Kp5sVymOaZQreFbQ/lFtQ0r7xTUx9XJgwiKniVV
         NPyRhEjVVkxPzaIg7b7BMmBzjNZFODdHZJIZx4g2UFbt/azrtO8jPmMz+Ragi+XIZU94
         IrPqdacApVbN1RbEjfWvrDqH9iDB2jKQvaW1a+7TyGASwHAZFyuuwW3vh3xUGVwnpK09
         g8SQ==
X-Gm-Message-State: AOAM531Q0wLv2HUBqwl2LMzRiTUmxSg2M266r0tbBeHlDh9zo7BqzMi/
        VMsSK9SHV92uriRsgniqdVTzTQ==
X-Google-Smtp-Source: ABdhPJwkwOIACccewkQqCq7lFXboSHs665ZdS3BOlR6JExOrfkmxdafAT+0A0Jn60PwPLemZW+jkMQ==
X-Received: by 2002:a63:5504:: with SMTP id j4mr21283621pgb.238.1623743384067;
        Tue, 15 Jun 2021 00:49:44 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:43 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 06/10] regulator: qcom-rpmh: Add new regulator found on SA8155p adp board
Date:   Tue, 15 Jun 2021 13:15:39 +0530
Message-Id: <20210615074543.26700-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
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

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index af41a517da99..73623d51929b 100644
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
@@ -1145,6 +1177,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8150l-rpmh-regulators",
 		.data = pm8150l_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmm8155au-rpmh-regulators",
+		.data = pmm8155au_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8350-rpmh-regulators",
 		.data = pm8350_vreg_data,
-- 
2.31.1

