Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348355FB936
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiJKR0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiJKR0R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:26:17 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6606E37FB8
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:15 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id f22so4724394qto.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDkePsmSRkY1uOm7FPyheIsHo+mqqn9dTrU4I1E9EBs=;
        b=Fm5mErn9TA5tcFIYVnsfrc4dD0MyJj0NG325Ejzx/ABkjuMzCSwngDnBkb15Smf0kr
         KUl2C/FFDSRpJ5gwPgFnw4CnG7TcHeoayWhNZ3K3YL/mZ4xrT9gPE6uHz0eIg3+cbowF
         X10xa1qBFpHoONqq16XCKCTphVEZgaXu9rypERKV6OWGErkMT7m17q6o72dGPrpSQngn
         xVUFdW29sHLj2R0QfIHXAXRjdVYVnIROAxYTzt7TpMfwUJiVwreh3DYkhALyM1HO1Fjv
         gpr0MeYXUQvTxWjXFs/uiJAk/vpRPq/FKy0CI/yiVgUiTNBie+r6kqM9A7SCjHpXoIKX
         CdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDkePsmSRkY1uOm7FPyheIsHo+mqqn9dTrU4I1E9EBs=;
        b=CFWdRHeESOIsviZbAgb4pHvi9eoPr2r35Z5iMGfSdcBMmMtI+KjBAtvb2FlL9H/1L1
         OQJPmjA9MV+ImlFr7e9UFa5r66qy4OQiIQwy/Kh8xrsdPkTRt0/Tq8I6aGOgOeqOv2M2
         gZP12OqZ+hILck2Gd4Jx7ZvVELAT1QQXN75L+cOScLHMPC26pHYdjvgu9xoitfcuedr4
         drVvtj20gxTMFzP1or7DDiNpWKr5yhrWPkJf3cBftCTDmGao7hkjvaZcQ0RNsO87wWHy
         7aR/PF1mfYdcyRAvyQED5c9RfIEMqR94pwudmKsgMyQv5CA0Mp3j7iRI4hbAoPikB5Lg
         vHAQ==
X-Gm-Message-State: ACrzQf3mt1nA99bChbAbUTX2qTNHu/PXGEtOeirYaIYQtciAAtA799hz
        90ncHQqi6NSHpwWYsyjCTYTfmA==
X-Google-Smtp-Source: AMsMyM7HC+15ea+4aNrdBBsWCAvroVnfuehpL7xi2piD7cy0XBYDMaGqm3+Ugim6M2iYIsgw1xz4ug==
X-Received: by 2002:ac8:5841:0:b0:39c:b754:2ddc with SMTP id h1-20020ac85841000000b0039cb7542ddcmr2038719qth.322.1665509174239;
        Tue, 11 Oct 2022 10:26:14 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:13 -0700 (PDT)
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
Subject: [PATCH v2 06/34] dt-bindings: pinctrl: qcom,sm6115: use common TLMM schema
Date:   Tue, 11 Oct 2022 13:23:30 -0400
Message-Id: <20221011172358.69043-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring common
properties, other pinctrl schemas and additional checks, like function
required only for GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iskren Chernev <iskren.chernev@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 44 +++----------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
index e39fbb36d8c1..3f5f5229a86c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -27,30 +27,13 @@ properties:
       - const: south
       - const: east
 
-  interrupts:
-    description: Specifies the TLMM summary IRQ
-    maxItems: 1
-
+  interrupts: true
   interrupt-controller: true
-
-  '#interrupt-cells':
-    description:
-      Specifies the PIN numbers and Flags, as defined in defined in
-      include/dt-bindings/interrupt-controller/irq.h
-    const: 2
-
+  "#interrupt-cells": true
   gpio-controller: true
-
-  '#gpio-cells':
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
+  "#gpio-cells": true
+  gpio-ranges: true
   gpio-reserved-ranges: true
-
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
@@ -69,6 +52,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -120,31 +104,15 @@ patternProperties:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
   - reg
   - reg-names
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
 
 additionalProperties: false
 
-- 
2.34.1

