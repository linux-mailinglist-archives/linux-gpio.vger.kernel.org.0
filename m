Return-Path: <linux-gpio+bounces-14190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF79FBA61
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 09:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8825D163837
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 08:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653F1917FB;
	Tue, 24 Dec 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMzAT5tj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC408176AC8;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735027366; cv=none; b=kGE3KrqoQYuHiNb9G3eSfLH0gqlTyMrjxY+/ztDFa7OMX7tiQno1teltKTKJ2cRxLHSTgWWhiuxZMWH6Y5pAoVqKkKdrwjl6fDUgOsVggUeuQ3FkkbxxMMDTP7vesudp27j32IMGzA5rWN99RC00bo3mHoNS0f2XgAd6ZnsRCpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735027366; c=relaxed/simple;
	bh=hOkM9U0MaePcaWmL5OuAx7GxLfZqXpdYyfoVZCd5d7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEiwWUojSSUahPHLLLe5T+LvEp3dIym6bxoyWtQFiJvnkIrEEf95jWDpUbjxTAiVwzd2yYP3+v+6LGniBXX9apxTh0zYHUHklxfuPfH535Rr774/Vew8i4CWII9fgzqB0Ut01kLRTv/WxtXa2JEC0m9ih37yX840rUyjEbHAsdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMzAT5tj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 871B9C4AF0B;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735027365;
	bh=hOkM9U0MaePcaWmL5OuAx7GxLfZqXpdYyfoVZCd5d7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vMzAT5tja+1uNKOBUP1+uIXbFJsy8sRiXoqepFfEVa6maf6Z1W5HVOGjJsjd69Q61
	 DXdoS4LHvWOYO0uxKiDDlPngq8zMrl8vbONRl0RXiDY8qzMJg0vZWUxlQhKm7/J/8m
	 Ory9OjQmeUM+FvvCQtXrLudLHi+2NDHGixqmyLTQ/XKdaO2ikEBx8VfP05exwYoE6w
	 AM6o/i1V/dtZzG7JmfcpfOjGYr2PAUUnw1zRYTbmaRh3euc6HhpjNhSQNwAr+e3lSU
	 5ye/1vKb/XCs3eKDR1lxgv2DGFcXcEgBgSgmsJLrL5JlKIyv6rcIMQ3z+51dB1YwxU
	 CFIEIDvVCwDFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAE0E7718F;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 24 Dec 2024 09:02:11 +0100
Subject: [PATCH v2 2/3] gpio: 74x164: Add On Semi MC74HC595A compat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241224-gpio74-v2-2-bbcf14183191@posteo.net>
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
In-Reply-To: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735027364; l=1201;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=jNZ4WbNdUkUKrupx6QKar4ygLSbl4KDsxbO9QciWLhg=;
 b=6sCPX2fn+hTmdmKC0JmdHwlHcc48bkvOZEJS2VyR7/dK8l6n4WbEio67KcA7woh/7UOgghbHj
 BzCq6M1mctbC3+21CG6xAh2Ba8YWTyNIDFBZSNupdfnxls9BQvUD2Ar
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The On Semi MC74HC595A/MC74HCT595A is another part that is compatible
with the Fairchild MM74HC595. This patch adds it to the driver.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

v2:
- Add Linus Walleij's R-b
- Add missing spi_device_id entry, required by the SPI core
---
 drivers/gpio/gpio-74x164.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index fca6cd2eb1ddacb3c330111343ebecf9b7c9234d..2ce00e90ea5650673420d7852999d13c298c2db6 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -165,6 +165,7 @@ static void gen_74x164_remove(struct spi_device *spi)
 
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
+	{ .name = "74hc595a" },
 	{ .name = "74lvc594" },
 	{},
 };
@@ -173,6 +174,7 @@ MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
 	{ .compatible = "nxp,74lvc594" },
+	{ .compatible = "onnn,74hc595a" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gen_74x164_dt_ids);

-- 
2.45.2



