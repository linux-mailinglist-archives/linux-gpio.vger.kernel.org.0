Return-Path: <linux-gpio+bounces-10730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75698DF02
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C49287B3D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784241D130B;
	Wed,  2 Oct 2024 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="M0lZn6Jv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9281D0F59;
	Wed,  2 Oct 2024 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882762; cv=none; b=MIQBPIwNkg+pF8UJnAkMV+tGWRpiV0Ewzq/KUfghHG1RYrMHY+gHJJ+qfEuXhbDDkRh/5nVgajK1Q0vc5K1CQIlMudSomxeDMmXI8pLQew7VyZjRk5Xq5nYZKKVJTOk2iQjUlxAfRLvmv97kFb+Pwbl3MINTv+on3qDFMpP8rKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882762; c=relaxed/simple;
	bh=kkbTx5Cgt7G+P6xs+9X+HNQrS0uHhWMptZCOhmNsQ4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vmk+G1VSZw7FAJ73N8pRlU4mFKvoYa/HvD0qTDkIMYrKghM5TDoZm4WdED0oy8+AggzMUEwjTr3V3pqwYajuTZeZj+vPRuTN+W4KZXJ1sWjXbGcBFZBVsEERGudQuFq0uLqntebyLaokPRMU9WsKcfi5lxMa6mumfM55+WrHWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=M0lZn6Jv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F0D0323D64;
	Wed,  2 Oct 2024 17:25:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdwXxhHzGVO7; Wed,  2 Oct 2024 17:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727882758;
	bh=kkbTx5Cgt7G+P6xs+9X+HNQrS0uHhWMptZCOhmNsQ4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M0lZn6JvdfwnGU0vkE4YXpKnfRF4AaYIglk4IDftJFUsZjEJdwMxB2Wr7NiyJrDlm
	 ETL1riK01hbYQChLrzgc1wtQhWIPJulkvja/HKXntje3uYqYWcbX3PWsO/fj4oyHoQ
	 a2UadVX6Nj2i3anKEB3Qq+VCJotgIOn74sIIXL01tCHzF+u2K9sekhpXfTYT7FM27I
	 E5C4zx2wYb8UJck2PYddM/D062FpkoM6mdACGg2lag/bR7do+emTu0UdV6P5lg2yVU
	 jxa0GWj9a0915O3mhf7+XKqoPFxzwqvay2thVqHxmgnSzU6iS5dxps6DHLcxMiq5jQ
	 d8Ltb/qn51Fyg==
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
Subject: [PATCH v3 3/5] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Wed,  2 Oct 2024 23:24:17 +0800
Message-ID: <20241002152419.30364-4-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
References: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
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


