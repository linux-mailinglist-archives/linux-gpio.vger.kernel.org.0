Return-Path: <linux-gpio+bounces-30649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB9D2FF2F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 11:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 385F83015844
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 10:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4BA34EF0C;
	Fri, 16 Jan 2026 10:53:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086F2D5926;
	Fri, 16 Jan 2026 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560817; cv=none; b=R43PQogqsXJzXPm5ip8T3fKvl9Zp1LwnEqFviLl1dLDT5x5e9AqrNKkOURl9v7Aa6MDi/wwtQLezGM892RMxLGKbwbH/5WBU/6g4J2enIPly0o5ecVqQQGNgH5dBwJ0ODtTi8OgaJDkAN9hkGo7SLc/E2vL1xnzBRUmtI/E/Iyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560817; c=relaxed/simple;
	bh=mGX+vjVuCl2hEMpWQgAaAqXg4XLqrn3jgc3IefMM0LY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oubMg3a5fIyUpCAOFXM5Lrkxdnqod4jM84FLi1vmyWYxnckYGfrs44JV9i+unRb8KCES1sxgrz9mMQkT5HHQT2aOPsnKxJN4PX5nI+kEubfjdluRy0dJtlsrwqgqpJn52ZZC8Opzs3EoWBXj2RVqiodae835UHpCMQeWCginOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC5CC116C6;
	Fri, 16 Jan 2026 10:53:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.20
Date: Fri, 16 Jan 2026 11:53:31 +0100
Message-ID: <cover.1768559970.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

(this time with the new address)

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

