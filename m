Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA635E896D
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbiIXIF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbiIXIFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B634115F57
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:13 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b6so2286598ljr.10
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FWVDuWp8BwqwRmMZ9J51BUVWuUxtUS1YpggdRQgiP8U=;
        b=lKqiHTyCaBQqonBvUzIa0MOK2PGwTxupkeVmCMlXsiL0hCMzRJcxjyDBaf3z1ha2hb
         7LIzryArcR4kW6fvegtze4M9DXV2ACZfUmyN7Pif2q9bPshRPp7tAwZJk96GDY56pjzR
         4XEX/XrgBoBStZUvKa3jAUiI7iKAJAe9jCQXUOTROvpLiNesTyqIlVltmk9i+Yqm1SSL
         kVZ0AFLYUf9SW4V0chPQgSVGTetNQIX3EoaeZF3aifyYIHJBCN/ONVA6BW568b0i/29o
         6thn+K8O5x+/SDZmbLy51y8i++OyOUyJk+P73gP5fWwr2gG9nLENKe2G9ZYPGczzIg+S
         329A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FWVDuWp8BwqwRmMZ9J51BUVWuUxtUS1YpggdRQgiP8U=;
        b=d1/oczQY3hDNgjWsmzR4vN6553jzp0o1wEsKmY7VkcqJIuPlVA7ieH6HPC1ZhKWFjN
         GpZpruPvJsqrJJbnbgx6a+8+QhK1cRMgNSC/6TLrdgrIdT1y7fDyhrDbOyR/FcWg49oL
         2wL/cLCPZ+co/OBvGv0oMPodO/OJoMRbVcdaJjn6W6qaDTAFMwxDUnWBV2RskBALYsh4
         Iu0z2+lSE8BbK0fVrqqjErdtSYgtTi4IaIM9IADjxPJuUoUtc1f0MO5Pms1QRjBHj4Ut
         Re4QLFEZF8M+nahoaNaCNH+m+5v389f6bE/OtlqZOx7fdMFk3Osf4xxUmydcWZhPEKIp
         Ea0g==
X-Gm-Message-State: ACrzQf2T+7uVw+xRpgKCszFc4PmO7ARhCiogEQKcuG4EsAP5wrMgY3I2
        kPQyKEP3PnMa3PdYzO1iY4RmlQ==
X-Google-Smtp-Source: AMsMyM6h7DHWtiAHdnbYgp6OT8Z2eDM7rQSK7Nb2kym+FE7x4xYbhKt8v1OjF9u1wbIRQ6DtCop/Sw==
X-Received: by 2002:a05:651c:1147:b0:26b:e6b4:6d34 with SMTP id h7-20020a05651c114700b0026be6b46d34mr4371508ljo.209.1664006711275;
        Sat, 24 Sep 2022 01:05:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:10 -0700 (PDT)
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
Subject: [PATCH 03/32] ARM: dts: qcom: sdx55: add gpio-ranges to TLMM pinctrl
Date:   Sat, 24 Sep 2022 10:04:30 +0200
Message-Id: <20220924080459.13084-4-krzysztof.kozlowski@linaro.org>
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

Add required gpio-ranges property to TLMM pinctrl node:

  qcom-sdx55-mtp.dtb: pinctrl@f100000: 'gpio-ranges' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index c72540223fa9..f1c0dab40992 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -559,6 +559,7 @@ tlmm: pinctrl@f100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 109>;
 		};
 
 		sram@1468f000 {
-- 
2.34.1

