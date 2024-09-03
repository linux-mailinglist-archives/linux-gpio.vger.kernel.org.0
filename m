Return-Path: <linux-gpio+bounces-9598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6909692B6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 06:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1075EB213D7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 04:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810DB1CEAA8;
	Tue,  3 Sep 2024 04:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="TcVzvmWf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AA1CDFDA
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 04:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725336537; cv=none; b=Q6HY+YdeK3rru4QJaTwwqNT+BqhQx7jiP5ChuqD3mquyTcKfByMuvLbQTH9oFbo1EpoMGbisoGNCfxqDgM/Dpgya4jXKa/nsbbeb07kqWL/eFjSaev+r2SS4q7JGw4jqDHNgJ1EnGKiJbrxkPVziEw9VfN+nXf2W9yj0EwY37xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725336537; c=relaxed/simple;
	bh=5wWZ7techati+aOfPvJMxyFSH5Wti/es60OR5gL0P5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fV1CvS3w8X2ghwouih7/0PggPGQcY6PR5H0xoVdDvyI1pgDXas9Yw9CFsxX/srE1el/mk3OdSEK77GwysMWhOurWyrCao6CnkD8NSwCgMDEit/pqd6ivhkn8al2AmPM5qTevG+flmSezj1G29W1wxcyI/oVET/vgo4l3jvU+TwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=TcVzvmWf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so2840079b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 21:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336535; x=1725941335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiQQIOurN5s0FJRXD43MLGWhBSOLzbp34+DraYLBvAg=;
        b=TcVzvmWf7sHy4I7+fBP5fDmLBa+ZDCBWzmMGx16iF7wx8ARTj+lCmQvM7XvNyE321m
         fiL/gyeoncbRe55l426JX573lq1QDuiuZi+1EgDd3sC7rIl5AwAHTsXo2+8Nv7ygD8f4
         pQYLQfB3+VMLZ1JlEAfkZkcoorj4QeqBTzhi2BhbyLsH3LXzeT8Mf4V8YMxtO/uUTajg
         KmNz9nbdvR+IsFuTzjhF8tbNblD/G3a6YYs7KQsZvkZavzGSw72s42Po4kJFzQGgyz9Q
         Z10xVXKE1mjEdzPIbjaCDIsSRtiG0VPky5YTTC8W+YaKJsH08xGA/qV1OTuIxLOT2MrX
         W/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336535; x=1725941335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiQQIOurN5s0FJRXD43MLGWhBSOLzbp34+DraYLBvAg=;
        b=kgsHyI7LC9ChnvVFD6ZMVO4nrK7Lvf4NEPUiqHusI6+AoOWythgTQgg73VrCh62Rw1
         nzPrmLwf1Vq+ZZwk3lakyJ7l4Q/pruVz8OzYoI9r3eqPW4jxJGH82Ky+dMhSGwrBHNZb
         zSjoSnMJ53BQLVUwx5BDWudJSBmeJj/IQHy/nvG1U4M/p3F9RWj7KbQwA7l3mar8lfZP
         uoX/s2rW8CiTe9/Olrj6FFuW28xtHBakNLoPFXukrQgp8YyeA6+XL+S6sc2byYr9/ps+
         0O8JKItPs0So4qn8R2rIaEdfBI1d0P5Tuz7A6VY+avMcNEeOSJ/+P/uTWQVAOICJMCr6
         6DSg==
X-Forwarded-Encrypted: i=1; AJvYcCUnMHnZVcuSnTG9uhr8gyk1bh5fQXyRfkvGMwencj62FiyIdHa2ojA4LfPIUVgIGR0riPij1kcagX8h@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIs+gWOFERUa6q2H+TSEgkhl8xG1vmB5spkE3qYbZVeb+InNa
	YVXf1hxBSdn17YGR0VS1emoi8V8ostenFFCUB4klwRPZLILieAJs1HBPBkgDeEc=
X-Google-Smtp-Source: AGHT+IGzyiuhlkMwYG0YMzdnnd3LOlKnGZxIN1H4tU/WAf0wybOl/XWFUTDfriwcPu5zruQGDsplqg==
X-Received: by 2002:a05:6a00:13a6:b0:70b:5394:8cae with SMTP id d2e1a72fcca58-715dfc76152mr19057737b3a.28.1725336534809;
        Mon, 02 Sep 2024 21:08:54 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:54 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:06:56 -0700
Subject: [PATCH 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-th1520-pinctrl-v1-3-639bf83ef50a@tenstorrent.com>
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

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..be85e3aee56e 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -44,6 +44,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &apb_clk {
 	clock-frequency = <62500000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..530648ad64f6 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,6 +25,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &apb_clk {
 	clock-frequency = <62500000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 3c9974062c20..834dcd1fe7d8 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -215,6 +215,12 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
+	aonsys_clk: aonsys-clk {
+		compatible = "fixed-clock";
+		clock-output-names = "aonsys_clk";
+		#clock-cells = <0>;
+	};
+
 	apb_clk: apb-clk-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "apb_clk";
@@ -357,6 +363,12 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -393,6 +405,12 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -529,6 +547,12 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


