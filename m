Return-Path: <linux-gpio+bounces-37646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLW5GWqvGGrLmAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 23:11:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E525FA4C2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 23:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F4973069147
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 20:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7592C3546F3;
	Thu, 28 May 2026 20:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSx2WAIQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864135202A;
	Thu, 28 May 2026 20:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001915; cv=none; b=C0m8wdhELa/ZLEGsUBPO/9ztlWJh5cNh0gMf9zF5ULX9EW/445tovwIsCD8ueGht+56bmppFPPLvUgn7WavyG4GodlQourtPRVb4eUV60qCdDX/A+efU+/d7E0vVe/VGSuzX1PMZxD/Dr3qg9e6mMMHpPLJpcd5POlh0CdCz07s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001915; c=relaxed/simple;
	bh=LzxixIpQVWQjnpBn8uGOb7M5DOBZtUdDXheYPlSZwNk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ib5bdu7OSmWZBq2tydg0Ivs64MtjlWStRgTOO318IvQ5xT06xtAKWlj7XfNgsALv3XwaBRFmKPmHgAuXvzsoxB26UQzNq7UVHz27KM/E6awgb3sHejexO+exqK14ac2KVTtgm/yE56FEEjzurjeAKhmVAYUbW5Y1C5AV42uFdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSx2WAIQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41431F00A3C;
	Thu, 28 May 2026 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001909;
	bh=qMR9MDynuLSKZwQCctFA/XsqsFCdpvsSHuUlFkSoPL4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gSx2WAIQi9J2RsJEdM4NMIyuqw3S8QS6gKfMzTh9X6zEMhIDgS2BoutFcX1gGx8Uu
	 IQBhr+aBsd64RtodHwwXsAEsQrfG9MdKg3lMbHynwvMgif4AlQHR76BQU9uLg1zEgc
	 GzoHek0qsWBIIsFheA7mCiMJM9qNw27CDVc4cdcnMnILIobx7kbPDgslANzmLqgXXZ
	 Mi/bpqIpXBwIEnJuH7NuG9Kh+9KCsQ55NZdlThaCGdRZ1GmbmiKAkqFK/Q62vYTbl4
	 dDBBZnNOCZqdE7B1Up4PajpkmwAW4Xj9HDCaNaSnsVObH4B+gRwK1osJE7K7O9To3e
	 Acx//O78PL0AA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56DB8381196D;
	Thu, 28 May 2026 20:58:35 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260528133030.49788-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260528133030.49788-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260528133030.49788-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc6
X-PR-Tracked-Commit-Id: 9500077678230e36d22bf16d2b9539c13e59a801
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b0f908d785e19d53f0c41cb5d83639b038d2e489
Message-Id: <178000191385.1510087.16998295401123440338.pr-tracker-bot@kernel.org>
Date: Thu, 28 May 2026 20:58:33 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37646-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org]
X-Rspamd-Queue-Id: 64E525FA4C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Thu, 28 May 2026 15:30:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b0f908d785e19d53f0c41cb5d83639b038d2e489

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

