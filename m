Return-Path: <linux-gpio+bounces-27893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1BC24904
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 346F2350661
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E333FE18;
	Fri, 31 Oct 2025 10:44:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A8F33556C;
	Fri, 31 Oct 2025 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907449; cv=none; b=SqLIvdvdU0sD4u0qbbMEpxxB7PLGR3feJoSAxr9f9QAgBOQV/a50ms9wXSElj8RLgbFlh3htkjlmCvejXfzoEfS8QggBYEbBZ+UwHITFOdHgWLc6SuYeo8Um4Q9ZaUX9O4qGfO5f0HPGqzsqcBQsvduucvvndlPDD251kdPLOR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907449; c=relaxed/simple;
	bh=iGzi6n3bdVibVDwlYvloApCytwY9MAH9hW+h9Olq8gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWsARjdSHYZOycVcRhC4NL8gh8o47TeKf8/tpH6t6Iri5nhQiUXSv6mMhY/kn6BAbvo5AncDoFFF9yHKL++2SuHrLGzhIkJ47H/5wJ5qity4+VSJDAGlPSdMapVIwQ1cijzPKZtk6WMfChL9nIPocI6AJMBcp+RcBPNih1pZ96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF6EC4CEE7;
	Fri, 31 Oct 2025 10:44:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.19
Date: Fri, 31 Oct 2025 11:44:05 +0100
Message-ID: <cover.1761906880.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.19-tag1

for you to fetch changes up to a5fad3aeff41f89ac94230d66ee5f9c1526cb3ce:

  pinctrl: renesas: rzg2l: Remove useless wrappers (2025-10-27 11:53:27 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.19

  - Fix interrupt configuration and port mode after resume on RZ/G2L
    family SoCs,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      pinctrl: renesas: rzg2l: Drop unnecessary pin configurations
      pinctrl: renesas: rzg2l: Fix PMC restore

Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Fix ISEL restore on resume

Cosmin Tanislav (2):
      pinctrl: renesas: rzg2l: Remove extra semicolons
      pinctrl: renesas: rzg2l: Remove useless wrappers

Geert Uytterhoeven (2):
      pinctrl: renesas: Remove unneeded semicolons
      pinctrl: renesas: rza1: Make mux_conf const in rza1_pin_mux_single()

Marek Vasut (1):
      pinctrl: renesas: Drop duplicate newlines

 drivers/pinctrl/renesas/pfc-emev2.c     |   1 -
 drivers/pinctrl/renesas/pfc-r8a73a4.c   |   2 -
 drivers/pinctrl/renesas/pfc-r8a7778.c   |   1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c   |   1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77970.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77995.c  |   2 -
 drivers/pinctrl/renesas/pfc-r8a779f0.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a779h0.c  |   1 -
 drivers/pinctrl/renesas/pfc-sh7723.c    |   1 -
 drivers/pinctrl/renesas/pfc-sh7724.c    |   1 -
 drivers/pinctrl/renesas/pfc-sh7734.c    |   1 -
 drivers/pinctrl/renesas/pinctrl-rza1.c  |   7 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 122 +++++++++++++++++++-------------
 drivers/pinctrl/renesas/pinctrl-rzt2h.c |   4 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  10 +--
 18 files changed, 83 insertions(+), 76 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

