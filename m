Return-Path: <linux-gpio+bounces-31496-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPFxA291hmn/NQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31496-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 00:12:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CB510410C
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 00:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46A5B3053B00
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 23:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735F930E0C8;
	Fri,  6 Feb 2026 23:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VClQOg0C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8E309EF4;
	Fri,  6 Feb 2026 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419405; cv=none; b=qsLW4q2ZvfO9vr3LeVFiZ2pSc1TQL+HZ1qazDQPF0Cjh+1G2XjA0jAIKF8bnzbk+aRaNjCxQNyftu8WjM7AXPPiui7Hz9VxWSJAF1OFBlLQhJkvqs+bPMZTIZUNbBoYHnaskmJYWEuX1X6tV0Gr6ju8FFV+Rz4yBb9271dE0v5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419405; c=relaxed/simple;
	bh=MCatRXU3JLOck85QoJsv35a/DFweTp8CvgKaOYI8YO4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rhewZNGzayVbp2+ZbajSAo88UloZtCPSieIZ0lesqKtFDT/njcPJyHEUci/z1NBtPMKO8zzERJBNRwMKDtksfs65roXDd3sJxRXZEhpVf2Jw7d5k2LcSoOaw61u20ziwbIStkWjD1TCOzXHZnnmzCUM4WsnIqNVjS87Tr1aXNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VClQOg0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBC9C116C6;
	Fri,  6 Feb 2026 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770419404;
	bh=MCatRXU3JLOck85QoJsv35a/DFweTp8CvgKaOYI8YO4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VClQOg0CIjLKW4KNUyMcz7/foVzm8o1l+qwTtcg6rfNXyszQXu2TJucA8RYxFE7fC
	 qLuC+vQE/+KydTBq7tpJEkEgeawqjtDzQZQ3oZReWOqFphVZwwcTQI7jveW/tw/J2D
	 8yqjasbo0hO83npcrGA/KGNzsgIzS3Berrg5yarI+fUMXB02wUmT+zmqq5vG9dT4sL
	 NBhJTQKIOPgvdeVkfaXdOLAOPE9dT4ALq5E0rwvhspFqbdIa7DaH5WYGdtYlZy/hg4
	 Nkabeky50G8oWYSm5Cl3U2OYYXThpQnbNAuPwFKrVwrCf5354j+cs7nHg0sFnfucqM
	 FbrxdE3FBt57w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B47B3809A17;
	Fri,  6 Feb 2026 23:10:03 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260206095002.21317-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260206095002.21317-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260206095002.21317-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19
X-PR-Tracked-Commit-Id: e34f77b09080c86c929153e2a72da26b4f8947ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8aa3041808b5dcf43f4964a5b58cd44652d772a8
Message-Id: <177041940155.1109628.1533161884093092772.pr-tracker-bot@kernel.org>
Date: Fri, 06 Feb 2026 23:10:01 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31496-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80CB510410C
X-Rspamd-Action: no action

The pull request you sent on Fri,  6 Feb 2026 10:50:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8aa3041808b5dcf43f4964a5b58cd44652d772a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

