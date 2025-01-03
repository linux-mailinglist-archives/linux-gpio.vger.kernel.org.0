Return-Path: <linux-gpio+bounces-14492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1EA010F1
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 00:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D5318847F7
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96091CBE87;
	Fri,  3 Jan 2025 23:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdQog1op"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758871C9DD7;
	Fri,  3 Jan 2025 23:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735946524; cv=none; b=S5GzWSaiCb9/p7wDCJo5IOhZOAgSzc2jIqlZg1ZPeLyHCVRSJdXac5i49QWjepiH9nXEJfmecI7ZhruhT3+U3cFl9mQHZ8c2DgW50pzFRJNMrAY8mQdYDH+9RvXsEQbXzvwxSL4VZGO2LHLlZg1F6UhvFaSSE3XI2f9Kog2UYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735946524; c=relaxed/simple;
	bh=R+s5sGJf1oWJlW/uUMiBTbMzCG+nyv7LVOsCGWY75b0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aSxbev+Nrarp3vXeGpHTUNM1ACkCLGGtdi8PMl+v49Se8A1m3z9g6XH2DIAS9nUUooMs2i1cF+mvWPWg5awHZZ03UXM850VXHRGPqE3cM6KL2LefHBXH+CT0fbJj2pzX7Y2L20qUFm3fdtTqmTHI6STv4p++bQgLCjsnURNzAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdQog1op; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DB0C4CEDE;
	Fri,  3 Jan 2025 23:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735946524;
	bh=R+s5sGJf1oWJlW/uUMiBTbMzCG+nyv7LVOsCGWY75b0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RdQog1ophfGLomil7w5Psqmlh5BOpcScGHAtemhT630exak10ybjmpMel9T0twUPt
	 CfZyLF/9QXnGcOwztI8JnF/pncesWJbbPYwjAssPVWtMJw5nFSl8gfF6827Jih1CUU
	 CNS0E7cgNOUCKlJre55qBpp25QdWmjSrabYTsFsa9XlhnicHATFUFiHk6lIKfQ2dKn
	 mcnRCkpXevGxSs4wePqcW7rgLSgFirpMsS8mkMi42YtgTX82YndVAh+N4E14a9crWq
	 H2A2m1Ee+OojQPPuZB+xPbEcBeKN/QSA3QpbHuc+FaoVBxa7eaqzfpsZNfqgUIUKjw
	 gW03CSK6r8uBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C2E380A974;
	Fri,  3 Jan 2025 23:22:26 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYCDUW5QMh5Tx9zkSniEhWzmVBVnAQ-6tTvUWeZ+eZTTw@mail.gmail.com>
References: <CACRpkdYCDUW5QMh5Tx9zkSniEhWzmVBVnAQ-6tTvUWeZ+eZTTw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYCDUW5QMh5Tx9zkSniEhWzmVBVnAQ-6tTvUWeZ+eZTTw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.13-2
X-PR-Tracked-Commit-Id: a37eecb705f33726f1fb7cd2a67e514a15dfe693
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f274fffbc28849848fd48379dbc83f10e1019270
Message-Id: <173594654484.2324745.5518851938337829691.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jan 2025 23:22:24 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 3 Jan 2025 09:18:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f274fffbc28849848fd48379dbc83f10e1019270

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

