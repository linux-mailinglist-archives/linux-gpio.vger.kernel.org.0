Return-Path: <linux-gpio+bounces-12988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAD9C79DF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 18:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4108B2CA30
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 16:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65296139D19;
	Wed, 13 Nov 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de header.b="kJqpUlWK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A543216EB5D
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.137.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731516755; cv=none; b=O1MreiK3iY/dFptTn2RT2k0jtDWH06QYrzuFE2t9eAORpcLGL29mUE6DzStNpaIUOLmI/k2Vgk6YIgtECyNiV85NZ/LN5c1N7e8rfgnH2UwZJY2pNLiTEn8bvPoH2Hl3n7IIIEtbrw8F9pNfsYND8VRdYo0/sexWpO8IoyPrORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731516755; c=relaxed/simple;
	bh=J0HkSgQzNc8OYFQS9bFDW1H8fmICAVSm+mT8fMEBuBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZISdGxB5J8XOrQYiFiLRDYFjkFYpe6z0H62yVsp7WoSvdQojfAoRPIBDI7X8ZvjSzKo8wcejWByC4aBlCt4DazxGrGqbkbL4EK8V8L1GvbaUBt1MKDzQjeKyIh0wiC7wAsu7XNcIen4Uzjsv1CuEH1hoJEs+urE1tDgIqXmMF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metafoo.de; spf=pass smtp.mailfrom=metafoo.de; dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de header.b=kJqpUlWK; arc=none smtp.client-ip=78.46.137.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metafoo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metafoo.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=rExjREVy37H6/p5pG/NUSw/EDufiDBPizQhbEK53Fnc=; b=kJqpUlWKN1s2B2NCxQqtoNv4gk
	NuhRY95ZHRFJRlXfxP6KcPosqkytAbs5nTWfoe0TDS8zjIMzfG+Iydlaupxu7EWZXVj3Jz38bwPwx
	XhEnZ4J6Wj9EeKZRRjlXTH/R8hb9Q+9WwiAp/UohR2NAM/WUcMjoVTBoZIqg9KmVT1YsMkuU/52pi
	dZ8LtQ6y/uUFTTWCvlnGkAt8A9wI9XKLKLaBFeQJHZWWFEhI6T/B6UnYdGl1Y1+nnPmkzr8DKoLs2
	9a2ZNs1ORcuST4n2EHLBA1hnyfrcEx87V2AjyBu5xCa63CrXCGnQANwaLwWIAs2tdPWP0DrnQfNEf
	8g8B9q+g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <lars@metafoo.de>)
	id 1tBGGB-000Knf-37;
	Wed, 13 Nov 2024 17:30:28 +0100
Received: from [136.25.87.181] (helo=lars-desktop.lan)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lars@metafoo.de>)
	id 1tBGGB-000GsZ-1E;
	Wed, 13 Nov 2024 17:30:27 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thierry Reding <treding@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	linux-gpio@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] gpio: tegra186: Allow to enable driver on Tegra234
Date: Wed, 13 Nov 2024 08:29:39 -0800
Message-Id: <20241113162939.886242-1-lars@metafoo.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27457/Wed Nov 13 10:35:46 2024)

Support for Tegra234 was added to the tegra186 driver in 1db9b241bb56 (
"gpio: tegra186: Add support for Tegra234"). But the driver is not
selectable on Tegra234. Update the Kconfig entry to allow the driver to be
enabled on Tegra234.

Enable the driver by default on Tegra 234 as well, similar to the other
platforms it supports.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/gpio/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index cb90e3898bf0f..56fee58e281e7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -715,13 +715,13 @@ config GPIO_TEGRA
 
 config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
-	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC
-	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || COMPILE_TEST
+	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
+	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
-	  Say yes here to support GPIO pins on NVIDIA Tegra186 SoCs.
+	  Say yes here to support GPIO pins on NVIDIA Tegra186, 194 and 234 SoCs.
 
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
-- 
2.39.5


