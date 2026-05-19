Return-Path: <linux-gpio+bounces-37139-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF8RJwpBDGqqawUAu9opvQ
	(envelope-from <linux-gpio+bounces-37139-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 12:52:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7A57CE55
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 12:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F391306C9C6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DA3370ACE;
	Tue, 19 May 2026 10:36:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395B8370AC7;
	Tue, 19 May 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186990; cv=none; b=O4KEyS+g+7LkIiAFn4h/wl3/V+tILvP3kPVXp57mBcPAfL+s2VQ2RzLtaexZfvxMBLzhht718SxoojfRmsyUwMo7JZ0hYFNuj+oBuqvpcANeQgVnB0H8qFLJg/jLnyhRxmO3Gpq9QAK1n4ODOpZpdY62tYQrBxEUG2aSRPupuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186990; c=relaxed/simple;
	bh=WVhfsKN0lfpDY6u10QDbapM1+uFig5Il863RmCj6nq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S03ParyveM/MGp1yNSCD/EYXUwrVDjmlscLLxvA/DaW7sbqPiWB1Hg5H6Xt+DdmBmKxLfvS/MimGozlZdwhh9iNg7r+yV3bQepGVY933jtPg/yMNJ7OeMxFKjjgnpunUY7sPGGaH9vGSR8uAN5UxuTUXlX2L0nEzM4+w0NlB8xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF100C2BCB3;
	Tue, 19 May 2026 10:36:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.2
Date: Tue, 19 May 2026 12:36:26 +0200
Message-ID: <cover.1779185631.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37139-lists,linux-gpio=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 9EF7A57CE55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Linus,

The following changes since commit c88ab9407986836820848128ce1f90f2fa49da95:

  pinctrl: renesas: rzg2l: Fix SMT register cache handling (2026-04-27 11:18:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.2-tag1

for you to fetch changes up to c7c8352fe569d17e3d379a83075a8ea12168526f:

  pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback (2026-05-15 11:15:19 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.2

  - Save/restore more registers during suspend/resume on the RZ/G2L and
    RZ/V2H SoC families,
  - Add support for the RZ/G3L (R9A08G046) SoC,
  - Add support for pinconf-groups in debugfs on EMMA Mobile,
    SH/R-Mobile, R-Car, RZ/G1, and RZ/G2 SoCs,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for the RZ/G3L SoC, which
are shared by the pin control subsystem and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (8):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document reset-names
      dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
      pinctrl: renesas: rzg2l: Make QSPI register handling conditional
      pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}
      pinctrl: renesas: rzg2l: Update OEN pin validation to use exact match
      pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
      pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
      pinctrl: renesas: rzg2l: Add support for clone channel control

Geert Uytterhoeven (4):
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag2' into renesas-pinctrl-for-v7.2
      pinctrl: renesas: rzg2l: Fix type in .pin_config_group_get() callback
      pinctrl: renesas: rzv2m: Fix type in .pin_config_group_get() callback
      pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback

Lad Prabhakar (4):
      pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
      pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM cache
      pinctrl: renesas: rzg2l: Add NOD register cache for PM suspend/resume
      pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P) dedicated pins in PM

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  35 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 577 ++++++++++++++++++++-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |   3 +-
 drivers/pinctrl/renesas/pinctrl.c                  |  25 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h            |  38 ++
 5 files changed, 656 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

