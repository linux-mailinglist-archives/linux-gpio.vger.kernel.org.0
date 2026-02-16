Return-Path: <linux-gpio+bounces-31727-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJcZN3GAk2nm5wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31727-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 21:39:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE971477DF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 21:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E2A2303A876
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 20:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86D131D735;
	Mon, 16 Feb 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5112D8G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E42FF161;
	Mon, 16 Feb 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274304; cv=none; b=XV19cpSdEHUF8ecHX7Oe0piQ8WMV11pttoOHQUcwNhHrRPM7UEcNn/G9YrRC01IXXm1UNBFSbJbW0C76VO8rmOFrknyUKPrAOHVQJW7yJNitpssPlVjwt4alVTftdVk4KmCMAB9WBnDlT99OhaGa7WFomTEDvilhE1TlgJL+sX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274304; c=relaxed/simple;
	bh=vGBLvU4ppJ77VrhLa32Z/pHBk1OK6abZqKJ5EBDZJRs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kHZuCkAXhjXpzBQmdkAanTD7+RASOGKTr+OykCMta8NA9BY1JvyUHLXHX0wXbgfJnRln65X3HDsaXhFc7MkCtzsXwlIS2ODyh9m0bx4X12eKzOSerRfDG5DY+yD1T9bxZHLy7pZLXNrnlB1nj1F9SqgTLHH17UvnW46LiWGG5Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5112D8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45924C116C6;
	Mon, 16 Feb 2026 20:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771274304;
	bh=vGBLvU4ppJ77VrhLa32Z/pHBk1OK6abZqKJ5EBDZJRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m5112D8GmZaRT9dEjsBu9Htfc5lNOhkD0MRfWLVsGNhJrH2hoHk1dXFXc6wDzvKVg
	 dhBZCJb0XpAx7P15OFW9vsDK9nL9G3CYAiGTimMwEyZakJ641u8Ew45IGuHJhqvdeo
	 PvHNBFa0FizY+dZfbVeG7R+VIyrmhYJz3sXKVNbKq5zI/PL2ZQGzIfh/Nk1lVQoyoo
	 aTGR+1RLZ1IY2WML/0xhU7N9RNjbWsnTLtNBkzRr2mtXDsMy9vxI/qrxjTavHeIVuo
	 C72lAqYZeXQ4YyUar/MaVKIYhdX9tlqBmQjJwJHoGtXqjlaxk3cB4RUWKGznmFQQhF
	 uuafA4N/Nawgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C268C39308C1;
	Mon, 16 Feb 2026 20:38:17 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
References: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-1
X-PR-Tracked-Commit-Id: 9c5a40f2922a5a6d6b42e7b3d4c8e253918c07a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46a1daac56b3bf1bdbd8b37e6db811f015bc1f4b
Message-Id: <177127429642.3994460.5510856463177338701.pr-tracker-bot@kernel.org>
Date: Mon, 16 Feb 2026 20:38:16 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31727-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AE971477DF
X-Rspamd-Action: no action

The pull request you sent on Mon, 16 Feb 2026 11:25:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46a1daac56b3bf1bdbd8b37e6db811f015bc1f4b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

