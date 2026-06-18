Return-Path: <linux-gpio+bounces-38700-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0ymN7d8NGrBZQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38700-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 01:18:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175C6A30E9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 01:18:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QxNcvQzn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38700-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38700-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 776F630B1122
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 23:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBBB33B6CB;
	Thu, 18 Jun 2026 23:16:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2347833F8CA;
	Thu, 18 Jun 2026 23:16:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781824594; cv=none; b=rhYIuugRiFoPRJCNqWJbIO63pTi29GEjjNdr6C5hsp4PWShbKfC+mzcEjMAZi3QFKY3b76+qLwHrDXT0Eo+pEW8c8koC42dLLNq5ny5ysFA7csxQgj3Rx1akucBNuWoebf8vRD4kgYF+ktZVv4na6D5Jf31H/iJn0ftPwswpSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781824594; c=relaxed/simple;
	bh=zuPNFX2/DMU0wyCcVKKP9MTtbpDiHM0kXFpbTtTKCfc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aXXkZllXojP1MrGtvpu7ATMttG8HO+aeMgZLc377yNEN/aShEvBuach7X5ZpfjcdY2bjL8yFrFqoNR5i4IciespiQgYf+CdSlVdGPFS69ATj0AJdZsFpJ350SqQUDPOSOYcr4hEomIwEc0W4sc10DlqYKfD3ns3cFKwmcjngI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxNcvQzn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BD91F000E9;
	Thu, 18 Jun 2026 23:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781824592;
	bh=/6qqtl8GSyovQmj72C8jsKfXkdRYZyvWxBIpGK1fef0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QxNcvQznYX9wOeEniKyYXgZ2VjZZ3iFAM1SJ2RQHpmFpCWiy0IxD1fFmLcS3fUfT1
	 sBsRdCctQrRp7OuCDSFTmNU25ub5dgdsYz6vHLZyxHiC59hPBN2J108PdAdUKQVzqY
	 9Yb9aUwgEbrlI2Kt4NWIo9czZfaR3gVkl+j2zgy43Y5aWEfErtc+1MHZ1YpnTEqcle
	 uXiO6+E1nKH2X7cssWtxcIarf9nXg2ZmEU3Y11PNJow7YKHvRnAoYtVTkr/07SVrgp
	 82pBqYJRWd59peYYiwAs2xq/4PlWvgVZBwLrATUv2xd+ETiaqcGU3YKDDKqU0K33je
	 9B1YuKexcwHFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569403A5676C;
	Thu, 18 Jun 2026 23:16:27 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for the v7.2 kernel cycle
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnqGA6eYwbuds+cC0uWvGd-dEX7TPU39ghattp-tETXSA@mail.gmail.com>
References: <CAD++jLnqGA6eYwbuds+cC0uWvGd-dEX7TPU39ghattp-tETXSA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnqGA6eYwbuds+cC0uWvGd-dEX7TPU39ghattp-tETXSA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.2-1
X-PR-Tracked-Commit-Id: 8b2c4f88c6ee86efdbc81bed1684e13e2efebd53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 53c7db5c1916afcecc8683ae01ff8415c708a883
Message-Id: <178182458584.3104666.2454647437691858044.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jun 2026 23:16:25 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-38700-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:torvalds@linux-foundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3175C6A30E9

The pull request you sent on Thu, 18 Jun 2026 15:00:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/53c7db5c1916afcecc8683ae01ff8415c708a883

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

