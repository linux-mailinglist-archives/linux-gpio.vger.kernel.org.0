Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2D45FB944
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiJKR0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiJKR0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:26:23 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE1054CAD
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:19 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id mx8so9375584qvb.8
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3bp1rbrC28KgiG2T9eOR6Cd8Q38ToH71DONTqvsv5I=;
        b=Y9HSrkyiNIGwKDJmhdM7/keBj58lfUG4Kl+fRYHXul3cwIWa4GUoRXIMZXr0w4/dsW
         oj3q6Kcoagd/poOkfbK2NTKDHzd3jFvA97haNpRw+F+cZBSu7pWgYKFHG9YlEBCEzx5D
         qrFAtUQxZbFx3svDsj5Aqa9NYfMBcJx4CHjVVSs/z/MQSEJy846B5XzDI0YiSIpLKz8+
         DeEcRwEpeLB7L6rG2ltYr7UQfrz32m3VfwaZ2uga29ld/6te+Q4xCvBHZfU16jAQtkiz
         mnnL0mpUrpiq1jmRay3YN5yuK6GXaEM/pxS6FegKMYvp1hBPrYwtIVr9bS2uz6GGiXXF
         xEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3bp1rbrC28KgiG2T9eOR6Cd8Q38ToH71DONTqvsv5I=;
        b=t/sAqSrFHmz9uwxncl/L+YBfC8SZcEhRvoA7RiLhHikuYsi6Cl/AT8EOR/BNST6Qa9
         uV4aHJU6WboWV6O/vKosLsUQ0DZ2Sg9zNbtKZauH12YxmgMxALv7S2LS5oKOQWRrlNxq
         v2M/mLdFOTi1wLr+JdP7xBSVRWU9V42EJn0pq4tBz/+8/79g/5ZojNPbKGKIDggEffcr
         HwbXAr0yBQMHyK/52HDJqVOJXM6q36WEAjJtIS+wFCGUmGpl6SLJXWdSP/7HQkqeFL99
         WxrN5d+itgdZVoasvIkrre63ls44CZkiihDWpjQmNtYyFEy0Pv3yWVNgor2WQYuToTxx
         j2DQ==
X-Gm-Message-State: ACrzQf0sNKGnI5mYQRhJFqGCRjCaSFGlZfVyhq7GvjFEsKQC03jPjmJz
        nthc5OcpZug0tJqb7wiI2rZmRQ==
X-Google-Smtp-Source: AMsMyM6t1Y7MjgHMNrW7U4f0uQTQ+tkV3lq78BS2rX6gQqLSjt8lO658TKAFsi+TQbL/qLAoP/baPQ==
X-Received: by 2002:a05:6214:da2:b0:4b1:8a49:b492 with SMTP id h2-20020a0562140da200b004b18a49b492mr19587254qvh.8.1665509179046;
        Tue, 11 Oct 2022 10:26:19 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:18 -0700 (PDT)
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
Subject: [PATCH v2 09/34] dt-bindings: pinctrl: qcom,sm6350: drop ref to pinctrl.yaml
Date:   Tue, 11 Oct 2022 13:23:33 -0400
Message-Id: <20221011172358.69043-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 856b9c567ecb..94af82ee5967 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM6350 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

