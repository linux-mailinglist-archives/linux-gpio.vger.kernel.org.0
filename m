Return-Path: <linux-gpio+bounces-10591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F598AD48
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 21:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E11228252C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 19:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3701719E7EB;
	Mon, 30 Sep 2024 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="FCbXOdNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7C19DF53
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727725872; cv=none; b=TYAOgdDkxg48RGcx0iMLwYg0QYG+wYznIWr9hJ3YoZVLu+iO6tiQJhaZ/DOMVk9PK2IW+cfTtSBXCMvzlfyAwl7ppBEszA3oS1FYD4lAEoObnuFxOdkT/el0G94Xr3rLvWE+9LIaSLvgMq6FLnyk64DH40Bc4/pEkQ9Yf3gxNR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727725872; c=relaxed/simple;
	bh=QOFY3NhTiXE558lxFJa40q0aIiFJXOat1xVrnr10WG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbnZXx2c2+xv6F0UmTIZgPJcdDfUoVQlicM1I4p+X4AWRc6yQcOECxSyWL3O98M8RSMhL69BtDM5dY0do/KrWB9sKJw/JiZ5V5JbqXHD+OM/RklfTZeYDrDo19xLB3r1WZlCj/+5sr+jJmAMLk5V/K1J9IMfos6EmahetskRbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=FCbXOdNl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-719ba0654f9so3994504b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725870; x=1728330670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOENnbNZqVpEixBn4r5uT9yCBf3nvHWmxb3PiDsNikI=;
        b=FCbXOdNlCgL+z3RcgthaF5UiBIqlB/r3qQkdTBLHqHGw9h0PChI/HGCrKSja3ZCk2l
         +OUuIfbhAUYk9UV4ntPCw9gzs4QZ6n428Aw6Pjhj2P8dm+VSLhFo0xwWl/pR1OyjH/SB
         CdbMJA5PKVDo6m9r/UoJbSRgZXVrFl/vMkNSaiJpJstvfABfWQJ08kUDwv8LYWMbvJEX
         OOm4XLSLa5/iGlgfV9aDw4vd/KW20HKzac58IO3l6V7VTVJSCl8dCOrL9V/g2xjn80xu
         AyGedh47NA0GD/D6D65WV/JIBNZ3uVQgb2/m1DpZP58U863pN1G5aA0MmVvulAE/2mdI
         hZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725870; x=1728330670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOENnbNZqVpEixBn4r5uT9yCBf3nvHWmxb3PiDsNikI=;
        b=MPbv3dsPy77N+Npznd0Jz3rLywE5uoxWE5DC395ZB2zPru99ynphKqaOsLexg6qkb5
         Go+V2qqeCVAaFdsw1Wn71og3lP7PP1juDZXPW9IsV37vBngHF9HmNUyFObAClKd4OSYr
         eRtaqY/7nQpXMOZQh3OiRcd5v8v4ionSiolp9P6N+EoJa4achUHbsBwCVlGnIwCW9M5b
         dc7XpAmvhKZqZq4kRlHVJGBpYt52U78scgCQUP3IA34iq/AYdA9Zlu7rS//iimdRouhn
         BSYYQ9mz9NDJiUYSZSA/qzK7XTysIB+Ru61gqnKz798BPoA1w/RjAH2bMH5zXBNemSjM
         6wng==
X-Forwarded-Encrypted: i=1; AJvYcCVQP7Y425TNVEx2dmgx/mIkBinl5TVnsLycxI/rEmDuUe8XMHzDheVFYRUyAFLHg6KaYGCQ0S/0+rD9@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5AGlbislC40FuWmjC5MC+PDTpWOFh0Il6VqvW6FrjAB9jKnI
	R9o2lL+3ltLXSxQUUpi3RINv05XygCg2ufJdfG3ezVBgPuWH5SSTjOpQbi8xlaw=
X-Google-Smtp-Source: AGHT+IE9wVO7c8Ywho+AqEJCOVbrSywl/1iA5AQOkKx/691Hbnt4288WiAeavD6A4I7Z24WVnR/k6Q==
X-Received: by 2002:a05:6a00:3cce:b0:718:cabe:aa8 with SMTP id d2e1a72fcca58-71b26059666mr21143692b3a.18.1727725870528;
        Mon, 30 Sep 2024 12:51:10 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:10 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:53 -0700
Subject: [PATCH v3 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-th1520-pinctrl-v3-3-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 27 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 497d961456f3..e88b4fce755e 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -45,6 +45,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 78977bdbbe3d..bf1c639072b8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,6 +25,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6992060e6a54..e4eda2a76595 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -216,6 +216,12 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
+	aonsys_clk: aonsys-clk {
+		compatible = "fixed-clock";
+		clock-output-names = "aonsys_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -354,6 +360,13 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&clk CLK_PADCTRL1>;
+			thead,pad-group = <2>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -392,6 +405,13 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&clk CLK_PADCTRL0>;
+			thead,pad-group = <3>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -538,6 +558,13 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			thead,pad-group = <1>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


