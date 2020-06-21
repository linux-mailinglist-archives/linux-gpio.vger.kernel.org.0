Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C63202D1E
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730828AbgFUVim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730811AbgFUVik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:40 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E9FC061794;
        Sun, 21 Jun 2020 14:38:40 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e22so1393460edq.8;
        Sun, 21 Jun 2020 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BTo8uc0DYv2Bq0tjWRFArUn+9wBNnrYsgKoGspnCgNA=;
        b=S9shq/p+tHa5o1hO8iRarQLe2oLh8FyBZztLApJJmpGI6ER+i+KUODYkT6EdRLu+lN
         R4zi4jx7wDojWGuM/0zQvPF4mM+7CfbsVXNhQSnYFAJ9wjlKr7WxTfj1zgxRwZ3jpSG7
         4VGoAYblmFG9wp+22281lZ87HGajjcX6sj/wedhCfCpOCDWmfomRL890KxHaeAB1qTbe
         THW/RpAKEnwZPqcQE26Nfiar61uCKZ1HkLsXcYefO+LAi+MrFnVC9WGIFIh2Cz/PiqRG
         wnDYExPgSSQaKngJ/Rau00ZN+Y81xFdRtsFyROXDGemhqdkraU9Guo07Lwl7EGv2+Afp
         D8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BTo8uc0DYv2Bq0tjWRFArUn+9wBNnrYsgKoGspnCgNA=;
        b=KO5z8IJx/oH/pXMtpUgmDB7swOpZTeYbD5rqcBP/Lu+AGZFFeZNPYW95HdEWvQjhJ9
         n8AjE6B4UtZ14Fpf4ePa8bhSAeWkJlxh5ZWS7lwPuPeifsKwqQ5sYJLdhP2Kth5e/izS
         bTedRE6iIemsOItimE1MZghCpKC3HmZlyHrB/CoSojRQZTDWSwBoAlcAghCVALBHJbkk
         0N/T41gj2qVVV2XCPDdand/M/ogrTuiOxqUjYPN8Bno0RSTPAkyLrbkJmkH0LDrfENDk
         MFJm+yIH7rxSK93qWjb6aNo0o/ygjDW5WAuDMhwoEcYX/ToNcnIlGHYrG7f9iOQcscYV
         SzLg==
X-Gm-Message-State: AOAM530hFkdq/mofOOi7z7taDW1XCBJrJQ/c0lcLwRU3CF1x18c0Aou2
        sRRsuYjKsJU3DXYPYQtr5ng=
X-Google-Smtp-Source: ABdhPJwIG9iG6gsPSxcc/ifYLuxxl5RA0b9FTHomz/VLJQuyoqsxHbs9+77gXN1cGD1Qh+ymbzNSCw==
X-Received: by 2002:aa7:c714:: with SMTP id i20mr9048213edq.215.1592775519157;
        Sun, 21 Jun 2020 14:38:39 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:38 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 4/8] clk: qcom: smd: Add support for SDM660 rpm clocks
Date:   Sun, 21 Jun 2020 23:38:00 +0200
Message-Id: <20200621213806.551879-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on
SDM630/660 (and APQ variants) for clients to vote on.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 77 +++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        | 10 +++
 3 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 90a1349bc713..2ced7807d574 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -20,6 +20,7 @@ Required properties :
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
+                        "qcom,rpmcc-sdm660", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 52f63ad787ba..2f1881d8bd48 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -766,15 +766,92 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 	.num_clks = ARRAY_SIZE(msm8998_clks),
 };
 
+/* sdm660 */
+DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
+								19200000);
+DEFINE_CLK_SMD_RPM(sdm660, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sdm660, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(sdm660, cnoc_periph_clk, cnoc_periph_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, mmssnoc_axi_clk, mmssnoc_axi_a_clk,
+						   QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, aggre2_noc_clk, aggre2_noc_a_clk,
+						QCOM_SMD_RPM_AGGR_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(sdm660, qdss_clk, qdss_a_clk,
+						QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, div_clk1, div_clk1_a, 11);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk1, ln_bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk2, ln_bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk3, ln_bb_clk3_a, 3);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk1_pin,
+							ln_bb_clk1_pin_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk2_pin,
+							ln_bb_clk2_pin_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin,
+							ln_bb_clk3_pin_a, 3);
+static struct clk_smd_rpm *sdm660_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &sdm660_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sdm660_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &sdm660_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sdm660_cnoc_a_clk,
+	[RPM_SMD_CNOC_PERIPH_CLK] = &sdm660_cnoc_periph_clk,
+	[RPM_SMD_CNOC_PERIPH_A_CLK] = &sdm660_cnoc_periph_a_clk,
+	[RPM_SMD_BIMC_CLK] = &sdm660_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &sdm660_bimc_a_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK] = &sdm660_mmssnoc_axi_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK_A] = &sdm660_mmssnoc_axi_a_clk,
+	[RPM_SMD_IPA_CLK] = &sdm660_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &sdm660_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &sdm660_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &sdm660_ce1_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &sdm660_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &sdm660_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sdm660_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sdm660_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &sdm660_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &sdm660_rf_clk1_a,
+	[RPM_SMD_DIV_CLK1] = &sdm660_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &sdm660_div_clk1_a,
+	[RPM_SMD_LN_BB_CLK] = &sdm660_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK] = &sdm660_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &sdm660_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &sdm660_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &sdm660_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &sdm660_ln_bb_clk3_a,
+	[RPM_SMD_RF_CLK1_PIN] = &sdm660_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &sdm660_rf_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &sdm660_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &sdm660_ln_bb_clk1_pin_a,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &sdm660_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &sdm660_ln_bb_clk2_pin_a,
+	[RPM_SMD_LN_BB_CLK3_PIN] = &sdm660_ln_bb_clk3_pin,
+	[RPM_SMD_LN_BB_CLK3_A_PIN] = &sdm660_ln_bb_clk3_pin_a,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
+	.clks = sdm660_clks,
+	.num_clks = ARRAY_SIZE(sdm660_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
+	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ }
 };
+
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
 
 static struct clk_hw *qcom_smdrpm_clk_hw_get(struct of_phandle_args *clkspec,
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index ae74c43c485d..d1afa634b58d 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -133,5 +133,15 @@
 #define RPM_SMD_RF_CLK3_A			87
 #define RPM_SMD_RF_CLK3_PIN			88
 #define RPM_SMD_RF_CLK3_A_PIN			89
+#define RPM_SMD_MMSSNOC_AXI_CLK			90
+#define RPM_SMD_MMSSNOC_AXI_CLK_A		91
+#define RPM_SMD_CNOC_PERIPH_CLK			92
+#define RPM_SMD_CNOC_PERIPH_A_CLK		93
+#define RPM_SMD_LN_BB_CLK3			94
+#define RPM_SMD_LN_BB_CLK3_A			95
+#define RPM_SMD_LN_BB_CLK1_PIN			96
+#define RPM_SMD_LN_BB_CLK1_A_PIN		97
+#define RPM_SMD_LN_BB_CLK2_PIN			98
+#define RPM_SMD_LN_BB_CLK2_A_PIN		99
 
 #endif
-- 
2.27.0

