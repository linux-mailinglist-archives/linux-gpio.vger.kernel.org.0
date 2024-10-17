Return-Path: <linux-gpio+bounces-11479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 155929A168F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A55CB2152C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECAD111AD;
	Thu, 17 Oct 2024 00:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Na78Rte+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0D184D;
	Thu, 17 Oct 2024 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123720; cv=none; b=hV2lMXtZFjT66xUwGL2auYXQtd8s/02tvRb/7Titnb3ZGz8P8L8F55a3D7wRHYBNdMp6GG0Rz9OBWoeaLfeJuYjoaoqPPccM023YSJp3LRAF68NE9y8OZvNDTswyFXO1JBoYYd5cgca4fY9eupaLGBgqFqVt4MUmlhT5YHGICoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123720; c=relaxed/simple;
	bh=MeweiKooJ6uVvq0NEWrZYqTFp5OOCPxHXRqsXdmpDVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYOk7zxhzfOUzlyRMsYOA79J+BDxg/B8A9BMeeZnMy633V5Vtdsu88WCQNi5nOcX7AxeoT8mSUUU/Q1Y+VyQ1WdL2vaaSkdMc1iOK2nF0/Enr3in3DBNuP1zWsicwVreV/jk6AuyaLJg2pbwwjqKlzP2Imz5UY7AgCz1udiNtl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Na78Rte+; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9E8EE88E5F;
	Thu, 17 Oct 2024 02:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123716;
	bh=rVUNiDsl8qiK0QNZu4GKqjxmkuTSCEzw2w+x4jgqAgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Na78Rte+rPHgt7jkp3bneJ5c5MwN3879XhdYtBX04FXkHRf0w8B7zLlYb+v3QRa6S
	 ENQIHPBtrcDB078GagQnyIU9dDfo+toztNybT88hcWiFi+h+0l1PzYRyGG5JTVRPCZ
	 mIjz2bTJnBW/CJQDOjysPVCVqWP7UhCkBbgGjBqSIjN4GjzqaRGRdhsM7erO+Pfk/S
	 rRFlbVKi6tzWHA+swYTqd93tu6QHr5Dj34XXwOlb6SPz1eqOqC4bPIeIEKUdYhyWRM
	 2+oN59Lv0QzexK20tpAduIYt3ExNNpyXdxfgLPx10+6QY08+gZxkNhvWMXLVWltiyG
	 cuY4wDXv7aRNg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
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
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 12/12] ARM: dts: imx6ul: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:58 +0200
Message-ID: <20241017000801.149276-12-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017000801.149276-1-marex@denx.de>
References: <20241017000801.149276-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Bindings expect pin configuration nodes in pinctrl to match certain
naming and not be part of another fake node:

pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Drop the wrapping node and adjust the names to have "grp" prefix.
Diff looks big but this should have no functional impact, use e.g.
git show -w to view the diff.

Signed-off-by: Marek Vasut <marex@denx.de>
---
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
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
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


