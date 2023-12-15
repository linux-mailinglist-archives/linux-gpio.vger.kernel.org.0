Return-Path: <linux-gpio+bounces-1550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E9B814AB6
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 15:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B15FEB20C14
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCBB3A8DB;
	Fri, 15 Dec 2023 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YaU60cO9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCF3717B
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 51B963F373
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651157;
	bh=zIhpWVKJJnmCyP1zy08oHrKsokOM6OlCzyTjReVqd1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YaU60cO98uLmQ66bhD7RR9Jc1pvU8QBqcudlm8twsM7J4uWRrEpCBSD9+wr3/8SYB
	 YE5GTFTamFezWn5h9yKRRZHTjmEXkiKSDhHQmSETHyH07L1OIuZDSw5vAPnIsMIqHc
	 xHKZ1pPohTVPXWolzCU8pmHC2tuKhW1J6ksU0wNO7KfC9FPVW8X5OqAMSyqxrQFx62
	 6J59Don6YOjcrYB4depAQ48282Jtk0Hn15fwXsZrTDFG7wXYoZAFFDaNy9yAqwtU8+
	 VxE/u+d7C5XhzsEV7mWCdd/wy44Zm/ak+CAmSKTfHmMRkKs3vALud51jkMhZjXlAtn
	 obw4n/muNx/LA==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50bf860906aso599863e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 06:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651156; x=1703255956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIhpWVKJJnmCyP1zy08oHrKsokOM6OlCzyTjReVqd1E=;
        b=TQL47smYkUj/ciXmqEpFFVuFbOPrxDD5CbDy1W1RpxQYy9OUqj4J96WItLJVF+GU6g
         cehIrJ30gfXDc44fquR2bLY7y2pH3Ehxw0MXdSKdHG8I/Htg4AFJcQp/JRvU21MJRbI/
         os4Hi8qXUIa139ZaU1XKoF1GcJOM0QR8fEqZSjKGTkPTaCLPOKs1f2hM2REwYAZ1zK3q
         2OhENdWNBe/PqnEesuN/RkUa7iM1nILtI/Xapor2IeX8rC92U3qxzudBajVr7HxThSwU
         AJfUQoSLXk3EYcxRMj/uZrDiDdUMndFaYOOj4ozX7KEanG5z48SjJ1fCOKmSkUPRZuaR
         DMaA==
X-Gm-Message-State: AOJu0YwhlRYi2CvYf1GXfZYT4YSEIhf/2CCtrLuhDcxfgphYoNUlWWO2
	0pL5wWywt20s/ISrpggympQ8+Rkb/qGsaTxHixl+cM3JsWDACCArkuKGx/Qdu43WbLPzR2OvXhV
	XJbNYvY8YOYXd21ZFbxkGbmvIoysQjZgsgXTX2EY4XxiUt3A=
X-Received: by 2002:ac2:562c:0:b0:508:11c3:c8ca with SMTP id b12-20020ac2562c000000b0050811c3c8camr5154667lff.7.1702651156259;
        Fri, 15 Dec 2023 06:39:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Vuhei34AU13Jnm38bp/hQV39eU5/IVQg8JqEo+wN89ajcH21veCiM3jRU6Sxf9xyyOAt1Q==
X-Received: by 2002:ac2:562c:0:b0:508:11c3:c8ca with SMTP id b12-20020ac2562c000000b0050811c3c8camr5154659lff.7.1702651155941;
        Fri, 15 Dec 2023 06:39:15 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:15 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 5/8] riscv: dts: thead: Add TH1520 GPIO ranges
Date: Fri, 15 Dec 2023 15:39:03 +0100
Message-Id: <20231215143906.3651122-6-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 397d5c71bd3d..d5e2378a1afa 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -217,6 +217,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -234,7 +235,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -258,6 +260,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -275,7 +278,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -416,7 +420,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -439,7 +444,8 @@ portf: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl_aosys 0 25 22>, <&padctrl_aosys 22 7 1>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-- 
2.40.1


