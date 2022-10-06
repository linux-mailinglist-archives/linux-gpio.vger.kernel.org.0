Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4DF5F68E7
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbiJFOHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbiJFOG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:59 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E55AD9A0
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:55 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id m14so2383402ljg.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2O452qq9ivvP2uI+u15wAuxEQuSlM8R5B96G5Fwl6Wg=;
        b=wj1qDgl1Bn6Yw4Gq+4Cq/hxZTExCNwUufJ79bXAfDaeKzCR6/n23jPM6J4mZ2L+xsg
         v5sCVx9MrIE770LkRGEqf9Y8JzweRHhxnxH4Xfnu0Y07cQYq2seFKYEekxlmXn/nSnrZ
         /MOXYrqvuQhxkNlq1scPKwSApBhol7H2QwQODpDc9nm1FLsHmUaRGTCuCMQr5uqo1KYU
         CVGebjbPUFohn4Im+R9607LajOQSt+hvOM3rxxk4cXuU6Xbz57Tv2FehCREGRRti2Avf
         WG6L6croP1ZDn4GeZZRdnxy1wEFVptyNbU5yVavR1eZbC9MZm1SYZWisJN5Ku/1+BifQ
         cMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2O452qq9ivvP2uI+u15wAuxEQuSlM8R5B96G5Fwl6Wg=;
        b=iSD84hwx9UpBF6FjNBCtOBEjiPnr8X2kz2VAmCi55TBFSYKXwAjBtvlCGl6Sbu9GP+
         iQWAq1LwbTdIX0LEgrVpzMLWXF/D7qtYTT1cIETx6JQUX653fhOQ88sFSLaP8EgvWScl
         Kb+AlfEBE9z124N6PjzhaFscQfK+pZw7GsXgi1Ze2Ho5l1iDv2AAnFLHIXra1w1uq4PL
         ui0ddB7ZdZgAKjx5zfKdGYqvN+MNHYk0q3J5UO/QLX3vFvBdocSz0VkCqaMCQGybsuSX
         x/N+6IuOTzjoECKLgGMLWhP6tNhXwwj9YDusepW1hxRfUtfwLIfDLkDno2onFzOynw/2
         bnrA==
X-Gm-Message-State: ACrzQf3gKUgQS2Xd1YXYZAlFfNOzIx81UdbJ6UcIeCMnFTjL8bo3VU/T
        4uTFLriTTZ7Bn6f+g745DKagKQ==
X-Google-Smtp-Source: AMsMyM5MF9vyCaNC5+5uAQ00ZarCI/6Kxw1vf7l15KLJf8MiL20nETILL/iz+nuSUAuwyAR1yXh0KA==
X-Received: by 2002:a05:651c:98a:b0:26d:fd1f:10 with SMTP id b10-20020a05651c098a00b0026dfd1f0010mr1898150ljq.323.1665065213433;
        Thu, 06 Oct 2022 07:06:53 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:53 -0700 (PDT)
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
Subject: [PATCH 08/34] dt-bindings: pinctrl: qcom,sm6125: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:11 +0200
Message-Id: <20221006140637.246665-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 843d110df240..50f721d5f843 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -13,7 +13,6 @@ description: |
   in the SM6125 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

