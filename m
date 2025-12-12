Return-Path: <linux-gpio+bounces-29478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C047FCB8272
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BF9E308CB6E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05E330F949;
	Fri, 12 Dec 2025 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k+piAqcj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4530E0C3;
	Fri, 12 Dec 2025 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525311; cv=none; b=Hq8vWBlpqbjjlf9bbzBiNAa/w1voC4+eSIwqD7yg2HfbDq8WYU4BzBHOZD9/tP5OupA6u347kOcQ338Aca93DB0uiYKcEtt9yXsFk1l8u9m0bO/20FtNfj9g5psxFv75Zto6oxheBUE19xEMEIiqfvjwZENIV/b8E7UovgS1eHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525311; c=relaxed/simple;
	bh=uPdRllvdToXHPTW+cCNzaHikV2UDXgHOJaOHIt6dbh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eY0n+c6TMhrAyunwd18F5WzeW1YEKhqc6FU7QhEZL1bU1mQSA3w61wwfsBbZTtYNLfZAvjMoj7VmfZSAqqwGfRKNl4YYN9vPwHuikHJ3dCabhJymu+PLFGhedDS8tHgWr106Dg+APz+u52DwunJ3Qv06efNJzqESaOcH9MtBStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k+piAqcj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64EE34E41BA7;
	Fri, 12 Dec 2025 07:41:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38EDD606DF;
	Fri, 12 Dec 2025 07:41:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD040103C8E02;
	Fri, 12 Dec 2025 08:41:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F9puDF0qsf7d+cFofikh+YMcfLgLR89soFFQ1eEsTxk=;
	b=k+piAqcjXVqixAW9nA4n4GOhvuTBd+kxGQgFiyNcasMQ3hFs0bdzvH7I85URKQLVK4f26W
	RuSJTmfANA4JnjhBmHZT6m4O26LTyjwsHzz58eQqGIK89AoNFQAhn2qroK7epPNHGwkt6Q
	Zz+3xFuiV4yMG3BGDTmbdaTrBpw6vd6wgmb7VuvR3gudBwOG1cEmBkZtqy4amBde7gz7VQ
	XDhRJFwqduwSD/5PwYiXP2aofHagKD0dwfnukoCeifueospPJG4b0Ssz5KkSpLaYvX9qy4
	eyTPXcaoZ2+SjaElFEycVWoVVAkLfz+1IeV026Ammjp+hQT07h1IjxNXYncQlg==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:11 +0100
Subject: [PATCH 8/8] MAINTAINERS: Add entry for AAEON SRG-IMX8PL MCU driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-8-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Add maintainer entry for the Aaeon SRG-IMX8PL MCU MFD driver and its
sub-device drivers (GPIO and watchdog).

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c64e90629c0b7d7941f879c9ac589e..13a4eced229acd970b9e5de864a441f28fa2aa91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -186,6 +186,15 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON SRG-IMX8PL CONTROLLER MFD DRIVER
+M:	Thomas Perrot <thomas.perrot@bootlin.com>
+R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+S:	Maintained
+F:	drivers/gpio/gpio-aaeon-mcu.c
+F:	drivers/mfd/aaeon-mcu.c
+F:	drivers/watchdog/aaeon_mcu_wdt.c
+F:	include/linux/mfd/aaeon-mcu.h
+
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.52.0


