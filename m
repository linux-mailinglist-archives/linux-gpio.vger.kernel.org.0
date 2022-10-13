Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6820D5FE3CA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 23:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJMVKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 17:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiJMVJ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 17:09:59 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D58A45F57
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 14:09:53 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id s3so2545674qtn.12
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t57ikZlf062A8UotjpQHzVGOSC5K6YQZNDwftfOX4Ns=;
        b=V2N4vT4k/4T84t+ssvdRNohKV/yac+qYpleEUNwuUUZmk3/bvgKFQm+RowdDO0/V+P
         TONFau9hLTX9v41YGo/19yVLDd7RC6S+mhr/bRI3hEpfdvj+AWq9dDO6/ImXHCFQs3c/
         PWUSXiXRypKqkNYjkuAKRDxeOANQEyOW4zSFCD97o9K2L5K2jVynlzNIDjUHC9NFoFZr
         eBtL13FKCl3/gb3bx0Aw1vXbOQQx1EEGpFJSAyNggyH2YdQ28HkTLrL8N8E/OCCzNM3q
         xZLsWP+/65YSQYnyhF8eWRaWvFklbP/UmwGXMJ8Jkxjo6rm2qok/vEYxtYH+8NX9RhT9
         l5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t57ikZlf062A8UotjpQHzVGOSC5K6YQZNDwftfOX4Ns=;
        b=HeJ4DCQYqPuNOEzR4XarG5lH6T87Hen2vg5B7uo0Rbjfiv/3pHF0DYE3svKiaa6TmI
         gtZDDTbLTdF6ZCa+SZMAaeYvt6spA0I1dDPLmyi/jeOjV7s0oZ1ro91h2zhCW9NuZYU7
         myPyUbKWnK5HrII/Zzqn3CEvW24WetYcfcWi5wgXWrvNlnO1u6KwWKo21L2+dvQ6Ou82
         QYggMSJhDT03IimP+ePdVwkW2741Q3qUV08e1Vl2LoEdoN3b8dPsJNnYdsWIcFNByRgV
         g64wWILxi+zHr07qwwVyd3rta4oq/skhb2TC9tXQzcTO0qk5pbzIC0By5q4I4fpjtlv5
         9y8w==
X-Gm-Message-State: ACrzQf1PjEqNa59xZ28kcmULQUaxlQML+60HNfyHzk1JS3/j9+0pZBIl
        FgD8mi61d0hQVPhPYXAunCAGbQ==
X-Google-Smtp-Source: AMsMyM4msHvjZYcUlK2gQSnvOaKWCvuvF0VJt/rvy1VqturLiRUdYcGpB8NV4NRc69K18+9a5d1vNg==
X-Received: by 2002:ac8:5715:0:b0:35b:b01e:e4c0 with SMTP id 21-20020ac85715000000b0035bb01ee4c0mr1671318qtw.556.1665695392707;
        Thu, 13 Oct 2022 14:09:52 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s1-20020a05620a29c100b006eeb3165554sm753071qkp.19.2022.10.13.14.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:09:48 -0700 (PDT)
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
Subject: [PATCH v3 2/4] arm64: dts: qcom: msm8998-oneplus-cheeseburger: fix backlight pin function
Date:   Thu, 13 Oct 2022 17:06:10 -0400
Message-Id: <20221013210612.95994-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013210612.95994-1-krzysztof.kozlowski@linaro.org>
References: <20221013210612.95994-1-krzysztof.kozlowski@linaro.org>
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

There is no "normal" function, so use "gpio" for backlight button pin
configuration.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. None
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
index ef2a88a64d32..122f6c25220e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
@@ -35,7 +35,7 @@ &pmi8998_gpio {
 	button_backlight_default: button-backlight-state {
 		pinconf {
 			pins = "gpio5";
-			function = "normal";
+			function = "gpio";
 			bias-pull-down;
 			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
 		};
-- 
2.34.1

