Return-Path: <linux-gpio+bounces-37000-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ix2xNcpICmpizAQAu9opvQ
	(envelope-from <linux-gpio+bounces-37000-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 01:01:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E356439A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 01:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78D9B3008238
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 23:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEA63D668C;
	Sun, 17 May 2026 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqqDz3I7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0834107F;
	Sun, 17 May 2026 23:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058884; cv=none; b=NWjiBSYBin1EpG3Oi9rugeXbuXTQTBB5PY+/iKTzPPPPpyoJXI+bSk0bhq0Cbm8g6mCmtReIosv3OhNEpR6fqcMNMsdG8dWMlAQglCgORhlCVF/yv5qJkwQfTkdCdu/r+X2TJ4QQE7G3n3egb8+yv9qJQGiVIgih7AUYTR6kmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058884; c=relaxed/simple;
	bh=dJA1zUeT/Ymkkb3Ek4+9tG4u4+LlMfhVN6/pBQeofgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eYeqrjMxcoziWQ1r8m/ZRjcRBoABoghWOihQj5+sKQ6q2C7+JxiOTDELC44DBZLF/eN+FLzvF0Ns1nclqHisqibUSKnkM6kGW3zAd6LaJX+CA0vQZ2NF6Utf6Xf5WqxOkjMkr/py+V5fMo9R/P4sqhFea0FzVLOPHJhdWNIrmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqqDz3I7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E872DC2BCB0;
	Sun, 17 May 2026 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779058884;
	bh=dJA1zUeT/Ymkkb3Ek4+9tG4u4+LlMfhVN6/pBQeofgg=;
	h=From:Subject:Date:To:Cc:From;
	b=YqqDz3I7cqs+tQ+zoTecL2RGBcKETE2FIck9MwHvl06EhK0AVMSIXwKjpiKB9kBec
	 u0wIgHVGIH3oHXyJQla52ZuBPAwWrUOW2f33AqAiwfnFCM28ChMgWnfSX01vQFPdEV
	 VVDW9of+Ke/VQ/4ieaCW1EH7YAs9/6EgoMFSPbMsYfZdWLKKm5+cUa3RG3Zegfdb0F
	 PsLc8Yc3dG2/MbrOg4vtgpw08NEXMBawe9LQGmCuMMmA30lAEWAkFwJignuxJGLsLa
	 el4MXTj1RH3jCdYbH3GIq9rI31ihzi/ryt9VjYSk/FTJ8wsvEWw1TcOnlrD1HK9rCa
	 CReFYpSmHjVHA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] pinctrl: starfive: Fix some jh7110 issues found in
 late review
Date: Mon, 18 May 2026 01:01:18 +0200
Message-Id: <20260518-jh7110-v1-0-fdb0daae5a4b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ML3awMc0NDA10zs9Rkk7RE4yTjlCQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AjYXyzGoAAAA=
X-Change-ID: 20260518-jh7110-66ec4fa3b3db
To: Emil Renner Berthing <kernel@esmil.dk>, 
 Hal Feng <hal.feng@starfivetech.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 297E356439A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37000-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[esmil.dk,starfivetech.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Found a counted_by() issue and implemented a suggestion from
Geert.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      pinctrl: starfive: jh7110: Use __counted_by() flexarray
      pinctrl: starfive: jh7110: Avoid ifdeffery

 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 11 +++++------
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h |  3 ++-
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 42ec31ec8df4675af621ec686db7410153beebfd
change-id: 20260518-jh7110-66ec4fa3b3db

Best regards,
--  
Linus Walleij <linusw@kernel.org>


