Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CF95E9AB1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbiIZHov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbiIZHof (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:44:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0714C43
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id s6so9478066lfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qpPAnA+QVmbRHt57Vf9Ofo1IOIWMIyAWhzEBUC3GMcA=;
        b=rQoaaR7sqHqr8dBHfPqjVxN5QlU+DXVpPYPtre9BSsH+KiR4WvWdGyp9BQua5AQc9X
         sAA/bHyE1LanPGgX34gdmVkHIi/RovdxggX+Qni4RBmulWBE+D5ZQz/zo3FWFRl4Jk0n
         KFYMcmph5nO8hw1fSzOgl61acXGmMLzNI0GucSPhuJjWobNVvqfSkTO8FHjJ86Qjbp9z
         RNhxBfSdspltASzi+IwRhC7CTHn/dLRLSuzcW4CD1jb7IQ6byZDdakUEmKmIOJtb09PG
         1T10ZIstLmvC7XaLQ2ikz5I0amrB9a6jxAvETO1JM7IvOaMW12zNQgKjvPiBTSFd7MdM
         IG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qpPAnA+QVmbRHt57Vf9Ofo1IOIWMIyAWhzEBUC3GMcA=;
        b=Eh6CtJgiWulRmDIu7K+TL/W2CZQOJ1yZ5HgHRcNErMBbhFEll87yIQnlz55ppVEYUd
         UvbEdNPsKdiL3y3Iep4PET0myC1NGTAOvnYRaek44K6w8Z35m0s7xGtWpC78C0VmXGAM
         /KMjUJrYzlaJ5eUz9nYd1LVhnWovKlPnVAXiA2Yot1xG0AMdoRqo7fYk64k7vRM9rIMA
         5qDrwJDXGncT5T+FfQNLvTuBAWayKrjPKw1bxj0Vnzx6ohQ9koNW6mdtWRVslWn79FGb
         /QGtEo1KyrA9CKeNpHGkR3A1eSyS7PKFGkJOmfAB1KIAdHQzrErMDc7H1k2qsVPsoBEG
         7qGg==
X-Gm-Message-State: ACrzQf1tG0opEH5L92kbjbeAOM+ZG2+j8DCQ1Y43t9x9MuliA7a8HNWr
        JqrCM4QrT/kgjgZJxQeps52pAg==
X-Google-Smtp-Source: AMsMyM7+a0emTxkFRpfPN7G/Kb7XTO4IioHtXrJk41uq9BmaNW99BNvMi7xZEqkFE8pWY0rLb7RbeA==
X-Received: by 2002:a05:6512:3d17:b0:497:9e34:94f2 with SMTP id d23-20020a0565123d1700b004979e3494f2mr7890057lfv.285.1664178272105;
        Mon, 26 Sep 2022 00:44:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/33] ARM: dts: qcom: sdx55: align TLMM pin configuration with DT schema
Date:   Mon, 26 Sep 2022 09:43:46 +0200
Message-Id: <20220926074415.53100-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.  Schema
also requires 'function' property, so two nodes for the same gpio (mux
and config) should be merged into one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 45 +++++++------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index a4fa468a095f..ac8b4626ae9a 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -282,40 +282,25 @@ &remoteproc_mpss {
 };
 
 &tlmm {
-	pcie_ep_clkreq_default: pcie_ep_clkreq_default {
-		mux {
-			pins = "gpio56";
-			function = "pcie_clkreq";
-		};
-		config {
-			pins = "gpio56";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	pcie_ep_clkreq_default: pcie-ep-clkreq-default-state {
+		pins = "gpio56";
+		function = "pcie_clkreq";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	pcie_ep_perst_default: pcie_ep_perst_default {
-		mux {
-			pins = "gpio57";
-			function = "gpio";
-		};
-		config {
-			pins = "gpio57";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+	pcie_ep_perst_default: pcie-ep-perst-default-state {
+		pins = "gpio57";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
-	pcie_ep_wake_default: pcie_ep_wake_default {
-		mux {
-			pins = "gpio53";
-			function = "gpio";
-		};
-		config {
-			pins = "gpio53";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	pcie_ep_wake_default: pcie-ep-wake-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 };
 
-- 
2.34.1

