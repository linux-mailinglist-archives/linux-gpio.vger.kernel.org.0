Return-Path: <linux-gpio+bounces-15695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FDA302D9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 06:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3575D3A625C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 05:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F6F1E883E;
	Tue, 11 Feb 2025 05:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSnNxxZj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDFC1E5B72;
	Tue, 11 Feb 2025 05:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251126; cv=none; b=aB+sasWyGrxQqdL48xJ7yIclwWFZQr0vMY07wowaj2NZaxApc/FFOfIeoL4e7yZdJtFiLRoXsfCXKyroS4ZoKxmCwGMrbeEiZAbRvKA0WpxnbOXXoFHztP8u1EGh6bxozIqDeD8OLjFYQVHG3hbaTJrHcFtq/uBziTX/ja1prKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251126; c=relaxed/simple;
	bh=IHUzeNgLbQBjAkpIh4Ca6I3jPK0IjOmUeGeV7yrmMPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIQuLnxnQFgJzYRLCszCr6J+otYIQ/N6sYf6LEnkLWipFmrPexA2UJcKsKYkEQ126MIGKF5atNJKwDGooAPGp3n5nuNGohinNPM/5IyrKSL5GI6OIQWfPTgHcryUkNsgjCDxbp8ByZlfO+HNlcj5Rhn/RX6FWidDsTMquMj+Svg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSnNxxZj; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c05c2dc5ddso197520885a.1;
        Mon, 10 Feb 2025 21:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251124; x=1739855924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9a/XI8nUmJ0m3ojAWn0RJ8VqdbALaTRgX2keukdkZc=;
        b=ZSnNxxZjfuqoXY+tTq01IFBR36aqVrbIakg7TqZXObCWjVOKF9bBwxZBWIsSol+I4+
         D6vD68NXK/nTP303hyo5WhfuXe3NGxuho74UsAOppBuTAhcpRkW5P/oGO4WzPQqJVeA7
         UlccXW+dA4BitgZMs6dg2IuaoFxmZriiD9WVt0BJjGM3B6D5IjhMcrkjGwEGr+iiUqOo
         QnDP0GrrVRnIaUVkx6H7dN+ZE95XBYrcN+apEd9BxToFG3J5ujdWwrlrcshpoLdt6I4p
         DjmE/H7Af/7x0TSldpsxWFRygtmRy7RtLahAkE0gay7PaWhdlxMIr/Ds2+sXghbsz77Q
         NlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251124; x=1739855924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9a/XI8nUmJ0m3ojAWn0RJ8VqdbALaTRgX2keukdkZc=;
        b=Joip6iiPt2ov04pkImiql+AwtfR/eR0SCs1YXdU2C7xvDtyobT1kwHvDmW3cQicei3
         UXyAyXsVemQzNWPQRS5AxqGON1i4XGKqTmrouudIVk4qQ9dimEipOyl6xZIjiURcMxfI
         VhH98H2rEWsk4qFRZIE1Mc7yvgGNeR646RLB2Q8YrkzvDB7BCGy5B3jnhUD1zpR7qoT2
         qtAzz+Rrvy+k1idvYKfvzPz5qfqUg4KVk1Y3ay7ueyBWmmW6NJIBTcD/UHXuDMKXggof
         ezewTyN8MiiTPAvGd5f5UHOgkqae0oK+8ZVfBmRDfEQ2hcZYvOGfQyV8b1D+46uH5if+
         v84w==
X-Forwarded-Encrypted: i=1; AJvYcCUdmym5jDUQxMG9RuIKPF0xfGOz4KJxmXBo9AENm01yFgOIa1NAYp7FMmmJlroSOzkc8WE7QT2cdVWWzw==@vger.kernel.org, AJvYcCVOam5Lz0j9mLI5EZYv+xlpD9wF27bHQi46UXOvslJJ4kgxbAFA/KPlimTT8AxWLE7L37rTrYDLI0HX@vger.kernel.org, AJvYcCXFmOQXg6DgNsZLi5rU6oNZolL+ijjTfgwQuh3oEzn7dWmI6f2BuaN37g9OZiuJxnPD/EVJx5S4VqFWIFH3@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKlwWme+t9syRp8v3legwcg1fvQ6Chk+VKXjc19NbM/r+wzgu
	gisoWqLl/VJH8ylswZpMBwKE3uIj+AdahRwf29EpE19ppiWajq/H
X-Gm-Gg: ASbGncuPffb4eB1ntlPJNAcMsGcG6OGzF8BofiBoXC1AZfg3qnAuOUlgeyRuudnZRa5
	jMUxAw9B4Dndq0f1aAFogTqtnim7V5EccSgp1XF4KipsOcqB9gFrgobkDQjOn9Sp9xeQRCF+Vd5
	5QpuQP7ILrJIiwZv1v3XIkKaMmZMOpXDqf3hGc/mIOKJRnN8I68D1CJVoRu/Z2+TGuZPz4S9ioX
	aUY4g+3f0yt6OwpeE/IKiwa3CO6ISM4QqF3AKBNvxOqu1e/9c6reJDsDD0f4N1YQ2s=
X-Google-Smtp-Source: AGHT+IF8RD8sYCPfHojBOSb3Bevtt7AgKe5hJyuI6s7bYeF2WfCLnOJzuuudlCz/10cter+ga10QrA==
X-Received: by 2002:a05:620a:4454:b0:7a3:5f3f:c084 with SMTP id af79cd13be357-7c0686fa3ffmr379450785a.30.1739251123960;
        Mon, 10 Feb 2025 21:18:43 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041debe6bsm623193585a.15.2025.02.10.21.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:43 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 8/8] riscv: dts: sophgo: sg2042: add pinctrl support
Date: Tue, 11 Feb 2025 13:17:56 +0800
Message-ID: <20250211051801.470800-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
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
index be596d01ff8d..a36e8843ab0e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -42,6 +42,8 @@ &cgi_dpll1 {
 };
 
 &emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
 	no-sd;
@@ -51,6 +53,8 @@ &emmc {
 };
 
 &i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	mcu: syscon@17 {
@@ -60,7 +64,73 @@ mcu: syscon@17 {
 	};
 };
 
+&pinctrl {
+	emmc_cfg: sdhci-emmc-cfg {
+		sdhci-emmc-wp-pins {
+			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+
+		sdhci-emmc-cd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-emmc-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
+				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	i2c1_cfg: i2c1-cfg {
+		i2c1-pins {
+			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
+				 <PINMUX(PIN_IIC1_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
+	sd_cfg: sdhci-sd-cfg {
+		sdhci-sd-cd-wp-pins {
+			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
+				 <PINMUX(PIN_SDIO_WP, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-sd-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
+				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-rx-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
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
@@ -69,6 +139,8 @@ &sd {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..aca2e88fcb63 100644
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
2.48.1


