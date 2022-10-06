Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C225F66A4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiJFMs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiJFMsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F1AA3451
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so2541196lfy.5
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tTMl2+XQJgPvX0+G4LvEbz7FpuBsUNstSWfbNW6//dY=;
        b=a6xyZ9CPCfkC0IR2IkEFS2Eq1tOGEEam5h+Z8dktE7dFxEKeOrjTsNQ51ZTX9FCKaq
         0yJMKrcZGLSCXT/JTYmdih7Ic9YVTfvTGSoSsDlg/zy8il94HbZQDXbsjA8u4tZF9i0j
         8SPEcCcPJnfwXgnkBo5GOZFhi91p20qdbNWcxkcxL9sexHjWDalEmirVPx4UavY7HyNz
         IBPCSjuxEmK65ZVqtVYmQw7WS7+nRBJNJpfiBf5DMHUtAT3cNpES8heFQncZZgcCfnZy
         acACBCFTlAa7XH75nCTXuL11SkhVyJS1jyJ2fDm9RxJORtlxmq9Qvh+AUgo1ZGzw8zBI
         FjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tTMl2+XQJgPvX0+G4LvEbz7FpuBsUNstSWfbNW6//dY=;
        b=5woITCspkdlVwoYBB3w21H8j4CmG0w880op4a9mYdm9A+WMi3iXLohCxlJ/EKxB80x
         1liwIa+diJxxBT1dHLBGPLe8950ljQuHCd6TXRxjx8UYh591aMoA6n9XqGj2bIE5Jir/
         rjcsvGpRH4C3viRtPK6H9FVx5jfBOl9dSWz6cx8sPXuvO56xsLhfL6ACDHA0j3umCDI5
         309n9PCTtLu91ZYT1Hj9/3WCE5Q/VjGDzK7gDE8PJY2ZZr/DxHoU9TGf99qDSo35upYC
         tbO69rclbpL4VnHcl2D+x7ZPG5TPKRm4sqWaYCzuH18pd6tupt33+s3/uZMv8Ztt6h95
         K0Zw==
X-Gm-Message-State: ACrzQf2f/toUwE25JEIHnV9K03uAk12MX2Eg5w9Zrw0VbeokVZ6ahM0l
        +xISw/7QV1r+AZ2r0+8ymNe4SA==
X-Google-Smtp-Source: AMsMyM77Ou53avfnXUtXcU41SRkN4MhE6lemlNCHK0MJ660SWYfQq9Kj/pYqgc6MB0KPD2jzIewb6A==
X-Received: by 2002:ac2:5de5:0:b0:4a2:2f3c:5db2 with SMTP id z5-20020ac25de5000000b004a22f3c5db2mr1790868lfq.635.1665060443688;
        Thu, 06 Oct 2022 05:47:23 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:23 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 19/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on non-GPIOs
Date:   Thu,  6 Oct 2022 14:46:44 +0200
Message-Id: <20221006124659.217540-20-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index b1735918fa90..08e2dd5cbebe 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -113,7 +113,6 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
-- 
2.34.1

