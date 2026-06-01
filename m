Return-Path: <linux-gpio+bounces-37762-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAgVNi+HHWrObQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37762-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 15:20:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A58C61FEF1
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 15:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3FB43021CB0
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 13:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0660D3A6EE4;
	Mon,  1 Jun 2026 13:19:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69803A6B8A;
	Mon,  1 Jun 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319983; cv=none; b=KxlKh06lUBl+bR7OUrr3aiwvP/wTu/h3aq2NJm4bCWapf8o/mz7niQ+rThWIeKrh58r4yF2A/xSCxSKtIqwwh9wRCTHNCKiEUk7tmcKvxr3FfR00f4V9Ii1wKb2c2xHCXm0n9ZApSfzmHx3Yp+gOvAiK6ukmliSUtpdxtPwIm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319983; c=relaxed/simple;
	bh=3W+D3xZWOVgznnU57w3vHat8ECUEX96oxvliRrQaDjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F+ki9l/3Vat03kZ+dG2blX1ZtISJT55du+mpzTYOjbjSuNnbUEi3A+FFu1D0pUghh73O2ZuL7WYEQKuqmszRPQhe+G68pTINBU9J8hifMoHzbvWHJ7bDrKTZ6aPtRNZiJtOyYnXH5tpqZ6PFUNKIdlEk0N1nSECa7iKef5KzhMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842941F00893;
	Mon,  1 Jun 2026 13:19:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:19:38 +0200
Message-ID: <cover.1780319402.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37762-lists,linux-gpio=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7A58C61FEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Linus,

The following changes since commit c7c8352fe569d17e3d379a83075a8ea12168526f:

  pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback (2026-05-15 11:15:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.2-tag2

for you to fetch changes up to 80538a53978bb9788080caea6e5ee3393dfb6a72:

  pinctrl: renesas: rzg2l: Use tab instead of spaces (2026-05-28 15:07:29 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.2 (take two)

  - Add GPIO config support on RZ/G2L,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (5):
      pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
      pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config
      pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
      pinctrl: renesas: rzg2l: Keep member documentation aligned
      pinctrl: renesas: rzg2l: Use tab instead of spaces

Lad Prabhakar (2):
      pinctrl: renesas: rzt2h: Remove unused variable in rzt2h_pinctrl_register()
      pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 ++++++++-------
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 13 ++++++++-----
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  4 ++--
 3 files changed, 18 insertions(+), 14 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

