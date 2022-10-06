Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB545F68D3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbiJFOG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiJFOGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CB7A7A8F
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu25so2892493lfb.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=J5ngFIXcSP1g00xRqhGw4exECwdqHtNburGMs+lMA4s=;
        b=zVLpt4jYV5+MIlNidrbj2d6yHkmojUQL68LRQw6O1r484WiOA01o5Ql3E3NtIzBq9L
         fN/aB5NT0i92UwmNUw9oOKP90wA9CZbnXXwSCXGzOAZxSpxluK9KDFg0dol+z/nKQS+w
         rGYLXAw2YRdC6t7AaC3s8UiahgUTynihlmKPpjP8M6Fu+NUj2u+hgVlaQzndsySBu4KV
         vLGuL15/QRNaJw6XXqj1GVBXxbLQ6YZjCmGB15/hDAqFDFr0NIVdMusyCNDvYRqoqnhd
         9Q9DO7UcN5Kq97bpS1C5K8BX4gwfjpFTFJUOiT+JKjOGJytgI0/4/2jBVRAzrUC23R/c
         rK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=J5ngFIXcSP1g00xRqhGw4exECwdqHtNburGMs+lMA4s=;
        b=RIHY3JPsfTQX9ZOJzgANzpmmoGCwLuit0l5SHzcdiK/jW3WoE2qiJimLSdZA3kWDak
         wktpucFn7v4duDZkTkoCVikW+e0CAV7zWGLG7bmPh2SvH88oGbqQ7R9MwdEJl6JZ2tkE
         HVhfkeGQIyfDYZETkGztxRk99BqtcpgaWTGdSl42UB3Yv09hE8YP6x+qdqLJ0cijrmG0
         /RVs0RfyvjcfayGYO968odyoInrI24AiM59f4gzSlT7A5bOIPhuq4e3JZkwJAObWDWeT
         hc0havunpnCz8XuZi42/QdG25TFW3nxbHf/S9SI3UlMHvfu9Ye1OnlUwVw2fe3gWbyE9
         kISw==
X-Gm-Message-State: ACrzQf2kq/EmdJQBUEuXlxwnQB4JhReuanfa8SNOHHoyWdfOVvda/MsM
        mjMDCYRshAyDTB0AdC0WcmOkFQ==
X-Google-Smtp-Source: AMsMyM5T1H4r8Yw5QN3belT2ES+lQD5vl0lcgroUymzYSVFy1yZbA+zF/zZWoYlZrwa2oRzMmCqEBQ==
X-Received: by 2002:a05:6512:1191:b0:49f:220:b7d with SMTP id g17-20020a056512119100b0049f02200b7dmr53471lfr.244.1665065208241;
        Thu, 06 Oct 2022 07:06:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:47 -0700 (PDT)
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
Subject: [PATCH 04/34] dt-bindings: pinctrl: qcom,sc8180x: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:07 +0200
Message-Id: <20221006140637.246665-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc8180x-pinctrl.yaml        | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 62d0ea7bbc62..71ca4cfd567c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -60,6 +60,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -111,16 +112,6 @@ patternProperties:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-8][0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

