Return-Path: <linux-gpio+bounces-23973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA01B18FC1
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Aug 2025 21:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F074817E43B
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Aug 2025 19:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F047F241691;
	Sat,  2 Aug 2025 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5DCrmwd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4411E5B7A;
	Sat,  2 Aug 2025 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754162427; cv=none; b=jGvMCpv6ykkACyoFkDFDDfZMXmZlxEkyPJs/oyqfrw/Sw6vgxyXvrX6BKkgKfko+CgRM2IJqk1aE7MLeWNjEny3kC4Vy4OFQktM1JZmSkOEfKNo8NLClsSboC//nEqaINWrzY5MrdLDzkMx4zZD0461JxMv4XbCA4p0JKok6apg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754162427; c=relaxed/simple;
	bh=BQP+5YtrHm4CjQ2iD8443+K60aJsg81Wl/pDQUp8/qM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fijUQuP0fw/MJ5eZxv8Npm6J15OsO2Sb9E/d8ZhMbWpH+vYKR/sNPqbWAamolkmZOHa20X2ZIEieVMZwPSZ30L1aJgnZDvrgBSl29rS0L9TyYDney2Pqxc3NMLTts1g8ozmMF1rOqTVBnjFprVDLCR0e3cEnNn4UMRHxq4D1f/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5DCrmwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4D3C4CEF8;
	Sat,  2 Aug 2025 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754162427;
	bh=BQP+5YtrHm4CjQ2iD8443+K60aJsg81Wl/pDQUp8/qM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N5DCrmwdy9AjnGSyJeV7tooQjdScjGLep/spxItv4xDehi5QIHaD6cXZO+mdrJ77q
	 JkVDiO+Ah+TjjsBmSlVVZC0v7mHA5eQgt9qlOzVzT2oElfFMI510qG77dz1nxp8HkE
	 +R1h+0R+uW1KfvP1cR3r3uwT1COaM7cOyUVan/4ADteY5VlYMUvQWt9zR0p0lEKxnh
	 x0SoyWxbizEYgxx8f9h9NlI/FGPZOc9GJZlE8e2Uqo0tu1WHWvh8qvgxlekujGfsxj
	 9WWj2pzpd4Aw4MY20YC2/MIs70gzuQNitCxwV1lqLHGER5HdmZQRjmuRqWqCm8VFP7
	 9igMXmXVu9rlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CD7CF383BF5A;
	Sat,  2 Aug 2025 19:20:43 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZh7pbuFnR6rhVzy_NHb3-Fj_30V46gV5TS=hWwuHSfxQ@mail.gmail.com>
References: <CACRpkdZh7pbuFnR6rhVzy_NHb3-Fj_30V46gV5TS=hWwuHSfxQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZh7pbuFnR6rhVzy_NHb3-Fj_30V46gV5TS=hWwuHSfxQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.17-1
X-PR-Tracked-Commit-Id: a3fe1324c3c5c292ec79bd756497c1c44ff247d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
Message-Id: <175416244257.228428.16615214272030791431.pr-tracker-bot@kernel.org>
Date: Sat, 02 Aug 2025 19:20:42 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 2 Aug 2025 21:00:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/186f3edfdd41f2ae87fc40a9ccba52a3bf930994

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

