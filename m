Return-Path: <linux-gpio+bounces-10980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B93993376
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54F592844DF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EF71DC1A3;
	Mon,  7 Oct 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="cRHdPrrg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D91DC183;
	Mon,  7 Oct 2024 16:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318967; cv=none; b=IIneTelLzK6EjerqIxNBHg3vZtyt5Ohf2Yqqg5esM+UoQOlZ7ti4wbZhnFafQmNPTxxy5Qp/drY4paeFUaVprYCfQDPOLwH9SlZ546fW1DNp1JhQbcaFYKh7B1n11Bb280VSiWW5KVH4jqxiv3QP3pCheoEgGvp8I9ksq337d18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318967; c=relaxed/simple;
	bh=UHUEo4++aXG37ZoQH2kgGM3s9sQa02R1Nwdd0MtVjsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L97LQVIbpKgsJbvwbyZGeqtptEVU2M0rglxWevS+2xaVz2rLRL2Da75CF03IDSDwRaf64wilb2Xul3enb3MkuUuYyQho84BiWQ2s/Adobw+ESUCzW3NG6D1HPw5PdRfG5OQkGKgmcLSuKqMk701+IhKBRAWpepm18jcliWDgCo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=cRHdPrrg; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 685D023F20;
	Mon,  7 Oct 2024 18:36:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NASA2BjvDagW; Mon,  7 Oct 2024 18:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728318963;
	bh=UHUEo4++aXG37ZoQH2kgGM3s9sQa02R1Nwdd0MtVjsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cRHdPrrgNiDMQHqMYCGVSelOckUn14cdwzxiciA52VdusYwqnhi2U8qWgfXrOdpz8
	 X5VxoaTtS4KzHGtU17ObpxXuXztwrqS9qYRDfk5D+PDFZdPx4bXV6Zz2VX8jl/ZlZq
	 RWgUZ8uEDnSL1u4rQ0eb6m3MDU4Nu1ZnudqpbGpE130F/1Ike10EiTyeIKo3luYXLB
	 kwpfKU7GpfoRmhdcEgV0t2yeI9R3/ttsKwPdUOGSH+tn2w8YdAYi68k0d8o+PKYssj
	 bac5na3mNMTzo6kAgZX5/ttGSpxnsTNYgUgOx/pem+yzVxfNQmELu8Gv4YlavLrvu4
	 x4lSwIR0pRyVA==
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
Subject: [PATCH v6 3/5] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Tue,  8 Oct 2024 00:34:12 +0800
Message-ID: <20241007163414.32458-4-exxxxkc@getgoogleoff.me>
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
2.46.2


