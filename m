Return-Path: <linux-gpio+bounces-9229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58289961713
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A6461F24DA3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90C61D2F45;
	Tue, 27 Aug 2024 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7wmwq7b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779AB1D27B7;
	Tue, 27 Aug 2024 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783793; cv=none; b=YXjtQ0hQ9EKxme2frTfZiPOR+tHhM+bgQa4w01AFlRBsuhgcahJZ9KJOfnJCPaL9CDONEOWosiZI2VGf62sOlIbEfcBYTjaC1p/06A8fNEvvFsdE1ZQTDkU8lETO67wOR7DQnoec2xvBy9PpGPXnd7STCIlE5pUk5UldBIUyf1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783793; c=relaxed/simple;
	bh=7UNJsD44NcWt0gV5FXb9wQ7AKocblVNyBXMBJ1ic2vY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=be44gQivts5qoZuKJbv/6bhB1z0zEKwBHoaPNJr4PZLyVuSTSJ3/qr+zZEe+zqSs2H3qbKncgDCNQntuYwor9RE4Mkt/Rpt6Ltyy/idgNVpgQ/CKBCzqnRXBV3JEoxE16ngr3eC3jNGzZNNBHmrJfpHEdWXr+eNpKTztnNC61co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7wmwq7b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E71C4AF18;
	Tue, 27 Aug 2024 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783793;
	bh=7UNJsD44NcWt0gV5FXb9wQ7AKocblVNyBXMBJ1ic2vY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=u7wmwq7bg9+7Gkf5KlPj/Fn4faWgRHgpT8Dvnql8XVxbJIkckoy/DRaa0owSU9/Yn
	 ceZgEnnG2kr3K1s6MSVgY1lgisEKN6cS5gHDHvTIjp0Q2VEJg9yADa7hSx0MiE4LJr
	 2ugq5w78VOTw0hw94tPQOMwdexMlDLCo0xmJLR4QvgD7tE1AfpZjCYwBW7PVdWuAqu
	 Ye4095cxrMuZNBo7yO+oc+QcK3PEqSA/kRFG5CilEoj1BQAzgcvHSG0jMR8p/l6XFL
	 pCiBUJ9w5xif3QrsUms9AAHHvaK0njIUzG3bWZYD+IWzjBMWnKk8Hd71dEiyX12Cmh
	 MuylV95uMiRvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE2D3822D6D;
	Tue, 27 Aug 2024 18:36:34 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbWs10eU-jSiN9H6UNkTNA7K8PS3gAfUxe+T6dktJsSyA@mail.gmail.com>
References: <CACRpkdbWs10eU-jSiN9H6UNkTNA7K8PS3gAfUxe+T6dktJsSyA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbWs10eU-jSiN9H6UNkTNA7K8PS3gAfUxe+T6dktJsSyA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-2
X-PR-Tracked-Commit-Id: 128f71fe014fc91efa1407ce549f94a9a9f1072c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 41594663c3fb565940ec2b947bd7e623e3f0e600
Message-Id: <172478379344.730673.4440726360525683900.pr-tracker-bot@kernel.org>
Date: Tue, 27 Aug 2024 18:36:33 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 Aug 2024 17:25:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/41594663c3fb565940ec2b947bd7e623e3f0e600

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

