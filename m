Return-Path: <linux-gpio+bounces-10133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB1979480
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CD13B22FBA
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 02:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DA3D531;
	Sun, 15 Sep 2024 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="RuuzTrnD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF91B85DF
	for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 02:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726368259; cv=none; b=kZ/XiK2xN+YrDi86o6OJ3ceA5PJ1T1QGwak3Jv+rscEEYb+hlMLfaeXN0iTaJpRULRnrTOdbyxXLhs34rx6qvGGr7jAzMO7K0zRo5G9ikrXyq0wUPENWp9yYPRvtazE4Wvecto9jiB04LPR9Iu3cEpSD0d1ooERaXepHg2zQwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726368259; c=relaxed/simple;
	bh=RHt/CuEImmNnG/8VOU+K/H1jEiWMV+ZSHNrD1hvj2cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpqbdxmeD3ITGbd1lDrkknicKIwQst6FIqmXCpCs/CBql8abx2Zyty7zEXKVuMWQWJ3mdI6xtVWiLpMPRM2oVliWLd2T2Q9qKQogpXLG5HTvmeMQmudYHRO9mvNoQHr6XqXf9qRTmu/9a8TcZJOnzwzHNIztr6Yb1I2Bsm0nkjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=RuuzTrnD; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1d0e74f484so2846765276.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368257; x=1726973057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=RuuzTrnDv57rErXTLd25zDpe4fCV1bQMJiux+7rjrbeO9G8VOjOTGuoaDGEZ+x06ub
         m3peAX7XBU84EKfBnJQ9A7cyQg59sZ6viy0ggrbVw8GCUTy/iDNb2/q1WZhAdTiBGTQ4
         n8MMhtA/fy2zYQzRiRAZvtAfcV4LE7W+YM1w5NF7+KOHWzFZZ27RiLVi5erip3uoD0Ks
         GAY33hhUcYPUqfWlV9YSGPvyn9i+uA3ljZVNuqOJx1M6PhNEFoVIbeMa8LSb1OwVdiTk
         gNgU8bAxYzGEe0AHPz+cQ4Y16vgfXfp+sjZTGDd6++/Ys9WdKWxoj7GFlkqu0uWQRLj+
         KCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368257; x=1726973057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=lha81toR548XbAjIlAz7nYWVLyPuosq3PYAyuEKD29UXoq8F4zzANnasxOammTDnVX
         jwiuEJNu9vxHWlGT3lJJe39Y4UkOGZhiCZzC+bsarnJws8x8mWc9i/oW2GnBr0Tom4VP
         Ky+aNuZiGod7LHOZHSa6xit70nrzo0nxMReKI3NsC9xfudTVoBGh2sJ/v2b3AtFyIu3l
         hJmfbbAPdOoiS9mfhGDgc9tr1ssuUlD9DgtdJqmwJLSpJSyIdovdlmcFRIzqjXNzA4Yg
         4/EeBRCxqsrsr4jnRsEO0oW2IboxutwoAgO1na2P985LJe35QS6nCHxaLZa+xFqd3Cst
         d5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUerGXvEUkyEKnPkt+xM0GclLZMP7486hTJnbZMvhwaVnwSiHP1zff0qwPOe4ODilA6lfnaS88sdrI@vger.kernel.org
X-Gm-Message-State: AOJu0YzdtoatY7LXmx3ahVFgPsWCq3mhgkWVUAPvIcURuwe9NdtLN+pX
	gNgJzh0Ublx4aaZbuc6c9OeDgzLPPRfXkvQTGjnNFJ0boQXaulqk3LJihpgOyBk=
X-Google-Smtp-Source: AGHT+IEClZ21Xn2I0tdDO6eQz5l4CSj9mqsoGgEda3xSmNTjGf1KEuzvGBfrhopXDCp2Yb4bN/rIaQ==
X-Received: by 2002:a05:6902:1881:b0:e0b:e47d:ccc9 with SMTP id 3f1490d57ef6-e1d9db98c66mr11206546276.8.1726368256818;
        Sat, 14 Sep 2024 19:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:44:16 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:56 -0700
Subject: [PATCH v2 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-th1520-pinctrl-v2-8-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
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


