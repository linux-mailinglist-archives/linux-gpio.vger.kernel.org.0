Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292A85E89A5
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbiIXIFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbiIXIF1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:27 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC60D11F136
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:19 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j24so2321752lja.4
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VY7fS0iu1FrQv7JLDwEKvC3Dn+VfsmyHaoeIkwh4NZU=;
        b=KRyeW7mG+bhv+Iv+m0hSEcOU1KuMs7Q17niR0GIN7m9OR+QNTdcYIfOIyPMgv8q+GX
         VyCPVJ5g62cfLsUun58wmndfn3Z8lt34LN3+x9xuVcNro0o9GO5iKQORRRFQPLJBPGj3
         9jMBlmzuK8so+vl62hjNlCRRL0V3dW3Pdzw39cwGdLJSKDXVPWdbQ5A4Fc8Jf7YA1Wxc
         cWyaR3JOriRJgBHfT14uzgfBX5m7MUdGvrkUUUjLLYCH8kDyYGvu7efmolyyOKuLIMch
         ojqDE2AZhSJrHpNhQFCn87mTl3/YSerYcspZTX71zXIlXoXmd/j0Bg7iU9DuX0FLUix1
         DfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VY7fS0iu1FrQv7JLDwEKvC3Dn+VfsmyHaoeIkwh4NZU=;
        b=sqAINg5HRYeoqM9P1kriLfv5icQE5tdXqgIIvtCMk7HoMHRJEc14hyAexz8euPUrCp
         smK70t9idTf12DEVYWVyQm3hX4skap2/eI8irlvjJreeVewhS6isqN1oG86mGdQ8wOyG
         H4NUHQl+k+t7/pNSEajaahMJ12Ykc4CReSLhpggBkGmxSj+u1SHesYuZ7VXMeTGVmtBo
         nNR4ZgNImbYSzxLhem21keA2Gs6eDEq+Akxrbu3Y6gbfre2oQFU7zGmkAzgvjW7Lutp/
         fWa7vpt8NsSkUC9VF0OiLoVeUAQJAVt44Z4dNByvOEMH+YaxnM7gCj67BBO2hPrpdU+C
         3WEA==
X-Gm-Message-State: ACrzQf2rw4+1ByTgaHMdnXlfwyAHBHGCmX+3TJ0l9nBt1WfW535eAGry
        vyXZ5rHZELd0aevWqJXO7wXT/A==
X-Google-Smtp-Source: AMsMyM5vRgij2AaBub331/OuCNOMkPcE5eJp2i/WT6KBGxRfGdy0aH5B8gbw3V9h9208ub5CR+dmQg==
X-Received: by 2002:a05:651c:1043:b0:26c:565b:2942 with SMTP id x3-20020a05651c104300b0026c565b2942mr4162300ljm.440.1664006717627;
        Sat, 24 Sep 2022 01:05:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:17 -0700 (PDT)
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
Subject: [PATCH 08/32] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
Date:   Sat, 24 Sep 2022 10:04:35 +0200
Message-Id: <20220924080459.13084-9-krzysztof.kozlowski@linaro.org>
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

One pinxmux node can have more than 4 pins to configure:

  ['gpio1', 'gpio3', 'gpio4', 'gpio5', 'gpio6', 'gpio7', 'gpio8', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio14', 'gpio15', 'gpio17'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 1f7a5f285404..9c6958a9cfe4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -63,7 +63,7 @@ patternProperties:
                       sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
                       qdsd_data3 ]
         minItems: 1
-        maxItems: 4
+        maxItems: 16
 
       function:
         description:
-- 
2.34.1

