Return-Path: <linux-gpio+bounces-38518-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HyoTCTKxMGpUWQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38518-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:13:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488568B6A9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:13:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hTRMK3r2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38518-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38518-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A2CF3128D1F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B25386C24;
	Tue, 16 Jun 2026 02:11:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD83AE1A2;
	Tue, 16 Jun 2026 02:11:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575888; cv=none; b=dCCJgYdd26XlzOi5H3QV2l+wJVehbRc6hVS8eK42/6HOfdnqMcdmrrbxvXi2Da3FRSTCmntsSvfqsRAPsRJPh1b3ZvFxdeVf7ab6wUYSmoQskJpPi4dOvbaKBCU7aQDgRZdZBEMzve9bwsPwKnQNOvUQYscG6bNvDcjd8HXNJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575888; c=relaxed/simple;
	bh=6BLm3a02p4esv+BYr9MLxVOX5dIVvOOyQPKF+8s0P1Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nS3uXVPjJtY/d/0WZd1IdQHKmVImAFKlakqJhcAyUOzAyiX8fhR04O2Z/l3PNGHRXqd0pUxDndzuew/M6nV4XRRSn7R7LaZmTk5j4FeZea5y8E658GieH/R2SqnnbOXjRsqxrBXnMRbQtrJnZFGKBeUz4keeJ425VzaueVPfQVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTRMK3r2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3254C1F000E9;
	Tue, 16 Jun 2026 02:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781575887;
	bh=3Mxq3KPY7JUPHAevg+VkeGN3dN02FfOCbominiarrQ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hTRMK3r23JX0ZVb2Ns0C1sUkyIrDOSs3KJNxefMpCMoU8gSX0U0pfGDjKMitmNjxY
	 PgGv4QUwekE35+XMfBeqRlMNfy7AZjUqNm9kBCk4PbmxfWs3RkO2Bcjm5gTWxlCp4F
	 EkFEcxep1K11/FxuPgavZYIfiuyhlO4wGzbrc6wJTqxTksCSfb+t53TF7jGGqruTFJ
	 wY8KnliCovqOPbjHuOc5j7wvBPBt4KGu/Cwn4zbSltftz4zqPTA90fge5uIllV5Ypq
	 Cdv4YYOA5Zk2AHuVRH5+d0sAbGAUVpLtGr98A2LzAXtusreuU462w9d7RYQX+VBjpZ
	 1USl5BuSWIehA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C473839A26;
	Tue, 16 Jun 2026 02:11:23 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.2-rc1
X-PR-Tracked-Commit-Id: f953585dafd71ecb0897f9def9c0a3702afc1bf8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77d084d66b7694e2a912abdd8b9e5a0e7a32d28e
Message-Id: <178157588195.390807.5690656305735845222.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 02:11:21 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-38518-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6488568B6A9

The pull request you sent on Mon, 15 Jun 2026 10:29:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77d084d66b7694e2a912abdd8b9e5a0e7a32d28e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

