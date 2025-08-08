Return-Path: <linux-gpio+bounces-24085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00963B1EB8F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4922A01BA3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7093F283C9C;
	Fri,  8 Aug 2025 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0ExhBX/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D928466C;
	Fri,  8 Aug 2025 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666469; cv=none; b=WsxiODGP8tPNq+Fow2LwvPSLjKm0RvetsTcOj6VoDPdDOfv9tHwViEjGyhpwwuV5gg4GJ+npD7wAMNUfMrlKfqt2SRyvENzjp3YUWAJJAkOQHHC6O2/drmncVNYH2RXP3iCFobICEv5ADRkwuxn8HNfNfSaZqGmsg1mYoBWq6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666469; c=relaxed/simple;
	bh=0PmLEzDj8Yj8Gy2JvlZNRlKud3xi+D1wYx18pEUDYTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bIbOLOml170ddKIM0Ji/XLu4pjIkjGYD5Xu93O8OA+kURSyf9PDyuKqjnwWM89BIcXge1MyuTdVS4sgtCQ6ueL4925Q+HOewYFsFfIVgjXxHCrVqybdrxYzcMlgSe3Ju/TapSfphM0UI3L4tL6afgz0ELFRh5AQsDqIkTHdsM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0ExhBX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5599EC4CEED;
	Fri,  8 Aug 2025 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666468;
	bh=0PmLEzDj8Yj8Gy2JvlZNRlKud3xi+D1wYx18pEUDYTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0ExhBX/zBUccORFWN5ApzcDF4QrmhRaRoonMkINrmotPF79gtI/jGIFD23+O+9zm
	 OTn0khB50ptVcYKBQXl/9C22shW0bt/yctH4XIRIF4tGBBI9vrXF8W6VYIRwVtGWfy
	 nIzZQCx6c+lklTraZyb5FZmbiprqtfQBTYp0N1KxrPg5TjsWRUynKxJ6keL98m7M/D
	 z/RiFH6qNnkuu5nASjeILyWY7QeOvojMwHlLH2JF+I2XeLrBrkNAS91RDu0F2WsLm2
	 ymEcAuxpuyr4GQNBdKWlNwJVWdOvUkxrbvl40pFc5elJCp5ZvYyh3T2oqu/skjma6y
	 +B2llCwtMtr/g==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 06/21] x86/olpc: select GPIOLIB_LEGACY
Date: Fri,  8 Aug 2025 17:17:50 +0200
Message-Id: <20250808151822.536879-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The OLPC GPIO controller sets up a fixed number space that is used
by at least two drivers:

arch/x86/platform/olpc/olpc-xo1-sci.c: In function 'setup_ec_sci':
arch/x86/platform/olpc/olpc-xo1-sci.c:358:13: error: implicit declaration of function 'gpio_request' [-Wimplicit-function-declaration]
  358 |         r = gpio_request(OLPC_GPIO_ECSCI, "OLPC-ECSCI");
      |             ^~~~~~~~~~~~
sound/pci/cs5535audio/cs5535audio_olpc.c: In function 'olpc_analog_input':
sound/pci/cs5535audio/cs5535audio_olpc.c:41:9: error: implicit declaration of function 'gpio_set_value'; did you mean 'gpiod_set_value'? [-Wimplicit-function-declaration]
   41 |         gpio_set_value(OLPC_GPIO_MIC_AC, on);

Select CONFIG_GPIOLIB_LEGACY for this platform and make sure the
sound driver portion cannot be compiled without this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/Kconfig  | 1 +
 sound/pci/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100..3fd5e378a9f1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -3006,6 +3006,7 @@ config OLPC
 	bool "One Laptop Per Child support"
 	depends on !X86_PAE
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select OF
 	select OF_PROMTREE
 	select IRQ_DOMAIN
diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index e0996a9d90b0..6366f72b3667 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -300,6 +300,7 @@ config SND_CS5535AUDIO
 	tristate "CS5535/CS5536 Audio"
 	depends on X86_32 || MIPS || COMPILE_TEST
 	depends on HAS_IOPORT
+	depends on GPIOLIB_LEGACY || !OLPC
 	select SND_PCM
 	select SND_AC97_CODEC
 	help
-- 
2.39.5


