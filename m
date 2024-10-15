Return-Path: <linux-gpio+bounces-11324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A12A99DE65
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4B51C23135
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B91D18B47B;
	Tue, 15 Oct 2024 06:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="HpDW07Su"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80E18A6D9;
	Tue, 15 Oct 2024 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973828; cv=none; b=ldxHKyNUdtZ6PVXYhbtkl/lcCLD522NUOfZpsGdhFMam5sfCA+VOjGe2NC+bHIx7umVlQAZEaWVtkFxtHBpj/+nu8pR6CWpAkkJcAiLFua8mGg5PRkPKqhRS7gSydjLOStqzliTX+A0KAGKTHL65uSkf+SGXipRqWeWsXZrF8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973828; c=relaxed/simple;
	bh=g9ygpDKyS8tAdx0p0uvQx/Yca2s4613LUY/AYHZ8um8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejgzfAIG4ZJR3O81u/733fOcEEM/3t2KP/4Ibc8leaKP3VAYxMnqf5O37+Bp3lP/oYPRszfZ7GiWXVEfK74AZ0J2soWjlhBUFqrOLmvuKYbM5xlro/7q3S8P6hGELcIGS6YEFG3VhyMBOB45jxiGfbJ15qjXh/H91stZbL+Souw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=HpDW07Su; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPNd3FRzzGpJD;
	Tue, 15 Oct 2024 06:30:25 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPNV2Q2Gz2x99;
	Tue, 15 Oct 2024 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973820;
	bh=g9ygpDKyS8tAdx0p0uvQx/Yca2s4613LUY/AYHZ8um8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HpDW07SulwZIZXW2WtIxHBdyGOyk+avCe0h4DAbkgi6GXxZ4y0qipOnaX1O2ssoEr
	 /i+8r/jWVUJOv2DcrxgbMIt6opxJ2FDVBmVXh3/NGkjOn/rNWL9Zkse54VHfPI2/V2
	 nm4NvrlwQXgc3ZXsk1/MAsURV8Lly3rpIaUx97rVHHiK0pBIVYZR+Ds6xZnQA6L++u
	 uzee3TaAmwtfMXyTbRC0DhEW6a+jBWDkpB85370KC73RjQ0wTaZ9baB0guWepItgk6
	 ++CyKPXhedrH0Gm8cEWZT3bp49ulZY+fwB3t5UMVaLL7YHMU8s0pWlhTyDHvBiYpKh
	 f2ihx0weN8jUw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
Date: Tue, 15 Oct 2024 08:30:09 +0200
Message-ID: <20241015063010.713407-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015063010.713407-1-igor.belwon@mentallysanemainliners.org>
References: <20241015063010.713407-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for reading the chipid of Exynos 990 SoCs. Its product ID is
0xE9830000.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 9e00ac8de5a9..94c7cc0d11e4 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
-- 
2.45.2


