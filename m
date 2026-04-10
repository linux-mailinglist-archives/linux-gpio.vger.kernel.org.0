Return-Path: <linux-gpio+bounces-35016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLCHIzor2WnhmwgAu9opvQ
	(envelope-from <linux-gpio+bounces-35016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 18:54:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E57853DAC0B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 18:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6746307C382
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 16:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A053DF005;
	Fri, 10 Apr 2026 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKqNZ+5t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30D3DEFFD;
	Fri, 10 Apr 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839568; cv=none; b=lwdkCrJ7qdFcdM3WbfSiBJFtIT+Pmr9BW2/tteI4GNOQbULUg4v5cOUg1M6AasrpOakJz0lGuYOPlVjKSzOwTuaL4aj4E10aKO0oYCr3ABjXbE3Ipxk2pzkfSIYCx/HdheuCDgV2xiUexQ8A6+rYq5QQOWv8NXkDeuu1lvA3gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839568; c=relaxed/simple;
	bh=EoHz0nNktmxR8yvDqKEfWTPEAZKAHoJ/TrW6qPrIAKI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mQIEmLgfowgTN3vSL2ymmTjavke0ueVdhFJ784rm0uzxS4/odCr6ay1zJ8cx7J9YF/pcTt9Dst6QQgwxG3xsnOoDWSFms8RIXDeLKbdPEkmNhVnACzVED7J3AVk8OG2Qih1ruxMuPcexfkBcpOfUtuJX9OxobCP91ylJ5lrLSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKqNZ+5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A125FC19421;
	Fri, 10 Apr 2026 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839567;
	bh=EoHz0nNktmxR8yvDqKEfWTPEAZKAHoJ/TrW6qPrIAKI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KKqNZ+5tS+XuIO+fg3bewUYy+DpkSwwJ7P4UYdPLPgsmZUzDyfBWHXxOFayUUtPxD
	 +LHlrYZSi/mNHG3kNHXG7tWML1Kg7HJK1t/KaJRAoMtKOg4JnDSDtJW2Gjred5tAwO
	 PJRRgtiiAfEOW2WQ8t0RlKBTS3gQLlff+DTZq5SsjLO+3yp/t4ciIuLxlGnUtjL4Xq
	 OzuhKgerAPFhrhnvNDBldB8ahZIHyvfflW3LY785fXQopW8EDmrRBbitL51Tzt7yxJ
	 2Xm/CVcnnhBW3kd5KrkYU7vAv1dGqbjpr6HGEcUbIVNO6niOK2Zien6JgCknYiAoyv
	 zNnS66h7YaWOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDDF3809A87;
	Fri, 10 Apr 2026 16:45:43 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnTaQMzLR32LFCx4u1Eft+S+fpaKuMdGqX9sBY5v-X+Yw@mail.gmail.com>
References: <CAD++jLnTaQMzLR32LFCx4u1Eft+S+fpaKuMdGqX9sBY5v-X+Yw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnTaQMzLR32LFCx4u1Eft+S+fpaKuMdGqX9sBY5v-X+Yw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-4
X-PR-Tracked-Commit-Id: db5b8cecbdf479ad13156af750377e5b43853fab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77c3c619d2af2540b15e63dca768c0d86be746c9
Message-Id: <177583954199.2559624.647901857448871213.pr-tracker-bot@kernel.org>
Date: Fri, 10 Apr 2026 16:45:41 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35016-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E57853DAC0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Fri, 10 Apr 2026 09:11:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77c3c619d2af2540b15e63dca768c0d86be746c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

