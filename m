Return-Path: <linux-gpio+bounces-10981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02399337D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52870284896
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8071DC728;
	Mon,  7 Oct 2024 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="cSIdmdZ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE181DB93C;
	Mon,  7 Oct 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318970; cv=none; b=lwxxh1mBSUH3c/nxePte0CfObu/30zFJOkzs2ZvPjircjvrH+dc0VHVjv6wqgMczdYSH/Wpr7VpIAb1Ig0tWQKe3hDHEfLhnRYyrBYL6qDLP8uDRMiogEf89y3gFj0v0RRpyJSyLgoIY93wcRsJALHgjyfYPP5NcYq3LpyrLdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318970; c=relaxed/simple;
	bh=PhBj+wNzXsN1aGTsBhnKKXX8YEocSTT0n34v6ymqBSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfSXxnIFJ3QONFqzhD22vY6rwajFqZ6JtEWkRwQ5Rp1ZBWH4BYH2F9OOF/MF4GTrqAbTIn9I9HwzVUx8E5Mu1TBDdgtCGgl0WmTBtdGz6MZTwpSG5w67ItaSYXMbDg/Dc71M6SgAheHehZ9bABNJQ4Dobu/bik2Q1Vjptaliuew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=cSIdmdZ3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5AA9523D49;
	Mon,  7 Oct 2024 18:36:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz3SctvFecTB; Mon,  7 Oct 2024 18:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728318966;
	bh=PhBj+wNzXsN1aGTsBhnKKXX8YEocSTT0n34v6ymqBSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cSIdmdZ3CiCTM3kPIsdLL3zd7YI7IBSIITsfmieUUSddHorkMrqmdZwKFjIkmpDZx
	 2Cktl2XCewp/03jT/k/0yL7PU6Wu0uD4kg+m7t8S5MCVxswPu4nyJ8z7peCvovfaz7
	 JXMpzbPD8D+rgGVka4aY+KNwb4IZwCY/6O5v9iLLCbvImf/T0dulkEscQwi6k6yGM1
	 WQpQ0D39MPlNuHSd+/Ms4BZ9qenAO6iUx8vEzcgiWzBUJwCNFxDzCqXQu0RUozljf8
	 dTraDgxGhXwg4K+J5WHjy2FRu9lq1Vzi9TaDC2tpczC/TNVXcohFJiT77PmRDVmm0C
	 0uOCMB2EJOqjw==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v6 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
Date: Tue,  8 Oct 2024 00:34:13 +0800
Message-ID: <20241007163414.32458-5-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some ipq5018 based device's firmware only can able to boot
arm32 but the pinctrl driver dont allow it to be compiled on
arm32.Therefore this patch needed for those devices.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 drivers/pinctrl/qcom/Kconfig.msm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 8fe459d082ed..65cec6c50994 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -24,7 +24,7 @@ config PINCTRL_IPQ4019
 
 config PINCTRL_IPQ5018
 	tristate "Qualcomm Technologies, Inc. IPQ5018 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
-- 
2.46.2


