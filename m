Return-Path: <linux-gpio+bounces-11904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E29ADC7A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C32528153C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F158018A944;
	Thu, 24 Oct 2024 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA3evVwR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95818A6B2;
	Thu, 24 Oct 2024 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752269; cv=none; b=n2uh/46ZKv9SyAqvtNLuoUFLUfSyeeRAkXohtSazPWCypEKXSfrecDg/gCge//s4vQwgPopYSAavXUqrxuEAz+CWbIhdmINeVw5DHhsF5xfxYLnk/hc2AOHyxd4yBllyHrnHSZUZcfBGuzj9gOiM+zbU/KC2HbSoIb3VPgOOsmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752269; c=relaxed/simple;
	bh=eWfDdwKivXZw5Y6xfHEFXAYJCI5V+vhiPZqUtjm/G8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCMtkqmUsAqgVcx9DctN3eqwLVo0iLeemDjI5JPlBYONulRZaA3X5J06ZJTmZUzhDgKoDTvmm2PVhWvYdK94dU0a/lL5rhV4bnKqRSBGrMa7ruoitd4Yd2D7c8Ro9VmfxYdaUwdZ8a3oCHlIgIM+nDvvCqK/Niwftoshf4UDmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA3evVwR; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso475309a91.3;
        Wed, 23 Oct 2024 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752266; x=1730357066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bay9mS60FeLiI1d5QqZKnl9EEsDU1Ul/yUOBCdDGZ8s=;
        b=cA3evVwRgfkV+JR4fJGKEIeaenc/4hFXJjSgihBwcEua2o2dMeGGUgjVmO4K6bvNLS
         iW4asNH9RBtKPKiqFJ05gfGZWAmmapfR9uz+kVe6WDmx17798QaBdZlTsi17jI00SHT/
         YePQsWBjTeiNNBR58VhRV2lSreo2mcpY7XBa2SupsZuwZ5sXXnvQ6FKmmgtuFuLJOfjG
         UqcAf8So92s1zNq0abiOKtIumtTNkBRoHc3vEPSJfUWfwEOMO1tkgB+cmbN6AR8cMaiN
         Ml7AIkFuzdcuo2fC9c5GMM8fKiO12YQDf8gonfYKiTpMq8aQXSz5Ta75bxICvMLPrl6c
         58bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752266; x=1730357066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bay9mS60FeLiI1d5QqZKnl9EEsDU1Ul/yUOBCdDGZ8s=;
        b=XsiBub8qWVawsGoWEIRGpearjsB0qfzpkCBcmQgyi0PSktCeYQ8Ny6QtdAy8/YC/hn
         3c9NYnFafCcRvvgihXGU784NvrTVl9vHXDu6b1IDL9c8ZfP4htnRsaECk0mEePNShasb
         9nc0FuH7W0ErnoJr8R7F6CHfVnJ64vpGfuizMWUrDK8MLIkyekcl4lxPPYBlhDOhOvcU
         exAzGMJGT72VEoDcSriNgNSw3nnJlg6ix68TD777oUtgWp7n0hVvBZjlE6huAve++x6L
         egXsXaMT4bx/yTInSIi3ANzM85hFuYD9G0RxXkrHHWPXIgHLlXpzSc4MU1GP8XvAjJne
         Lscg==
X-Forwarded-Encrypted: i=1; AJvYcCUB0PpwhQdrMpiapVq6KbhDY+v4nGNkCOvUmgqpbTFvhbwfHEVmPZIDueYfw7vD4srkeVqOihBzTemV2sQy@vger.kernel.org, AJvYcCXNYKD3rVvi9L7EkHsFcNekuxDUvwLF5qyMql15nwggRj3NarUstkHR7QhnpmQFuiUnMnMXJtbDgVYi@vger.kernel.org, AJvYcCXwsoRJYDrw7JnOf9+MFf9xjHJKGcFPhrWtWVzaZ48y9jdtoTDKtUKZf4tiO3ct3VKzEUHOMjP3Cx3tbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwdv30RLTIu0xXLSqv9MwoaLDTi04F87p+k5iH6Pvo5qqNgz0D
	YgG3oatM5BaLQlP7Olfj2LnWrHcE4muMqPIvK9/umK87hq2iMul7
X-Google-Smtp-Source: AGHT+IGvAXNeAgZ3B1Vd1rJpFjy1izpP8sqUkL3InWyofh+5HC6lm8M8dvlziCEjoiCDn10yt0EIlw==
X-Received: by 2002:a17:90a:6001:b0:2e2:a3aa:6509 with SMTP id 98e67ed59e1d1-2e76b5e2403mr5546364a91.14.1729752266180;
        Wed, 23 Oct 2024 23:44:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76dfeece3sm2649693a91.57.2024.10.23.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2042: add pinctrl support
Date: Thu, 24 Oct 2024 14:43:56 +0800
Message-ID: <20241024064356.865055-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024064356.865055-1-inochiama@gmail.com>
References: <20241024064356.865055-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl node and related pin configuration for SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 72 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  6 ++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index a3f9d6f22566..0654bcf00a52 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -27,6 +27,8 @@ &cgi_dpll1 {
 };
 
 &emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
 	no-sd;
@@ -36,6 +38,8 @@ &emmc {
 };
 
 &i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	mcu: syscon@17 {
@@ -45,7 +49,73 @@ mcu: syscon@17 {
 	};
 };
 
+&pinctrl {
+	emmc_cfg: sdhci-emmc-cfg {
+		sdhci-emmc-wp-pins {
+			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
+			bias-disable;
+			drive-strength-microamp = <21200>;
+			input-schmitt-disable;
+		};
+
+		sdhci-emmc-cd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+
+		sdhci-emmc-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
+				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <21200>;
+			input-schmitt-disable;
+		};
+	};
+
+	i2c1_cfg: i2c1-cfg {
+		i2c1-pins {
+			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
+				 <PINMUX(PIN_IIC1_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+	};
+
+	sd_cfg: sdhci-sd-cfg {
+		sdhci-sd-cd-wp-pins {
+			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
+				 <PINMUX(PIN_SDIO_WP, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+
+		sdhci-sd-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
+				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <21200>;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-rx-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+	};
+};
+
 &sd {
+	pinctrl-0 = <&sd_cfg>;
+	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
 	no-mmc;
@@ -54,6 +124,8 @@ &sd {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 4e5fa6591623..107565f22f79 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/sophgo,sg2042-pll.h>
 #include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2042.h>
 #include <dt-bindings/reset/sophgo,sg2042-reset.h>
 
 #include "sg2042-cpus.dtsi"
@@ -181,6 +182,11 @@ rpgate: clock-controller@7030010368 {
 			#clock-cells = <1>;
 		};
 
+		pinctrl: pinctrl@7030011000 {
+			compatible = "sophgo,sg2042-pinctrl";
+			reg = <0x70 0x30011000 0x0 0x1000>;
+		};
+
 		clkgen: clock-controller@7030012000 {
 			compatible = "sophgo,sg2042-clkgen";
 			reg = <0x70 0x30012000 0x0 0x1000>;
-- 
2.47.0


