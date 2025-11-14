Return-Path: <linux-gpio+bounces-28482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8EC5C9FF
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DAC34F3DEC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDE6311C01;
	Fri, 14 Nov 2025 10:30:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE153112D3;
	Fri, 14 Nov 2025 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116259; cv=none; b=fdFwrAJjpd1vQFSUTohcQVgn3KO/Fr1VcgUYl2c9EkskWJv2iQ6VQIdFO7Xa9aRwvelzOFjrAPaJMHU+Hkr0sOz5PwVzDZ0JV6/Le6t+9SFzqv0sYhTZHz6OxZVTYGNigVheZufmId2pfLlnr//xu2lVLl5J8rQE+A87Mc35Eo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116259; c=relaxed/simple;
	bh=p21iTEWP4ziErMKeyrjYD0RdpCzTknp7cegbJ+eba/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B//Uo+KImAwRClZuyMLAYGhkmE4FlpDsQv4HSadOmQr9D9loeHbeCuj2wI4ZrOpe0skN7I2oQsWRtZB1xUKil+pWBfbJBJoVtWCk/QIhXAezE29trf7PkS419SBf3sgUOIsKzb0qC7zuJhC279E/E4hkmR9+A6V3QnFp02kcbnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6452C4CEF5;
	Fri, 14 Nov 2025 10:30:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:52 +0100
Message-ID: <cover.1763115734.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit a5fad3aeff41f89ac94230d66ee5f9c1526cb3ce:

  pinctrl: renesas: rzg2l: Remove useless wrappers (2025-10-27 11:53:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.19-tag2

for you to fetch changes up to 3b0cf6ab35909d7ac8d561e18159c62d42d914c2:

  pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling (2025-11-13 21:21:02 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.19 (take two)

  - Remove removed signals on R-Car V4H and V4M,
  - Refactor OEN register PWPR handling on RZ/G2L.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: renesas: r8a779h0: Remove STPWT_EXTFXR

Huy Bui (3):
      pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
      pinctrl: renesas: r8a779g0: Remove STPWT_EXTFXR
      pinctrl: renesas: r8a779h0: Remove CC5_OSCOUT

John Madieu (1):
      pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling

Thanh Quan (1):
      pinctrl: renesas: r8a779g0: Remove AVB[01]_MII

 drivers/pinctrl/renesas/pfc-r8a779g0.c  | 100 +++++++++++---------------------
 drivers/pinctrl/renesas/pfc-r8a779h0.c  |   6 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  53 ++++++++++-------
 3 files changed, 68 insertions(+), 91 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

