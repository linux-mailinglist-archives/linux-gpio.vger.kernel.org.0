Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8A76C1AA5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 16:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbjCTP7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 11:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbjCTP54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 11:57:56 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AAD4C39
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:20 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v25so7357313wra.12
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRiWX/hg2WHOlY5Q4SxUV8r3xOlR6eC5PLcwIju2Pjs=;
        b=U8Mt6W8drFShZryD8lCf6PZgzBtdwxFTZVnm2NC4vD7xXp4fBbWHn6a8R38Ahmh2rL
         oMMW3/JsyUJfHI0YlJx0A4KIxzksKV2EY9Srp7gdkZuTlhuXOtG1ARrUmy/GavRScCYi
         7fAVLjMWScnmxLSFcZuiMliQc1RQLCExD0k7cgZr7B2IIljsr+IhyS9ua2zL7jYUEI+q
         QhOCQd9/KEM5PTSnLzD13vqwu7jy1T+a9sJILDMCGnQEFwNbO8u3rH3aNqPxLBejHtGh
         F3v/506njXf9+Oo+bAyIQUmcMXRp3xmcYLwEH/80ij/9L35yn08EmP6oPCZFaoysomNI
         LKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRiWX/hg2WHOlY5Q4SxUV8r3xOlR6eC5PLcwIju2Pjs=;
        b=TYp/bFBvKf1FsIyp0ht+3ved7fjEfzjBYspqs0mKvXU2xDbM5lhsiCxka/waovkFMW
         5tzJ+t8eOysaUnZ2p0jV620cfujUsw5zeueZN10DPHE8kInWYUXSYqBc5eVNqtUsV+xB
         IgMvxCNTmQOfOnMjP5OJqfF0QxnU4+Jq0X4CDjOVAPOwUnGOO94ZiecB7JeECF6yeuFY
         QRTZSDEMReKW1jjr5hcMy4zGqMafc+2vDPs6UQSej5V+rjwKzuZAvn4WKMrGeisUA3fJ
         GFSPgndgUCcuHsYhb3AHN/gsaHYLCYITLTcoY+1C+0qkxcukJOTOm8ns55gBU0O7gdfV
         hJgA==
X-Gm-Message-State: AO0yUKXW6n1G4Edq5tnOH1m85HxsWKHUUQNVXx/D2Tq9BnIurRd2WNCQ
        d39+Em5H9/kflA1lwEx+giDyAQ==
X-Google-Smtp-Source: AK7set+DTVHoL1ftwnf+wJIKCKTr8DEkGX9fZuqkLtT5NCQUtEC/w4N4Aqs+i2lluCmv0p0hLXCLzw==
X-Received: by 2002:a5d:5686:0:b0:2c5:4af3:3d26 with SMTP id f6-20020a5d5686000000b002c54af33d26mr14387094wrv.9.1679327341666;
        Mon, 20 Mar 2023 08:49:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:49:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 11/15] arm64: dts: qcom: sa8775p: pmic: add support for the pmm8654 RESIN input
Date:   Mon, 20 Mar 2023 16:48:37 +0100
Message-Id: <20230320154841.327908-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the RESIN input for sa8775p platforms' PMIC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index f421d4d64c8e..8616ead3daf5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -26,6 +26,13 @@ pmm8654au_0_pon_pwrkey: pwrkey {
 				linux,code = <KEY_POWER>;
 				debounce = <15625>;
 			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.37.2

