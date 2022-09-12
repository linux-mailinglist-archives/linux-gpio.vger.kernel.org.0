Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95735B5431
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiILGUD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiILGTL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:19:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB5829C80
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f11so13137528lfa.6
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ix0v/JGnTNkLvR8lnkw4PxO4vTS1Ezmp9TWJ/ylE0lI=;
        b=RNq2Ay6bofF8EtTn8Aa6fJHXRwtjlaMMQP08M8V+KUrrsyuwbPrNA3XJoxh11yduDU
         XhOblk3H0YAT/Zaz5e79wMpWLiu64N/MAu1+ByC8ua/LVZgEJzpmQIBVPOMSfff4ZdqF
         6NK0B9QpibR84J4dKgbVO07aSpU6jiDS5nPK0BcGUWx/13GHjdssakEgGl008YY8px49
         gSUzr0CT98FvcWtoo+NxcOeELtPGmWJtmNsdxlbC684gzYiKKnMMx4mqVL7TTkqpggnN
         Gsty06IMrt9PG2HOPz2JL5dBVFxW0XKidF/t+Zo1dw9PlC5SkTMTsXni9cCMSOpHua8A
         76aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ix0v/JGnTNkLvR8lnkw4PxO4vTS1Ezmp9TWJ/ylE0lI=;
        b=StTIeXBRnmzuSOxVydQDuDmLNLi4P0DH4yf6UOr/F2HdvgMcEa6yIYRGI5PpMBUqCW
         FjNibPG+TGQeTBywHWLbkMM7smjuTmoUXYrCthrYABszqOVK2UpB+YeC/+xFrOp4X8EL
         m2MqI9lVnLN7XaU2C6BOoJp85CTccKkyaJH+AgOs8y740fOejMB8q7KOTwVdR0RhlI0o
         /tBhqVT4fNmJOvddcW5ekmb9VxC3ezNfzv9wCD0geAnOqAcy9Q+HY1UVUmmCSVbEpkxE
         3NBvX4wM1TD6BLfZu3+T3vcSOjXYFjIFHDlvqZQdeh1Oqez6cz7xWezg1d2UDZL/gBSa
         9iqQ==
X-Gm-Message-State: ACgBeo258WJBRL+v6s1tLYJ6zZvo8haIFRCgMgByrH9aqN4ktavchlg9
        NE/fqOp94BaeBWzuXpSwRL70eQ==
X-Google-Smtp-Source: AA6agR7oxSPmPzWcJYkvHhpvvohJVKs8ewnvLe9zcbvmo5ONG+O/0LmLLaQElLINXty+TqmeG/Q1bw==
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id g11-20020a056512118b00b00492e3c4a164mr9200538lfr.598.1662963494177;
        Sun, 11 Sep 2022 23:18:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 16/40] dt-bindings: pinctrl: qcom,sm8350-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:22 +0200
Message-Id: <20220912061746.6311-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

  sm8350-hdk.dtb: pinctrl@f100000: qup-uart3-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be followed with a
'-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 6b7789db2f75..211cca11f94f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -44,8 +44,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm8350-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm8350-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm8350-tlmm-state:
@@ -130,13 +131,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio18";
                                 function = "qup3";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio19";
                                 function = "qup3";
                                 bias-disable;
-- 
2.34.1

