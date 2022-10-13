Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0A95FE3E3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 23:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiJMVMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 17:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiJMVL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 17:11:59 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E8918D833
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 14:11:57 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id de14so2105064qvb.5
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZlJX7kjpd4TWS3Y6SDZoAELXMv4D4dB6O2ZH1hQHrU=;
        b=WI5i8uXZHiI4zKVuIg1nsoYwt2xrtZOksefsPrBVoHdh+kky/oVIqyFzhATEARy+/n
         rkukpY6Op8HPVKG41jr5PUSao0eTjIfAzf7BNX87lBDDC4dbPOL82HCdljOYlCtwThm4
         4eYeAKypO22VhLIwXAzTqCp/dDVUHxbrENgKAItKFrPM6uUff8IM9tz8WBQYl3U0jCgt
         V+GOoElvoda2RHxP8NK3d9vQ/VW40v9uMahsrpy+2cU3Os+7RL/ZtUdBnJlxjuak2EJZ
         OlgzCBl8ZTiy2Sd+afIc8cbBJ34cD+ix5OBLR4s7g96fr5A8e+zgSxLpEZb0QFfZR83h
         9ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZlJX7kjpd4TWS3Y6SDZoAELXMv4D4dB6O2ZH1hQHrU=;
        b=ztQmWECMJNtRORAKTwrY/+hB6hQSftKbWSWTOvEWamNC2myaYe51KBOwuvLefk6j/M
         LAkqBjoNvta5IaeletB7qWLEoB+8BpCxHFiJTbXB7H8vBcpNhjIWJLAQYFUHhcftDWOQ
         B1DKIQj+/uwIHejTrRwblUfYHq4EskTK/yW5ZSmsJ2sRK6vkI8NWdmVMVIRmnsFFmpSZ
         jJpBQ++iOXlYBVmoZcjOxPRZladkNPe7TUW77TQbQ28FjhkHyziBdzfxF6alOwvNiG0i
         4FkLfG9hKpJ13TScMYcs4hmgm7qppvWVbtG78Q8RzyzoNR9H1ROUXSLm6l6y7uj+tlWG
         rqUA==
X-Gm-Message-State: ACrzQf2D7RZNW0Uxj9UKxxOyKVe5ajibPHFaGJ6jXe+kOS9RXHj1kWvX
        4Fs2Z89jiam0HkKQ8OnutGtOiQ==
X-Google-Smtp-Source: AMsMyM74ltuubSwlJDfUyjG6OIArphxTEasviLOc9fAcAZOjdQJSzq/frcuPXWgUumiySmfcfSWVlA==
X-Received: by 2002:a0c:a98e:0:b0:4ac:929d:216f with SMTP id a14-20020a0ca98e000000b004ac929d216fmr1800925qvb.16.1665695516668;
        Thu, 13 Oct 2022 14:11:56 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b006cec8001bf4sm616969qki.26.2022.10.13.14.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:11:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: msm8996-sony-xperia-tone: drop incorrect wlan pin input
Date:   Thu, 13 Oct 2022 17:09:51 -0400
Message-Id: <20221013210953.97806-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Pin configuration has no "input-high" property, so drop it from node
described as Wifi host wake up pin.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index ca7c8d2e1d3d..93568fb4bc86 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -912,7 +912,6 @@ wl_host_wake: wl-host-wake {
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
-		input-high;
 	};
 
 	wl_reg_on: wl-reg-on {
-- 
2.34.1

