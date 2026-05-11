Return-Path: <linux-gpio+bounces-36604-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJycIsMxAmrSowEAu9opvQ
	(envelope-from <linux-gpio+bounces-36604-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:45:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB10515389
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A13F8300B470
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC4B4D2ECE;
	Mon, 11 May 2026 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWaQV5PO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAB5426699;
	Mon, 11 May 2026 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528627; cv=none; b=rx18ZqoJXyG8JxmoHomFJhTczyw9bmvspFixcWwrpuPb4xzIVdYNlsJ9h7FN+29L1a9ubRRyk6kQ0RB0MItJudP1g32//Jj8wfoC0u8wVN9S+NMh3lGK7RJJiEPLIGAWcTJ5iVeB6gasZdZP6rWMwC/MGnN9rqqL7OkmgqTDXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528627; c=relaxed/simple;
	bh=nradfUHY5AVnCHVn152RQDZOyNtIpLauyEQ6mGMi2Dc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m4CMrrG8bers6J6QoXPAyit9mlNEoeV1863KdjQIzTJd52evIbcevh/GCGKxXZDErmSV38s+ownUgK/+A4RACJAAtvI9GReG8zSajvk9da407XzXyOjb5eD1vOrbJE1l34+xtJjS5bCc/G0nrneiE/NRwcrlH4dro3N7qntymrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWaQV5PO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF5BC2BCB0;
	Mon, 11 May 2026 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778528627;
	bh=nradfUHY5AVnCHVn152RQDZOyNtIpLauyEQ6mGMi2Dc=;
	h=From:Subject:Date:To:Cc:From;
	b=NWaQV5POCYr6yN1cUu0uK8Uf3VRVEGrJmG52jYWdPeVcr79qUPeDNFKcTzEcVQ+05
	 xPwrP8MlZWljqX8ZXi2zyh4Gl6aRERBgUY5bwlIuHaffCmy7ZPlhx+jA3mb40xVIKM
	 05rXiHCiMPlQJZrKjo1CwBSWwsYL6KWZYIPdfiXUy8/MLxSummRW9NkbDMEsmxtYgv
	 wqBEQVeYSGfB9pSfjec4pxMnpuMRxneqs6io8/ZL7PFkKnnY8aenkG+TphCYesHrG5
	 R9i9P081isK42d4Y5oasf4J5ETtiIC++hKbot2zCmOZGgRfZl5jjbOM8PT/HbY7X0S
	 Ak1y1nKoN5brw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/2] Support sparse unidirectional GPIO lines.
Date: Mon, 11 May 2026 21:43:42 +0200
Message-Id: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Nyw6CMBBFf8V07Zh2sEBc+R/GBdIL1geQKRIN4
 d+lutGVLk/uzTmjChCPoDaLUQkGH3zbzJAsF6o8Fk0N8m5mxZpTbXVGgvpadFR3vqXQFRJAlb/
 DkfNCxtlSOwaXaaVmRSeIY9Tv9m8Ot8MJZR+d8XH0oW/l8eoPJv7+TA2GDBUMm1sLzrTZniENL
 qtWahVbA3/a8h82Jk0OQL52VaI5+7JN0/QEaNexcykBAAA=
X-Change-ID: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f
To: Alex Elder <elder@riscstar.com>, Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: DFB10515389
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36604-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Action: no action

This adds a fixed_direction_mask bitmap to the regmap GPIO
config and state holder. This works the following way:

- If the bitmap is NULL all GPIOs are assumed to be fixed
  direction and that is specified in fixed_direction_output.
  This makes sure old drivers keep working as before.

- If the fixed_direction_mask bitmap is present (!= NULL)
  the lines set to 1 in the bitmask are fixed direction,
  all other lines can change their direction dynamically.

To be used in a forthcoming submission.

As a consequence, be more elaborate when handling direction
setting (patch 2).

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Rename fixed_direction_sparse to fixed_direction_mask which is more
  to the point.
- Make gpio_regmap_set_direction() fail if the requested direction is
  not the same as the fixed direction.
- Augment gpio_regmap_direction_output() such that it will first check
  if the line is a fixed direction line and only continue if it is
  fixed as output in this case.
- Link to v2: https://patch.msgid.link/20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org

Changes in v2:
- Make a second patch to exclude setting on unidirectional
  lines.
- Link to v1: https://patch.msgid.link/20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701@kernel.org

---
Linus Walleij (2):
      gpio: regmap: Support sparsed fixed direction
      gpio: regmap: Don't set a fixed direction line

 drivers/gpio/gpio-regmap.c  | 74 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/gpio/regmap.h |  7 +++++
 2 files changed, 77 insertions(+), 4 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f

Best regards,
--  
Linus Walleij <linusw@kernel.org>


