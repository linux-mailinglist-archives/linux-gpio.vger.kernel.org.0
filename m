Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2CD601CCD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiJQXAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiJQXAp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:00:45 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0907826120
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:00:44 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id a18so7695713qko.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIrBy8IF6iGbWcZ0YVqj9pp5C/hpdRh+/4SU5uYRz10=;
        b=Xw72h5CJptrLGg990kTss8YhRMuEFAIb60XVjADFE1yb72w1OnNHRK/hOuwDC4MQcU
         OAycyhlhfAMb0kZtvm/Sm+dHfGr0msh/RsKk7ZcRsm/uhB0ByF7F2dLMDamtMStwpUBe
         F4iqhSXk+sDPxJ/Ck8jP+tr1rfZQQqCn1Uzi2mxBu0U/uAvrzLbe9dPFllRzYA1YYGQv
         H/Azd66XwTOzPKyqSNdgmlLjE0bd85DINJIvAERUeP9oyaVvu0lMMbRXuSFl8RV/ZWF/
         BwfiLo3qhKO2xx/IpaMo9pYHKiaCXmp7hufvX6GPXLoFXyv7k1PLPEm6SeGWBnC8uHG0
         SDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIrBy8IF6iGbWcZ0YVqj9pp5C/hpdRh+/4SU5uYRz10=;
        b=ReMTvfLE46Mqi3gm+CPkvjtuZZASO8b/xMoYwhG0aZTgIsfufu7Ek2b3jPDHLDDkmN
         3mqASj2tkO5lp+IBzBUeBxAG/Psv8ooYSrdkhen55olkq0kMJvx7lSEOcb+2O1H8jAp2
         eC6YhzTcDGynFZT/qJIHdFdOuzgwCAUHy254pa1gFZI3rL/9frAf6DKH4PEyVPcMbduD
         HyDkpc0FY4SdWYhjfFXcwRY3L7hCfzUsChC7yHlb4ZDfwlwxhemEk3N6P4RB8NAYLapx
         luKMFVhl1PP/ZZVDzlMgfIEukL12oojSwFal0uJvaOVXL9qd8y90zSLJ+JU+6/Ry4KhB
         3cIw==
X-Gm-Message-State: ACrzQf2T929MOfu5uZhIf47szxVqW3n2vtwxh2uiTeQp8REl30lX6ZFl
        N47hu4DuTALOHm5gxa3FJeq60Q==
X-Google-Smtp-Source: AMsMyM5WZDMrq3WlrTp+OM+TfuPYWbAjR6U6zN0sjCGpR0FhGtTkd0HaOfVLrcGaMMCqItvv/tAMcg==
X-Received: by 2002:a05:620a:1293:b0:6ee:dfb8:d448 with SMTP id w19-20020a05620a129300b006eedfb8d448mr6710273qki.510.1666047643584;
        Mon, 17 Oct 2022 16:00:43 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:42 -0700 (PDT)
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
Subject: [PATCH v3 04/33] dt-bindings: pinctrl: qcom,sc8280xp: drop checks used in common TLMM
Date:   Mon, 17 Oct 2022 18:59:43 -0400
Message-Id: <20221017230012.47878-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml       | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 0b251caaebf2..886d4e76af44 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -53,6 +53,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -113,16 +114,6 @@ patternProperties:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-1][0-9]|22[0-7])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

