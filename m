Return-Path: <linux-gpio+bounces-10757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57698E6E4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 01:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA923B22E0B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 23:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572B01A0BCC;
	Wed,  2 Oct 2024 23:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="J/RP4PNO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8780E1A0721;
	Wed,  2 Oct 2024 23:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911785; cv=none; b=mO6HTNi0ks0JswU/tzRcOXvLm9ZoJC9tSS2Sm4nbZUxi80RZB5NQqCh5JRZHGkbIk4+bmRIZlXOTDoMj4nDmz6FEEe6o7hVotF1NL4Xm33X2c3DDAnZWe4olIB49bmuyWMET42mwQaRSzcsUijmJV3SYHxlC2qQEOvwkdz3XTIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911785; c=relaxed/simple;
	bh=kkbTx5Cgt7G+P6xs+9X+HNQrS0uHhWMptZCOhmNsQ4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGdJLo6JomJuwxfT5Ltid0HgnsFPJxJb8l1Igjo6PEXeLRMm0Agze5V+xgspEmzY2R/l92Tjwfag1h6zeV1+aZgX8B243lwGruwJJJ6ONNsRBhi5+htLDxwUE3suiKRuor+tO8eP7elHdHZU4Br8k99U8rqAohOOCbh7YezBaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=J/RP4PNO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 139E823DBB;
	Thu,  3 Oct 2024 01:29:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZEmvX7piPTo; Thu,  3 Oct 2024 01:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727911781;
	bh=kkbTx5Cgt7G+P6xs+9X+HNQrS0uHhWMptZCOhmNsQ4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J/RP4PNOUdbAD65XBSbIv1HZJeMxgHnb5/K2CJHePsyRwTfRLgjYomaMC4OoTItIg
	 d9rkOBE+JNykj+vqqWrR4fGomXbC47nGX+5CEbKOA2o41JtV9esgvQitFLsDi7OSmg
	 acX+VS41Bu51C1k+o4ehmdepVs3R0vvphNxBn1c582CluJzH20D7fOgIbCX8VTD2Vg
	 FvE5ofBwtc8MOw6nkmmGs6g/NwhLnbKDxEE5D9SnfP+r7xu6pUth+7j3fuIa+kD3v8
	 3fPsiETVpJ9eEtHqmn62aH1SkWfcPL9Ito6+Ndbezvzj2UApKLaNg4MREty9J9aZnS
	 4ZvwkqrdUa0FQ==
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
Subject: [PATCH v5 3/5] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Thu,  3 Oct 2024 07:28:02 +0800
Message-ID: <20241002232804.3867-4-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some ipq5018 based device's firmware only can able to boot
arm32 but the clock driver dont allow it to be compiled on
arm32.Therefore this patch needed for those devices.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a3e2a09e2105..f13520095cc7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -199,7 +199,7 @@ config IPQ_GCC_4019
 
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
-- 
2.46.1


