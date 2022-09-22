Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B26E5E6C6C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 21:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbiIVT5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 15:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbiIVT5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 15:57:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB3F10D649
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z25so16486343lfr.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=b/USyE2rZeGybRiRERaxxJ71NRPvCslQr07H+7bxxRI=;
        b=KFywZhJVgPcV5Yte6p0VwcDQXo65tmv1k9UjUi6vZPSzS+XYKutopzrkx3hrw+omnw
         5PdSQ8KduABZ8NyX6B4CbFOWKdZE464GOWmcI1NJV9IEhGypwJjhpBIA29zLEKKwM1Wk
         LuT5cWzaskiPKye3cHlSM6QdGjSsp63qqbf55XmxPe8kRRZ5uYa4KHPzOrayQK8CxB+T
         q01SpQoRik847dgdK5BiKDYvvidXk6OVBvp200Nv797vZPnTSmp4ZGrkgXfE3p+8SCb2
         mNvjxqqTUG4eAtCQfKaq7tESIAfaLORR7168ADpPm2Tlm6SAZyzvIPV9HFjTrLabHRJe
         qe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b/USyE2rZeGybRiRERaxxJ71NRPvCslQr07H+7bxxRI=;
        b=MK4L7F/QEEMBb9O4ylLktswgB1LYvFh2rUDifWqm9dzxBe9so7wYOA/A2LwtJI1C1z
         S1KjDjpd2rO2YXk68xc6zNE1dxLlquiRVNaKbeKe7IeUFMYh9X8qGWTI9KRvYn+rpgLD
         YNmPmi02dp3fGioLifQSwLMJMq+ZSMvII69T4kJ4zSZ4Na3PVjX5aZ748RO0BHDgPD5D
         //fVbSlpT3OMUWrQL3v1UXl+35D0F9JZpdUzlI1IYbyMn7gjFIFowJ9C32cxxzPsGf23
         483eu7128RmhHgmBdayPm7vauT8S8AejK0r1TrJs6qs8MOXvDKY1a35QnFOPOyXL/hBw
         /iyw==
X-Gm-Message-State: ACrzQf1ebsrqkSQy8Nz/I7/0zs2G6k9sU79zFvROujuuDfOQt2dVPMPc
        DAOuEEM3cbEe11YGq1C5VFhoRw==
X-Google-Smtp-Source: AMsMyM7qkvIhBMWXvHBVnRpwmk1gO51YhvvcPKetygQntWVB2FemKftpJxcvgaXuaXvqZb9eH+zi6A==
X-Received: by 2002:a05:6512:308e:b0:49b:9015:e76e with SMTP id z14-20020a056512308e00b0049b9015e76emr2007191lfd.393.1663876630882;
        Thu, 22 Sep 2022 12:57:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:57:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/12] arm64: dts: qcom: sm8250: correct LPASS pin pull down
Date:   Thu, 22 Sep 2022 21:56:50 +0200
Message-Id: <20220922195651.345369-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

The pull-down property is actually bias-pull-down.

Fixes: 3160c1b894d9 ("arm64: dts: qcom: sm8250: add lpass lpi pin controller node")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a5b62cadb129..8f402b912c62 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2454,7 +2454,7 @@ data {
 					pins = "gpio7";
 					function = "dmic1_data";
 					drive-strength = <2>;
-					pull-down;
+					bias-pull-down;
 					input-enable;
 				};
 			};
-- 
2.34.1

