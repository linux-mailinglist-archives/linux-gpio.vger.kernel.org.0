Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7DB9686A4D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 16:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjBAPak (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 10:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjBAPaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 10:30:39 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E2961D4D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 07:30:37 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1755807wms.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK7ORKhwF6fA376ugu8KYmXoLthZ7oUrLPaNlTk1CLM=;
        b=dy/VLpUdT+shdcZZ6FFKb7CuaCD08Z3cNjFTIDMyb0VIHr8OEhrQLGul7ghl9xdq7u
         rqr0SjcymaFetzD8QoU4YBYuZeosw278PLMW0T21YA6OXu/j2iM7ZnwlRar0uwMa89j9
         eJ6RZQpdb7lHzl1COXOft+41FyGNbStpv5qIqqBNI/7FYTRtImF0N/xa4BxAMPfHd0s5
         EXAzw3eo2l5RNzrN/6z/fHfjxYbjqlWCTBTnxVFx0Cd5zTsHKAMaFuFgtIwDN8qutuvM
         791hNONlWQqN4kxpz/ffLko77j2tvT8eQlGd0Kd88OL+o2D0TqEUgZe/gDx1/7p9pL1a
         Ks/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK7ORKhwF6fA376ugu8KYmXoLthZ7oUrLPaNlTk1CLM=;
        b=o35zh+1zbN3WvUbGFbujBcamRbE4sRQVg3lPWhdbfQRrgqyD1I2BsKppvOqonNyFYC
         JdSgFelkCRAyvJegTOwaAaZt9rEs/hq43ZpsPT/8XiMUKl7P6wIxsYSgzN8cW3y9x1s4
         oagUbaONZKMWgWCFIA1oFwD6GN7ocx98FOF0Nhkz2SXMIfywl8Q58e9dTEpSEeo6gi8P
         OKWbbggPEURIYGai5aTQswaguupevoannms5XwOiMTkebDGfS8XG7/+qV9zeU4SVUDt9
         onKr8kGUCbZlOVwWQLNDJYR53y2wSGPpudRa2Nt9oxmp2d7wUbGIiUQYkchUc7ZsHGTx
         JWxg==
X-Gm-Message-State: AO0yUKUooQLyRdiYdipiUlgMiw0Cy0BdgOObwzW8thg+3LGUakSGzA+7
        c6GG/8XUYnddNFvDKyp0vjvLyA==
X-Google-Smtp-Source: AK7set/+4bkbR0JIU7BBjx8kS5AUZOXyhl1TI4ym+DKIey0SP6dr6m3rmNS6DbXrsTkhjPlITWzFWg==
X-Received: by 2002:a05:600c:350f:b0:3d6:ecc4:6279 with SMTP id h15-20020a05600c350f00b003d6ecc46279mr2218252wmq.27.1675265436247;
        Wed, 01 Feb 2023 07:30:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003dc4fd6e624sm2168032wmi.19.2023.02.01.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:30:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/7] dt-bindings: pinctrl: qcom,sm6375: correct GPIO name pattern and example
Date:   Wed,  1 Feb 2023 16:30:15 +0100
Message-Id: <20230201153019.269718-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
References: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
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

The SM6375 TLMM pin controller has GPIOs 0-155, so narrow the pattern
and gpio-ranges in the example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index e4231d10d76f..75216fc7c8bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -63,7 +63,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-6])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-5])$"
             - enum: [ ufs_reset, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk,
                       sdc2_cmd, sdc2_data ]
         minItems: 1
@@ -134,7 +134,7 @@ examples:
         #gpio-cells = <2>;
         interrupt-controller;
         #interrupt-cells = <2>;
-        gpio-ranges = <&tlmm 0 0 157>;
+        gpio-ranges = <&tlmm 0 0 156>;
 
         gpio-wo-subnode-state {
             pins = "gpio1";
-- 
2.34.1

