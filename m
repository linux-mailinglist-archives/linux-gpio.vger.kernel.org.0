Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF22C6B9E7D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 19:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjCNSbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 14:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbjCNSbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 14:31:14 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B2A5DED5
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:31:02 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so5414780wmb.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRTaCzYY0Zr8GLr8g1wP4DjAykkl6qzoi7oFjU1DC6s=;
        b=1iKche64yoAEpkrTLDdKrwTBnwtIxUC0j0z807wsjhXbvqKMTxM7rKFWzGV4Cbj+pf
         51feleAWKkPhlbjut4BGYmYgUlO6jJNWQip89ibxb+cWeDRNYdBZ3accu9xIayzI1W8f
         rnfCw9keND+OKGi61kjHX8T/DrIBn+kI7BdJ1+avPKR1Jg9zqxZtwsZ1/d5qBgyaKS5G
         eqAAKxeC1K+7a+FQNwmYF0RFF7qoX0n3X+6xqjbQ0p+F6Qp0sgVkgfsG2fLNBPfYo+3P
         JnZsM9jZaqwR16Tp2HKaebto8KGleqCdMFP+LmX3zSG9LFXmfjlpxoUVUhV7GoXAuLFM
         K/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRTaCzYY0Zr8GLr8g1wP4DjAykkl6qzoi7oFjU1DC6s=;
        b=ZAg4G++4JOtFe6UDKb2DUe/9rnlwFTEyRa5ilINar70HBFgh2bTEacpgmuRaKNfDcZ
         bblqAe4HqxTl6vRKjkgu2n/AB4u8r5kHfFLV0SVKsdBRTk92F+BHVm5k7RH0Jw8pxFfx
         NhdGqvPe+Zk5XySpa4pv6sqWKXbrqQyAfGG3TQwHt1g6dSV8H3HSOUtdYdvCtspwrFjR
         2qhoNxenoNp6Hq9ZzNu7i4CKZbnINudCPDxYuwklABu5Rja982aSdegpvnJjumPTn4TO
         uasUhkMoorXykuWzBTA997c95xOebqZ9mrO84/RpJHuliYaGHYNkIfTarxSIq6s/EZSE
         KUSA==
X-Gm-Message-State: AO0yUKVjqMJjJsrUrWcdIYX5GGLenDh5dZQb4SlWNd1nDMPzSX0gEgNr
        vOYfbLjPcAOewQOT4927csId4Q==
X-Google-Smtp-Source: AK7set9ygbLi5lAPLa6SoEIuFPB4rp3XGRf6Kxb+eyfpg+qEEhTFofTFE4OkREyQDiuRnXuspsWdeg==
X-Received: by 2002:a05:600c:4f96:b0:3ed:2702:feea with SMTP id n22-20020a05600c4f9600b003ed2702feeamr5922506wmq.41.1678818661327;
        Tue, 14 Mar 2023 11:31:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:31:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 08/14] arm64: dts: qcom: sa8775p: pmic: add the power key
Date:   Tue, 14 Mar 2023 19:30:37 +0100
Message-Id: <20230314183043.619997-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the power key node under the PON node for PMIC #0 on sa8775p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index 5d73212fbd16..874460d087db 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -18,6 +18,13 @@ pmk8775_0_pon: pon@1200 {
 			reg = <0x1200>, <0x800>;
 			mode-recovery = <0x1>;
 			mode-bootloader = <0x2>;
+
+			pmk8775_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.37.2

