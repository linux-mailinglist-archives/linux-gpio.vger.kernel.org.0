Return-Path: <linux-gpio+bounces-34344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPpFN6/Fx2mTcAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 13:12:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8047334E5E4
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 13:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E32304A6D2
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 12:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B31838A728;
	Sat, 28 Mar 2026 12:11:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125E38A70D;
	Sat, 28 Mar 2026 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699906; cv=none; b=hmQUKTXkKFuUiRRp7+3sgCcPe1qoEGGpwspqCjIMb5FysFe1dMNjTPu5skWzrwkt7pSz/mYOdQ0ZxuPb/MeeBAiTvZSUERm3zU/7b35I8voYfx3nbgrzwUVHi6fryko/GBeY6yPSRPWTl0B/Eo2FT2MP0Fgr9D0vI/j5RG/cj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699906; c=relaxed/simple;
	bh=04Yp3IzGSrrJIWfUtJjG76bXIauH8JMYVfcV4c2A2r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGQtMcF/3qGSklCJqEIMrjYxBMs3fQfsyWwMIQPRZA2P0pymML3VHqVLT+NpldUsO9OxpNu31yM6k4moWxby15d49PyfQFgpaEzDncZ39XBpw3d9xXje0kQvUHf8uyT1WuTdATLORfwJgyr5T2LgxH1hyCIy5ghoNmYX9qPLuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC3CC4CEF7;
	Sat, 28 Mar 2026 12:11:45 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.1
Date: Sat, 28 Mar 2026 13:11:42 +0100
Message-ID: <cover.1774606726.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34344-lists,linux-gpio=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 8047334E5E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Linus,

The following changes since commit fb22bb9701d48c4b0e81fe204c2f96a37a520568:

  pinctrl: renesas: rza1: Normalize return value of gpio_get() (2026-03-10 10:33:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.1-tag1

for you to fetch changes up to 3f92867ce3ee2a274ebb7e7d5de7f6ee85da21f6:

  pinctrl: renesas: rzg2l: Drop superfluous blank line (2026-03-26 20:05:36 +0100)

Thanks for pulling!

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.1

  - Add pin configuration support for RZ/T2H and RZ/N2H,
  - Fix save/restore of registers for ports with variable pincfg per pin
    on RZ/G3E, RZ/V2H(P), RZ/V2N, and RZ/Five,
  - Drop a superfluous blank line.

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers

Geert Uytterhoeven (1):
      pinctrl: renesas: rzg2l: Drop superfluous blank line

Lad Prabhakar (2):
      dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration properties
      pinctrl: renesas: rzt2h: Add pin configuration support

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         |  17 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   8 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            | 258 +++++++++++++++++++++
 3 files changed, 282 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

