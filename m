Return-Path: <linux-gpio+bounces-16763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9FA491B5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1C418935B7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49E11D5170;
	Fri, 28 Feb 2025 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="SIuPOk3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA651CDFD4
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724866; cv=none; b=ZQ9SWKUcftZtLnKp/7VcyoycV6W99tEn57+jQ4JCRObaB17QVE0sY3AOTZ/qNe6Ud9/ZK+f7zpAyKQMeE1SdcWIXMeFrh4jPmk3sRZyNWWPPNY/w4OtKng6lIgbCFm8OyaGEEVWLc9NJ+dRwfJpcR84Am58z/mUMW1cwbeL6CdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724866; c=relaxed/simple;
	bh=+Se3hzcxltQqG7wGkSUeYBocE0VirOcVIliyTsxeR9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3uABVi/7jqk8d1duoh9D3TjZMN7tx9JLn/0tvse6KoqJWFOtK1iZMyVaTFS+dVLsKz3iJPz5DQbh+Y3m57OCj0PwPSIQh3E9572KM8+1cq8gLQm+wXtf7G5/unx88jgSlktmm3wc4w60u9UBMMrxDiyckenZB5vvH0ekf/7Y8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=SIuPOk3l; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724863; bh=LFxsWR3l8emE9VbLBSkEoA10aFZjqSCs6/nvHtvdILw=;
 b=SIuPOk3lP2O2C32iK0TQL6bkiLuFv4+4/SKLVADPTq5B3bR3AzihWkfS0e0rJTv43FoIkG68l
 ubd7H2DudVQKh0yv2H7FombrOXtqpB9N5vjiJkJqS/h1OtYDFD3ko/EL5BZ8vEwlHTIdJNOauKa
 Ts2cYBgnvC5fWo16HnvRbfxMl+8nLsZIjQ2601qT53YbcKT341lWWwijZ1SOKjbDnq1vkujNoVW
 m8g/ROjrrV6/Q9nQQf9xcxedXFsEibllUAxUdwwG0owWqPTedKzLw1OnCnmWP3/wi1RhS5/1Pct
 yRnQhjLJH3WDRrA+/UZD4I9rMt3I2zH1uk8JvcQPLaLw==
X-Forward-Email-ID: 67c15a79bcf1d1bd23db021a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 6/7] arm64: dts: rockchip: Add user button to Radxa E20C
Date: Fri, 28 Feb 2025 06:40:12 +0000
Message-ID: <20250228064024.3200000-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Radxa E20C has two buttons, one SARADC maskrom button and one GPIO user
button.

Add support for the user button using a gpio-keys node.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b9a66c6a1dfb..d19e319b4100 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -32,6 +32,19 @@ button-maskrom {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_key>;
+
+		button-user {
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
 	vcc_1v8: regulator-1v8-vcc {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -62,6 +75,14 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 	};
 };
 
+&pinctrl {
+	gpio-keys {
+		user_key: user-key {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
 &saradc {
 	vref-supply = <&vcc_1v8>;
 	status = "okay";
-- 
2.48.1


