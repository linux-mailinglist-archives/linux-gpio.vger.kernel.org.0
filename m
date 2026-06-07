Return-Path: <linux-gpio+bounces-38056-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xO7eEzv5JWotQAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38056-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 01:05:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B4651DEE
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 01:05:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=EJjtLYkw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38056-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38056-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 701C1300D179
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 23:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890FA32B12E;
	Sun,  7 Jun 2026 23:05:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4F3329C57;
	Sun,  7 Jun 2026 23:05:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873528; cv=none; b=pMDdIiX24Q4g2af9mSCyl2tebPzHCYRvDpTXDqARcwiHrZpj40de2ECRByahCM7fjujcs46cjB7VEvksMzcajd92glozO9PxtuCNP7ODUhP+HPBeZl+Ul1ebd540lx31QcJA8XQrvxRUhjhlOkBDaDPUODdwmWKmGbO/HBCc/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873528; c=relaxed/simple;
	bh=Y6ZqthY0/KmfwbT+mbcPRxThag2E4h/avLxT8wpSRmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IB+Vk5HOeGAFEx8ZRNs2T5yJhnHLI3iIlJD9F2thXN5LjtE2+vryT/6A0AOs2G6AlZcA22c452lmx1lKx6o7sBfkVwREQgPNG2HwI3ybj7zREUY3jxtoonXZEHqjh14gKWFIvJm9bQgQpNsQFkBEBvmlI8Xiagfi2q22k+96QDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EJjtLYkw; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5998427740;
	Mon,  8 Jun 2026 01:05:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OapcbgyAuZT4; Mon,  8 Jun 2026 01:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780873517; bh=Y6ZqthY0/KmfwbT+mbcPRxThag2E4h/avLxT8wpSRmE=;
	h=From:To:Cc:Subject:Date;
	b=EJjtLYkwO+t6DDJH7escbwwh0r1yL3RwRmB269vydRugTEsH7/hhpUWgvwY/xXNeA
	 MEdwG3EP8zMcv2TyjqoEsVa4Igr5iwmnZOQvUMik4Omt9CWj/Oi58+QdcYuLdWUyce
	 1MVWyfvRUlKGYc+wyZnEKZa/pWBiEwkDFSqCjW7ZhbowI5vhFwHc/bJmAORqmNihwj
	 ecjF4p68zB87E3RhlMSJGzQb1T5+9w7qG2F8MNYvGYqVzJANUrzR/DaOwTJlK2eBb1
	 9xdhzwtHz5GH80ReQPAPMFsIb65yV4VsPbFwYhNnpqzAo4Yad96JbTPCvpsG77Wubu
	 KveugGp5d7IGA==
From: Marco Scardovi <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] gpio: rockchip: Fix generic IRQ chip leak and modernize resource mapping
Date: Mon,  8 Jun 2026 01:05:01 +0200
Message-ID: <20260607230504.35392-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38056-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:heiko@sntech.de,m:jay.xu@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C8B4651DEE

Hi all,

This series fixes a generic IRQ chip leak in the gpio-rockchip driver
and performs two small cleanups to use standard platform device helper APIs.

Patch 1 fixes a leak caused by generic IRQ chips not being removed before
IRQ domain teardown.

Patch 2 converts register mapping to use devm_platform_ioremap_resource().

Patch 3 converts interrupt retrieval to use platform_get_irq().

Marco Scardovi (3):
gpio: rockchip: fix generic IRQ chip leak on remove
gpio: rockchip: use devm_platform_ioremap_resource() to map registers
gpio: rockchip: use platform_get_irq() to retrieve interrupt

 drivers/gpio/gpio-rockchip.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

-- 
2.54.0


