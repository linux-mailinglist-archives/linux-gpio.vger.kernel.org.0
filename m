Return-Path: <linux-gpio+bounces-19248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158BA9A636
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505C1465C29
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6D3221FD0;
	Thu, 24 Apr 2025 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghzw1tHi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225222155D
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483758; cv=none; b=faf/OdEzNe//cCkBRy9QfYru0f9P3g1da2RCnjmjEfG+Tow3eC2FSJRKM+mDE335XO57gJAD9LaGt+JcEu2Q6KrKgWfkG5/k/wupEiLkN15BBMGv7iENyaMgot7QJl3IW8clPbbfG59OKwsx/Es+JBZAjXegnEeFTEanssh7lEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483758; c=relaxed/simple;
	bh=QkWXtrkIRF3vsuquILKlcbHOs7CG+TDFU7mwGH8Ipb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8VBanbpxj4d+/ZiRFKXq+0mZad6a+j7zuJaUy1BxsR9YhfuM8OzpiFYWdR5cAInDZU1p2qd/1eePoFppr+CSyFUQyrPJEqM26dzLqwDTfeuCx0dkjwohxTn38Ar8kJvmu+w4qS4YkTB2QUq53+f9OPGZ+ogXL+5RN3zsbemrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghzw1tHi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc4577so370138f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483754; x=1746088554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=;
        b=ghzw1tHiBNhusg92wetSynKH6g+ZVMDVTcChfPqwjJUOXoQhD2t3WrUyEsRRkh5lDX
         jNlZV8CXWwRklq7LI3Y7CRPS9E0W8TvUrmrAWAMOhdehjvmArZ+B4idhrebdv2n8H4vh
         DSNGDrAnbWpwoe/2NJsuSfu307TAh/o80zkplaayoaRYJ0c/bz5lsguZCSieOnVN0AC+
         HNO4fW+11eIB7Tm4ld7evBuylGt8O3OiJEu8bUiS3Utj9GPM3ppa8jfXxLXDGfE2oH7Q
         HruIbsbL7KFEUp1SKVfaAcpvv4ihqF6JsYG233J6yZNdUkMnfdZieqhA0Ug+OHE2FUpR
         /Shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483754; x=1746088554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=;
        b=LtN7IYu+pApnhogfTpHeanmo6cRg8yl2gwxjAAtH7puRvNPKR0gHRmZj8KfLR5Bzz4
         41WEPHjCvzvEsl+uXQ3Ej0DawS4BnrKn7ECaVVFZCMY+D1xFglxI4KZEFaYg7qbieZDf
         DsI/R3ElWXrE8+KwQ1akd8DJdYvyaXddZpKV56xZtJoLimhAarFdn5+kZezFvUFDmkMq
         CsYx0Hbln0ZxfHHljFHd8bt/i69/gpJ9toMND5BggXa+dbZYDjEbVpHtlK6epuEqp63H
         8oj/8sQWOXnXtf2hponOd2+V6IkOFbkh3bbWwPusP/beD1KQN2P6I2zyi8FIY5Y43Hbr
         grOg==
X-Gm-Message-State: AOJu0Yw0iCNuEmj44z9ajf/B4y+l/TofG04PC5coaM95WrA+CDO1S8Dl
	gnlcE6IbmfFXFPmp0DGyehvAfMTeYjE856rLPA6dpDZTGNlpeKduKltXyC+HCGw=
X-Gm-Gg: ASbGncu6v1hgTXvao3kjWTso7rPkQv/clF7YgZQvB6cnFoif0cR7uwMydDI5dm4pnMO
	IXCbdK2usCMTMfA5ITyhdp6q0qZ/UGkmH8xTery+Y5itas5Pa/QQ0ZGT3BA6WFHLp8u8c82dCy+
	eeo079SxJrOZn7o629Z8uD/JgOTh7hei6MV3I/cu1oCbocR1teJt6wNEAJ+XmGt4+ZNrv0/w5W2
	vdb2sc1PZjMEqyREOJVVXpHnaB0AWIpt+JoR8aNHTyRui0/LZGTWf2lXz+lIVUmux70JIn6bs/F
	IQPWMTVCfl5BGMuUXWpBdSNfD7F+EeANFg==
X-Google-Smtp-Source: AGHT+IEn/oPv6UnLEvwrRXLxLEBd1A5hnHHfX68c3JV4/tT6U0jLedpQliXkYdl8P+72/kekunTQ+w==
X-Received: by 2002:a05:6000:420b:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a06cfb22c3mr1086182f8f.54.1745483754307;
        Thu, 24 Apr 2025 01:35:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:31 +0200
Subject: [PATCH 08/12] pinctrl: at91: allow building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-8-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JQiHyqG15e1DMj51Mblko1MsHmKlA0nIqnk0NLfFft0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffc0yLOnkqqTE6zwxGGFb4MyEZpSfBDn7daV
 BRxeEOL8NKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cnfxD/9hl8UZC729fpc39Q9MO+KK6OGwDTHMkxkX0abTk0tnDXvkYVW96eyNIRbMSvdgtxxYhQz
 DRC/3UA5i8zPRD/OwTjEIOsmy2MrIk7jIxOc5WSE9YQ8X7Y9Tm/SL7gxlxkKDhfXIfKk4kfIe1E
 XSwI6rjWj8PbPffzAMsQ27Kvm5wKlmT0jM3leNBQzqu94uViOHB830IfkAsXtoo2s4NWWmp3Xke
 aVgPWgFaZAwaXQnb6e/3UPwpp6qeMaofylNzH4HBO5YvWqtaL4kzYcSztcH4dRWVKwhXPaUQ6wj
 XddUuH4De8auEqWbcs37eMJhLmIPaj1lwGXEuYAAqPMc0aZBFF2k6QtC46GyCGx+TQywYIXaCak
 6Kd2qc8b8NJWREV/UnAq5r95k8EQhYr/GHDpFT2ZlikKn1JAVeDz2zPws30y9RhcvMgC7rHXhEc
 +ZDp3lgSoP0biUU8jtIZdCycINhWD2S9VGI+RRfDLkBZi4mm3DdvH0C2Cn7X6WGdo4rvJuqMwnr
 pHhDbirfJ5xluN72zegSt7BJLSKyLgRDejg/nElrexqqLGINLNl3P1RVsaVavFjwrw8K27FlZN8
 6927UtJgVUgH0EySgq1Dkch7+90ScwITtvN98N452XpCGrslt3WrHTz63//GtPkErNETJABYuBz
 mMIajgtwXO69Q7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled. We can do this as the driver doesn't depend on any
architecture-specific bits.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..db84d80b7e7d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -103,8 +103,7 @@ config PINCTRL_AS3722
 
 config PINCTRL_AT91
 	bool "AT91 pinctrl driver"
-	depends on OF
-	depends on ARCH_AT91
+	depends on (OF && ARCH_AT91) || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GPIOLIB

-- 
2.45.2


