Return-Path: <linux-gpio+bounces-23946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39477B180EE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1026D189BAB7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC89266591;
	Fri,  1 Aug 2025 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pJ7tz1uW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF222D9ED;
	Fri,  1 Aug 2025 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047099; cv=none; b=VO8TQ3T9WxQ4gOfMd7cBD/bGL25cG4zsjbvFfxbESN3hUJfF1eASRQJYp4/iPD8JJMSnsWGQklDSJAAHoRQOyFPo9mJ/msotBZ5rcwls7L1Q4CmQ1lEkk+TSYJp5qChbIl/35Q/sSbcLUFFaenJxuwH/RnWPNCraPChkHoYAUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047099; c=relaxed/simple;
	bh=T6KtWc71Y7qbuML6Qis9tsMmmj0jC0rR2IZxAIr/RGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJrZFzGqfdKp+nMaXBXXZZwhuDx78UIWDlYRP9vK9zLKJftepE9jpiOuDfm/FK91r0ZigEog+VecTblq7oHT8kRWcbMXz9RcxS3DF8KVYtW+mjFPg43VYXYOAxH8hiJW195uINMTkZN1D7zybPKunjHuOSEq5g2qzh651l6SDWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pJ7tz1uW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047096;
	bh=T6KtWc71Y7qbuML6Qis9tsMmmj0jC0rR2IZxAIr/RGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pJ7tz1uWPrkslNeE5KblpPKLMPa8+dYuxJJL5myyodeIfSEJxlDCQ5Zs2jQzeM3Y/
	 K8PQmx46vJfp9RhDfQEJgrJTg9m/Ju/+HdW6LOzYPQRtXRw55YmA0tkqD4ggkH0Ziz
	 tog33ZJqvVpgarA3+t6qtYdvmFXQbedELp0kRul/nKr76LloQ1Fo8B3a1N8TLjdBxF
	 mCjoKN8/8WYI5PB9aw0od4CXjdyHRlbvJ4E/xG9xYM/nkBVCpJx9O3eGabBWw9j/6g
	 ceHqiQVH8fHRsu7E1iJI5j/C069ZPTO75sQ+/Q4Eu+S/cpsrXkvA1UCevJqCp7ocbt
	 TMgfoQVvznEkw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE4BF17E061F;
	Fri,  1 Aug 2025 13:18:14 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:10 +0200
Subject: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The properties `mediatek,pull-up-adv` and `mediatek,pull-down-adv`
were using incorrect values like `<10>` and `<01>`. These values
are parsed as decimal (10 and 1 respectively), not binary.

However, the driver interprets these as bitfields:
  - BIT(0): R0
  - BIT(1): R1

So valid values are:
  - 0 => no pull
  - 1 => enable R0
  - 2 => enable R1
  - 3 => enable R0 + R1

Using `<10>` is invalid as it exceeds the accepted range.
It was likely intended as binary `0b10` (i.e., `2`),
to enable R1 only.

This patch replaces incorrect values with the correct ones
and removes the leading zero from `<01>` to avoid confusion
with bitfield notation.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 400c61d1103561db6ee0fb2d2e1c157529d03206..02bdfdb8e53c87dba0ba0024e0c69fcee825552b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -574,19 +574,19 @@ pins-cmd-dat {
 				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
 			input-enable;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-rst {
 			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <01>;
+			mediatek,pull-down-adv = <1>;
 		};
 	};
 
@@ -603,25 +603,25 @@ pins-cmd-dat {
 				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
 			input-enable;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-ds {
 			pinmux = <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-rst {
 			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 	};
 
@@ -633,13 +633,13 @@ pins-cmd-dat {
 				 <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			input-enable;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 	};
 
@@ -652,13 +652,13 @@ pins-cmd-dat {
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			drive-strength = <6>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			drive-strength = <8>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 			input-enable;
 		};
 	};

-- 
2.50.1


