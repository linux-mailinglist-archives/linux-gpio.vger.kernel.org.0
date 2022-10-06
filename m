Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A665F6666
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiJFMrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiJFMrL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:11 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5CBA284C
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:08 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a12so2089980ljr.7
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cZ9oR+D/ntPl4smbOciC/3TQd2xPuUm410NdDVUtl4c=;
        b=gUZTgfHoXKZ9KAYcNB6Hm8/B92MZSVCP3muHOZCKxeD0wvduglvWrEEP2RoMF4W9zs
         KqRrutbb4DsEgyIi2llIp+IR3xDuStODcKdbYD+hi0SboIkcL+U2iEOEXsn3abBVI1dl
         F38ZVHYbE5V4MYXjxFk08WSyfn423JB/qrsJFCUgk0v9AWkM23KkyZEcNX94juWZXAq4
         VPDkQpeWNWnHh7Hh7H5GZLrd9OpAjLu3B73DRYg0LTRNuMDaRvyccb/wZkyOu5NmuX14
         SWwlIAr3oGcGeAGd9ESUjV6yv9yJqjFjthxrgkNjHTs/0u3HrIinDezK7fnZ2jVPqERZ
         t+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cZ9oR+D/ntPl4smbOciC/3TQd2xPuUm410NdDVUtl4c=;
        b=jET6BRGoJhB3tidCY4ESWwwHP98YrQ3Srfm5cTIRCJarn+Rx5+JU4SZfzNUYAE4zEP
         prCS36zWogcnsAcxvrbRLxvHqKFROpPGEVYWFJ868xG8VVz9yAnno+Yd9D+t6iwkTXqI
         HIu9MTILbbXHU3T4KIFopffF6ZjTGrmMt4uw9P8wM1gbU4SjkOdqZUcaND0gP68OZ11J
         S7CXVHWqrnd9cjhnPlKwovoCkUk/G3vioteBmnUIQLwWkpLdSppKo6vniUQsZ1GSZD+M
         oSMiPGA3+3ZRpYmgxY0Xx0lE5oA1BR7mnCeaaDQpZeVkykjLuGiZPL7xbOFYczcFsyOY
         pSgw==
X-Gm-Message-State: ACrzQf2AXPUybvfR4AAk3bg2h0i0pvb0ECcGGXcBg6NOIm4QaAgQZKJT
        mBrh9NE1thBaX0KLoPW8hGc7bA==
X-Google-Smtp-Source: AMsMyM5EcB/crcUMMdHpIfGRcaOqdbWcxtxQx671Ngdl2LqeccEGVyt4FrX/B++RPifOcwbFAu93VQ==
X-Received: by 2002:a2e:a44a:0:b0:26e:177:d166 with SMTP id v10-20020a2ea44a000000b0026e0177d166mr1353951ljn.520.1665060426572;
        Thu, 06 Oct 2022 05:47:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:06 -0700 (PDT)
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
Subject: [PATCH v4 04/34] ARM: dts: qcom: sdx55: align TLMM pin configuration with DT schema
Date:   Thu,  6 Oct 2022 14:46:29 +0200
Message-Id: <20221006124659.217540-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
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

