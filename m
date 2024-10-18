Return-Path: <linux-gpio+bounces-11597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 387689A3818
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 10:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BAA71C23DE2
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840FF18D65C;
	Fri, 18 Oct 2024 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVvzFII3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12918CC16;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239054; cv=none; b=OPP8hsngftImkZnZwtddo736YpY56O/XSmlEQat5FXtQh1Mz9dXtTwbb6q4OeOZTXz976Z8YyB1MwfwSgpFdX38xKcn2SKgwuzENd1nh5JCC9/qKqbMGiGp4SdxvDngOnoGuIHvsSyraemiPdTUAZ6HyyN5seWMCr/CVtjXOUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239054; c=relaxed/simple;
	bh=4lRaP8QuPRYBMLT0wKMG6lQBbklppLHQ8jODgVosIp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/kPECfO56Q+VpfDeStttUvDRxb+5gqK0t4j+0flYYrTFFeLpG7CeudZ3a0Sp7wPzIyJjnTCDJPBeNmCleOTA6KhmvHxGbj/MuvsIkUu9/PzVTXlDw+9333nwD0o5uN1EzsGOW8LXSMhqcxuju8G18s8uRfYYg5BhWZbnQVrprY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVvzFII3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDE35C4CED2;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729239053;
	bh=4lRaP8QuPRYBMLT0wKMG6lQBbklppLHQ8jODgVosIp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QVvzFII37hOt8aY1vYXY4ArE261Cksq9TrwnZw/db8OOGGaMWvuZlZX+UTU93GsLB
	 N5O4WWA3LbxWoJBxDhiiee/L16EVvyOzBr3jYFVxkuDxcntex8tDDG2MtmNhs45XgW
	 QBsqgw37sW4xkoI3VeSosviA/QCfM4ReKgxTYNMstyIZWsHz0Hi8fS8IDAV3V+MH4A
	 HGXQGRqGP8VUgilE74xebue7/Dlb9YgQj2sE//We5gln86PYJ6IiFhSWefKmZ8dtOO
	 FADllkph6AVKyjQmFmvYtcJ+bx/pZrobO9hoKOLBxZW0FBsYi364YFCsxwVQ8FYfvR
	 qd8av6hFK9WSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2D3D2127B;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Oct 2024 16:10:52 +0800
Subject: [PATCH v3 3/3] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-a4_pinctrl-v3-3-e76fd1cf01d7@amlogic.com>
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
In-Reply-To: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729239051; l=1373;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=0TyPdSWayWVTMUykbXRDetRSywdwa5DK/B9vqJRVr4w=;
 b=ZqOVlZk372JHtgitbR4ca7CgNHxcIlTajIDPZZVvZ1OnC72L63RTbCmyO277r60OSaQuGKyX1
 BBXGLi5vlfXCqaUcB3Nzj8lMNXg8uWObiBtREPa2nlYKaL45AfBH+FQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..599635eb86d0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -48,3 +48,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&aobus_pinctrl 0 0 8>;
+		};
+	};
+
+};

-- 
2.37.1



