Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E5D6B291A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 16:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbjCIPuE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 10:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCIPuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 10:50:03 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB73AF28A7
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 07:50:01 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id da10so8872947edb.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678377000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hDw377R+3WveEHHISt0O+B0HNboj//Q7JnZS8WCHQk=;
        b=xFOeIBq/oenmpZgse9ypMIySBxHojJR+priTRx4ns8SVP7D39nQ6GWvynrSpoOZ5R4
         HsKcT908aKbyY+mWmwZRF55bt35KR1yKcW6++DQauTZLH6LO5XQhIsgcSLObp6gQi6hm
         a3C1Phim93FONjhxlLRQF8vnGyv5kEKRKyqqR4+hFR4Sgk3etvYPV7Q2wgf+quQeWcXe
         hxC2Ucy6M/FWI8NXM4FSsbi4SSEtTGBa+kYiuwRsDKUcCqugBKPlLx+sYmJ/K9BI1x47
         dyALpaqG6NJ6cPLoOigP4lVhPtGskb7OAMXxdEwptXITcYfMfg+ad/t27LGV1Lpt5K5d
         pncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678377000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hDw377R+3WveEHHISt0O+B0HNboj//Q7JnZS8WCHQk=;
        b=NxYIHXoLtjUmp6Pph7PGarVdqnS51Fess0i1Mx89Cz3C5ZxCWiMSVXsoniIp70Evlt
         2eHTMC92PpctE4uLg2tMCEdD68qfO1ghke5I8/UGjSXh+Pbtn9DZbmBm0w7sa2wbq/JD
         dMmR/VVjmUkFeVUTG3iCdW/I1M4oANTbcGKPwoNyp91zRN3auG6ku/k+5q5Zl0sEt2Ys
         o+APLA49+Bz7c3kAlRZEqkc/C1en+R6eEyBfEMcOQgX53LTS4zbW9QMmAsIOqJ3dshIt
         Cj6GO2rgtULEte9s0MTfSDPvgvXbhZxd0/NLX7lYdgN+mJ2BZeetwU7JFrBbI3XGeiGU
         7OtQ==
X-Gm-Message-State: AO0yUKWw37mdFn16YA6hKgwj8ZQQhqLGU7p4h8TdteOCCaiUJRh06xOw
        Erbo/DXG7B7OdQCAdHx8v2JOIg==
X-Google-Smtp-Source: AK7set+ShI583mjtu+t07MzMAYJ711BR0WtRErkuBFVx28IQ6paK6KKAKh5e4gkiWKvsgXlvtUbldw==
X-Received: by 2002:a17:906:a1c5:b0:906:3373:cfe9 with SMTP id bx5-20020a170906a1c500b009063373cfe9mr21147766ejb.10.1678377000203;
        Thu, 09 Mar 2023 07:50:00 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id h17-20020a17090634d100b008ee5356801dsm8981683ejb.187.2023.03.09.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:49:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 1/4] pinctrl: qcom: lpass-lpi: set output value before enabling output
Date:   Thu,  9 Mar 2023 16:49:46 +0100
Message-Id: <20230309154949.658380-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

As per Hardware Programming Guide, when configuring pin as output,
set the pin value before setting output-enable (OE).  Similar approach
is in main SoC TLMM pin controller.

Cc: <stable@vger.kernel.org>
Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 87920257bb73..27fc8b671954 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -221,6 +221,15 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 		}
 	}
 
+	/*
+	 * As per Hardware Programming Guide, when configuring pin as output,
+	 * set the pin value before setting output-enable (OE).
+	 */
+	if (output_enabled) {
+		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
+		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+	}
+
 	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
@@ -230,11 +239,6 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 
 	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
 
-	if (output_enabled) {
-		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
-	}
-
 	return 0;
 }
 
-- 
2.34.1

