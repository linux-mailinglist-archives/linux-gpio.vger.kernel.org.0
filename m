Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9A43AAAC3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhFQFUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhFQFUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:20:04 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BDEC061280
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:17:50 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id i34so3955691pgl.9
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/10lSEnqxmZU389TyEm0ftHJEmxcBUG8gGtRVqkHKNQ=;
        b=EZ6HKpKNb1vR7EfW8MaKdXZNXQaTQtFcDG2zFR4d5N+IFa0kFhQ4XhVHerzc+NGfTD
         9M1QvtQc7eGCYLyvPtsdnRmYBRzGW26GWvSJrN7I+fulF5ppdmTLelRksTmT8B20sFer
         qGlq61MrldTjWQ/fiLCGmWess8xTwPTckvyx8016DFHQphB5lbl1YQRCjprM/Qr/WeBW
         WIsc2/2VnebhU9sWIUL4tUWfxDMi/gD1GqSLoujMmllU+EdGcxP/ycwzfj1/d2Uqiq3P
         f6nYOPxFL7SULghvGsryyPQ5rkfOfIPclNabl2iLwINvM65xdQdisJjNfgMIgk3mYu5u
         Zcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/10lSEnqxmZU389TyEm0ftHJEmxcBUG8gGtRVqkHKNQ=;
        b=ny6Bm2pZFQovEafoBSTxBX2NEbXu8SNMh/wTGtmF8rfqV/+h/3bTN7O1WF2k0uYpsc
         vKKQ5f6uT63phqF0Jr1DX7MgPOBJGt0dDdD6D5zVobjsm/0jqNVgUVs1OUbf8Htd1YCR
         xQOuMonR7CcUc5AjIiYEJzcTILfFDKAa2gjV2fN2oFL5ETLUUnYf+1GcPCZu8DxORbWy
         ReQIlP2juDhI10t4kys96H24JW5b3QMqsLdRdULTNeimt81m8T25+FXUR4YIGYTOCQMv
         yz/AffgAuiEX8N2mv8dyN4g2KyfSlynMxjdTYLo8t5Dxu8+p/cVaLP50BsVbjY965yen
         IEKA==
X-Gm-Message-State: AOAM533BKSyxPzJ7EiqpJwVrofz2n31KOst0O5g75+XJ6sOSxB4QQ3IH
        MN4JoWw2SE/dbHKdCzkqHTqaIWuz9jZv/w==
X-Google-Smtp-Source: ABdhPJyC7pfLaL4h+0iTWzIbGXY4KHz5novuxT8CXSRL+P8Lq8P/K8ULcHhITt0J0qSAS3yJLRhtiQ==
X-Received: by 2002:a65:4244:: with SMTP id d4mr3287012pgq.83.1623907069625;
        Wed, 16 Jun 2021 22:17:49 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id 188sm3900893pfz.146.2021.06.16.22.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:17:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 3/5] regulator: qcom-rpmh: Cleanup terminator line commas
Date:   Thu, 17 Jun 2021 10:47:10 +0530
Message-Id: <20210617051712.345372-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Cleanup the qcom-rpmh regulator driver to remove comma(s)
at the end of the terminator line(s).

Cc: Mark Brown <broonie@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 22fec370fa61..6a8b7ac67bbe 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -811,12 +811,12 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
 	RPMH_VREG("ldo28",  "ldo%s28", &pmic4_pldo,      "vdd-l16-l28"),
 	RPMH_VREG("lvs1",   "vs%s1",   &pmic4_lvs,       "vin-lvs-1-2"),
 	RPMH_VREG("lvs2",   "vs%s2",   &pmic4_lvs,       "vin-lvs-1-2"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pmi8998_vreg_data[] = {
 	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
@@ -824,7 +824,7 @@ static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
 	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
 	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3"),
 	RPMH_VREG("smps4",  "smp%s4",  &pmic4_ftsmps426, "vdd-s4"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
@@ -856,7 +856,7 @@ static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
 	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
 	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
 	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
@@ -880,7 +880,7 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
 	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
 	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
@@ -906,7 +906,7 @@ static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
 	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
 	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
@@ -934,7 +934,7 @@ static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
 	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l1-l12"),
 	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
 	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
@@ -947,7 +947,7 @@ static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
@@ -960,7 +960,7 @@ static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo7",   "ldo%s6",  &pmic5_pldo_lv,   "vdd-l7"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
@@ -988,7 +988,7 @@ static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
 	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
 	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
 	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
@@ -1012,7 +1012,7 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
 	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
 	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
@@ -1039,7 +1039,7 @@ static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
 	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
 	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
 	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l16"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
-- 
2.31.1

