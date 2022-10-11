Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54BB5FB979
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiJKR24 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJKR11 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:27:27 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD181AF19
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:55 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id i65so4561181ioa.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4tu9IErf0pQ5NApJoK+MwyIV7wWxNHbMibtb5C6x5M=;
        b=Mnrb0mT62eNEHW2oTkHxFiY3wXZlEbhKt3RXXvsbhUDJ+Udo7YBh0U5grDiORdc5PY
         Aym1ZoBaGM8Cb3jnVMPPWk4eZh1gipVOuL5kOqP1lz/McEYOXJjURRbQEIOH3UoXBLDQ
         kv2TcEmj+Dndn4MRpVnQJlTtYwLbJzQjKZaIRz0f9at37ynuGelSQmhNef5E+z9w3Pa7
         F7FcudIYKYlnMYc41Qn4SKu3aooQLhE635qjvXWdHgX9CsR4z9/o2UTsfU0z8YlX792g
         JJ2s5ktAkUL1FyoqtzobKMBRN4n0fruyCFwRN82HS/+uliJwJ6sUwNejkui8Pg+ap1Mx
         qcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4tu9IErf0pQ5NApJoK+MwyIV7wWxNHbMibtb5C6x5M=;
        b=OzUj2MDO3v0tom1CvZJN1/5DHmiePjslNLdM3nmmuraeoFcGLYd65xjjMEE3XYeivY
         hcqeE6L/1AXZDk6AyXJ7pN3QCk9ZBhyPTvGstOKzQDjri/MxCBKbKTjG4Ns0WUQgV6NG
         AVlt19Bbvlp97Cjt1M1lv3VsCWaT/OvI8cb152TEmBqdOAp1mwfoMsaQ8imVyMsW50Lu
         Du9E2/nNd1RptqQYcP1AZNToutv0oOa7drnkmwf1EmyRTrzdSjSKaW4oW2Ix6HlNvZXP
         CXlu5w/U0k84mV8NoROCSzoZPv+iwB0EpxQa8mTgOJVllYfV2DV95m9hOjd9bOVx7/v8
         LrqA==
X-Gm-Message-State: ACrzQf2jpUAcEfocjvEDcUaWph/dRUdnUar12+p+LczbszCDR8EAMaGZ
        eXow6KEQWzOo68KHcPowZXH4+vX67FC3Yg==
X-Google-Smtp-Source: AMsMyM7P9FlKQXnuFszruJqKjhOfjdfKd194wL9ja+9wkIp6/TuL+YCd/dk+M0X10UtfqbFgNXpGPg==
X-Received: by 2002:a05:620a:240d:b0:6ce:7f55:1191 with SMTP id d13-20020a05620a240d00b006ce7f551191mr16722448qkn.644.1665509185275;
        Tue, 11 Oct 2022 10:26:25 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:24 -0700 (PDT)
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
Subject: [PATCH v2 13/34] dt-bindings: pinctrl: qcom,sm8250: use common TLMM schema
Date:   Tue, 11 Oct 2022 13:23:37 -0400
Message-Id: <20221011172358.69043-14-krzysztof.kozlowski@linaro.org>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 34 ++++---------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index fb753fd8bbee..824a4dce1202 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -27,27 +27,13 @@ properties:
       - const: "south"
       - const: "north"
 
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
+  "#gpio-cells": true
+  gpio-ranges: true
+  wakeup-parent: true
 
   gpio-reserved-ranges:
     minItems: 1
@@ -56,8 +42,6 @@ properties:
   gpio-line-names:
     maxItems: 180
 
-  wakeup-parent: true
-
 patternProperties:
   "-state$":
     oneOf:
@@ -129,18 +113,12 @@ $defs:
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

