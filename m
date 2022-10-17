Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA9A601DD0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiJQXrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiJQXrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:47:07 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE557C1D7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:47:01 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id df9so8361030qvb.9
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1yHsuZ2vVjzQeapVPiUFGnm94rrZZEPN9KYsMhL7xI=;
        b=cFoNiefj9VIxU0L2x0bX2weS9meVL7djOmLKT7dv8QpbzmpFw40raf/CtRS5HC7j3i
         IK6pK8cy0ZrFlx+AlkXlxZVCULA56EaGNpQkZONc5d0y1pXXLDhz01D2NboFB8hrnOlW
         Mf1p10mtTAoZFf8YnW47L5hIZWpPYGRFyMUSf0kfHOW2EAZliygzNwwpxVXxoIfdG7bU
         t5i9kN9AhkhtyGQyiIrdbC5nqX4ZGY7DKVKzxJBCfd+mWVbHqCh8GE0VzpugSBtw+PJ0
         nFXoh7xuuVsqXbBIdFcUfQ4stAFaT6KVV9ICMoGRqENcfSDgKtli2k1ZdsHDhC0cPMsb
         yZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1yHsuZ2vVjzQeapVPiUFGnm94rrZZEPN9KYsMhL7xI=;
        b=DGABtqqt7Y4RUbgkzUlrtIRpf3qatH68NhvO1kKGcNBqe8eY+yMvQbK8YxXZOCaIBp
         H8hR82U1oJdlBRUj8FR+5DaIW/nD3aPP6pF/wxOt8pAf+P1+NKoxjyEFTa7hivZnzf6W
         avUQWaTLPsgs5nxo2WbLgNEekglWM1/yYn/D5H3pKen50/wY28+408ZUY7p7WvbqwRL4
         PtvipZySGNeAFo+KtFREGpnZL+cIMPGLBl+S3Fsh+0hDLp4gv51qlLssb2QDoa6Tk8C8
         d57/DDUFoLBpHjtPGjScOnE7yhK72HGT1u0u6WlDGUYioaAQnTIJf50PpZZK3wWxJSq5
         R7xA==
X-Gm-Message-State: ACrzQf0MGvhj5DkHsb8rOWgs4sR+dD5ORCOhaAQ7xQlHWnC8rzdVplfO
        /hfuhoZKtVK4yxxNpNVeUZVEGw==
X-Google-Smtp-Source: AMsMyM7k2lRcaDXOIh7+6NThMu0eR1PvLnuOhGZcvoLTQXhPHFP4yCi9HK0qWgQkw6EmpbakU1RGsA==
X-Received: by 2002:a05:6214:c42:b0:4b4:189:363d with SMTP id r2-20020a0562140c4200b004b40189363dmr86838qvj.25.1666050420273;
        Mon, 17 Oct 2022 16:47:00 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id r19-20020a05622a035300b00398313f286dsm858120qtw.40.2022.10.17.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:46:59 -0700 (PDT)
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
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8998-oneplus-cheeseburger: fix backlight pin function
Date:   Mon, 17 Oct 2022 19:46:51 -0400
Message-Id: <20221017234653.55506-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017234653.55506-1-krzysztof.kozlowski@linaro.org>
References: <20221017234653.55506-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v3:
1. Add Rb tag.

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

