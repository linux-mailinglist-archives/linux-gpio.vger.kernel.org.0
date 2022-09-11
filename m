Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F6E5B4E4C
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiIKLQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiIKLQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:16:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764543F1CA
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:13:28 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so10359930lfo.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GgI6sNuIiEld/+iiG14XAnJiIn6TNY0eqR/C3vJoJeY=;
        b=L7H8zUOiqJ2tFqdxdf/JxX7apiRalZmhatFV320dks5MvMQzkdX4Q9k3P5xULYmB5E
         USOzgtPSo3bpYrTGSD2m//G7AWBH193tCA4no0h5dOF8CyHG2ThVEdPtq+AI7DPp2clh
         /nCngcJt/i50nKduun+fB9DIU3ghr03Ea9HfwbEESNiJXe0v9W7dRkMzcPAP1n1kNa6G
         m77TBO3AhSfhQoGKliaAJ7svEKlQA66L+QWNAs55L5L7u2CCJ4tNelpTgaaVA/15xjxd
         3oEhcc+aX6wWlkGE/dowKGaZXVcQZl/Q0yDTaONI0oG3pt9y58r3ULsgQ+5buaImKkWl
         XRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GgI6sNuIiEld/+iiG14XAnJiIn6TNY0eqR/C3vJoJeY=;
        b=YXN60eu2ICZAwA1WnxxT+RsAg1axvihG9J8tcYZ6NCEv2rfcOiqpj4MdI9yJko6Oon
         9xIUnymJKDkuUyOEJLxrAFlmIp/SJsGFzfeusufp14YXmcxmFhif9kPgVvwV1Y8mQLav
         lyJKhhzz1AuFDjx1TtsrVpp30AmL+ThC8MdUhSND+zoNKmVMZJQEVpcspsXG8Racj/bp
         aBbjKHaoVVG0y5QKIVwINzmzS14SNiQW8kA9jiCI3jAkseqgl2Uj4YxZrJC3OaI7XTdI
         Aa5QUkgRO2hvDfOTiLs1XDBlfZkeswQLVWtAwKoAJEyWtVmSFlFtjALzcH3Vz20qIYEF
         +Vjw==
X-Gm-Message-State: ACgBeo1VSla87xmi0o6cxLWEy6+zLArxqOKlaX7D/9EL/ODha47tea/v
        FFv3O5RwYFFswxg8aYVSHDaYCA==
X-Google-Smtp-Source: AA6agR68sMPLZnvoRAYJzhIZXXYbc7px+8AGg3MkpnSNS1rRV5tbRqx8eQJ54qUdZCi5CBrMSMEnzg==
X-Received: by 2002:a05:6512:682:b0:49a:9db4:5a3f with SMTP id t2-20020a056512068200b0049a9db45a3fmr486649lfe.214.1662894769000;
        Sun, 11 Sep 2022 04:12:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 35/40] arm64: dts: qcom: sm6350: align TLMM pin configuration with DT schema
Date:   Sun, 11 Sep 2022 13:11:55 +0200
Message-Id: <20220911111200.199182-36-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT schema expects TLMM pin configuration nodes to be named with '-state'
suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d882c29d53aa..c39de7d3ace0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1314,49 +1314,49 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 157>;
 
-			qup_uart9_default: qup-uart9-default {
+			qup_uart9_default: qup-uart9-default-state {
 				pins = "gpio25", "gpio26";
 				function = "qup13_f2";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c0_default: qup-i2c0-default {
+			qup_i2c0_default: qup-i2c0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup00";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c2_default: qup-i2c2-default {
+			qup_i2c2_default: qup-i2c2-default-state {
 				pins = "gpio45", "gpio46";
 				function = "qup02";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c6_default: qup-i2c6-default {
+			qup_i2c6_default: qup-i2c6-default-state {
 				pins = "gpio13", "gpio14";
 				function = "qup10";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c7_default: qup-i2c7-default {
+			qup_i2c7_default: qup-i2c7-default-state {
 				pins = "gpio27", "gpio28";
 				function = "qup11";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c8_default: qup-i2c8-default {
+			qup_i2c8_default: qup-i2c8-default-state {
 				pins = "gpio19", "gpio20";
 				function = "qup12";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c10_default: qup-i2c10-default {
+			qup_i2c10_default: qup-i2c10-default-state {
 				pins = "gpio4", "gpio5";
 				function = "qup14";
 				drive-strength = <2>;
-- 
2.34.1

