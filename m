Return-Path: <linux-gpio+bounces-30648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94BD2FEDC
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 11:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 544303043F7F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 10:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC3D361675;
	Fri, 16 Jan 2026 10:51:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138A35FF54;
	Fri, 16 Jan 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560676; cv=none; b=nptZuKUFG9DmlPeMqUu8WEEEEv13mjHgVOWf9PrrXBGnnuICZAYIm1IxublTi+e+7bYpF3uMdITAz0nJ5ZH7PeEpN6mqvtPP6NZAjGFf7J9cQxUC4iKJN5/P481UswKdt3QZ3YOkvOoay+xk7jtpsS/RtcPjZR1XBKpWspIJX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560676; c=relaxed/simple;
	bh=z5YzK7f8j2tmHVx7zu8DGvwKK1sBymqNRk1xDGxEwQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2Y+a93mTbhppA1Nxs91qVYagPfQ9WbO+YFQRFr9C0b8+bViuzfiIQFm/+Q5GUx+Dbj48C99YZymCBdAZs6saKzI1d4cszZqevQ5Nh/bhQunj9mPpzHPGNTiNGRqYV7iKmJxyOZzUiEDDeHUsrAOfvci0mYRX+48Ro7Sd1NoR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A23BC19421;
	Fri, 16 Jan 2026 10:51:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.20
Date: Fri, 16 Jan 2026 11:51:12 +0100
Message-ID: <cover.1768559969.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.20-tag1

for you to fetch changes up to 829dde3369a91ad637ac15629ea8d73f3db2c562:

  pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts (2026-01-13 10:21:53 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.20

  - Add support for GPIO IRQs on RZ/T2H and RZ/N2H.

Thanks for pulling!

----------------------------------------------------------------
Cosmin Tanislav (4):
      pinctrl: renesas: rzt2h: Move GPIO enable/disable into separate function
      pinctrl: renesas: rzt2h: Allow .get_direction() for IRQ function GPIOs
      dt-bindings: pinctrl: renesas,r9a09g077-pinctrl: Document GPIO IRQ
      pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         |  13 ++
 drivers/pinctrl/renesas/Kconfig                    |   2 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            | 248 ++++++++++++++++++++-
 3 files changed, 254 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

