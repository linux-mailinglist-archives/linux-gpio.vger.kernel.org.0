Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A574824EA
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Dec 2021 17:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhLaQWR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Dec 2021 11:22:17 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55088
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229811AbhLaQWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Dec 2021 11:22:14 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C09F23FFDE
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967733;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KJLJlHo0AJqCD4UZgLL97AyGGMSnzkFEI/XD88ePNQ1WVkWNzq1hsQo48yJbz+KHe
         ePI+Kg8SlfoRg9gaQArAPKUNWPX0VgoaUEAoI8VBd+Hjw3FXunCvIpgr6370dmSkBF
         vLldAezy7zBzzlgyHC7+0vqXO7kO4K4K3JNJ9JGeheCYC/DCTvwv1hTmvweKUuRooc
         kF7P7gl2/WP/4xRfaY2v8Ih/icF2CnjYFNICT7DZleeIO6/igCewQhFn6lk8Htu4O/
         rVdNSJGD/2ouVdd+BVGwQAMItBeFgRekgSA+t8tl5c7PNPUTcvuF+Vyvbb0L+AjTdL
         JQTnSU4RYr/bw==
Received: by mail-lj1-f198.google.com with SMTP id u8-20020a05651c130800b0022d6dad0418so9486842lja.11
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 08:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        b=D7NzY96B2BBrij5eSjmun/6JKumsaH2xlJA2O9pmN5BGAjxlzifPcrgewVjOIouGhk
         bP/iRR1xr4QO1KtL56f6c9VZ96osbC5Oiq8aMo97JcERrQoNCmDH7ZzceZyJ4K/+5FP4
         IO2UwyTDyQV2UwTfgkcPbIkFCe8JWZwx3T2tqp2zpl+mHqGR7AQOhSg7QMvYV+Yfx6EZ
         RQJhcXqDnVVu14fq5fTYJ774GcEucSvlYioyKUd7V6FSx1b00++EWiwP4Ar4ilI21J2M
         m4ySDvv1Vv2z4ZkElvbLySV0Ppagd3EYPgfAQPqDNG4KJR2AlHjxGxduC/C/e2LTO0Pz
         6OCQ==
X-Gm-Message-State: AOAM533palu3wT9TujdD8Bv9AqOrvS9i6brln4dPPlcDZFFYTb9HrQQw
        ZixDFIrisT1BeAbmvjZEMGR9B/KD11wfwIfVSqP5C3Z8PeWVQnwVYB3nTTzH2usK9c5VGJn/Xa5
        FEkTFfO0BHLS5Mrgg8pjvuyGLdD0mjPNyuvthsuQ=
X-Received: by 2002:ac2:4189:: with SMTP id z9mr3080466lfh.639.1640967733214;
        Fri, 31 Dec 2021 08:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj2gThzWoyI9QubMge0h0BQecBvCdmbDjWIZBlaRnaejJXNiEiNSgi9MQggMIsd1wLrH6Now==
X-Received: by 2002:ac2:4189:: with SMTP id z9mr3080444lfh.639.1640967733004;
        Fri, 31 Dec 2021 08:22:13 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y36sm2796514lfa.75.2021.12.31.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:22:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 09/24] ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
Date:   Fri, 31 Dec 2021 17:21:52 +0100
Message-Id: <20211231162207.257478-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the nodes of S3C64xx pin controller with wake-up interrupts by
removing the artificial pinctrl-interrupt-map mapping node and use
interrupts-extended.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s3c64xx.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index cb11a87dbc42..67a7a66e11d5 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -178,20 +178,12 @@ pinctrl0: pinctrl@7f008000 {
 			interrupt-parent = <&vic1>;
 			interrupts = <21>;
 
-			pctrl_int_map: pinctrl-interrupt-map {
-				interrupt-map = <0 &vic0 0>,
-						<1 &vic0 1>,
-						<2 &vic1 0>,
-						<3 &vic1 1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				#interrupt-cells = <1>;
-			};
-
 			wakeup-interrupt-controller {
 				compatible = "samsung,s3c64xx-wakeup-eint";
-				interrupts = <0>, <1>, <2>, <3>;
-				interrupt-parent = <&pctrl_int_map>;
+				interrupts-extended = <&vic0 0>,
+						      <&vic0 1>,
+						      <&vic1 0>,
+						      <&vic1 1>;
 			};
 		};
 	};
-- 
2.32.0

