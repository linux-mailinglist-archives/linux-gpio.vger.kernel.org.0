Return-Path: <linux-gpio+bounces-38387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7qFlObiGLGpjSAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:22:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC467CBB9
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:22:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XKIRELT6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38387-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38387-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37B693229DB6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127813D1CA2;
	Fri, 12 Jun 2026 22:21:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949ED3D1ABD
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:21:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302904; cv=none; b=N756UFU3NlHwEeBjd9SrVIOAcRyPh+9vbzl0cFg45BJ2LcEW+bplADgdDYYwz4gpAZJP1K294BKEnmbASXJmhgJfdeGnSpKFDjf3A2HJiXEd8Yml4YyS8+LklqBoqeXYhZd9GdQEaN2TMQwYhigsWfCvh6Xi3JJdREVHeHzlgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302904; c=relaxed/simple;
	bh=3I5GOYy06hdmsrBpdJ/ENlXyZ3gg1Hk1pDkQf2O4IGQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KJX+AggIY2/rYDX+9yJEpVe+1m2kz8Sj3SXgULeFn9XRIAlXRMwO4lfoxrtbIf14O8tgA44bsn/ObsZ4ZwzcT7RwK6Jhtfv8DrXAyw9eftevpQpqBxHx1b1bbV3Pz5d2dKFQ7LqubYoRTGp4zOCcOql9aWwPdcJiu/KUGnaXc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKIRELT6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AAD1F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302902;
	bh=bUqQmmJTlGTbeueoQO+FzpifHMgi3IS7DUnVY1NfFlA=;
	h=From:Date:Subject:To:Cc;
	b=XKIRELT65zAqIiMD5WDFLO9WmGrQ5AdLqCdm9xfrlI7eVPJA62W5EI2awLY2JVxHz
	 s3Ensjpk4HFJ23/Pp8EC0cDsrSsgrtOIWa9L9dBHsElycUg4pMMc98EovhE0Q2C8gQ
	 r9TI5RXgkEkmMy3hnAGTdCYvWpl0EwspBLMftWrd6UMHqvxKqpPFmM0wRe595hLRvB
	 Is0+DsGOT3s1gejt6WS04D2wMo5L+Ba6J5wO3C8WlQ7mUcC0iooI/f6TvvxSe4VHNC
	 3tisJIxPe/rWkvPRmaFpUUUftDtKM7WlBFHYaX4V4csU+yOM3Fs2JCmqSjSZ5hicMZ
	 C/LB5WKPB2TVQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso1302355e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:21:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YxkGUpeRpAemZh4GR0vIae/m8nG06raJR/7GXFje518hq48k3Ho
	Rejd5FUjySBZODe6T36OxJ1sSeka1NxDxhRl7gH/LOSzBitGoFhF2CExTwnKSTRvj4FBIGQypa5
	e3myi1OM3DR/nKcRLth/M1Cfn98hWg5Q=
X-Received: by 2002:a05:6512:63d7:20b0:5aa:6b09:2ace with SMTP id
 2adb3069b0e04-5ad30da8f85mr202892e87.15.1781302901150; Fri, 12 Jun 2026
 15:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 13 Jun 2026 00:21:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLnB-FROix=2GN+ntrSpHPR5798-3pg6n9BH-uGd8rdX4g@mail.gmail.com>
X-Gm-Features: AVVi8CeYywD1z8jEDK4o7_unzHrdoOjSkao1mH1BnGjKqA0WXU-tkVNmutHE3DM
Message-ID: <CAD++jLnB-FROix=2GN+ntrSpHPR5798-3pg6n9BH-uGd8rdX4g@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v7.1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38387-lists,linux-gpio=lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63EC467CBB9

Hi Linus,

some (hopefully last) fixes for v7.1

I sat on the patches for a while, which turned out to be a good move
because I had to drop the tail patch from the patch queue yesterday
as it broke systems. Phew. Only the revert of the deemded incorrect
fix is left.

Other than that: two driver fixes to MCP23s08 (a popular GPIO expander).

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.1-3

for you to fetch changes up to 3f786abd23951f3f600a62fef42469d9200d5f52:

  Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo
Yoga 7 14AGP11" (2026-05-30 00:00:33 +0200)

----------------------------------------------------------------
Pin control fixes for v7.1:

- Two fixes for the mcp23s08 driver.

- Revert an earlier fix to the AMD pin controller that was
  all wrong. A proper fix is being developed.

----------------------------------------------------------------
Hardik Prakash (1):
      Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on
Lenovo Yoga 7 14AGP11"

Judith Mendez (2):
      pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr before regmap init
      pinctrl: mcp23s08: Read spi-present-mask as u8 not u32

 drivers/pinctrl/pinctrl-amd.c          | 35 ----------------------------------
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 11 +++++++----
 2 files changed, 7 insertions(+), 39 deletions(-)

