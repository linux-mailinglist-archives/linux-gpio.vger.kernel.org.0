Return-Path: <linux-gpio+bounces-25195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E42B3BB01
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 14:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 304992069B4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 12:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A76314A78;
	Fri, 29 Aug 2025 12:18:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DBA298CC4;
	Fri, 29 Aug 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469930; cv=none; b=suMTztHORv7w+fv16PMfIYLKUkLBccQ+RhUJzhzYBHvKIlWE/ZilDuMcMUcQSJkAjl1w3YdVhVJW3694ZYOULcsb4cSLHe9vu3zkS27e1vAtP7t5hHfLLixrbmr2VVSenFQEY/SrUYZOLTYAoIfiJrL41xmtE9Yhhdh+GACdjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469930; c=relaxed/simple;
	bh=fxs1PT8qqqjqWRRIYkijrtbmmrPa3GpVuj97KOudCwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnJwUOhbgducjUKvHUfA9W+diKVGGXZlTCq2ausGwtOA+7aYwBqxTeg8ZrRrTirtQq97eEw5tkHNiGYjF6/1foVLEdz0zj/eX7StBO+zvx6DtoqzMiIo8s6izqj1GWWctsqEUfiyXaYqwjH1Oj+L7hqqC5HNHpMtJgQ2+mh4UIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12197C4CEF0;
	Fri, 29 Aug 2025 12:18:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.18
Date: Fri, 29 Aug 2025 14:18:46 +0200
Message-ID: <cover.1756469283.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.18-tag1

for you to fetch changes up to d1d31e2739ff063da1e85cd9b44316ca5cccdba8:

  pinctrl: renesas: rzt2h: Add support for RZ/N2H (2025-08-20 08:56:15 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.18

  - Add support for Output Enable (OEN) on RZ/G3E,
  - Add support for the RZ/T2H and RZ/N2H SoCs,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the RZ/T2H and
RZ/N2H SoCs, which are shared by clock driver, pin control driver, and
DT source files.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag3' into renesas-pinctrl-for-v6.18

Lad Prabhakar (10):
      pinctrl: renesas: rzg2l: Fix invalid unsigned return in rzg3s_oen_read()
      pinctrl: renesas: rzg2l: Parameterize OEN register offset
      pinctrl: renesas: rzg2l: Unify OEN access by making pin-to-bit mapping configurable
      pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
      pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
      pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC
      pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks
      dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
      dt-bindings: pinctrl: renesas: Document RZ/T2H and RZ/N2H SoCs
      pinctrl: renesas: rzt2h: Add support for RZ/N2H

Thierry Bultel (1):
      pinctrl: renesas: Add support for RZ/T2H

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         | 172 +++++
 drivers/pinctrl/renesas/Kconfig                    |  13 +
 drivers/pinctrl/renesas/Makefile                   |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 195 +++--
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            | 813 +++++++++++++++++++++
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   1 +
 .../pinctrl/renesas,r9a09g077-pinctrl.h            |  22 +
 8 files changed, 1112 insertions(+), 106 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

