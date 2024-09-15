Return-Path: <linux-gpio+bounces-10128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8D979472
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB47BB221EC
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 02:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AB2C13C;
	Sun, 15 Sep 2024 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="HUOEIRhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173486FDC
	for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 02:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726368162; cv=none; b=sdhgJ5pXjFPhecJ40l9C491HwW4IMDUJ4GgdAwPNYpKFO3AW4xxGgIJxF5CjQNIdIT7zECKfXeizhlyEWWhk4KBU5H8BG8ZCjwOHyTF/xnocIJvvuiAy8te3C8GO/hmke54mepEIC96OSPLdzyOrK2bLpbExR5K77I5FSMGPu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726368162; c=relaxed/simple;
	bh=l+d3TzVnQG3NYjcjHylN8ao9bzvwnvNaWn+AHCUhmpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+UhiDukbgaZST01fYVO4MOlRDO680S6QnIesJ2TUOE9vZAHd5Wawy346nXt91VY3Eo7VkQhOLbhD5jYwMOOjYNOUq0Pfw+hxqiC6A87o/zaHXIfxZpKQYunSytcvT18L3AHUb9JRmndbnmBxAISXgqd1YI3fQi78zkTJAPYGO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=HUOEIRhC; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6db2a9da800so28520437b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 19:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368160; x=1726972960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHgln3wQkLMw2wtycnvxZvj7Igj75ioqXt+PI4X1eXk=;
        b=HUOEIRhC76ZYsBpdooa6/Hj2yeAhrl5bqz07PZ55V9osC3xsoYRbbsAKdByqEAXB6U
         K0H5TNoJnOJ84x2lc+SPik7mIbS7exDnZ7wh5v3ZY8Mt9taoSuHH1I1Kn/ezlFWKCGsl
         s5jgYw/YR5PUSd2uz2Nsi1lyXtN6GKHwzY6nuLJpMHDqRW4pT6sSADBDXSzqHkDMtDTa
         z+OOXooKSiF0U2yPXZeqEvFU/hqK6ztJjsCJPK1okRceUL0K7ukyH89wjwVOdGWHoqkJ
         RXAdn5kYPqouQozIvuCrkSUN0tlWPrxrrL/0Dj46bqzZAw//mMAjlm3+gbiTq3bNV+UX
         8/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368160; x=1726972960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHgln3wQkLMw2wtycnvxZvj7Igj75ioqXt+PI4X1eXk=;
        b=b1ggtCTGcfQHYGShA8tE6AZlTFh7WRC8ezYGtaN5bvXh+saVh8ykMoFxA4Lw23qVnn
         7MVVGsX7cO66XpF/zNYvqLZo0N2M5U2PgwevBFqwXzahyb/rCNA3g004gVxowYSQwkMT
         UuOCBR1QBBSN4VN7hnv/F1M4IlC+daFHjs7x5C6Fr0pmmBA3XPdBkojUGNDS1C/ucCE3
         fGNSoApJZ1H+5I/+lXZzuZr2goL6Z5fNhxwzKbBgNBoYgRV8e/ACzLP1zBM9HbQPcaKy
         YWv5WI8c7lZG0XWyvdr+rfLPzE8tVtKKYATlvQDc/TCYZu8G9jyUsWx5aBUghjW7y+Vp
         ubRw==
X-Forwarded-Encrypted: i=1; AJvYcCVI2SSz+xx07AdZPy6lS5aqhfBIl6HYIi0zHV4MvgAnxcuSN6gjoqyIZWh0tggz8zquyAYNWyX0E6Vk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zllUComoE57cUjBG+5MdwoLKRkGvC6OCa/82GVOprdyyMOVz
	yRFTPd0f7n7EhN+p6TsALIFAqSfyOQ1bxgbgdzkYuJAPlGgbBnvR3Rt2PIuIctk=
X-Google-Smtp-Source: AGHT+IFaHdrsdHOuCpt6ydJMZ8/6aD/aZlY/iZxg9AFVDXoiT62Bt99GdZSap1940+IAiYcKZgw1yg==
X-Received: by 2002:a05:690c:498c:b0:6d6:afe9:d818 with SMTP id 00721157ae682-6db9535bab1mr147029077b3.6.1726368159686;
        Sat, 14 Sep 2024 19:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:42:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:51 -0700
Subject: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-th1520-pinctrl-v2-3-3ba67dde882c@tenstorrent.com>
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
index 3c9974062c20..9367754eede8 100644
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
@@ -357,6 +363,13 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			thead,pad-group = <2>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -393,6 +406,13 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			thead,pad-group = <3>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -529,6 +549,13 @@ porte: gpio-controller@0 {
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


