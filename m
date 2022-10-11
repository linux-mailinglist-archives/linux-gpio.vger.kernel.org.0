Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD645FB993
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiJKR36 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiJKR2s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:28:48 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9228774BB4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:27:09 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id o67so8937872qvo.13
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8vCb8LN3NJCbZdNLXXOR3U/nzHlkTwjfzQuOgzIuCE=;
        b=BhLyjWsKnJIcynX5A80t5/46fc5t4LkQSTVtCauxVAQXHop0j11VXu5LF407ZSwG7Y
         h9TWikdAM0F3InF3UrUrecrS06sSbfVirCkpnFIZalB3CXCeSEy3PwMcqYQOPoxxtpk5
         rSrAIUwkTC6Ul6setcM1OMBuismVIsduZF1yE/qLFS1MA1/dVwvlx+MOiChImOegMgeJ
         tbDSiobGAg0+xThYKm/o7F3m6+PUmtYpXrQqJdxAXOBU1hYyDQVSYnqIq9GYsAz/Iog8
         A+p2CdtwLTqbqWw5a2llU0RMNCg1n2Vb4OeMR3y1NLi2W5bH5a2YYmvJexOMgruQLtvQ
         41cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8vCb8LN3NJCbZdNLXXOR3U/nzHlkTwjfzQuOgzIuCE=;
        b=Mc+rAkfqHUN0k3PFjsu2ukWtkdrV5XC/unyXf8cbMRywWD4ax7E0+YKF9DEl5l5ihD
         SmFvw8EWaNjKyUPccqQkWwZ3tDOhTHXDHb9zn7wCgcqU9iYTeiGfeRkHs3BIfS42TXpP
         b4ZdTLCzovvbOAFO/xkgfGYy8YpDwhKjzgWQuiA742TGrzXDn1gF0TJEqvZqrGSMgGjE
         qCIWI6Cje72JE4Kqzo/XH4qzrgSClN+WXwwDlkc1u77URVfuo+zx1irRKDBA5W0U4YWo
         sUnIxrlVamIe0zCVkqtbJjzERI7nKfilkB6MUrfB2u/jKAUzn3nilhVw4KW+vtTPmfrE
         9b7g==
X-Gm-Message-State: ACrzQf3yKpq4YI12CCyx/xV6phXTISDYGJwqq69YqfNgfgetcdX6CANk
        GRooRqrRMFnlCc+fiop9zIBbOQ==
X-Google-Smtp-Source: AMsMyM5BnsW4QZvtbBUdKyM05aI1VkqgUHxZ1Zp7WutxMBCdSAZQIHcYIHH1ntmVnpetInjOdOC/Mg==
X-Received: by 2002:a05:6214:20e3:b0:4b1:d5d5:8e85 with SMTP id 3-20020a05621420e300b004b1d5d58e85mr20932726qvk.69.1665509206790;
        Tue, 11 Oct 2022 10:26:46 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:46 -0700 (PDT)
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
Subject: [PATCH v2 26/34] dt-bindings: pinctrl: qcom,sm6375-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:50 -0400
Message-Id: <20221011172358.69043-27-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 4482625b6b1f..d54ebb2bd5a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SM6375 TLMM block
 maintainers:
   - Konrad Dybcio <konrad.dybcio@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM6375 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM6375 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -39,7 +38,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm6375-tlmm-state"
       - patternProperties:
-- 
2.34.1

