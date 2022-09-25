Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7315E925F
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 13:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbiIYLGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 07:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbiIYLG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 07:06:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A34A32043
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:24 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bu25so4876941lfb.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CrAQr2nGitPQM88QN5/kuBTbw78oOV1PqKWyK/7irX8=;
        b=QwqfjIz93V6ZmrnecEVD8uIrRefM8uoBM6koWgtjglItpYRPOQ9EyKdVNizNITTJxo
         mdwaCLSFCBuseKG/R4aG9B9hnLz6TNliT/zHSMzHxjESpm3qLuvbxQZ/4lUIuFqv8dLd
         TAHmhcRYubDKNWKXzsP0xSW6VIH/C7o+SY/eliS+oFVQkLNccxFVn0N6TUSs3qUClCAW
         9HgWvkaMj4lLmbkbZvthzqXGjmy+m1Nu16jpuFTqBWJEtUK4ljQC2+KVVN9rEEVtG1C6
         Btx6iaWvZ43ua7NQYjv7LhhWjThCW7EFlUYsV1fhfcF9HqXKR/D0UsYKZHEwJOdN4D6W
         Mm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CrAQr2nGitPQM88QN5/kuBTbw78oOV1PqKWyK/7irX8=;
        b=3Xl2kyHoq+sd3IuzuiZLcgZbjHK91y0L+FxSwsHRYxMjpmLItLDGfKWO5G5zXPMD+x
         et7y9WOAwoLjvMtWMi9U6QzqaDLxAGKXJwM1uxQAkrl63f7KzgIaxVCK9xeFamdcs3mK
         syDTpWhPoJjfkEKjPOtT1f6pKC0fpkO/DckdiCyXVoPjsJoO7teFySlcJM2JO8xT3lf7
         oaNUsr2ZlWw5ntpIMGrIH4lZ6AvMt3nWqau5mQ+F720VtyW9QXHBa/ejTX7I4dzDGTqE
         jeRpT8/axin/V+E4F9b8ySgItfNQIifZmyw5N47stct6YwbJJwEHHlGYtgb6nFIaFkBY
         qcNA==
X-Gm-Message-State: ACrzQf1kea5pSd0KN2lOfm5Sm2R+5ji5NrUHx5bqxXlxADOtbeXWtayZ
        6PBh1yxWzWPzU/LKB5+jXtkT5Q==
X-Google-Smtp-Source: AMsMyM7VhAyTi/l4UzuXNsqv6E++PhBemzuipntch+/YsbOMwyFuffOQSkEQrO0Cra6fhJVR8NKMHw==
X-Received: by 2002:a05:6512:25a4:b0:4a0:547a:b29b with SMTP id bf36-20020a05651225a400b004a0547ab29bmr4157598lfb.469.1664103982675;
        Sun, 25 Sep 2022 04:06:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/15] arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
Date:   Sun, 25 Sep 2022 13:06:01 +0200
Message-Id: <20220925110608.145728-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sdm845-lg-judyln.dtb: gpios@c000: 'vol-up-active-pins' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 20f275f8694d..1eb423e4be24 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -604,7 +604,7 @@ pinconf {
 };
 
 &pm8998_gpio {
-	vol_up_pin_a: vol-up-active-pins {
+	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";
 		function = "normal";
 		input-enable;
-- 
2.34.1

