Return-Path: <linux-gpio+bounces-31617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NYYIZvmjGnquwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:29:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F67127639
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8E7230177B1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 20:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291B235A925;
	Wed, 11 Feb 2026 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl6uZo8F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A9357A3D;
	Wed, 11 Feb 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841691; cv=none; b=HS/ehfDC33CAze+WpQYKD4y3696PbkTnx3kqMh/92Wh0BmHjXHPYPjii74vASO099e51GQxSmJXKeJsRsBDR5+cgBUuJQYpw/dgLwWw6GkdGPQOWxsreQgB8lEddqRfFANFCNfzxrPpUANbdkdEyP8SUUfSDXxJi/pS1CWV51ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841691; c=relaxed/simple;
	bh=jWe/KLigto5fTNilNYxQhh2GO4BZRatUWKFTy7tv/1g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OQGUQw+7/w/eZddZTVJBshUanBb4BV1u+u7hpVTA35hJle1VEzQ6Xl0AXLMwAdvYuweeJ9IgN9AXIz8h0bWhLvof/egAWbemay2HgJchuw8PzN3N5m1NSn9eqDmGlmbJncJ+Suw5AN4m8Y8hPXbSP68S5MycVhd56enevyKcW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl6uZo8F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39AEC4CEF7;
	Wed, 11 Feb 2026 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841690;
	bh=jWe/KLigto5fTNilNYxQhh2GO4BZRatUWKFTy7tv/1g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Xl6uZo8FIQ3IWxAaUX1E2hus25KPcE+57Jdx5+3meCdruCuBTEUaxccUP1+n0IifC
	 zAX/ul9IlKhgkZMoRlkLIKRUnrsgo2wRCHld/a0nihZZ9yCFjCoUp41hu3iVm1fkVd
	 n+I591t+rkg5OFCzYmyoFSrg3eKbLAK0RJSZqXjW1jROrdmFR5EVEVzLEpIsPA4E6Z
	 7T2IydDOZeMFoct+WripEWF2FMsF01aBQmlfN3q9ZNaIGLYn9qcULNOW0Vvn/X9dDI
	 LhPIHFF+lIzvJ2kkyUS8VemOc1TnxmfmOEHt7Xg3ipBMaMQTrhyjRSUk3ngbWaGAFT
	 sP8Zp2lIvxRug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C237F39EF964;
	Wed, 11 Feb 2026 20:28:06 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.0-rc1
X-PR-Tracked-Commit-Id: af9b4a56f0000fb11057e204ddfb05d72ba4dba0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d70178215211a7c73ecabeb55eeb0f8ef002bcab
Message-Id: <177084168542.710910.7357668844733574564.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:05 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31617-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2F67127639
X-Rspamd-Action: no action

The pull request you sent on Tue, 10 Feb 2026 10:20:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d70178215211a7c73ecabeb55eeb0f8ef002bcab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

