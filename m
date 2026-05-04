Return-Path: <linux-gpio+bounces-36063-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLqkMPmY+GmcwwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36063-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:02:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E54BD5F3
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56DC3034BC3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AF73D7D95;
	Mon,  4 May 2026 13:00:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E30734F483;
	Mon,  4 May 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899638; cv=none; b=Ah+J3pO0SW0dip+Dm+RKDNEefaWrKW4XgXJReIzcOFy6SmAt/HBNak4CreU48zRytyBmRc5aP+jPUoGABGb+AKBSc4zBiGwTu6Bd2UPQIajaVcgjEuZ0sfXe/c7ueOE1r44MP71MyXjrLlnQ33Vz+00LNuMuhhJdlxheEx5Qof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899638; c=relaxed/simple;
	bh=kQZLhHLUsEpxP8HAlwBWmh5K6Ri5H8sjOJZLpik8qKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfSzPRN3RQVmIs92V/Ia9kXZRYABbbZi7b5OVEOUCfs8KvR1InsC9vPg3yXPI9t2j+8UxkNerB4rjTSNUGtc27p8friYzfTOBn8UqojZnXydm521L6UbK75X0Tv30S6b+2fJoZ/bP4j24cMMZg2Anw88hTzk4fEKkLuzXRqJ0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9AAC2BCF5;
	Mon,  4 May 2026 13:00:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v7.1
Date: Mon,  4 May 2026 15:00:33 +0200
Message-ID: <cover.1777899466.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D60E54BD5F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36063-lists,linux-gpio=lfdr.de,renesas];
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
	NEURAL_HAM(-0.00)[-0.938];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:mid,linux-m68k.org:email]

	Hi Linus,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v7.1-tag1

for you to fetch changes up to c88ab9407986836820848128ce1f90f2fa49da95:

  pinctrl: renesas: rzg2l: Fix SMT register cache handling (2026-04-27 11:18:04 +0200)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v7.1

  - Fix pin bias suspend/resume handling on the RZ/G2L family,
  - Fix Schmitt-trigger suspend/resume handling on RZ/V2H(P), RZ/V2N,
    and RZ/G3E.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Fix incorrect PUPD register offset for high pins during suspend/resume

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Fix SMT register cache handling

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

