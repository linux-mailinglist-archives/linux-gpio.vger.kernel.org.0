Return-Path: <linux-gpio+bounces-11183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21D99A34A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F55285F3A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBF02178E5;
	Fri, 11 Oct 2024 12:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY+7GL2z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D9217338;
	Fri, 11 Oct 2024 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648375; cv=none; b=UuFCloEkT+J4gNHw5Pi49wZ02vV8QBbkH8bUpG336AzJdWGtBFrmoxCfP6dGjxbe1pqFHcGcuSSDWycXnb+wefZiJ4CD9zVOSgiYsKtvQkS7qVD5kdix6ZTiRwRqPPM3p+ZaT1E+mGSVNy4ABoDt8Zvzhs8tPALUIiNaQ/6H5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648375; c=relaxed/simple;
	bh=DiHPnMVF/HBjIULLCUIBPGPpIO9Asa5hLlhWPUgaMu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3WdG0hEtL6ygmO/jZI9RB+4cYzYVsre9HToTJOIDcwg4AIw0NofhE2scx9lfaMTlIGp6Jzdr6fxZYhdQe3/JQhm8deZObZ+1o5FpwzJzfbDHKKSA3AsAIHJNib1NR3NFpbtPNEq+kJR/abmM6C5AQaK50y0DNOsijHYcch/UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY+7GL2z; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so2329530a12.2;
        Fri, 11 Oct 2024 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648372; x=1729253172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwwOHHmNfIXkBnfQ+BSyO3zaAGqXbcc9kTes1NzHmGM=;
        b=MY+7GL2zuzTUuCv4OxFS8cTJYY3DPmIhrxSnYEPLUzgQj5DzjWcdLHMKqlbk6BLFPd
         BtH8jeu7ucgKuidWhm9xwYIGSmJm+RFgmPs3FFBehJa8PBuuTgBGaa3EZYXIWapmQmyo
         MxxFpANRui61J/NWrey60mTiEBM+MUgNCUYokcuJTUrn5Tio6xUqgYBAzvsINUrKIheO
         Dy3c28iDniM7bPscYVYptJdk5+CqLap9PA3ndm/Ry8rC3c23fxpOPY74jLYEbL7MhdQf
         wqC0CRWCeCXznKcV2qAp4Hz920pRBaL/2Mz5QdAK4UVjuZKtyFokspQXSwnRMjebzuDE
         J5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648372; x=1729253172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwwOHHmNfIXkBnfQ+BSyO3zaAGqXbcc9kTes1NzHmGM=;
        b=i1XeBNSpqd4nTtZVdWCGCWIl0mxEgLCvshJtixxME5RHCDnaT+FmXtaAjlfTEaKxhT
         pHE/bngiFAqeuMr3VcfYN/rqe3Khli/7cPs9BEDg+2p1BgvuEtVwweTNQywmoZjNdeSC
         YHoYY7kSxFRz/Ig3mcp2TZEnePDXTwMg1Jk7AosptSaP61YAsB34SZygCkDymhEZB4mE
         S/2QbVRREOvZJTWWFkcB3iHVcMtiJPBY5a29zChHTpd6v0ZL4zvF/4KIwVx4d2ei8Iqv
         v6dyp7CQns+d4ywr8H43xkPukE/VDm+YwC/WLCqlBiIveo3TXiFcafMs1EM10gnEzHp2
         OTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHpYUekd0KRfCvU2Pqi0enWHFbIiwVzO2C2POvnc13Xd3dzv66TxkJUW20Eb21XZegF5THKB4ZUeLFikvA@vger.kernel.org, AJvYcCVvjWcm9qZSBhXk7tHdeEGHhtYVZkMNMw4sN24Jsx1/FwrdALvkjgUHIhPScz8rEU41tPnx1hmrh7gUbg==@vger.kernel.org, AJvYcCXl5LkUMJydpOU1X8eizHPkbp6lM+OkYnd4fF/eAJ6Lpe8/GSktstPu6YqZfnz66WIKMEnnrJne0LHd@vger.kernel.org
X-Gm-Message-State: AOJu0YzOaT9KpGo8ti56heMz5v6hyu7P7qoHk0W2egMzEPwR3gHP9q4T
	vyXxiWZ1Zi8tk9OzJv+/2FrkcPH1mE/spipnlNBYiMYQ5HH6mOjc
X-Google-Smtp-Source: AGHT+IFgVwsuSAq9WEnfhtW5pOGhnuZyyy0168qn0i8pRbiG0OVPCEzP+JXQsY84r1H5fj2P13/ebw==
X-Received: by 2002:a17:907:96a7:b0:a99:446f:1f1a with SMTP id a640c23a62f3a-a99b93ed1b2mr213531966b.35.1728648372484;
        Fri, 11 Oct 2024 05:06:12 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:11 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/8] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Fri, 11 Oct 2024 15:03:49 +0300
Message-ID: <20241011120520.140318-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 0e9d11b4585be..a786d1d08f683 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		uart0_pins_a: uart0 {
+		uart0_pins_a: uart0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO234__FUNC_UTXD0>,
 					 <MT6797_GPIO235__FUNC_URXD0>;
 			};
 		};
 
-		uart1_pins_a: uart1 {
+		uart1_pins_a: uart1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO232__FUNC_URXD1>,
 					 <MT6797_GPIO233__FUNC_UTXD1>;
 			};
 		};
 
-		i2c0_pins_a: i2c0 {
+		i2c0_pins_a: i2c0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
 					 <MT6797_GPIO38__FUNC_SDA0_0>;
 			};
 		};
 
-		i2c1_pins_a: i2c1 {
+		i2c1_pins_a: i2c1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
 					 <MT6797_GPIO56__FUNC_SDA1_0>;
 			};
 		};
 
-		i2c2_pins_a: i2c2 {
+		i2c2_pins_a: i2c2-pins {
 			pins2 {
 				pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
 					 <MT6797_GPIO95__FUNC_SDA2_0>;
 			};
 		};
 
-		i2c3_pins_a: i2c3 {
+		i2c3_pins_a: i2c3-pins {
 			pins3 {
 				pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
 					 <MT6797_GPIO74__FUNC_SCL3_0>;
 			};
 		};
 
-		i2c4_pins_a: i2c4 {
+		i2c4_pins_a: i2c4-pins {
 			pins4 {
 				pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
 					 <MT6797_GPIO239__FUNC_SCL4_0>;
 			};
 		};
 
-		i2c5_pins_a: i2c5 {
+		i2c5_pins_a: i2c5-pins {
 			pins5 {
 				pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
 					 <MT6797_GPIO241__FUNC_SCL5_0>;
 			};
 		};
 
-		i2c6_pins_a: i2c6 {
+		i2c6_pins_a: i2c6-pins {
 			pins6 {
 				pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
 					 <MT6797_GPIO151__FUNC_SCL6_0>;
 			};
 		};
 
-		i2c7_pins_a: i2c7 {
+		i2c7_pins_a: i2c7-pins {
 			pins7 {
 				pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
 					 <MT6797_GPIO153__FUNC_SCL7_0>;
-- 
2.46.2


