Return-Path: <linux-gpio+bounces-1989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A61AE822E46
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 14:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F8C6B22B1F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 13:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701BE199DA;
	Wed,  3 Jan 2024 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dgDWrqzp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB31619BCD
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 921E73F5A7
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288539;
	bh=k0eAX7Pjr0Es3oRTW4OzPPCh10C3Ug4Yt616FM0odEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=dgDWrqzpGvvlEHL2e8Z7vQrGg+ebhI+hlyqwCQst1ls9TBBQSc6dK4lRfEjCWWafo
	 DsyIlyNC0fe5jQ3khxvXL+Qs8Lk677SKSBnSMiPiC4ItizaBhy6DDYaagikrhJxra6
	 TH620BLyhvcFosOslZpus/aNUa7HB9o+42q7gEZ2f/Z3fQ5MtaTbJqsC+3or1xMd3c
	 0DUzEAioh9GOoawyUSPPX1v1WmZssIJF0cOvC9ioXJR+lKSfxxuO4TazP0uld2liDP
	 Q74fO1zPKbV/QtMOE4Pd3tsmKJtsXaHo5nw5wd/nNL1XiJVlZzwVdwfm7TsdVe7h9F
	 4UmC+kl1A59cw==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a28b20b48a8so7093366b.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 05:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288536; x=1704893336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0eAX7Pjr0Es3oRTW4OzPPCh10C3Ug4Yt616FM0odEI=;
        b=O1d84NhPKLG6aUOUlvB9GfZPQmrhtyK8mrkon9ONIkMQDDGcXlrOMd/CnjXGiuK7ym
         JeKMdPvydGMzTeR1X9hmksO80Tb1H22CvOut86lV8ioltUC5eim158v5AkqMVZoKFQvO
         omyNF7aMtUJ3q5VKEDlsvtdQ44caBfw2KP+5nO0AOQMdur6KzDYE2zmR321loToX92CB
         U8Zby+0nRa/X8xY8jdvFronOX7LcfgcViSY+jEu2rzbXA92I96YGnG9Ps9FU7LvtcdgF
         /FUrXlSPbzgevmojHh2lOv4qoRUnVdVFxaqWY5k/P2EPyanbWFZEEOlm5IFPDx2rt1XZ
         yspA==
X-Gm-Message-State: AOJu0Yy+MluzsUXfZVbTgMUw/vwQFpS77GSvj4efYrLvE/zCTfpYKxdi
	UOAHtqQn0NfehOfr40V2SHl6Mk010tD8Od3qESwI4bUJMcHUg+yeDQcqJtqSknOds77mFGK0Ol9
	BGq7EQuTB7MslKRia65XO0HUQ/nUvQPRg2q5bH3mk5cVcpA==
X-Received: by 2002:a17:906:ae81:b0:a24:8deb:3524 with SMTP id md1-20020a170906ae8100b00a248deb3524mr9998287ejb.54.1704288536394;
        Wed, 03 Jan 2024 05:28:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNIq1CKNhWMoSrckwwyabhUuOE7H6QabgeWt/eKwTAzHuJddgDz15KXv9LDSyfEPXQDMx8qQ==
X-Received: by 2002:a17:906:ae81:b0:a24:8deb:3524 with SMTP id md1-20020a170906ae8100b00a248deb3524mr9998278ejb.54.1704288536233;
        Wed, 03 Jan 2024 05:28:56 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:55 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Date: Wed,  3 Jan 2024 14:28:40 +0100
Message-ID: <20240103132852.298964-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..6c56318a8705 100644
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
index a802ab110429..9865925be372 100644
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
index ba4d2c673ac8..e65a306ff575 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
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
@@ -242,6 +248,12 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-group2-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -278,6 +290,12 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-group3-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -414,6 +432,12 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-group1-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;
-- 
2.43.0


