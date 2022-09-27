Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06CE5EC7DF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 17:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbiI0Pet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 11:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbiI0Per (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 11:34:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563F3C39
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:34:41 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 10so16314959lfy.5
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZL3t03EQvl9mHvGpFybHkv480XEe974dhXgVTeybEX4=;
        b=dbnNysgG0XYWDDfkYPwEEF2Kq1F0PifZCOgGFORNmq+QkNXSr+rU3zjtNJ7hkzldNt
         y3UUELTICwaQQ+R1tV6OQQxdBfA8eLM/YCaSAOMbVaSFr3XefNrZ3VGgBw1/uDXamI4k
         CjWLwQEcuajJjKeuIibqs61YvJsHKxVAZPuGrfupfPOsF2HeSg+U7WjX6HcpajOh8lrC
         Mzt0wMCsOlHzttWGd0A875a/xg81pzRfdCkouMEp2imBhn7rFoGYdB5mo6zkqRCfCDQu
         cImV2eqYyWyT1EIDtnlsGNIoVHQpRtLRrFmUNScmtjfDQ6fMkVMDooEO8iOEVCKpAywA
         KQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZL3t03EQvl9mHvGpFybHkv480XEe974dhXgVTeybEX4=;
        b=nZiXAyTyCxVu1IevG37M/rlPf5Jmqr5mPn7uj/bs9/mgp8gMYaMzCrhPlXCZROoScW
         a+IlO2067ccmu9wXxdquR8HF2CVX9objNpUOX4L8DuirZWDTRld965zSYroPNC2C37K9
         MJ38v2KYitRhSxEL4qU5cJdzw3yiBTCPNwO7eSk8ZOGxiCk0iU1QkBl5IO9fn+XemzGc
         dc3vPkJaty17W8OcHbQSsqr1/wU4Olqe+v8pL6Nu7dMee5+LHfAiSs92thVaSPZ9c7DG
         5xTC7WW2zZpUqQRwYIaDELyw1NAJLCSlzMy0leQ4R3d8bHB2Um9WYN474+U+V1zJUUZN
         4CuA==
X-Gm-Message-State: ACrzQf0G3JW8R+n+1hmHo22nGdC27V1aMi7Zv4t/PuUJOXJD7HPykcOU
        wAL6h71G5YDOb9EVDI11S6Nh8Q==
X-Google-Smtp-Source: AMsMyM6M8TEnRKBH7blo7l6uhJp6U50XP548dWbIGw2tS11iWONM0nWkCh9xDcAaQVPxVZTkGZczLA==
X-Received: by 2002:a19:5016:0:b0:49a:deeb:8681 with SMTP id e22-20020a195016000000b0049adeeb8681mr10796490lfb.331.1664292878101;
        Tue, 27 Sep 2022 08:34:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:34:35 -0700 (PDT)
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
Subject: [PATCH v2 01/12] arm64: dts: qcom: sc7280: drop clock-cells from LPASS TLMM
Date:   Tue, 27 Sep 2022 17:34:18 +0200
Message-Id: <20220927153429.55365-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin-controller is not a clock provider:

  qcom/sc7280-herobrine-herobrine-r1.dtb: pinctrl@33c0000: '#clock-cells' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8d807b7bf66a..8823b75a6f1b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2432,8 +2432,6 @@ lpass_tlmm: pinctrl@33c0000 {
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 15>;
 
-			#clock-cells = <1>;
-
 			lpass_dmic01_clk: dmic01-clk {
 				pins = "gpio6";
 				function = "dmic1_clk";
-- 
2.34.1

