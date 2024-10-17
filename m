Return-Path: <linux-gpio+bounces-11578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAD9A2F61
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 553B51C20D4C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0239922911D;
	Thu, 17 Oct 2024 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Fd1RuOkr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD91F2281D2;
	Thu, 17 Oct 2024 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199600; cv=none; b=k+Ji4g52stjz/pLYXBpeiVQZe9bfPbanIYdaPksEv9Dygo1nUyqUK+axJtqHCZ5lhoUNN/t6CfGLpmoz5SMF/yTr2IaN5juxUA1+oIycbdgxo6YLNyZW2F3Khw770q8m3pdJ/eVGZlhZy0SXZQlNm1NY3OSqpa6oTgpQUrKtfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199600; c=relaxed/simple;
	bh=mS2c1TpES5TF/xE9PVXO3MCApR4OA0SrbO2iU45/9f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrqSZrlJdEOOM1jDojIt3wOnJOk2orjfUJnNulVbydY7c/MDeJCmIUdEJsu87Hmg6pDu+a+z6ecbr/HwU05rwIUdoa4DKDGemh9OXSk9J1lu0j4fWYW2Hhp8+rKgKq0gGFW8KyjPYY6gci+23P1MhtvzTFdbpmAVAwsxqMX+l5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Fd1RuOkr; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2B9A189093;
	Thu, 17 Oct 2024 23:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199595;
	bh=ZmL1xFgsVud9yFvtqhiJwX/QABib18ZZmqTfyDgCi+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fd1RuOkrSzzlCnaMmnQgBEOrXOZO6fqwUt43X6vQeJnKLlhgPt6s9PX7ImrEP08Lx
	 9Jioiu+6+ljnRd8R8KKGgBiFsLDTRelw4ucpTYRY4md2+xATtT/nXMqZn3W9sggXG3
	 i43b7KEtGukW/Q4wiUyUCaQ33/E5pVT3iF0Vkrsy7TkEkrvUChYnQorN78fjnsV7a0
	 vW+cdmEGFMWk+Nz0xsTWLqRW3cGxGMBpntfia6/T+JpvArpfKmmcfje7rPsEz3qi2J
	 /RgdfmwZVrjSmd/TuQtxI+YtvDrydThPwSa/q11yhSc5tv+bBZ6XeuqoDPSA6R36WL
	 RTwT+hkAe5mVA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 12/12] ARM: dts: imx6ul: Drop duplicate space in iomux node groups
Date: Thu, 17 Oct 2024 23:11:29 +0200
Message-ID: <20241017211241.170861-12-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
References: <20241017211241.170861-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Drop space between node name and opening brace {.
No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
V3: Replace commit message to match reality
---
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
index 118df2a457c95..4c09bb3126966 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
@@ -322,7 +322,7 @@ MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
 		>;
 	};
 
-	pinctrl_stmpe: stmpegrp  {
+	pinctrl_stmpe: stmpegrp {
 		fsl,pins = <
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18 0x1b0b0
 		>;
-- 
2.45.2


