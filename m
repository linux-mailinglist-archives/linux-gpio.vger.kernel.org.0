Return-Path: <linux-gpio+bounces-9604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBC9692C9
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 06:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D611F22E88
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 04:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6117E1D0DD1;
	Tue,  3 Sep 2024 04:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="QlxIqLsU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4AD1CFEA2
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725336544; cv=none; b=dK2PiuwwHLPU+LX7E7qZdczZiaSkqTxPN4Z1xeXX1kS96Ng54bELp8OXXbRaB0i0yTmHtAKXhWHIFNjK9HkApDjDASxcnQsuwHiLWQZUB136ZYj4oGDy8jQe203+nIO8H7rOBDlFPQ1eR7ouTlRtbGjiQ4i036EFEIy2bXL7ZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725336544; c=relaxed/simple;
	bh=RHt/CuEImmNnG/8VOU+K/H1jEiWMV+ZSHNrD1hvj2cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5sesULSjS7EMtM+cRmjfNuSRztlwVjEBLFRuXQT7ZCedD9n6Rf8E3IiJ5bSa5hCFpNwfdbE/GwweB0Gi1cKQzDijJAONFV8p+qeiQ50voxJmtX+wXdWMpfoMIgu2fcUHp0pAKk8Qz2xiDlOmUAGLO5Q/tqUG1ieKz4h1LDX9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=QlxIqLsU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7176645e440so588691b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336540; x=1725941340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=QlxIqLsUH6+bkGib+E9QLsSxwmXOIpaJ95LP7gE5p1cWppYbLPHSL5vcd/VGqZbuFo
         Y3Zff6ddfU0IHWSBuodFMQfIongdKTay+Saxo9mJ8uIoGGl1BmL5FV1LqBue75BAh6ST
         x+ozh3Lw6CVc9lQ3v9I1ovKUPTUBfWD2xWjfT4n5VL5Cpy0ZVawRlS1Kv0x1vz6FCOYJ
         oFl18hqVMMGUDLnx6KsuvmqjLkU8h7cN1jpEouobK1oyEG1ALZBnEpn+8bU8UNkmUxqC
         nPeVlhyEzdpRr0K2OV5IdLZgcPjcYJxorvIX7S16m2qi+kYXILTi9jTnK6/zV3XgOjhz
         8VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336540; x=1725941340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=d5MsxfHx2GNXBQCOWu35SbSJgnMXJIaMf9Nj0PNNSCX1CoYQkTI4hA5xsizNSqXV5o
         Js5lnYW+tC1rd6rWQO9mLFiJJvQVgurgqPRolPVS18tekYHiEl/APD7BlxCAYKkymttI
         VbHm4TrSwl5rMPJcXrvvdBGaVSU+ieNfQIorkcMaS/9NSHln5GAUAa0RcunqKwc0NVAE
         wXjpfDYTU2MxHDE75qmO5GWtRE+LA/3YVYphs3l+O/jC5YDnOP24zEI1KY5LOjKDCsky
         O08JnEaRXXl5vjefjeP6E7AUG4uI2DHW5jDsZIIqAWTmhxXs0F/iBagt461xSvGwOMNc
         LUMA==
X-Forwarded-Encrypted: i=1; AJvYcCW1c6m/dC/o8mskD2SGDVC8io2ukD6xDrHUYFUuTzDJFSeC5zczRFZKzM+MMYkO5lSnSDJC8NxRIpLq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0kfcu7f+Yu/C66xeYluprZXXc9Ondqzb0UkcrUYv2IErd1a9A
	Uk9ZDZ+ZaooH43ZnCqBV0WFzAPNQmGkg7my/giqtj4fssDMJOrztxVNmJ941opE=
X-Google-Smtp-Source: AGHT+IFNAPzS6NfqW5WUiKK6YWRUIPCTsa89ov5gA3kZvZyE5KG2NssyQ0TR5AepdwMXQxdhjgwENQ==
X-Received: by 2002:a05:6a00:2d1c:b0:70d:26cd:9741 with SMTP id d2e1a72fcca58-7170a85aaafmr19264523b3a.12.1725336540085;
        Mon, 02 Sep 2024 21:09:00 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:59 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:07:01 -0700
Subject: [PATCH 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-th1520-pinctrl-v1-8-639bf83ef50a@tenstorrent.com>
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

Add nodes for the 5 user controllable LEDs on the BeagleV Ahead board.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c5356f674f85..823aa5b44efb 100644
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
+
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
 
+		led-5 {
+			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led5";
+		};
 	};
 };
 
@@ -82,6 +119,24 @@ &sdio0 {
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
2.34.1


