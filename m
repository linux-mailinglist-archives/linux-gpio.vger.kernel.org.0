Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04DB5686A59
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjBAPa5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 10:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbjBAPay (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 10:30:54 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D20371657
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 07:30:42 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so1676969wmb.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 07:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Mi7+OhNuEyZNc7DiLz+rkr+x6COhOfkexl0o6kozQ=;
        b=s+wRAp1uEsnL/+iaA/XDYYGqFrEXhmBd5iSGiNp0AXDZ94Vj6VE5FSgXpvxmrVCB1+
         fzgxmglsxGxXm5EjLeStK6BhzYzNvPxZbbgYp5Dfd0VogrUk3FNWlkIF0MfM93wbR9lG
         SVp3s82gf/qWDUQJlR3pv5/BRDXslPQsiInWuqNl+7KW9kkx45tHJMM7xiyYG3Ry23W2
         yMmSXzj9HCkWcAoV0Uk6qwnTP+CJbH0p5ViVp9MZi3COvL4tz5RYG31ZuFlShO6xZyzl
         cU1aG7q0sBdP8aAVghh0+rCnzTEQv0E8dCLFFnmjW6Gdd1RvxbTy1F2PbkI7ruxKBYpv
         hXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14Mi7+OhNuEyZNc7DiLz+rkr+x6COhOfkexl0o6kozQ=;
        b=ErNVLULiWucjH4DDkwPHBxTUQmZOGLv9ZBrV9xlzzKtE4k+xkiyws87TdxEvyG4Ig8
         k1Z5Y6HdYDNp8G3OtDTD/DJ3+FsYnISdz8zwbP8HMXreWMlLATPDrnMxULW87oigU0qM
         q9/flsZmxjWsrs/3XY6g/lDOH1lD6jcOCf9N8IuH2RCnEOH4ifTnpiuBKGF9vNFGJkvv
         VVUGU1R3SjUdkAnuN+BsDY1i2vZQ1tMXYBkq/KeNVHr+ahKsyfJMxU5yJInCY3nJsaXN
         mum49GPPr63VOMUYPxNpZZKcoNJHwdMxvAY+6RvodaQ7SJQqjroPIuCfM+HoJr5KmQdd
         ewDQ==
X-Gm-Message-State: AO0yUKVeB+R7kywBU+OhdKvCDd6dFKdnvI2uGwsiVHfhsNDmQoCHFf5a
        3n+KBK+kvCkkNLDX/TJqtNrxSg==
X-Google-Smtp-Source: AK7set+/fxIw/6AP66xR4HipmCgO57GDV2jpI4cZMsP3FKcEAGub+CNfBOvv5AUv6ssGk6Ana/tqmA==
X-Received: by 2002:a05:600c:b88:b0:3d3:5a4a:9103 with SMTP id fl8-20020a05600c0b8800b003d35a4a9103mr2506288wmb.31.1675265440772;
        Wed, 01 Feb 2023 07:30:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003dc4fd6e624sm2168032wmi.19.2023.02.01.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:30:40 -0800 (PST)
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
Subject: [PATCH 5/7] dt-bindings: pinctrl: qcom,sdx55: correct GPIO name pattern
Date:   Wed,  1 Feb 2023 16:30:17 +0100
Message-Id: <20230201153019.269718-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
References: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
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

The SDX55 TLMM pin controller has GPIOs 0-107, so narrow the pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index add3c7e64520..a40175258495 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -55,7 +55,7 @@ $defs:
           List of gpio pins affected by the properties specified in this subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-7])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
         minItems: 1
         maxItems: 36
-- 
2.34.1

