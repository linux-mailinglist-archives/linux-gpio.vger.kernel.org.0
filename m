Return-Path: <linux-gpio+bounces-37379-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK+FJIqxEGpWcgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37379-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 21:42:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F805B9841
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 21:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E31693033F8C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 19:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B122F379EF0;
	Fri, 22 May 2026 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XI9gKfdy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66713357CED;
	Fri, 22 May 2026 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478732; cv=none; b=IfFTsGl7c4UTSBI3Fomlc45C2K2R0YyzWK/C0BRqa14zXZx8LVMw8Cz7d6VicVkwu1Ow8Kb2z6gx6vT81TrhiL1L/9IkVYfErG2pHUVG27oVrEB5qrcC98s6qIWv45QIpJ+C6RpOwgseZ7LnMySVbxIXlDdKdLyQpK2BDSO/LCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478732; c=relaxed/simple;
	bh=xNqUAdZAs6B9+tLOepvYWuD4uv6R6GMmiKXToeskkaE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OynzX7tgT+W6Kv8KHy+vs5nI0DpwN3r1Qpki/TN4suUag8uCmF8Ej8DGAiSqUQeClw7wCxDekwJQdk66BOjAhA7+iR+RmE54APVYiU01Eema0a0jpguYdmqqZrvlJQ7pS92Q4wsal4W9AhhP6C07A4hRDMRj9/pOBWccXgP/qio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XI9gKfdy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CE01F000E9;
	Fri, 22 May 2026 19:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779478731;
	bh=IDgecz8MQdWp9jd+IszwxoNOFR9/DIZCh43D04KBnSQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XI9gKfdyKqfHVNxwBfY7ABklf+vIPGeMnuzNgDT+DEb9bMkGLd3y9n1PCfaj4r/+I
	 75YsdBphvkqADYzvgkOfrOG+3nxlv/LxHxTU3GQC8pWloSlXQMbj+AyFJKaHtJ5s2c
	 N+kAyi38nJlOCImw1uM/Di6JgEbRx8ur8mY7KmSy/rSpkvxnoyrOFyhy3NHfSlQBRH
	 xfvIIvtKNqUG4ORcbChZ8GKQ0VDWNxBgBDa1jf4auUpuZtpvMNx37Sze+D3Pkm6Mid
	 +Nw6P/goEbpZ8KW1HCHYhFSXa32BHLyzPMtCOngw/4Wn//Larzab2uOVdhcLUVdL2U
	 73p0NQeQuaFqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A623930FBA;
	Fri, 22 May 2026 19:39:01 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for the v7.1 kernel
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLmCEJD+9LMJM0C9a6C-OdBCEb-gef4qFAY+=wULQWhECQ@mail.gmail.com>
References: <CAD++jLmCEJD+9LMJM0C9a6C-OdBCEb-gef4qFAY+=wULQWhECQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLmCEJD+9LMJM0C9a6C-OdBCEb-gef4qFAY+=wULQWhECQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.1-2
X-PR-Tracked-Commit-Id: 3812a9e84265a5cdd90d29fe8d97a023e91fb945
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 003759d49a407c712f0bbe77cf5cf5b57f03d9e0
Message-Id: <177947874020.1341212.7157241262382615556.pr-tracker-bot@kernel.org>
Date: Fri, 22 May 2026 19:39:00 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37379-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 14F805B9841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Fri, 22 May 2026 17:36:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/003759d49a407c712f0bbe77cf5cf5b57f03d9e0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

