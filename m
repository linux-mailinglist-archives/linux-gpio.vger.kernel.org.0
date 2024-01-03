Return-Path: <linux-gpio+bounces-1995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E723822E58
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 14:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DAE21F23F5E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 13:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B0E1B281;
	Wed,  3 Jan 2024 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="DnOEVUJD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DD2199DB
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A9A3D3FB5C
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288553;
	bh=j8polI0w/bjJ8tZqB1jGYw0XXYsOmvLZx8MNesRoCUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=DnOEVUJD7eMXhCK/MQ544wTYkmj+RRJXE3d2iW2RbveB84/P/NCR1RPnPu3zu05Gy
	 6cqnOjY0Hs5CEeJVpmcOMjEGTrSAxuTHHeXyBeM8cchni5s/iD7QIPUx66kKWUBT9y
	 xXrOpGRW8OywWbFo4qKCJbitCm9yBs7hspfEgRI3NxhcYhEFYy/EGvZ0yRSitznMFr
	 Yf9XuJErz/ye29V0YdJAcIZrXLmljwYljny4G7QYN5kIa/kBaMElmWoyokmAmlqNsV
	 qXh+RH/p9Bfe/ECOkMLpU+NcbI9bndeBNyALZTer6pjmeg8J0EyJbmUGBmJZ0mRv5I
	 Bn08yOnXV8nDQ==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50e7b2ac430so5522603e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 05:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288542; x=1704893342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8polI0w/bjJ8tZqB1jGYw0XXYsOmvLZx8MNesRoCUY=;
        b=c46/epRbBwqJtflec4lAv3yck+gwJyHZK2HkpuG/HRmGpevipC5o4bIyU5bz9cCEHs
         5glTMbqjal/CQhiJcXYNkbpsUdw6vIwOHAdha8Pdf0mjL9BQyPbC0S4OYuCFBdi49XUC
         GMt7ZovxnrB0Eb3LRYthz7PVsCt+HH10u4bjasEj6a/wVUOnATWIBfz9/ykAe9RdvXBU
         QiefluJ7KPhEWgX+1poPBxODlrt1AEiCea2/0FIiAwFC6oM01SrphxUQZPFbr/X75kxL
         395BvGiojqR2jPbJwnYt+tyn5K6K+0x+UcH/aU552nYpkURydzJ/Irj64GGIMUtFLUUt
         1Bjw==
X-Gm-Message-State: AOJu0Yz/ZIM3MCYHmV+OXOnMA2CnqruFcKVdzcUGbU0M4UNV+fZEcGEo
	WV0+HcHtiVkPrhBxuqyEdhlREXWy9nfRM9hWbmZXhDhjfIUXTGzR6wFr2b+n24X3wfOMXnmZjGY
	BxbSpSF7+yQ4oUlTRkWBrODunZoaxxV6sjsIfNa+YamRwgw==
X-Received: by 2002:a05:6512:1145:b0:50e:3767:d381 with SMTP id m5-20020a056512114500b0050e3767d381mr7432131lfg.139.1704288541971;
        Wed, 03 Jan 2024 05:29:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJt4/P/j0GlWbqbKebsvHvV6+jrN2+ONRLeoH23443/k+kOFBIdKz9RoGU2lF8BDUFzg5rrQ==
X-Received: by 2002:a05:6512:1145:b0:50e:3767:d381 with SMTP id m5-20020a056512114500b0050e3767d381mr7432116lfg.139.1704288541775;
        Wed, 03 Jan 2024 05:29:01 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:29:01 -0800 (PST)
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
Subject: [PATCH v2 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
Date: Wed,  3 Jan 2024 14:28:45 +0100
Message-ID: <20240103132852.298964-9-emil.renner.berthing@canonical.com>
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

Add nodes for the 5 user controllable LEDs on the BeagleV Ahead board.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c697a50ca9b1..0b309c770202 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 
 #include "th1520.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "BeagleV Ahead";
@@ -34,7 +36,42 @@ chosen {
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0  0x00000000  0x1 0x00000000>;
+	};
 
+	leds {
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+		compatible = "gpio-leds";
+
+		led-1 {
+			gpios = <&gpio4 8 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led1";
+		};
+
+		led-2 {
+			gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led2";
+		};
+
+		led-3 {
+			gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led3";
+		};
+
+		led-4 {
+			gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led4";
+		};
+
+		led-5 {
+			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led5";
+		};
 	};
 };
 
@@ -62,6 +99,24 @@ &dmac0 {
 	status = "okay";
 };
 
+&padctrl_aosys {
+	led_pins: led-0 {
+		led-pins {
+			pins = "AUDIO_PA8",  /* GPIO4_8 */
+			       "AUDIO_PA9",  /* GPIO4_9 */
+			       "AUDIO_PA10", /* GPIO4_10 */
+			       "AUDIO_PA11", /* GPIO4_11 */
+			       "AUDIO_PA12"; /* GPIO4_12 */
+			function = "gpio";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &padctrl0_apsys {
 	uart0_pins: uart0-0 {
 		tx-pins {
-- 
2.43.0


