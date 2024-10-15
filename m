Return-Path: <linux-gpio+bounces-11382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7499F8A9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E541F236EA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0514D1FBF7C;
	Tue, 15 Oct 2024 21:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="Ezo3bc8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BD61FF04C;
	Tue, 15 Oct 2024 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026321; cv=none; b=R7BPitCDpIjCnJhEpA5u4vH1wnMMhRznC0tH4+d1IFR6iCmG1cnDCzBT/PWjUYB7jD6T0nqKBm/Cf7lF1APwSDwgxl2xU37fQyplu/PwkctpXFYhq7M4PEephVCinCbKQM7VvT7fTbjN6TEBvz22il0FDssFTIBurQWHOgmx1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026321; c=relaxed/simple;
	bh=YscXqSr7g4C+sT65nIZWuK+o+u4BsXRQprc7EXuU42M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ki7HLR1a74EjKVV3hqlH5Oj8JauGPW0WkMKl3IMTOqw3kKS2jPy4ad9+AY/v/AcBFGk8gvfy0hLg4azxcU/YotQg9rojXrFGC+odU47yD9/iwLXolrhd7SNJFVMDJyHtDq7ByD8M9gX5ecGODKvdVKoR+10aegxkQblgyJMN1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=Ezo3bc8y; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmp70VxNz4wK0;
	Tue, 15 Oct 2024 21:05:19 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmnz2HWQz8sWQ;
	Tue, 15 Oct 2024 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026313;
	bh=YscXqSr7g4C+sT65nIZWuK+o+u4BsXRQprc7EXuU42M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ezo3bc8ym01UpzdOoDEQyfJ//SsxyF8EBGooaGqj0eT3dipKXE2Dt8QvjpRsKqGsS
	 e8JfnwdR/QjALgPpqjlQd2do5N7QRsUjtEe6GsTC7uMWM/JPFiBdy+jWcGEorxeTqe
	 cpNIxOi3ULHcXOtqTRlm46DPWur8+KnEpGTMk/wPKdH3KqwV8vyvwZOTzhUxrTygTG
	 g+Uv8lY3fFB8LjQgWGqv4EMRZC5SVCtU5eaQBavWVbByaTgHfYsd6TY4ARSOfrZUf3
	 GcSk12ygxNjwgFTz/jJbw2sD6WtBA4jeRXdZ9KH97Y0KI4mMbwz3Hycb3PENwPFbPT
	 fVUPQOuJtMnrQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: exynos: Add button support for c1s
Date: Tue, 15 Oct 2024 23:04:50 +0200
Message-ID: <20241015210450.964093-6-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add button (gpio-keys) support for c1s (SM-N981B).
Added are all hardware buttons (vol-, vol+ and power).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
index e57339357dc6..36a6f1377e92 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
@@ -59,8 +59,57 @@ abox_reserved: audio@f7fb0000 {
 			no-map;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &oscclk {
 	clock-frequency = <26000000>;
 };
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.45.2


