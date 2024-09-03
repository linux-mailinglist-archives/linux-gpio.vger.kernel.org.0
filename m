Return-Path: <linux-gpio+bounces-9660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01C96A17F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B361F264AD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A14A14A092;
	Tue,  3 Sep 2024 15:01:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFD2AF16
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375690; cv=none; b=u3qSVurXP+maxOcIxKC+/oF3M3pm99/FciT/G2O7/bi/w2gmNnM5VEjS3ImYp6avfArEATI0KjtVbgzFEsgtyvC6syyTTy+AmiPk69DHqgl7crOT1sS843tUXdF5f2SRKijlkrTh2imAXSypOu/3lRgwJxkUazoi8GPLCDCGvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375690; c=relaxed/simple;
	bh=+8w2Z83ET8dVywGSWKR3appMQVb2k0hACxAZXPb4nxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sGJWakxQCZPvkEp1ONe5X4ZEM99/HNBBZrBPf5pREVtQFgczgsQ9PdvoZOuHeGaftLZ1zbe5eDmWQLqMxB7PAwjrDfFvrmEHMAOd04X1JhzowUvCC2Sg26Si59/d7vXKVbFY7CItsNZ4UszMBK1TWZuxry1C6NpSDTCibbKUkVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WypW42FXpz4x4Vx
	for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 16:52:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b015:4053:6b25:396c])
	by laurent.telenet-ops.be with cmsmtp
	id 7qs82D00f0nYyzV01qs8YR; Tue, 03 Sep 2024 16:52:09 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slUt3-001zen-W3;
	Tue, 03 Sep 2024 16:52:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slUt6-003oSS-M2;
	Tue, 03 Sep 2024 16:52:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.12 (take two)
Date: Tue,  3 Sep 2024 16:52:07 +0200
Message-Id: <cover.1725374961.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit f73f63b24491fa43641daf3b6162d2a451bd8481:

  pinctrl: renesas: rzg2l: Use dev_err_probe() (2024-08-02 11:26:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.12-tag2

for you to fetch changes up to 1325820dd085809645bdd89a2fd408a05b4a5492:

  pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call outside of switch cases (2024-09-02 10:13:59 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.12 (take two)

  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: renesas: rzg2l: Replace of_node_to_fwnode() with more suitable API

Lad Prabhakar (2):
      pinctrl: renesas: rzg2l: Introduce single macro for digital noise filter configuration
      pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call outside of switch cases

Shen Lichuan (1):
      pinctrl: renesas: Switch to use kmemdup_array()

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 72 ++++++++++++---------------------
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  3 +-
 drivers/pinctrl/renesas/pinctrl.c       |  3 +-
 3 files changed, 28 insertions(+), 50 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

