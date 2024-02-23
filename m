Return-Path: <linux-gpio+bounces-3704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C286105F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 12:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD1B3285843
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 11:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556B376907;
	Fri, 23 Feb 2024 11:28:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE02A76048
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687737; cv=none; b=g0U+7VydEgxcyb+J/PSfMKy2MJArPuYJyxm4Xehp9+QZEpH1MHb7hq7PfH/+knk9rtdtg6vj4Okixa+2idSTXSrxwDa7uyXwas08xdL1krE2aSMbSAXn5+m/wx7RWxYoCriMee6jUV+Env6LYYPgwTPqXHZOnbsbrVDkKtigY74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687737; c=relaxed/simple;
	bh=f+I/J3nCeKRlXlFmKEP/28Cmq0HpHZNcbX7hsQ2/BfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aJ8PI4RruNG2uyxfv17JQGvNQAr8eAJ2fmAUVKlwzN5bAqKLxHikRESKb93+bqRecHUvy7K69+031vi7lEOhqIZNT0AcQOBVd5yWL6VvchGLMCpp9uwMo5bz0fxgrK4gccSX+vvBF3csPbAochey+uqWJWoVsWYBg8OvHsN+U5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6f61:ab26:80d6:d9d4])
	by xavier.telenet-ops.be with bizsmtp
	id qbUr2B0082itsqh01bUrs4; Fri, 23 Feb 2024 12:28:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTjO-001P4I-QE;
	Fri, 23 Feb 2024 12:28:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTjX-00D0Vn-4x;
	Fri, 23 Feb 2024 12:28:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.9 (take two)
Date: Fri, 23 Feb 2024 12:28:50 +0100
Message-Id: <cover.1708687406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit fea58424e2523376ece6f734479e63061e17ad7f:

  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28 (2024-01-31 14:50:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.9-tag2

for you to fetch changes up to a6f06b909fee72c679c565adfa7f080f9595e336:

  pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm (2024-02-21 16:34:33 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.9 (take two)

  - Add support for the R-Car V4M (R8A779H0) SoC,
  - Add support for suspend/resume on the RZ/G2L family,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      pinctrl: renesas: rzg2l: Configure interrupt input mode
      pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able()
      pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able*(

Claudiu Beznea (2):
      pinctrl: renesas: rzg2l: Select GPIOLIB_IRQCHIP and IRQ_DOMAIN_HIERARCHY
      pinctrl: renesas: rzg2l: Add suspend/resume support

Cong Dang (13):
      pinctrl: renesas: Initial R8A779H0 (R-Car V4M) PFC support
      pinctrl: renesas: r8a779h0: Add Ethernet AVB pins, groups, functions
      pinctrl: renesas: r8a779h0: Add SD/MMC pins, groups, functions
      pinctrl: renesas: r8a779h0: Add QSPI pins, groups, functions
      pinctrl: renesas: r8a779h0: Add SCIF pins, groups, functions
      pinctrl: renesas: r8a779h0: Add SCIF_CLK pins, groups, functions
      pinctrl: renesas: r8a779h0: Add HSCIF pins, groups, functions
      pinctrl: renesas: r8a779h0: Add I2C pins, groups, functions
      pinctrl: renesas: r8a779h0: Add MSIOF pins, groups, functions
      pinctrl: renesas: r8a779h0: Add PWM/TPU pins, groups, functions
      pinctrl: renesas: r8a779h0: Add CANFD pins, groups, functions
      pinctrl: renesas: r8a779h0: Add PCIe pins, groups, functions
      pinctrl: renesas: r8a779h0: Add Audio pins, groups, functions

Geert Uytterhoeven (2):
      dt-bindings: pinctrl: renesas,pfc: Document R-Car V4M support
      pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm

 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |    1 +
 drivers/pinctrl/renesas/Kconfig                    |    7 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/core.c                     |   10 +-
 drivers/pinctrl/renesas/pfc-r8a779h0.c             | 3967 ++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  485 ++-
 drivers/pinctrl/renesas/sh_pfc.h                   |    1 +
 7 files changed, 4440 insertions(+), 32 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779h0.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

