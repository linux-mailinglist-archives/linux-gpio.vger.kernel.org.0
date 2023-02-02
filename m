Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA471687AAA
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 11:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbjBBKrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 05:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbjBBKqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 05:46:51 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F6A73044
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 02:46:21 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n13so1033760wmr.4
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 02:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HxV2uwUvV4T8rg3EOmyIyCvm/QTHJazOaEqc2uAkmI=;
        b=pyX2BIhaxMOoz6BDIWy7BkwLoXi05spwGsEhsMGjbf5mpDURxexGshfv8QMEvShMPF
         JzoyjliJatzYXEjnmhPquVhdbq0U26XYjGQrUCBjb20VkfD/Jw03jLPOlYIkLxQfIpOg
         Ko1OeKUFmL5yj3EgDvWdzbIBaL1EZvcAmman1f2dZ+YpYP1kPNGD1NWty1MJv8KFuDCd
         a5hNB3D2HOgGwoR4UGx6wUASKHnANkEfFKWaYDK1XVTU3E+QVo7PRcVjTnv/5AMeaIdZ
         aLwrLeyX9sHta48pYOYkXs0kKseu5YSjccb/OOmuX9J4GntLAUx3SvJV4USP6oYTN7Yo
         ykOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HxV2uwUvV4T8rg3EOmyIyCvm/QTHJazOaEqc2uAkmI=;
        b=hi1lL4E7FTjqvicDXw49trPptjoN+wuTMYwftxenvNBYS+S54NgHxf/hUn5tUmxifS
         1wCDOSq0iz801KTp6/VwUy3R5n90QqMpdh79s9i0dIFz6sgkLcqgF2Sh0hIz49V+SY3Q
         UsZTDItvjAk28O8TJJ8aljpDacxT8tVgkheYJ+o82rNi1JLIvJPzynyHOnaBuvaiT64V
         yKVKkg4CDMLtJwWoDtOrgcnwNNjEIHglbjQHOKndXVMuYnBiyu9PbDZj7v5KVAIAlzdk
         MVDTnPQOsa1IJzNFBQTclSY1XZQxU0t8W/tTZ9m2wgxn0R97ibf4J15XOR1CAJnBKd3s
         y+rw==
X-Gm-Message-State: AO0yUKU31ZOqgNNYMbrnjF73lU089OlX/FSkbSGIHCs05JEgr8JJEoHu
        XwDTP1thn/oHpvOUsdrY3+HFpg==
X-Google-Smtp-Source: AK7set8CzddN/j5shOjSU2n+Ys6BHcfjZ2EUvqg7YJmAcNX0x2rg4UaaV4E8N4ynHMYJ0Ws+oB9l1g==
X-Received: by 2002:a05:600c:b88:b0:3dd:1ac2:989 with SMTP id fl8-20020a05600c0b8800b003dd1ac20989mr1425940wmb.39.1675334755934;
        Thu, 02 Feb 2023 02:45:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:45:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/10] dt-bindings: pinctrl: qcom,sm6375: correct GPIO name pattern and example
Date:   Thu,  2 Feb 2023 11:44:45 +0100
Message-Id: <20230202104452.299048-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
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

The SM6375 TLMM pin controller has GPIOs 0-155, so narrow the pattern
and gpio-ranges in the example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index e4231d10d76f..66cef48ed59b 100644
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
+        gpio-ranges = <&tlmm 0 0 157>; /* GPIOs + ufs_reset */
 
         gpio-wo-subnode-state {
             pins = "gpio1";
-- 
2.34.1

