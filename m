Return-Path: <linux-gpio+bounces-1281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED880E481
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 07:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DEF282D9F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 06:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CC71642E;
	Tue, 12 Dec 2023 06:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwAPwwzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43919BF;
	Mon, 11 Dec 2023 22:52:23 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d30b544b35so9962025ad.2;
        Mon, 11 Dec 2023 22:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702363943; x=1702968743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49MMQvIGuWmN6Zs24tkY7bheyel2kIquMFgVb7inNTI=;
        b=MwAPwwzk18/XpFExx87YDBWwAfhm9uEpKFqEjFnLQvN4AbQeMjO5Ge4XU+XteSJwKa
         w5hPG4CMMptDYobAKzzOnfSR+PZHNFmR0rSLu/kjvUI4SZRh9LfcLWDNNAjaNkZM2OX5
         PizVGljV3yToICzZZLmV6ikJ5zC6G8px0gZyAvM5snfcZigvTPpaxF8iOqlZIVh+OiEI
         MMMReUFPj1pBZGgb8rqBI5DTT4rFNFq9PKWZZkEvYFg3HIE/IMTnLvSnl29m7fbvfwfS
         FEepb+GXVML2GmPN3wcSkfIgCebtZSsBgV9R3/88gC1nHTAY2W7vfkTd2jHIASAlgfXy
         J+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702363943; x=1702968743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49MMQvIGuWmN6Zs24tkY7bheyel2kIquMFgVb7inNTI=;
        b=tCaIDRyc92O37iyID2D9psMmPzSyCxSCk6iWlHZCfyh9d5sadSrk9JmLdaOc3X5z4N
         3nbCLaZvml6lV/lsahyeBS/4qafPLMaGcl+10EBne9wxf8NTkazalIdCkeX6QetcbA7E
         9IxN6SuTkSwB0BurZbLP1jSnd4L5ZUJfv0k3vtrp0C3b9T2GE506D8fwnHW7o8DRfdxM
         q0oTyEJoBnaBGIbgjkKsynTaG2ghk0KUMFNa417fME0KjU2L0IfdBpJS31BuSgrX9TD7
         ZAPMVsZkTf7jcmMMFV/Yn/cXYwTNW4NXMJFKzIDWwwvo2nn18LuPeCBP8RgIAwsKIVjo
         zvnw==
X-Gm-Message-State: AOJu0YziJK/0c5pq/l/H2fV1zmq2aRURyu9X8yA3vCOIeUzVI2BtqmPI
	KxAU6KYuOPGIwZyugb/KHNU=
X-Google-Smtp-Source: AGHT+IGYRrFjXla6CjqcDaj8aTMVVG8a7UoxmQ6AhBp32HQuaMsd5k2P5Hd8cz8Yz0Slu7jOwxhTVg==
X-Received: by 2002:a17:902:db0c:b0:1d0:69d9:f391 with SMTP id m12-20020a170902db0c00b001d069d9f391mr3161808plx.40.1702363942681;
        Mon, 11 Dec 2023 22:52:22 -0800 (PST)
Received: from localhost.localdomain ([1.200.151.130])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001d0c4869725sm7855221plg.97.2023.12.11.22.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 22:52:22 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v9 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Tue, 12 Dec 2023 14:51:46 +0800
Message-Id: <20231212065147.3475413-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212065147.3475413-1-jim.t90615@gmail.com>
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

Add the SGPIO controller to the NPCM7xx devicetree

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v9:
   - no changed
Changes for v8:
   - no changed
Changes for v7:
   - no changed
---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..df91517a4842 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -372,6 +372,30 @@ &fanin12_pins &fanin13_pins
 				status = "disabled";
 			};
 
+			gpio8: gpio@101000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			gpio9: gpio@102000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
 			i2c0: i2c@80000 {
 				reg = <0x80000 0x1000>;
 				compatible = "nuvoton,npcm750-i2c";
-- 
2.25.1


