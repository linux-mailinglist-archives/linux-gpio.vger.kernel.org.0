Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183485B4E1E
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbiIKLOy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbiIKLOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:14:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0AF3D58E
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:46 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y29so7395687ljq.7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VrVKTm5IPzB9yPQM4on4vs6doVXn79UQwYvWB99boi4=;
        b=xp8r29ET1cxQ+YxztbEsZyuaJwy68xG2X0SIkGHow5xmqIrQ/vTfLpzs5tE347LYML
         sJPHMphD0xXFXzkUhnMgVM4raNi2sRQWNBu2THFQNxRky78fpDqr6nMqju7K061euIAJ
         S7v7/FcC6MlePhgwVX4zIja2l/RV3DxuKVH9lArKp86CVbvF7ofncpc79mWvZD8xK9c5
         DiumwaFteDOEiHHE3lZqdV4+eFW+u1UEVF5REOQa4+68pvpcVczcEHcuniQ0lJyCaSVF
         av8pjtNccI9wQMG2ztNRbPprBSb/5nRluqTTj7waRAIKyijMPr3i6KcJ5eM3htwSRUrb
         EsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VrVKTm5IPzB9yPQM4on4vs6doVXn79UQwYvWB99boi4=;
        b=B5HTmB0pEVQqSmbMgIHLY6e2/+RMjWqVKnVhq0IBJ6tOKnWGw8xMozS50UqjRh/kfD
         XGFG7hAEBzYdt9ezLA0nWQ8cJSggeoX7ut038EPUFnLUwJWrs776UZHtRaPuCekjjhRu
         KkUvlaaqxu1VyWtM9zFFWuRXxjHGmwkFgtaXcqVX9VzG9lq+phWoZ9KRI+6ep+f1IZHD
         qe5FHVYYqNs0RzaDODjtYSylxiHpIr9oAGv5RCe0swj4/kRBdTyKlPGikplqCioxValN
         q/Ah1t0mEWwrEQwxb9jm+OMtBkqSCnddVLDso7vPePnzj7DuYE/SkW1Q5l7FBgAH87vN
         C+VQ==
X-Gm-Message-State: ACgBeo18mrPO/v9RNbcgotLz5xwbD4t4o5znN21B2P3rsE0mNAG0Y53N
        JJrHKgeGS62mlxUG+lzkuFcgpQ==
X-Google-Smtp-Source: AA6agR53u8ue1LzW/SyFNgMGGcOf64oJdDOv2ATgNfXGuNbU05Za4Mc1pxScULpuI0moW2wWFPhjGw==
X-Received: by 2002:a05:651c:1116:b0:26b:e28a:6919 with SMTP id e22-20020a05651c111600b0026be28a6919mr3494238ljo.461.1662894744654;
        Sun, 11 Sep 2022 04:12:24 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:24 -0700 (PDT)
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
Subject: [PATCH 16/40] dt-bindings: pinctrl: qcom,sm8350-pinctrl: fix matching pin config
Date:   Sun, 11 Sep 2022 13:11:36 +0200
Message-Id: <20220911111200.199182-17-krzysztof.kozlowski@linaro.org>
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

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

  sm8350-hdk.dtb: pinctrl@f100000: qup-uart3-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be either named
'pinconfig' or followed with '-pins' prefix.

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

