Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EF85FB992
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiJKR35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbiJKR2s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:28:48 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7548872B42
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:27:08 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id f22so4725339qto.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4dRbN0aLfj9QfEIbf0upluuPumPiiqVQlBvgF4rrF4=;
        b=YiwQ5F8HmqIFixogex8nMHb0cBxXhc9l6IuhgjpjQv4NPqtRU2uUgc/37jtWUM972q
         RcV9NMNiIoREtyjg9EEYbzgSVm6Moy7dgI1e3+Jme0DJgCwtX46xjBIEWnyB4zRQJNOo
         I7hxeU2D9OXXUSAq6f9m9ijzfXlaBvu0QCyWH7bt4zSScCVitqlVo83JaIJLgwdj5caS
         HhnYtaI3nHdUmO6JWjaT7TaJqX0EWrU7uWqoq/9vwxgTUlBZsS+vbG37zjMjrtqkdQGB
         wtf8/VMFzmC7O3H2n4LVaSJ08lUaQ2QlFC+kGAqB0w4XZHp9gTteY35mHqJk/OHYz2KX
         9EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4dRbN0aLfj9QfEIbf0upluuPumPiiqVQlBvgF4rrF4=;
        b=fFsZw0C648mqFg+o4laiI1MQImVCssO3kfWi6YAjd+xk5aFcVB8d/uapqftraQfbiw
         dgY9I5SCoGJdxXEabu9X/RfG0qyRQTP8bm6WTVU7YyqLd8NLuyp1+nSve7qEJxMU6ZF/
         i+YTtupmdEXNnUUGLoDJkrSlp3LN4/CHaYpfpzA3oU/1rHlOOR+d2eEIyjBZH/6ywoKC
         vhEzzkRHyeNCI333+soqAW51+cgHIElEuzO9KrvW/XdDA0xZ7qtSoOti8NgmcRf/+qjv
         LQFjcTxOarImhc7eiM/bOdXeosKp6sqm8EeB1/dk8HsTLubiDNufT1Zk7Rt7PkgKuovV
         2lug==
X-Gm-Message-State: ACrzQf3N476yABIPW6K1ZfS1NjERkDGSWZBXJYVEo9XV8Jgz4k1dK1Gc
        oT+qPNoAoK7G13M4VA9yfsF0AQ==
X-Google-Smtp-Source: AMsMyM4AeeZ/09x9U5G9FkYASAtJbiBTakgxOBPfxRSMss4hm+0ESZRJ2H1SDXJRh2FwbuESvMrZ7Q==
X-Received: by 2002:ac8:594b:0:b0:35c:d0b7:e2f9 with SMTP id 11-20020ac8594b000000b0035cd0b7e2f9mr20178773qtz.483.1665509205101;
        Tue, 11 Oct 2022 10:26:45 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:44 -0700 (PDT)
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
Subject: [PATCH v2 25/34] dt-bindings: pinctrl: qcom,sm6350-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:49 -0400
Message-Id: <20221011172358.69043-26-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...om,sm6350-pinctrl.yaml => qcom,sm6350-tlmm.yaml} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm6350-pinctrl.yaml => qcom,sm6350-tlmm.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
index 894e59caa735..41e3e0afc9a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SM6350 TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SM6350 TLMM block
 maintainers:
   - Konrad Dybcio <konrad.dybcio@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM6350 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM6350 SoC.
 
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
       - $ref: "#/$defs/qcom-sm6350-tlmm-state"
       - patternProperties:
-- 
2.34.1

