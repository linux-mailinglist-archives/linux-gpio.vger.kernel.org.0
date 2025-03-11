Return-Path: <linux-gpio+bounces-17441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15FA5CC4D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41955189BAE8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 17:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF922627E7;
	Tue, 11 Mar 2025 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnMhODrL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680FF2620E7;
	Tue, 11 Mar 2025 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714513; cv=none; b=ncQj/jWNuddT+tK20mnOgo1AdssCR6CwIYqtF1GZg1YHeQ/Su7Px+G55KjhYtIW0/29IoRmlM/BrweG05WGkJ5jLyR+VmFs0amq8bso5q715dQFGzUyELM4FOmPx8IXUX3uzpjwczk/0J8+gjrLgH83l9ayb3+r6+Lupe570V+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714513; c=relaxed/simple;
	bh=JEMUyG1Mc9eg7j3W0eO4Wl8+aC8HhuaW4FFMVwJ/AYk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ew8zBHMifUIjcIZ/Cuz9RHxAUz35eHOskfl9+wrZ8npxugLdhDZOytb0ykNcURnzLA72UiY6M7lWMC2STu5SiapF8vJnIbXMeTUf2tx+Bhl95kKyKSOvllezvvvg1rf+iPfmRUwg5awk87/gD/9DrPykiSpXez/53xCsHfsG0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnMhODrL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AC8C4CEE9;
	Tue, 11 Mar 2025 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741714513;
	bh=JEMUyG1Mc9eg7j3W0eO4Wl8+aC8HhuaW4FFMVwJ/AYk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jnMhODrL6fY421U7NvOXtXA0I/Mx+ovpjl/hy8SOFY8o2VC61DZWjrextfNp26HcG
	 3nKH6MS4Ga0TnvJdYuiegTMogVy/QxBC/pMWH2b9/HCT3kVwL95uNCTCUb6GnzEZu3
	 JCVmHJ11YsxTQSFg0G4F/dXtEi3tsi71YWdcTExGXKhVSANcH3WfYSThKbH985mWQd
	 zvGcmwgD75tGGFiRK62NV+YmjYLQCBqs1tQFQCNaoDDJ83KaCQKYmwzm1nD32GGbQg
	 fygILKK1KN66rSPk5YhG+rGXdv4Mj3DhTcRjE78s4xpT6tZvBc7UScfGFFaTHuANWL
	 0nOiTf2HHz2kQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2AD380AC1C;
	Tue, 11 Mar 2025 17:35:48 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZmBznW3b132Wze8t2zC=-8YuEW+5aQD1qSSr3w2OFfZg@mail.gmail.com>
References: <CACRpkdZmBznW3b132Wze8t2zC=-8YuEW+5aQD1qSSr3w2OFfZg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZmBznW3b132Wze8t2zC=-8YuEW+5aQD1qSSr3w2OFfZg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-3
X-PR-Tracked-Commit-Id: 7ff4faba63571c51004280f7eb5d6362b15ec61f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0b46b049d6eccd947c361018439fcb596e741d7a
Message-Id: <174171454721.169681.6398861200080705545.pr-tracker-bot@kernel.org>
Date: Tue, 11 Mar 2025 17:35:47 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 11 Mar 2025 11:43:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0b46b049d6eccd947c361018439fcb596e741d7a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

