Return-Path: <linux-gpio+bounces-13280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 411129D9013
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 02:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 919C4B279BB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 01:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24D81B815;
	Tue, 26 Nov 2024 01:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTPA4Rt3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D13619BA6;
	Tue, 26 Nov 2024 01:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732585265; cv=none; b=MPYv6xI9x7XuA/XYGrbHGrCVOHPCzBOKtqPeEQdi16RSPkvSLHRs7FdIlZWl1ItI7Df/v2ZHtfYIXKD8dMQPM3kmMJPlzLsKbUlUw+WXMaBmgRXEAi+cvV/4a2+XhSCkcZFBtkAZR/foUW5TncK8QyqMJYZ6gsS0uR3OdtkgwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732585265; c=relaxed/simple;
	bh=OarmreJ5S8weedh6yY7jTaM25t9OAUjkqf8FbAWCLDU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HwqA9S8D0qlnaCNQrHAi2rSxOVELTIjIg1s3HJ1hdu4b7Rk/+kXdsAkAY7yEnLDXEPIbD1eAVaQcaWbCyDdRyNVpTGimIV2h9NKhPHS5GqxDN6PZIe7Bxqvy9CxvFHO8IG4PERUvFSI2ksriPNX3YSSZqj5MCp2pTwKGC/YQScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTPA4Rt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9479C4CED7;
	Tue, 26 Nov 2024 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732585264;
	bh=OarmreJ5S8weedh6yY7jTaM25t9OAUjkqf8FbAWCLDU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XTPA4Rt3M/OMa9ExXsTs8zxmRJIEjTm44X7xdUvBUmioIin2jd5GBCatllK7UgIdo
	 4rsiaYoCy08KU3pvL8hnAVmrEVQHHcW/08oh4/Y3if0lLigoAyK+VINqm/r9pS9n1o
	 ssgd4B3E2cRCTotIHMd3WLAWhpRnZsBsOLl2vGGz3xyi1aupy3Z14ZKdm50azrQHda
	 J6IjwgIaeuEbVXshfeWmgjpBJ9tRbzwP89tIMGFAyq9QbYXUCrFd0lZMivdxqLRCcZ
	 WZNd8D1cvlQimxZnPQOAYvY0S9VgEBlPxebEFagG+uGLraffLQk6vblvij2POKdjKc
	 cQx8YIowUieXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBF2D3809A00;
	Tue, 26 Nov 2024 01:41:18 +0000 (UTC)
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
Message-Id: <173258527742.4104378.16233832579622123156.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2024 01:41:17 +0000
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

