Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67618607AA3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 17:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbiJUP3D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 11:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiJUP2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 11:28:45 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C43427A32E
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 08:27:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f11so4987776wrm.6
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ML5NXIKWu+6+po3M0Jn1i9pygIWyWhf0++IKdAxC2NE=;
        b=I0hMGNsmxG3ZiTQFLKO+2L81c/krssX9iSFnJDm/lWrin6K7SKCLr+cMo6ZQ4XTO6D
         xGW2Yk8Fz5gDCUhM0NnXTAs0uU26kB/Ck/X8oFz5Cdazy71pZzUqEPGMWeg85Tslh/Vl
         1h0hRXe6ivkMlU96bSvrLru4yKI663zoy5/aUbCMU5LcdhEjHdXrNcnQbKpMg+f7ziWO
         OcD4Vdvd3aB4UfwHVhvST79mYA1tJRazORKULu74lH52+SysnmRrusAA+ffBfSYPiNL8
         k+U4X+yVsTq4FZ3HH+2VSVujqY3ZCgqigjo31dnvQTdavNL03P4AAI3Odrpykev+b4dG
         tJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML5NXIKWu+6+po3M0Jn1i9pygIWyWhf0++IKdAxC2NE=;
        b=E0U21lQdc+rbX9LDG7mayJE5DQuY5dpi4On7zVvHgKRogluPbD++mwcOg89seIPjGx
         /C7y0woCZXkoBI9i9QgZSqSGvpgQfs3s3Lbso7/w7MZh6YdQ9hh31sHsI8LBW0opFeur
         79zGX32syS+cSHxiF8Hs2rFguTWJ4Rhp5XlGSAXPGVe8QQN8iMhu7mz/xf/+zERQn5jw
         wWpzCyEspzEh9Cszy9M9rUJQd/faJnu2Rw2aBVZ3v7bhTLQOi7lhGB4aNNhxRFwgTNoT
         Yq9wvL/QDf9RPZQagN2fuDSOsps4QFQyBPWpf+qBms2oa5HwZdoL34AjQa90dVJgaxtG
         XDUA==
X-Gm-Message-State: ACrzQf2QQ/8RdoaqtaRcKy3FecW7SxVIjX1PLrRAWs3lDTY51yMOwCmF
        rVMv/i9X5y7zigyaIEnvcDuHwQ==
X-Google-Smtp-Source: AMsMyM5EMBudiVg0Hb43tE/Jjk/NTGhyMcCwq5aJfShETR3Gkz4RJxIArZknMIbRvLg9RqDvKO4pgA==
X-Received: by 2002:adf:e88a:0:b0:234:ffee:978a with SMTP id d10-20020adfe88a000000b00234ffee978amr7574548wrm.247.1666366077409;
        Fri, 21 Oct 2022 08:27:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c1c0800b003c6b7f5567csm10706169wms.0.2022.10.21.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 08:27:57 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 17:27:54 +0200
Subject: [PATCH v3 2/5] arm: dts: qcom: mdm9615: wp8548-mangoh-green: fix sx150xq
 node names and probe-reset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mdm9615-pinctrl-yaml-v3-2-e5e045644971@linaro.org>
References: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the sx150xq node names to pinctrl and use the right probe-reset property.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
index 30a110984597..a8304769b509 100644
--- a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
+++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
@@ -116,7 +116,7 @@ i2c@4 {
 			#size-cells = <0>;
 			reg = <4>;
 
-			gpioext0: gpio@3e {
+			gpioext0: pinctrl@3e {
 				/* GPIO Expander 0 Mapping :
 				 * - 0: ARDUINO_RESET_Level shift
 				 * - 1: BattChrgr_PG_N
@@ -142,7 +142,7 @@ gpioext0: gpio@3e {
 				interrupt-parent = <&gpioext1>;
 				interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
 
-				probe-reset;
+				semtech,probe-reset;
 
 				gpio-controller;
 				interrupt-controller;
@@ -154,7 +154,7 @@ i2c@5 {
 			#size-cells = <0>;
 			reg = <5>;
 
-			gpioext1: gpio@3f {
+			gpioext1: pinctrl@3f {
 				/* GPIO Expander 1 Mapping :
 				 * - 0: GPIOEXP_INT1
 				 * - 1: Battery detect
@@ -183,7 +183,7 @@ gpioext1: gpio@3f {
 				interrupt-parent = <&msmgpio>;
 				interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
 
-				probe-reset;
+				semtech,probe-reset;
 
 				gpio-controller;
 				interrupt-controller;
@@ -195,7 +195,7 @@ i2c@6 {
 			#size-cells = <0>;
 			reg = <6>;
 
-			gpioext2: gpio@70 {
+			gpioext2: pinctrl@70 {
 				/* GPIO Expander 2 Mapping :
 				 * - 0: USB_HUB_INTn
 				 * - 1: HUB_CONNECT
@@ -221,7 +221,7 @@ gpioext2: gpio@70 {
 				interrupt-parent = <&gpioext1>;
 				interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
 
-				probe-reset;
+				semtech,probe-reset;
 
 				gpio-controller;
 				interrupt-controller;

-- 
b4 0.10.1
