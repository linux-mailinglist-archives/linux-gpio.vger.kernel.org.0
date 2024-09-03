Return-Path: <linux-gpio+bounces-9603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BC9692C5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 06:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49E80B226B2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 04:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742801D0484;
	Tue,  3 Sep 2024 04:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="X8aNOgBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272761CF2AC
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725336542; cv=none; b=T76RF015SFmmm0PoiXFNQxvIe+hl+20AlQZABHwdvLP5iR3zOppulccJAnCe1bKfkJiJhHYunUzcdW81F5wFxonviyu9y7lm5Fsjh6Ds+aEVKDfA9Kn/VJH9+n69lTQBtppVVKmSAVODNk2AzaaGS/pnqz/uD3uiEePJxSu/ljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725336542; c=relaxed/simple;
	bh=HfD283oA9J+y4Ws1aDfqcKBEJxdpADZfKLsu878/aS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DujQHgbVdgEnV/olXOghbTtP0RFdDpgzRkbu77YxnBID4a8gN0lFBXkYZtHU5c7xDi4BSNEbX8n3ZfGMmz6//UZeetaIfxmexyu2B+gPl+EENVVQ+07S2LKxS4SOiu6dSgqOYnsD4E9S2KPwtN8Vl+b2BY3Nuvr6QH9E22q5IeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=X8aNOgBj; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70f657cc420so2135590a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336539; x=1725941339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=X8aNOgBjcv7+CoBPiljMxQkDQAaznxKrhEUmZwjgf8ebiHrzWblR2T93ulFoWxl/gR
         8/PpZuFMO2xYdxf0EX7CvxMf/AouWxgoa6IkcAV92yRzOrLavRqIhJe6gjzgLNLnKjLg
         s3w92nBgPuPFT06fhFIAzCw3D6V0CCqC0TIars/CLNzqD89sf1Z4X7Ta8xL1mNqG6o/d
         CwRV4JslcOwCGv5HmrIfUKDoyBsvDrKowVLcML1DCYUYG7SZMis95pGJwyGUANBhQY1g
         zQDVFi8ROk+iaAtE4ZE49Fxrs9S0+XWR/o4KjB8XbUQ33jGr4qhVn7EXSW9JKa6KxS9w
         pRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336539; x=1725941339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=MqRKOSMnX1sq7wJDrMA3zHGTW/lzrCYhSWhIMSTtOhnKkPjCAJNXIsDr7lu9/du/k4
         2iBgJUCNfhdlnSGPUyE4Ah/wXT7FNhjLwPLpp8GeCHtaouLvtjuHB0k88yyqmqlfiQV6
         tUFGtFefWHiLLRdPQh5Qf/f5xe2JJy0ZUDmEQk6wiIgNgjkGewo4mm1PIb6Fbvx97T1l
         cVdbctas93SN3YgCIZPP5fewY3R0Jx2Pr+SJ9ykpvQHNlEMy+2yP36/xIMbRKdpt87As
         X0gk6Xckv/WzL0BeUkJ+kCFeUQ7LWTvJIP9YdsGSqUF9U46lsPPpndnYh8wN0pF/yFZ0
         S9NA==
X-Forwarded-Encrypted: i=1; AJvYcCVYyHQIOYycYA0zw4RZQAhvgsYHSIGX65JbAmSX5aG25x9QgIdBlRZ7nv6uKaaaEZJmofpV6eo7fiwZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6MQYrf+njsFOkSwictnDFF3YeEEaBjyUgTzGpquPrPpyLBLEW
	3e37Y13RtJBcFPwiYXgeSniPKVaZQ+X5Dl8a3pGgOWJ3Hrlk7l2h3MsgXRT+wKwIa5HRScr/hX3
	+
X-Google-Smtp-Source: AGHT+IG1bv+0Hcu89hJ/iW0ppyWLhDz7hQS9eXP//hut2vcYYD8TEwbZJJXon33WkI7TKADhhCw9MA==
X-Received: by 2002:a05:6358:b00f:b0:1aa:c49e:587d with SMTP id e5c5f4694b2df-1b603c48be2mr1966327055d.18.1725336539064;
        Mon, 02 Sep 2024 21:08:59 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:58 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:07:00 -0700
Subject: [PATCH 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for
 UART0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-th1520-pinctrl-v1-7-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 26 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c48f6fd6387b..c5356f674f85 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -82,6 +82,32 @@ &sdio0 {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 0ae2c20d5641..932838c55f90 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -29,6 +29,32 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };

-- 
2.34.1


