Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F0F5E9ACE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbiIZHpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234169AbiIZHoq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:44:46 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014DDE097
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id t16so2425688ljh.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=q6DefFI7GIEcs/oVzXTkboP62pRWh8w39cembxYBY0A=;
        b=B/rQrR/v0P21hQNF9AHNcT29Geh0QFbTr4rt5aSy9lRJkkMya+TM+G+ZpaSCxdQCwc
         K/lz/xgu6/+PJwTUq7upLnJA4P+GDukHkqh/NwMF8QZrwtbMcV1QTKRGdNcmVoIcTW52
         9ASXURyI/fzTnLBn5ToqDfzjWglLueuIBItTBfCjrmS2uhfEFff0fni5JlGj6D8KhkpN
         2t3MeYB+4kHZ8NWC7fmfmrh5LvimyUFGCz3v6KR+XV5BD4gFsypvmt3ePI/WzF/PwZHA
         Ris9da9KrsGhOe55tjVx522qW4KQwV0GXvpSCQVBl805tJ49pEFMZoV50we+BHeTubUK
         o+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=q6DefFI7GIEcs/oVzXTkboP62pRWh8w39cembxYBY0A=;
        b=IWLksmnTfoVTuT3CL/DcCBDXnh4UUfj9Ve9WTa3SLOICMfObvxU2jweVvU+MZiEVG3
         jrLWby9JIRlX72m3qLqkNS/bV/VxpVmS/6uBcC4WuU35wI13OXZ+xh3k/PHOv2ysYLi3
         +kVL9WuiHnclMw1gMPmhCFCARugVyQWnKzq1rqpuwkJn/rHbxwwmh7sF5wNS/+1SBV+g
         tAh/qDy++35PMSlvX089tbqYyFdZO4xanvPVLjQxYvIWnXOmZQi/3vTrkv9lBt2kte4t
         DOCgBywCA074yqKCGshGL0T/QtAzhIF9D/am7r/RK7Ydc31s5VNxicgicZyoozcRgvPl
         rLIw==
X-Gm-Message-State: ACrzQf2yRnimYxPgU/fdWO/2SC0TPOnMdNaCwI8dgQXbOg64wTR3ZXzy
        sBcWqYoN/Rdj8LRFwvHTML0c1Q==
X-Google-Smtp-Source: AMsMyM6ZQfKZBjPOt15k+zArd75FydqZHvVQWp93+QH4M/12RJTqKdpFjMfouSw9kxw6oByq2mWdzg==
X-Received: by 2002:a05:651c:128d:b0:26c:37f9:c8d8 with SMTP id 13-20020a05651c128d00b0026c37f9c8d8mr6841986ljc.97.1664178281231;
        Mon, 26 Sep 2022 00:44:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:40 -0700 (PDT)
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
Subject: [PATCH v2 09/33] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
Date:   Mon, 26 Sep 2022 09:43:51 +0200
Message-Id: <20220926074415.53100-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

One pinxmux node can have more than 4 pins to configure:

  ['gpio1', 'gpio3', 'gpio4', 'gpio5', 'gpio6', 'gpio7', 'gpio8', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio14', 'gpio15', 'gpio17'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 0bd1aded132d..670eb7162e1a 100644
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

