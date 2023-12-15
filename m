Return-Path: <linux-gpio+bounces-1552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F4814ABB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 15:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0BA41F2373C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 14:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537A03C481;
	Fri, 15 Dec 2023 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="DLmBUzEX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04D23BB27
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6E0363F744
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651159;
	bh=KeS7bAuIUzMlkgCBNZb8n3wxD/29BdX0GI6KJUISBPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=DLmBUzEX56c4nbV41rCjeOg9seAuRSulSXrZVTuAhhu4/opVy8UX4F112GJ4X3BcH
	 nd++gmjjKhQL0+i3eAmu+ipWNfnL5hRnWrWjSLmdMHa2jbc3Pzx2Z3QphWtO4InsaQ
	 0VSL0LRowDFbx/FNSQ09wHUCFU2bJQm5YClovdkwIni22i5bcpgh6o2UDIINk0SQUK
	 T3PJsMdxoF8Ipm+BLjKcUTHofAfncwBmZeSLW70TfQiDbJ1wPf8K5WKgDRGk7KCCmZ
	 i41ST37NR/3vEmyKMYsqe+olqTyAgSYVqk8Qh0wrDv5MnTzhm0z4H9g8xU3NDWfJf8
	 Z+V/50rl0tTqQ==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a22f129e5acso43424066b.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 06:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651158; x=1703255958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeS7bAuIUzMlkgCBNZb8n3wxD/29BdX0GI6KJUISBPU=;
        b=Fak9OM6/ozA/owaEGr1tRTL/hGFC1Pt07WF1CIvduXuyaxi031EbLiwinEzrKhQBZY
         UF8sg+ZyrlPXICVtwrHCrZv+wNl0LrOtAbQty5rQKlvM+3e06aUnbdth54uAc5m3BKIJ
         nkCLWVhl4hl/wA8uRme63Fex9BHtx5r+p/oY9yiOp5sj1Va9ABwPzVteO4ubom5WlPs9
         j801LJ8zv9YEOQyIOtNsCYkj7J1XwpM+YUvRgpiunYi0QfYRivLmppiSxJn3hcpfKKuj
         MIUdzDAxxi4YC/ABeWUpK05S/B1Eqe04WVXaRK6xB8VfMBEpY44aLayfZcK5YMww4Hw3
         vKkA==
X-Gm-Message-State: AOJu0Yxxl5WMDyGUIsP+5AVQzfFOIwbhlESO6uz7RaD5ZcqPCSG9ALaA
	cIgBrijqFpkCFflQMiYDotH5/6Evz3URRpoUr5RwuaSLjzfmuUzgwGVvyGWJG+amNwar0UscFKU
	4sGCfYelQ+ak1EttJoIohc59E4P8qowR6OzXbLnU7w6JIgjA=
X-Received: by 2002:a17:907:9815:b0:a1e:5ea5:c5db with SMTP id ji21-20020a170907981500b00a1e5ea5c5dbmr7355322ejc.83.1702651158536;
        Fri, 15 Dec 2023 06:39:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYp9pwfbZkq5mfgtJhASrZeR58D28PvdjDO0/bhC5ViEz08OWOBS4jzY7w2oHtlQRgSLS9Lw==
X-Received: by 2002:a17:907:9815:b0:a1e:5ea5:c5db with SMTP id ji21-20020a170907981500b00a1e5ea5c5dbmr7355304ejc.83.1702651158328;
        Fri, 15 Dec 2023 06:39:18 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:17 -0800 (PST)
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
Subject: [PATCH v1 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for UART0
Date: Fri, 15 Dec 2023 15:39:05 +0100
Message-Id: <20231215143906.3651122-8-emil.renner.berthing@canonical.com>
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

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 26 +++++++++++++++++++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 91ba96588ae8..54d86aab6656 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -58,6 +58,32 @@ &dmac0 {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "0";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "0";
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
index 0ae2c20d5641..260aa5e0769f 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -29,6 +29,32 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "0";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "0";
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
2.40.1


