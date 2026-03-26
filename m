Return-Path: <linux-gpio+bounces-34210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE3xJUoqxWkU7QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:44:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5913356AB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA26730C620D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0333A39099B;
	Thu, 26 Mar 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYT78k0/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C72D1303
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528689; cv=none; b=ppPXli2dyrovQ7Zlw86RDdehnXuieFzNG59aCt55LLS1lKZfYXg6ZtJv5rg3IIDrTqoV2iB0k/FXbM7izXAoGWBvDrWQzI6YyjAJ2mC2xCauXsTTGYsy7cs9xs30AIRZmL8SpsQbzXLlK81p+gpFMMoAefhEErfovONa11WmP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528689; c=relaxed/simple;
	bh=q5kp+vkaxZFsAz+OodkD0LnOIAJg/VNPQvnuNO8APQ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ELQfvToguIdfGXXljw8lkyGZaR4M+FzxVf7s7dr2YS3prp8ixUl6Sh0nXeeabet/v4B7GhdiGqCFSuPdGZTJTIEtVqHz7f7Wi4U3yavzrri2ATGqMiaGDzogoNwkHOOGj+MQ1I/3m+tOM1HvlC/9FpL1DClvnTanL5A6ECCCCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYT78k0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E5BC19423
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774528689;
	bh=q5kp+vkaxZFsAz+OodkD0LnOIAJg/VNPQvnuNO8APQ8=;
	h=From:Date:Subject:To:Cc:From;
	b=QYT78k0/zYJEEgNZSnI86cxXIp+G43uBzb7Xz41Nj/K9H4pQz/VDAOSHAQlmsP390
	 k/xqrIv4NKrwKH5j6LrjjkhNf1dw/AZmHqftzsamLPuebh+fFCuSRBETlW5PrP2DUe
	 F0Aj09X76AwchoKEr4oFBThsbfhCM+r5AIQl32QFtFqYccjbmEPuZIrxvLtFRrmPfF
	 bVh0z5zy08LG8P5bODWlgmJ634D0NAhJwrSHC0C/Ot0gYPIrlLgfCtPpm3e1qrdHCl
	 87JgRLW5SG4FkenDyVzME0qvnln6j2eCz5AWgsSw6ByAcPft9VXcF8BFsZ31eOhmG5
	 nJUdPGYflFOWA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927261a3acso7875877b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 05:38:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Yysf+7B9iIjVTecfZ8M7teUuxZ21uxu4t9DMoBQOVUkmWPDFiGu
	F0hLGDVw5Bi4Bf4S+MwhBJT6mv2IDugvrYg1rJyI3yZSs8GG20Djley98EWGhrVQxXWOS5M1Dca
	VSQ2rAt1OJMY//mJ7TAPfbeAiCsoeI30=
X-Received: by 2002:a05:690c:6887:b0:79a:b824:ccf8 with SMTP id
 00721157ae682-79acf70dd78mr80085867b3.62.1774528688871; Thu, 26 Mar 2026
 05:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Mar 2026 13:37:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=tNGv75VN6XJ4GKGWbqP9PsTb-DzpitiWEsJtz5g5Emw@mail.gmail.com>
X-Gm-Features: AQROBzBPbo6K1pJxdGjyl5NUkiLghF9eczRd0e2GuQqNh5WO3Ez44g_VmcGAwX4
Message-ID: <CAD++jL=tNGv75VN6XJ4GKGWbqP9PsTb-DzpitiWEsJtz5g5Emw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v7.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-34210-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1E5913356AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

some more pin control fixes have accumulated.

Nothing special, just driver quirks and bugs.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.0-3

for you to fetch changes up to 70f8915ea4e909826306a8567c7fa46959e278db:

  pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when pinmux is
unknown (2026-03-23 14:23:09 +0100)

----------------------------------------------------------------
Pin control fixes for the v7.0 kernel series:

- Implement .get_direction() in the spmi-gpio gpio_chip.
  Recent changes makes this start to print warnings and it's
  not nice, let's just fix it.

- Clamp the return value of gpio_get() in the Renesas
  RZA1 driver.

- Add the GPIO_GENERIC dependency to the STM32 HDP driver.

- Modify the Mediatek driver to accept devices that do not
  use external interrupts (EINT) at all.

- Fix flag propagation in the Sunxi driver, so that we can fix
  an issue with uninitialized pins in a follow-up patch using
  said flags.

----------------------------------------------------------------
Amelie Delaunay (1):
      pinctrl: stm32: fix HDP driver dependency on GPIO_GENERIC

Andre Przywara (1):
      pinctrl: sunxi: pass down flags to pinctrl routines

Cosmin Tanislav (1):
      pinctrl: renesas: rzt2h: Fix invalid wait context

Dmitry Torokhov (1):
      pinctrl: renesas: rza1: Normalize return value of gpio_get()

Felix Gu (1):
      pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()

Linus Walleij (1):
      Merge tag 'renesas-pinctrl-fixes-for-v7.0-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into fixes

Luca Leonardo Scorcia (1):
      pinctrl: mediatek: common: Fix probe failure for devices without EINT

Michal Piekos (1):
      pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when pinmux is unknown

Neil Armstrong (1):
      pinctrl: qcom: spmi-gpio: implement .get_direction()

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  9 ++++--
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 16 ++++++++++
 drivers/pinctrl/renesas/pinctrl-rza1.c        |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 15 +++++-----
 drivers/pinctrl/stm32/Kconfig                 |  1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 43 ++++++++++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  4 ++-
 7 files changed, 67 insertions(+), 23 deletions(-)

