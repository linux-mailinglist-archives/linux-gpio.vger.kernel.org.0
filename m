Return-Path: <linux-gpio+bounces-38908-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0GEeOWlcPWpk1wgAu9opvQ
	(envelope-from <linux-gpio+bounces-38908-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:50:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BD6C78F4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:50:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fu1b/gjd";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38908-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38908-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303AC307834A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 16:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B523EB0F0;
	Thu, 25 Jun 2026 16:49:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72F36492C;
	Thu, 25 Jun 2026 16:49:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406196; cv=none; b=I+mVbjXw+hKjXWFQi/aesKIos8bGHytnLumSsxwu8mgJ+MCCrHBVpg02fMpueyT+9ZYlNSFjiShSVOPU1Hg39BJULZ9ruQUvvvD6iAxg85ISiDBQu1hHip67HtpHNJMYKmJZZfCTOtAjBxPhr3ljnBeog+w97yhTm+i/qWRA4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406196; c=relaxed/simple;
	bh=5tkio6Css7vl1KqZoIL7N70VEEbbiR8MAJ30M3SmSKU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qU4uGNGsLB5PTiyqDFrDQHhs+XF7WxePq99N8WV6JE9tU3kC7kiMvy73Ka/QJqxayEs3vtz0XTBZZlC2PxbYFVhzXtOjBX/fK6Nc+ACMX9NUq6X1uupwWp3A2Z8PqbN/we/ayR/eypsIcgREQJWrgJFeYcNFSEX2ytVT+CKB+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu1b/gjd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24091F000E9;
	Thu, 25 Jun 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406195;
	bh=nDC1pZMCamUGf34CtUpDLJJFqU1eQbmGuBE9YUPYIew=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fu1b/gjdl5zssXDDaaE5PwFPOCUrEgq5im6j0nxOpDLmWfOAOV8yXAs84kP0N5xVt
	 7bX67D8KWtSBLENO0eyIrPwlRh03y6boASH2e9VEA+kpJrcPwo77JxwcYrHPdJvhRm
	 nNpRnaYcRhq6HZSlgc4lT18uxeLHV108X3xkNEL/Uj0Zf5XwBTcUwShh8B01oyfNN5
	 OyxgD0tzzMlbAmd3bNVvxGo4OuBFabe769uoZpOxm5vrhpLg1uTMMsZSkv9/2+KftO
	 nFsxv83bcreYWLfIfjEgcWlfYg5nRQSrT7sFwvXJt5WgloscwfcoE7NkqjLFHe6XD1
	 0oIKIF7RJT/1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9388E3938789;
	Thu, 25 Jun 2026 16:49:44 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc1
X-PR-Tracked-Commit-Id: 4e8eb6952aa6749726c6c3763ae0032a6332c24f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 962528fef90253aeded29cee20a9b6ff3595fed4
Message-Id: <178240618320.3815539.13760964416755988611.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jun 2026 16:49:43 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38908-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B1BD6C78F4

The pull request you sent on Thu, 25 Jun 2026 11:07:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/962528fef90253aeded29cee20a9b6ff3595fed4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

