Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB475B4DBD
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiIKLMN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiIKLMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:12:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10CA32B8D
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:08 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i26so10340459lfp.11
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ULI4E1YGBzuTdtZhggajmSSNmIlXGsKZGjNlYp+12Qw=;
        b=RuYCb2kd6bIExQCrcE/2UvzSKGbCtuvzauVOaDIaH2C4DIjolIQL6ArQE+EsKfd/Kq
         hayS1iEymsuhuhnkHCAxx8ogff7ELBxPIJ/YUT0c2UGvsaYNvhbVGmuy63smumXCIx9A
         grFPDUuCLKfFJTsU5WY2jIELdAcY8Y5WXf+t/OI4fbstJlH81l5dZfvi7F8RTxh35FwV
         77kv6d9ggFfyultFuxN8lbhMbaDV3H9EyYAD8xR3+dYIUc1TVwbjCiBMiVHFfcUH8gSD
         0N9g+XLjNdUBh//sKa9uSWivA0LKU1jxDHK6RXjpPpshoLjJ7Tp7zqP3b86dU40dOg5f
         OIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ULI4E1YGBzuTdtZhggajmSSNmIlXGsKZGjNlYp+12Qw=;
        b=HhD46A7wtpegS2LMycjmlv909q1vlrbE16f5NfgsU2YViAyQiatDdogL7fo8huq1YG
         e8YVN5V3gyHoBAqRKlxfF0pn6kaanBzRADUl3bayA8eW2ymmvy9WmVNmWbc+w+HL7vA6
         MMTQm3aG5Y1edFm5ngAI13UXWaO8KLstta0mLjpOnuJmoqUEoK7KeF7yOYkIQsjjSToJ
         G8loH0MOlid1whfrNegruRcqOHsDPv/tmui8hvnvlSicMi8Ca0z8+Sn/fkSsr1ZBN8nv
         CvmJCB4U9tHOGs+R6wh78GnVFlTDQ7bNO++DB0cvIKOM9M/8tR0Xj/HgrDYLIO43QAHf
         WQKg==
X-Gm-Message-State: ACgBeo0BfuS3/FiAIVgYR6XfEykELQN15sq4OgLZoe08uwcMTdv8DazZ
        A/sCrPzXAPEqkEYbAF+T2Y6J5Q==
X-Google-Smtp-Source: AA6agR4mVMIRU8kdKCWGn6F7du/Q7/hA9RJ8JPUJVZgTSHFVXov+ZPEGgjpDXMtmlvkLdSGUmnI/Og==
X-Received: by 2002:a05:6512:2294:b0:494:8dc5:10af with SMTP id f20-20020a056512229400b004948dc510afmr6718001lfu.426.1662894727027;
        Sun, 11 Sep 2022 04:12:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/40] dt-bindings: pinctrl: qcom,sm6115-pinctrl: fix matching SD card pins
Date:   Sun, 11 Sep 2022 13:11:22 +0200
Message-Id: <20220911111200.199182-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SD card pins do not have function, so do not require it:

  pinctrl@500000: sdc2-off-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'bias-disable;' is a required property
    'clk-pins' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml         | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
index 8a2b4767c7b6..28b29bf714b4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -69,7 +69,6 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -121,6 +120,16 @@ patternProperties:
     required:
       - pins
 
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"
+        then:
+          required:
+            - function
+
     additionalProperties: false
 
 allOf:
-- 
2.34.1

