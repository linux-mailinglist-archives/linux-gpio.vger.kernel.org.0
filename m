Return-Path: <linux-gpio+bounces-7856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4291DFFD
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 14:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B8E1C20F3C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 12:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2421215A85A;
	Mon,  1 Jul 2024 12:56:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4AB145B09
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jul 2024 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838599; cv=none; b=PfNsVQpm1QhrW9FOde2G5xLB25GXD4cWIr/kBssGitRT6DlV9HNG0eHps042q4SB73HYMYB3y9dk7VUecgqo9eaycO4Z6Iqyzgw7sdqyrHS2jrW6txrN/1odgqdAn/INbQUnmRJLgL1rwm/3he0UIv64aOH1PAI3VyEjQmvV+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838599; c=relaxed/simple;
	bh=XBx0EW8nqpZVqVLCtRcejcPGgY91HlhnKUyXuarXNNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H6l2egpB/nXOhxyEnWjmIgTW6GhBT2tdF+nS0nEkAoH5Atxj83SSmaqgzOjstLemEgIkHgcQtRLBzLZaamfx8cZCkf3r2QexX28BlZ23EeXofIOBVrwaRmVf2lgRhYSmNNWIL64Jymf22skPJxVRMsyRQyt0nOptu2MFqKkvzU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1c8a:3990:9784:a231])
	by albert.telenet-ops.be with bizsmtp
	id iCwU2C00L4bcH3806CwUhY; Mon, 01 Jul 2024 14:56:29 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOGZw-000oEx-Sc;
	Mon, 01 Jul 2024 14:56:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOGa4-001GZI-DW;
	Mon, 01 Jul 2024 14:56:28 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL v2] pinctrl: renesas: Updates for v6.11 (take two)
Date: Mon,  1 Jul 2024 14:56:27 +0200
Message-Id: <cover.1719837986.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Linus,

This is v2 of "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take
two)".

Changes compared to v1:
  - Back out all R-Car fuse commits.

The following changes since commit 9bd95ac86e700ab8b1a6c225685e0e5afe426b4e:

  pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC (2024-06-11 09:50:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.11-tag2-v2

for you to fetch changes up to 71062e52fc0aea0f3477aaaaa789226388a7eeaf:

  pinctrl: renesas: r8a779h0: Remove unneeded separators (2024-07-01 11:27:39 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.11 (take two)

  - Fix ambiguous and inconsistent pin group names on R-Car V4H,
  - Add MII Ethernet PHY and external interrupt pin groups on R-Car V4H,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (12):
      pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
      pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
      pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
      pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
      pinctrl: renesas: r8a779g0: Fix IRQ suffixes
      pinctrl: renesas: r8a779g0: FIX PWM suffixes
      pinctrl: renesas: r8a779g0: Fix TCLK suffixes
      pinctrl: renesas: r8a779g0: Fix TPU suffixes
      pinctrl: renesas: r8a779h0: Add AVB MII pins and groups
      pinctrl: renesas: r8a779g0: Remove unneeded separators
      pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups, and function
      pinctrl: renesas: r8a779h0: Remove unneeded separators

Lad Prabhakar (4):
      pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro to be 32-bit wide
      pinctrl: renesas: rzg2l: Adjust bit masks for PIN_CFG_VARIABLE to use BIT(62)
      pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN definition to top of the file
      pinctrl: renesas: rzg2l: Reorganize variable configuration macro

Michał Mirosław (1):
      pinctrl: renesas: sh73a0: Use rdev_get_drvdata()

 drivers/pinctrl/renesas/pfc-r8a779g0.c  | 830 ++++++++++++++++++--------------
 drivers/pinctrl/renesas/pfc-r8a779h0.c  |  82 +++-
 drivers/pinctrl/renesas/pfc-sh73a0.c    |   4 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  59 +--
 4 files changed, 557 insertions(+), 418 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

