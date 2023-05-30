Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCC4716228
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 15:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbjE3NhG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 09:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjE3NhF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 09:37:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5827ABE;
        Tue, 30 May 2023 06:37:04 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4d80bac38so4852387e87.2;
        Tue, 30 May 2023 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685453822; x=1688045822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Mq4zTWNZxgXmn77g79M7jiTcegyvnCqH1d/BABQRw=;
        b=Tn4Gr4wRFBnmRXvGahCMu9rNobPmMYN8iSyEl20zLtrgzWSJL4bp+oACyFTPtiDbTq
         EsiK6eeKBz8T+2bki3VzbNfn9Pc70z4iLK+4LvqSW/Q7y8Vs5I6EQ/Mj8ZlNVGulExoG
         OsHJajngXiEn3d2wvy2+Km+MzUxGEFre6/6U6LywE5RiM3dGaRUKa1AqZ2GP0AOZOnft
         EezTnovfp8nhgLYmrj82PGukGCbSpS4pju9I5EjY4cxa5IEehNzb6R88MGKyMpZVKwoC
         ambgheXDptarg+92YQtTZC5xmZlMqC892eU622fce1VsY5d6Ke9xnO5TSBfV1RxAIYow
         WnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685453822; x=1688045822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9Mq4zTWNZxgXmn77g79M7jiTcegyvnCqH1d/BABQRw=;
        b=MdYpBOeGRbAgLuyuXBz6oQwfDaVRr8upaGNBT0ELeC4T4UJHRPnF1IV3u6T7pGKChs
         0tCKsRv76W6dt18bvsJUbDpv148W3Evk8nXF27u3zYo8VPnxqC4CSFR19ctjDvu/9auf
         c6C7YeMyWehq6Y2zN9DkvMkSmAnGF133OVV7b9P2Mb5EpNv6drFqJ7Vg2tzk7UFA68OD
         MDzCnGm2ScM9wN0UdtjLWAe6bZvkwKGiMx9DkpuRDHTt7l4M6OKH03OyoSDgbsvtxddS
         ydnp+wVpQeMfG7+dzsPPLmjLA/S/MVZQdy0+WX0kx/zE+E5wB988mFRYfh5YmUprEyND
         UL3w==
X-Gm-Message-State: AC+VfDzoxtX7dvONC0eS8R3p5C1EzFXiu+RdcnpbZux7wY7Ejws5k4S9
        kF/J7FS94fnibKaLrk7LiMk=
X-Google-Smtp-Source: ACHHUZ5t2Nn7S/8nL4xxINGuqPWyAQcwVNuhnBx7I23hCptUvObR4Lwvybnt1G0QIKjeLWfJOB8CFg==
X-Received: by 2002:ac2:532f:0:b0:4f3:9001:848d with SMTP id f15-20020ac2532f000000b004f39001848dmr692804lfh.9.1685453822244;
        Tue, 30 May 2023 06:37:02 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l19-20020aa7cad3000000b00510b5051f95sm4427140edt.90.2023.05.30.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:37:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: tegra: Add Tegra234 pin controllers
Date:   Tue, 30 May 2023 15:36:54 +0200
Message-Id: <20230530133654.1296480-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530133654.1296480-1-thierry.reding@gmail.com>
References: <20230530133654.1296480-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Prathamesh Shete <pshete@nvidia.com>

Add the device tree nodes for the MAIN and AON pin controllers found on
the Tegra234 family of SoCs.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- use correct value for #address-cells and #size-cells
- correct gpio-ranges property name

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 133b2d32d19b..9dba05be03d2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -109,6 +109,7 @@ gpio: gpio@2200000 {
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux 0 0 164>;
 		};
 
 		ethernet@2310000 {
@@ -147,6 +148,11 @@ codec@242c000 {
 			status = "disabled";
 		};
 
+		pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra234-pinmux";
+			reg = <0x0 0x2430000 0x0 0x19100>;
+		};
+
 		gpcdma: dma-controller@2600000 {
 			compatible = "nvidia,tegra234-gpcdma",
 				     "nvidia,tegra186-gpcdma";
@@ -1805,6 +1811,12 @@ gpio_aon: gpio@c2f0000 {
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux_aon 0 0 32>;
+		};
+
+		pinmux_aon: pinmux@c300000 {
+			compatible = "nvidia,tegra234-pinmux-aon";
+			reg = <0x0 0xc300000 0x0 0x4000>;
 		};
 
 		pwm4: pwm@c340000 {
-- 
2.40.1

