Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82625E89A4
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbiIXIGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbiIXIFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:34 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA2A120BF8
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a2so3527852lfb.6
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dzT2o8l8kfLsRyN4jbWpEjgtzkg60okM0dLWljLPehU=;
        b=Nut3dXqx4HdfFNUc0lFKLLnx8BUvU8aX7GO/hsNMTtxfWvtwbaPdSPNn3iENtgPhPa
         PXIRqjWP2+CCY7d3KSvXNCuFNQwQ/Qn2xdNPTGUQjRWD6zpu2tx0YKkiDSEQPXuuhMr6
         JEVwUhIejzy2CmLYxY4xEB6mEKw4LDT1EeNoACGQkf8OmsFrdUYPAWHfznh3imuFhc+W
         zPvslhtSdjHAD7I14Oml0JOv/Oe0Eo3qZaCfLr5gzvjd7fKZCDwZ3nN7BSyAsvAazoK1
         Agcy7llQrmRX51ZEXU+magHVM0Wjl9SOQ7XuVJKTXtmx6GKrHa+/d/tQwux3zTXkOp9P
         qxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dzT2o8l8kfLsRyN4jbWpEjgtzkg60okM0dLWljLPehU=;
        b=vwTD8cXmavAPmW/UCu/7rqZ3lPwTL+UugO/RTQW4DsTD4dSHIm5/OdMeVl0mQs/iMb
         lg2gOyGg6El/PdwJ10yof2YQ3TWNPogw2Bbv879ylFQhOnEiA6cKKGA8sDeui8juhiA5
         T1cB05ag+/XcMA9flI24ATSxN5/d5M5PwKZOg6kxd6Shy6AAmhV9kbEnt7g5fXnzeUwm
         Ufk7qPTtTBou6ZDFImkuGozEE2aPg+7WF+w2m3k2eDtRZ8zUlbzSmpFhA/kFvqAjoqlJ
         Uua8OVLfHagGyeLb97Z515AIieneR3JEfPA/L+rjrbnfglz74SpEDT3HCZe+1UQ/7f8L
         0BUQ==
X-Gm-Message-State: ACrzQf20yDNaZ4QfMESgPg8IqOdGYC1pqQRO90nAREMJ4xSF6DftlQ5m
        DlJKxkb6d/sxSjqCw7Ee4j+vew==
X-Google-Smtp-Source: AMsMyM7tZjF0XfS/xckpybmX1ihJDQCbeabJl3uER6gnAmeRxz59tt5YjtwQwaFJyVIjWgfyTFacgA==
X-Received: by 2002:ac2:5cb9:0:b0:498:eb6f:740d with SMTP id e25-20020ac25cb9000000b00498eb6f740dmr4579246lfq.106.1664006724553;
        Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/32] dt-bindings: pinctrl: qcom,msm8226: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:40 +0200
Message-Id: <20220924080459.13084-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ecb90c77f666..f1d9696a1fe7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -60,7 +60,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
 
     properties:
       pins:
@@ -101,7 +100,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

