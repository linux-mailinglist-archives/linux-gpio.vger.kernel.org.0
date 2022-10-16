Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1320D600223
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiJPRWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiJPRWg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:22:36 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAD030566
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:35 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id i12so6285554qvs.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb2yg7Pt4DxTka9+KV6Co4SrBHPOoUuiBCx5duzCR9A=;
        b=gxCrwHeF3zKR3Mjuj7bVIh5ELqVK3T/d2MLsiMnXXqFIB9Bdoq9rpNM396qANikuaF
         k7zEuq0JrfqWTBHMISokDgf7kkLX6PMINMksRD6heLq/sP+OgN6LkkGKJpZQGuIjgO3S
         3/eTDEfobeyBqN2b2sspR8aJtT6Krwq6a2cM/SitV7B+AW/zmSPS7Faw0DxfNfv0eokt
         JpGIprISOFz+yG6abcbVGDVHxqTq60G2Q8nmGh64NtNUMqhUajZReIu+sVDvaGn1rFWl
         8F6/S3uSkpQjURXFFXFWfcPWlG95xeSlASXRtlguFDAu1O7OOyj0O6liirIqNr5NGlxr
         wyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb2yg7Pt4DxTka9+KV6Co4SrBHPOoUuiBCx5duzCR9A=;
        b=M5OEqi0ztjXgAUtNMhj3Iv9Npx6pzuz8VVwYQc8MT4ZZUPwFOShMEQJMzKJnkrOxFI
         CBKnTYAiBruTcqn4E5+ElVM+ds/wiq3LzDLhqzW978xL7wl4u11nkcSV4fgyTBbqak98
         azT3uPtli064b+nKltDV4DZCc5xXfSaaeSYDq884YOK7iopmdBg5WdVfa1peKYbw8PLi
         2IsK6P3flpjK/pzoAxPAqXRBRTobn66SzOBPWB4pDiNYu3m5SBh0LQzEtFml+uYzd7ph
         vzgdGYuILYBS3lqQIJ8ANlvxAQPxeypb15ctBCFHS+1wEJ0X6yuS5O2054lFcOaZqYJP
         wtmQ==
X-Gm-Message-State: ACrzQf31qy5pCBXqGue3v+w1TsL7aebWkUvpLol+S/RoPR5ii2aG+Uxa
        KnW2/eOO2fncBbp+/nhHedUqMQ==
X-Google-Smtp-Source: AMsMyM5EAuUxw/GXBs739Cj7Mg1cWOGhKdoPK6j8MCxTZr6VU7bJOvsVuav/kdGugyA5LHJOcDi+FA==
X-Received: by 2002:a05:6214:da9:b0:4b1:d600:f9d7 with SMTP id h9-20020a0562140da900b004b1d600f9d7mr5868918qvh.26.1665940954892;
        Sun, 16 Oct 2022 10:22:34 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:34 -0700 (PDT)
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
Subject: [PATCH v3 03/17] arm64: dts: qcom: sc8280xp: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:21:58 -0400
Message-Id: <20221016172212.49105-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sc8280xp-crd.dtb: pinctrl@f100000: kybd-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'disable', 'int-n', 'reset' do not match any of the regexes: 'pinctrl-[0-9]+'
    'disable', 'int-n', 'reset' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts            | 12 ++++++------
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index fea7d8273ccd..a2027f1d1d04 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -374,19 +374,19 @@ &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
 	kybd_default: kybd-default-state {
-		disable {
+		disable-pins {
 			pins = "gpio102";
 			function = "gpio";
 			output-low;
 		};
 
-		int-n {
+		int-n-pins {
 			pins = "gpio104";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio105";
 			function = "gpio";
 			bias-disable;
@@ -410,7 +410,7 @@ qup2_i2c5_default: qup2-i2c5-default-state {
 	};
 
 	tpad_default: tpad-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio182";
 			function = "gpio";
 			bias-disable;
@@ -418,13 +418,13 @@ int-n {
 	};
 
 	ts0_default: ts0-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio175";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset-n {
+		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
 			output-high;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index b2b744bb8a53..68b61e8d03c0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -350,19 +350,19 @@ &tlmm {
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
 	kybd_default: kybd-default-state {
-		disable {
+		disable-pins {
 			pins = "gpio102";
 			function = "gpio";
 			output-low;
 		};
 
-		int-n {
+		int-n-pins {
 			pins = "gpio104";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio105";
 			function = "gpio";
 			bias-disable;
@@ -384,7 +384,7 @@ qup2_i2c5_default: qup2-i2c5-default-state {
 	};
 
 	tpad_default: tpad-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio182";
 			function = "gpio";
 			bias-disable;
@@ -392,13 +392,13 @@ int-n {
 	};
 
 	ts0_default: ts0-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio175";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset-n {
+		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
 			output-high;
-- 
2.34.1

