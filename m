Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0427D5F665A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbiJFMrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiJFMrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:06 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9526A284C
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x40so2078327ljq.9
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JHCjDmNzA6ce+e/MAOdHluOTeKhVdn9kfCUAVEme8Xs=;
        b=rZZjn2LLklOJzInY2fY7K9Y5TRUQV4ErXbOtBoCKWOYk2xCQX5+Y8DzpK2ebcbD+mr
         fR8VrP/qe0/6C2Nnyzes4jXslE8xZ82BuAeO+sQVAR/bMbCmlBGIaAK8ptpGAMcKp4xy
         DExRVAz6RbUZ4ADEF7/JhTDYKDHsHm+hNtupd04iD1Aav86m9yUMbxoHdmRECbGrdxKd
         jsVTPSanBCRaLEL8z6mPrMe2P5oIeVa6YBWgpkAm0+TRuvA+D1h+JWf5pMSyJ9Cj7Wxh
         KGMakFNHTzgVModnZJYcvDi43WC2/4Pwe5EhumIyeG1NXCYxvHR/s1Sj+pnaVaEscFpX
         FwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JHCjDmNzA6ce+e/MAOdHluOTeKhVdn9kfCUAVEme8Xs=;
        b=B848PX0LiCftzy3i69uhOU3OnXbOTzqd1wWR2xrWo8co1vhEM5sLQUmaujesCq9Tk/
         DJLyUtzLn4Oz1JnB723DGMzc/S6KTkDr+V7YmHL77ZZVENlLuUAaGV8gstHRSr3tjNTk
         pz641daEwk/TUYgqiHm44HoorAsJWU9RdwmicEL8mJf8O4rdKIksfSsEfUbJJz8DkwgA
         3sp/h945ZPCDWl8uxiKpUB3zBFG7HLRE5WVl1lDtxDfL/RhRFQMK7bz9M+Af1vT184/T
         l4XDBqNn/66dSlHaEFWh2urjuPEOPxgoPDRPNtgBEEEwu871SOO/DcKmMwOrDIp8evM/
         Dc5g==
X-Gm-Message-State: ACrzQf2xHgfEP8RJH7UZTFMK6rZmb6xMSdizM0F6uFOklhzUb42mDFxd
        pK+jxAJLPm//yadRA4Lso8GG+w==
X-Google-Smtp-Source: AMsMyM70LtYY9WrgWr/OZ2WL2HRIwFM68jsltmemnMs5nGkVeMJN1tCzGgPEW4QVR2/dlX250zahdQ==
X-Received: by 2002:a2e:a7cc:0:b0:26c:ea51:1448 with SMTP id x12-20020a2ea7cc000000b0026cea511448mr1736329ljp.47.1665060423109;
        Thu, 06 Oct 2022 05:47:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:02 -0700 (PDT)
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
Subject: [PATCH v4 01/34] arm64: dts: qcom: ipq6018-cp01-c1: use BLSPI1 pins
Date:   Thu,  6 Oct 2022 14:46:26 +0200
Message-Id: <20221006124659.217540-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When BLSPI1 (originally SPI0, later renamed in commit f82c48d46852
("arm64: dts: qcom: ipq6018: correct QUP peripheral labels")) was added,
the device node lacked respective pin configuration assignment.

Fixes: 5bf635621245 ("arm64: dts: ipq6018: Add a few device nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v2:
1. Do not switch to blsp1 (Robert)
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 1ba2eca33c7b..6a716c83e5f1 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -37,6 +37,8 @@ &blsp1_i2c3 {
 
 &blsp1_spi1 {
 	cs-select = <0>;
+	pinctrl-0 = <&spi_0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	flash@0 {
-- 
2.34.1

