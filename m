Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C669A601D0D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbiJQXCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiJQXBm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:01:42 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74B01A808
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:17 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id x13so7655536qkg.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfgNIZvfwGoe0bHz9hm95p4m4kkN6QthLg5o8QuwQk4=;
        b=CJD8JRzLM3u7taOW0wrBpW+bjQRkLgWu3LN3WBm1jzKD+IHHBi5TrXfK2bNO4ov+LH
         aiCVpkgF+csOp2Ijlo94dcihhwG4vCQApKClutIXZOV/NdjZ8f2s6YAhlMCGwICaERb5
         9V54O3eQQUySZB60YxltHwupb53RSQdEOhbsvaHhM2qxjp0yseUmC7QbfgsO5ZH5zYZ9
         TnSat8hSLOT8zevM5ioVackfBiEx+y//tPiqWuHmEe9/+Q980yY0O2ISckhz6F2A2heS
         SWE482hzg0aQEclBEHzvqV1w4h2hT+kVKhcAwCCUfsVguhvxj6lTSuAP4Pyokaj/lLcV
         H0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfgNIZvfwGoe0bHz9hm95p4m4kkN6QthLg5o8QuwQk4=;
        b=Os5eTRoEnnzJXdlhhgKjKfTvN3VT/3Jy0aP9utYjaUBmRc08DiJD3uwv9+1ACN6Euz
         +tc3MMPYrMdi2oy6kA1HCp1gFqpHiS+FF9mahxP2siq1QWXUkjgHWfOmKRKZE6z8IpkU
         ao2uQArzbFI2Is+/AE0rwGHqPza5KTwseKlked8G7YnMVkJcTMU68cqJux9boTphQNKg
         UZdUzbSjss3166NXqu8y2Dy24r2vrtQ7cmeBTqls7ojGzgLeqYtZgoNUsfufvX0+Is1U
         BZWIO1qNMviYjHU6makXTALVxc/HNwz8ph4YF1L6rBziO2L14vONP+jGGIGLxbV7KrIz
         ZOlA==
X-Gm-Message-State: ACrzQf1E86ei1uu/rXKpMZXjsizE/pqWzpcR1o3motCv2bWxtn+eKBNg
        xAbKpFY0jMSKKHtAELUPlp2ohQ==
X-Google-Smtp-Source: AMsMyM5ePYFx2hqFP/FDb6eWCDtwWWM6s19qvxQtsCDOVTMiTr1q+undYQcuLfDHFzF8jFVAL13xAQ==
X-Received: by 2002:a05:620a:7e6:b0:6ec:c7e7:e50e with SMTP id k6-20020a05620a07e600b006ecc7e7e50emr9367775qkk.295.1666047676801;
        Mon, 17 Oct 2022 16:01:16 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 22/33] dt-bindings: pinctrl: qcom,sm6115-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:01 -0400
Message-Id: <20221017230012.47878-23-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 ...qcom,sm6115-pinctrl.yaml => qcom,sm6115-tlmm.yaml} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm6115-pinctrl.yaml => qcom,sm6115-tlmm.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
index dfb6e5403ea6..51bae1d3f150 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SM6115, SM4250 TLMM block
@@ -10,8 +10,8 @@ maintainers:
   - Iskren Chernev <iskren.chernev@gmail.com>
 
 description:
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SM4250/6115 platforms.
+  Top Level Mode Multiplexer pin controller in Qualcomm SM4250 and SM6115
+  SoCs.
 
 properties:
   compatible:
@@ -36,9 +36,8 @@ properties:
   gpio-reserved-ranges: true
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm6115-tlmm-state"
       - patternProperties:
@@ -46,7 +45,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sm6115-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sm6115-tlmm-state:
     type: object
     description:
-- 
2.34.1

