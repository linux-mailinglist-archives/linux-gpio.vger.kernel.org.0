Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18985F68F0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbiJFOH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbiJFOHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:07:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CC3AD9AC
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:57 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id s20so2844793lfi.11
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZI6V0g8Fa0N0Mb60LAsLdyWPSvNvWVbqoCuAkJZgzhs=;
        b=JIDF8cwmNfPdx26tk1eqfgpSDIZe9UypQDthjpV6FOq6EqSKSrDF4P6Hx2m1QHKqYr
         oIn96hq1ZSO4tJJIsTIhpeouo8kt2f/nkEW8l2HxRpH0/FJL/NkCrWWG/Rb8GPXXPXLx
         c7dH9xHB9kcqyR4j+D6HB9rTmf8wpwpCeLuyy/FxgbGhp2aZBszLG6TO2xJKh5Idk8Ue
         uNHpOieSW5GtC7iPZrL/WHcJ0eJ8pBXRE4bqMC+TjDrhw8ADOX8pECh316OCD1Cn6sbA
         nmGHeGjrh7YhKmD8xdO9H4AWI+g+rCfJoWJdwMWdM6ExJfZqBdvsTNmGWznwKcbc/tu5
         asQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZI6V0g8Fa0N0Mb60LAsLdyWPSvNvWVbqoCuAkJZgzhs=;
        b=MTn6u0HHNkChQ8192gcVWcfjlzbd9vj+lxW3OoGnt5IZE1q43kF4HZoMolc8oer2Af
         dOJnPfVkGyIyOh564EKgGox4QMiSduuW8OMwAr50TlHtbWZlpi/UrdI74lLxtvXzxkOP
         mTUGbzzIGL/U0e95qWf1BdfX1D2zAgS0x4FK6Mvp0SGwRa/jG+F+n38sbZwXNHGNCmRp
         ofKioRk8azOPuIdZ8DTgbjb9D2pk/wD+hexQ1NW/Z7LG3n4BZSUckyplphTt64QPBAkw
         ZaIcvwlhF1QoWu1sr6XA8jOEGqsz9tGqv/0q92nl6ClBuBFskepjTayyzQ8vMvfKmJz5
         IgVw==
X-Gm-Message-State: ACrzQf1e8qmuUGcX/v5DyMAkO13j7oAkItwcFP59gIoTm6A6ZhJFBwPA
        2gUbhJ4Ax3XfH656negmPt9yNg==
X-Google-Smtp-Source: AMsMyM5ToChhLcVsxSQ058FvFfhF6ZnMQsPD7i+QJhuCLdRQ3A5usc07mSmB9FLtcvlQyFkWW4VVqg==
X-Received: by 2002:ac2:4e0d:0:b0:4a2:6fdf:6698 with SMTP id e13-20020ac24e0d000000b004a26fdf6698mr55136lfr.288.1665065217058;
        Thu, 06 Oct 2022 07:06:57 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:56 -0700 (PDT)
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
Subject: [PATCH 11/34] dt-bindings: pinctrl: qcom,sm6375-tlmm: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:14 +0200
Message-Id: <20221006140637.246665-12-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 025faf87d147..8320e5ff17b9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM6375 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

