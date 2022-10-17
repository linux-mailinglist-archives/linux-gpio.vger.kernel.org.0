Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3C7601CF7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbiJQXB4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiJQXBh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:01:37 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B631B82753
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:15 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id r19so8725612qtx.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWjfCBrBsSU1ByEdtEtQGsBHhgMgWBvICo70lg4eh4k=;
        b=OcUhYh7mA2kES4Rtq1+XGWnJgXLgLzhi4uTVNlU05Gp+OGy2b3Tep5WLSQMe6QA/WD
         UY3DhSpbZ2VHO45mTfCIqj/tVW534bjnzc3VyZy2Ekt4FbnShZa6WhLRTLYii25RHett
         JW4ROMS3wvBtgkKIUMBrJP2vlh1IVTNZFt59PZQg1MWbrGVzfzoBRsXxaxoa1AQLGiXL
         zwT4Ua+3IL//crg5oEi0o5Wa4GP5HGlH2hN6CYUPzlfEFgYYlel4ccRauOXmzPUFcq46
         XbXKVhBX/4w7UAzbpukre4B/NDpPwj9UAWFPtbQ3JgNGe3WITDQddiUvrq9dJvrU4PSb
         y8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWjfCBrBsSU1ByEdtEtQGsBHhgMgWBvICo70lg4eh4k=;
        b=zCDN1bVP7B/+XQsBhO0Ai7eDXSTKlfjXCZVgy13ieiSmuVwlIWc1173PFL+JQeLsZC
         OBI8ev7zEArvSqOYJjgzSyRdQLnh6LzTGK6t7w0s0rvDpzIKmIrpzo0WiBccaJTVUGDn
         w2qNLFmx0nR54f53tiuUJ/tmF1Sg9tHKvQAzV+sVzBBTSb3cDR+o0X4u5rRrClpBgFGI
         s+VlndnehzrDaFoMLUzfqyoa+Xo6+U9ND5ipUAQJQqF/zzMD8YSu+6gR1c1LsiVRtaHQ
         MQbtJFtgb8/ucNaiwCk9zssibsKkDJfd5mN7HUuhhDmVyRVhLt31DbpGu4X/IGdntDiM
         vYPA==
X-Gm-Message-State: ACrzQf0YjWgv5SJzAf0kXuY0XeSNK0jny0WQgMFvwvGtq4DFsMOSuvvR
        I+FO2OkiPJ0/l7Zr2Z2tbw1JIA==
X-Google-Smtp-Source: AMsMyM4yAtGc99z4BgzEg56XHbBUowJJgAUZ9ywP0M9r8PFYtaAUVMQ9QiprGn31DvuDO37GfFBmAg==
X-Received: by 2002:ac8:7d0f:0:b0:398:3029:3328 with SMTP id g15-20020ac87d0f000000b0039830293328mr10989239qtb.99.1666047659712;
        Mon, 17 Oct 2022 16:00:59 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:58 -0700 (PDT)
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
Subject: [PATCH v3 12/33] dt-bindings: pinctrl: qcom,sm8250: use common TLMM schema
Date:   Mon, 17 Oct 2022 18:59:51 -0400
Message-Id: <20221017230012.47878-13-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring common
properties, other pinctrl schemas and additional checks, like function
required only for GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 34 ++++---------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index e9619c4a39d8..e424ffc1472b 100644
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
@@ -124,18 +108,12 @@ $defs:
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

