Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035C95E9258
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 13:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbiIYLG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 07:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbiIYLGX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 07:06:23 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF4031EE5
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:21 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h3so4644610lja.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EzXiLJjl0ryjreOAiZGo1RYDlL18FFHe3CNuYiEU0U0=;
        b=k80c3RkotVz2eG34ay/BtJ5AT47PbY+KemOjsojLauZRNsI+Smy94EHDRf0VutecrP
         WmnT9IHHs4AM1Czu97KJuAz8VyNQfgVwhFf9R+gFzsRgf3rtmiNi6lNSVU1p3L+/qtMz
         ofKx7HnMcUDEHmkS5yak7L2NSNIw+YRHW9Qoix9e5YXBqPJfVi4XTJLqiF/K94sTivVC
         f3fHZq9AQ/SgCGRMfdWcIyn5jGttJqY4pKX+SgjgWsYOvKYOTkw62OEgKgiWB+QctRMa
         qBwtJTPtc3dZzBjXCqJh2itgSbH6aBpYNvyP/2PMcZsfWSO2xXxJODPaPXVugVB2npwW
         SuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EzXiLJjl0ryjreOAiZGo1RYDlL18FFHe3CNuYiEU0U0=;
        b=BwKihDzQK4DHep283uTkzDoL2pnJ1GANVGxUsw/Ktt48nUpkm/hrrNjz9nwmqTOhoh
         YP2I0fV8/0bT2IjXTXJtW1LJpfAFk6K091oub+mTfaNAF55MrRzGbyHYH5mt6h6f2bK+
         v50we1ZDiAoXT1FpoJmGzHy4FvsPYQGhdLpz3wDNnUy6RWXzdVlqbfvpXLae3EjdGZLq
         SWwiyw5OrQ1HXeJq+d4eNxG7ciCijJYhOBy0xYp7FpPTnVeKDPqJf3Zq7/x8JRLLdeEW
         1PigeVzydLvTgplMRVa5ueihqWL6EksoIo5vQXSMt0mbyH77nQIdtaqahGin1Fw3QEZP
         xSfQ==
X-Gm-Message-State: ACrzQf3r/Jiz0LCuCOYAkoVuuRKNqQs8N5a1R+N4SDunYDitaEg2aReb
        iOqYxxoseAfh7Aq/eC8GOMpgbcTOZ5SEFQ==
X-Google-Smtp-Source: AMsMyM7rwNCRm4iZmSfEnKdVA3yc5c/91m138uvRCVDPP084IxtYfyzzQg9KkN/1P/OlViD+3beNBg==
X-Received: by 2002:a2e:9bcd:0:b0:26c:60e:9f4d with SMTP id w13-20020a2e9bcd000000b0026c060e9f4dmr5466301ljj.469.1664103979380;
        Sun, 25 Sep 2022 04:06:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/15] arm64: dts: qcom: sc7280-herobrine: correct number of gpio-line-names
Date:   Sun, 25 Sep 2022 13:05:58 +0200
Message-Id: <20220925110608.145728-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

There are 175 GPIOs (gpio0-174).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts          | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts    | 1 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi    | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index f0f26af1e421..4e0b013e25f4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -372,5 +372,6 @@ &tlmm {
 			  "",				/* 170 */
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
+			  "",
 			  "";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
index ccbe50b6249a..739e81bd6d68 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
@@ -328,6 +328,5 @@ &tlmm {
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
 			  "",
-			  "",
 			  "";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index c1a671968725..c8ff13db30b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -358,6 +358,5 @@ &tlmm {
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
 			  "",
-			  "",
 			  "";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
index 4566722bf4dd..3dff610fb946 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
@@ -321,6 +321,5 @@ &tlmm {
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
 			  "",
-			  "",
 			  "";
 };
-- 
2.34.1

