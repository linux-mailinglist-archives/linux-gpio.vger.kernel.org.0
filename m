Return-Path: <linux-gpio+bounces-13279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288E9D9011
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 02:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75861699A3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 01:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D27415E96;
	Tue, 26 Nov 2024 01:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGA2oOy8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7811401C;
	Tue, 26 Nov 2024 01:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732585263; cv=none; b=TPxIozxZ8jr2RkL8nn0cECOtMixsaERtFyhWYU8sfxeN6tVBsDROn/XsErSLITveZLsuy+QBMpkWFXaU8YkO75ekktKlJbsX3JHJZmwLrZGIqiX2ByOK9KRtp9kPQ/NU9j0EzELmm/ZLYeulCsLgyveATOIS8sgqHkbIFaRgGFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732585263; c=relaxed/simple;
	bh=OarmreJ5S8weedh6yY7jTaM25t9OAUjkqf8FbAWCLDU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FUU0j4bzynXUGtsuOV4BAKFj0k6tHdgFpddnXQtn9sL03f6qdDvewe4KvfPeQwGUWbhU7bSnk021R9jEAni7tLL3LLS6j2Am8sInrgEXqCHuawMDyI9B4DS7P3kIsVQDcRLqo4ehHOvz1PNadraDgLx2Ugg1yMWmQQWXaE62ziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGA2oOy8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F72DC4CECE;
	Tue, 26 Nov 2024 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732585263;
	bh=OarmreJ5S8weedh6yY7jTaM25t9OAUjkqf8FbAWCLDU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WGA2oOy8RfqG0keenoC/jRJ0hyc5+1W85f+jKO11uf+TtKDu6pi2rrwzQwH7LFHfm
	 PGlLWkDH3tWske56cJwaJx5RBcFgGK3uJJlvDSHsIhSP/canUFAtLMljpsf0UnbkxC
	 9s9WdO6mZJG44ZSNWO/XJHIlyd7mNrm1wAbgDMgFJ7qPDQbEkIyBrJSz08St17FqQO
	 LQV4gBwURX99Pbkf88c0wZ21lZ95mG4lhUpUvBqH1emA3wKo+MxBg9xvUFAgNhYzjM
	 cozfe5Cl6KdRT4h5EUwvu6QARIhFYmJeHC3OeNpC4GQ19TBQDsUYGfQNEqSWbAEGM/
	 V3cAHEzjPF9RQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 344433809A00;
	Tue, 26 Nov 2024 01:41:17 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
References: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.13-1
X-PR-Tracked-Commit-Id: ac6f0825e582f2216a582c9edf0cee7bfe347ba6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d32fba02e0e5b67fb3a4ea51dde80c0db83f1c1
Message-Id: <173258527580.4103683.18187928526533726903.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2024 01:41:15 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 23 Nov 2024 17:23:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d32fba02e0e5b67fb3a4ea51dde80c0db83f1c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

