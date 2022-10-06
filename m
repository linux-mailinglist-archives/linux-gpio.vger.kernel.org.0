Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1118F5F68CE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiJFOGx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJFOGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:49 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51656A7AAD
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a10so2412810ljq.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dpVa1Bd2BX15p5an5Hiu/Ih46PauKXzJMUjfTxIgEw8=;
        b=qaXDbRxgcRv2x+tHLjQG4oYUHBKrYEuGCNAwMaDltQXmGJsbaKSvuhPP+NC9KMiwK6
         Dv/BSg0RxH4Yw4WYZDPyYE/uRlkVVomoeo5nO1UO5P/sNqBUI27ZFPQ3xApQn0AfdTlc
         ah5HWSOE6cyGZz0qBOGiG6QKTYt5T7gUwYTOxh1qNTSR1MLEnbwjKwFm1vKsQ8rvsJHU
         sgxiNkv8wbgSbUp0uv3ARk/adK2uYuwOAwrCIAnRsXSZeCF25a+qdacQhGCB/pYaDNwF
         bm96xTvsYV1dV49cXxLeUaSzCRXgMmJeBUe6lwrNBHQ4q4cRlPUvi+ri4E+dx5vF9Zch
         cxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dpVa1Bd2BX15p5an5Hiu/Ih46PauKXzJMUjfTxIgEw8=;
        b=THN1wbEQQilQBW/XTxPWMeXWZ70am7iD4MWwWsywXYwaDa5alopMALP4SV0uI+Pi81
         U/QGTCVZ1xgdZlvEyzQkK6DM85dKBYb7omuHgxeQbH60YpsSsFale4p0jT6Y3KhvfV9j
         j0aKttCHkyiXiCDqDRAS2yIDPVtaNsKh2Lwl7siPaYdfQev0D2V8KfD2z1mR89rY5zDP
         JUQ0a4o0/2m4ogVV1QnKEnA6wBaxCxOvbKztZLWQrYlU1dtcUCOJKHo+ZzxZ/tLIfWTu
         iH44UqPK0weLGJDmD4XmH5Z092tK/dFwFx+T5EDgjhS4HmzdNHBnnpVxkRzuC2Nz1MiD
         Fv9g==
X-Gm-Message-State: ACrzQf3fylOXxsFaACi5aomxYyBIBRqp0PmfJkR83Xqjyyi6OSC0fMTQ
        khYuxzETwk68/yhCGcGeCk95LQ==
X-Google-Smtp-Source: AMsMyM42M5CyNOIlsRnnNx6kT7a/CyNKGt/woh5MHZbZE/OPfotuMpu4EzWGDhL12bRjHysGvJ1ong==
X-Received: by 2002:a05:651c:1508:b0:26c:622e:abe1 with SMTP id e8-20020a05651c150800b0026c622eabe1mr1802870ljf.228.1665065205356;
        Thu, 06 Oct 2022 07:06:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:44 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/34] dt-bindings: pinctrl: qcom,sc7280: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:05 +0200
Message-Id: <20221006140637.246665-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 2a6b5a719d18..bdb896e5682f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -62,6 +62,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -127,16 +128,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: /schemas/pinctrl/pincfg-node.yaml
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-6][0-9]|17[0-4])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 allOf:
-- 
2.34.1

