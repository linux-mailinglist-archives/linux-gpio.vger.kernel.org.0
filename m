Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01F85E9B2C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbiIZHtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbiIZHsj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:48:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B2E3869F
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:45:36 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a8so9451310lff.13
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rip9dlqrCxUoqsfVIdKnVGZs/mVmoXJ1pwJE84kTnM0=;
        b=D+Sofw07TQjXsyVzkAZSP/EqENOZTmJh7z5imb4KgyLruWfeofVYZIuVnrbADfB2aI
         YnwgsQXXpejlU0PWRUnmJOgKLO4j4KtjUaXaaQJRigytDhdOXABb9WOEwJ9PmZyMyfHW
         03WkOJFzpowoJ1af3SK9SXAx8uVskwmeOCLsIl/cTaDTtbp1GhEyq6QPp2I8DcT6jWo3
         4IRmDdyPGPaIYGi9SLdv7LoETkYcofvI5TGEX9N0bxHI7W7WF+pf8ODB4vC9PFiOdsCR
         m7iG8cix2ygL+IMurOcYrG0oQkPSUteLFXVxNRMFB70eL5zNP8DQPKb4Se9NFK/Qj1CE
         G50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rip9dlqrCxUoqsfVIdKnVGZs/mVmoXJ1pwJE84kTnM0=;
        b=wS4DO2j384eiTBf8nzV2YOtjTvCUX5JujeexYvTJWrKmz2I0s4uUW+60k1KAM01lmj
         +YrgfUrgObefVdSEKxf9fozygB1KMLm/dIYqev7t9zSpLg2hSlJhgI/nvbyehfjnmHoP
         QgZAC/QNEC2INOWmUR63WKJtaPCg+dJm7Ptbfq3xNDkvsjDN3A9OHd+geHcAlDZWcKEe
         mkTD+IRlHuilvUG+rxpk21I1uDaAYb/8dzGYRsVo/OKxbQDmvAAL+asys67+n9qHiOjq
         2zy33Aui9XdHR428uW658/a7xZGjuiP3mViosqVI4aXx7qTsLlPKPDGO0q9Vrx7XwFaD
         pCAQ==
X-Gm-Message-State: ACrzQf3Y1Nu2F65i+PfVEaG9JNRRrLip4NkbpFIy73kquEoplSyUC+LT
        EQbqv8ZGw7ZlLpe63UyUtq9qRw==
X-Google-Smtp-Source: AMsMyM5jtk4k+suGHJrz0z+fgzKwhx4QWJeS4953XmFEzGBPsdZBw0u1HDdVkLuW46e0/S4jqXRagA==
X-Received: by 2002:a05:6512:3d17:b0:497:9e34:94f2 with SMTP id d23-20020a0565123d1700b004979e3494f2mr7891109lfv.285.1664178328055;
        Mon, 26 Sep 2022 00:45:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 33/33] dt-bindings: pinctrl: qcom,sc8280xp: fix indentation in example (remaining piece)
Date:   Mon, 26 Sep 2022 09:44:15 +0200
Message-Id: <20220926074415.53100-34-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.  Previous adjustment
missefd one spot.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index b9ab130cd558..0b251caaebf2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -139,8 +139,8 @@ examples:
         gpio-ranges = <&tlmm 0 0 230>;
 
         gpio-wo-subnode-state {
-                pins = "gpio1";
-                function = "gpio";
+            pins = "gpio1";
+            function = "gpio";
         };
 
         uart-w-subnodes-state {
-- 
2.34.1

