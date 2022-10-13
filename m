Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712DB5FE20F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 20:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiJMSwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 14:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiJMSvn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 14:51:43 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69ED92C104
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 11:49:51 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id f27so1017684qkh.12
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 11:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2SGbqYHT7CkdaSBV8U5e0zJ3eRE5mDDsTrhswazFq4=;
        b=AZv610mXBZDZ/MHOrJ7h144VlGimj+29vBs6ewMkCQX8o1YkHBpRNRhHsy/yP5tM8C
         on7RUkA+kh9IqbTI+uaxSqEvLAoqI8okrxToVcWT/LGYSo8qte45INSkKmqFgb5K/MP3
         zOaHgfXjBhwmAnbBEUFZcehmnc020q2OSVWENTbWcTLo2DRD4BCujiDjlay+rHN8z6xP
         VzQe1dsEbPbyt9Cp1hW+1GdKSQKHyYOh+DDwK13ILeQV+muCNBsK6URj157EbtIqv2xb
         dBQyhpBTa+/oxsGgsq9HfCqKdsltd8idIngjnQt0cosMXjhKfebfmcE62totxdGP2Ryn
         g+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2SGbqYHT7CkdaSBV8U5e0zJ3eRE5mDDsTrhswazFq4=;
        b=yhu0CHLgyYKcY00KeR0icPP/yMBlZW6Qd/UNXw12bddjzZtzPoHawmm4PJhF2we57/
         /qpKb951LJKCsPxOBvxmChqBoirf9vPwH7qCj40rhjGXHofjW0SM4YFbBZWNNRR60F/3
         NBJvJmqt8q4wW1GNvO49sT6CiT/zojsa2S34BXhV/DiCszI7toYjFDqmB1mjAkqDFPSW
         CqPXdVOmP73bQHmKQX4wjcKRlVURBPy9gjgSE6+PS1ooYppbIbOQ/JpBUD5E+yRgXBDO
         HFOXkgdGJ5H14pXful60TDARMdwyYPJZULOjqJbkBdt3/ihqRBGbLuJpZsryEbPz//a9
         w9Mg==
X-Gm-Message-State: ACrzQf1ZmtpSsA9D+AL+chXBorhDIXeCcKXrJNBFMFplk5jh6/w+9Ctp
        3uItNojn+eJhq8tzgPVw+ID4AQ==
X-Google-Smtp-Source: AMsMyM7/2b+G5jEnO5nVlVP7slW4uGeZAxa9BQrGjiAA8NltfQ5dtjXa+6JSa9Lz4G4z33ssXKboVw==
X-Received: by 2002:a05:620a:44c6:b0:6ee:7a7a:93d1 with SMTP id y6-20020a05620a44c600b006ee7a7a93d1mr1068341qkp.256.1665686944114;
        Thu, 13 Oct 2022 11:49:04 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a430600b006e16dcf99c8sm400748qko.71.2022.10.13.11.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 11:49:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary I2S pins
Date:   Thu, 13 Oct 2022 14:46:58 -0400
Message-Id: <20221013184700.87260-1-krzysztof.kozlowski@linaro.org>
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

The Trogdor Homestar DTSI adds additional GPIO52 pin to secondary I2S pins
("sec_mi2s_active") and configures it to "mi2s_1" function.

The Trogdor DTSI (which is included by Homestar) configures drive
strength and bias for all "sec_mi2s_active" pins, thus the intention was
to apply this configuration also to GPIO52 on Homestar.

Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch

Not tested on hardware.

Cc: Doug Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 1bd6c7dcd9e9..bfab67f4a7c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -194,6 +194,12 @@ pinmux {
 		pins = "gpio49", "gpio50", "gpio51", "gpio52";
 		function = "mi2s_1";
 	};
+
+	pinconf {
+		pins = "gpio49", "gpio50", "gpio51", "gpio52";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &ts_reset_l {
-- 
2.34.1

