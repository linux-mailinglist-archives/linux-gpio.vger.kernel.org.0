Return-Path: <linux-gpio+bounces-26037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAEBB54AC7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 13:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8A681CC8390
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B4F2FF16D;
	Fri, 12 Sep 2025 11:14:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D503296BBC;
	Fri, 12 Sep 2025 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675683; cv=none; b=aKuFbWajph7pBqJiZ079/MQRzn96PX7+9bR9oCCjEj1buXIkc4OJMFvLV3RhZvcuXmbT++z4mj25LswOh4PrG54Xu1YJhYDuFnaV4Lagr2ZMzcIN4EGgaJfvH6CpuQUr7vXIQygptkqOGE4n5YaPyt4LwmTI3I186Oq9a3Vt6ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675683; c=relaxed/simple;
	bh=mNqoRA3SQT8Q3pCzh+04uFfjRwXQIPEB3BJeZR243XM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfZdei813vnAAtT8i7UOuq3reZJR2wcR4qa3UV6zXXk5vsN4UvXZt4piVfD0DJq7MIDzonyzBvKzyRobdnwd1Iyy6btqNMO1zWBOOUfX5k4yz0o8fQIj8hI/Kw2lhm3ec6HFQ++cGX4EZqvRaKePgflRADSG79wzhOHBts9gndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A5EC4CEF1;
	Fri, 12 Sep 2025 11:14:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:14:36 +0200
Message-ID: <cover.1757670094.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit d1d31e2739ff063da1e85cd9b44316ca5cccdba8:

  pinctrl: renesas: rzt2h: Add support for RZ/N2H (2025-08-20 08:56:15 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.18-tag2

for you to fetch changes up to 512bf60226c621893729605121a396240e84a5d4:

  pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment (2025-09-08 12:03:08 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.18 (take two)

  - Improve suspend/resume support on RZ/G2L family SoCs,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      pinctrl: renesas: rzg2l: Fix OEN resume
      pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers

Marek Vasut (1):
      pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment

Qianfeng Rong (1):
      pinctrl: renesas: Use int type to store negative error codes

 drivers/pinctrl/renesas/pfc-r8a779g0.c  |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pinctrl.c       |  3 ++-
 3 files changed, 25 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

