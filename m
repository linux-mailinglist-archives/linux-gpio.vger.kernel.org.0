Return-Path: <linux-gpio+bounces-17871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265BBA6C518
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 22:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EA6E7A3C06
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 21:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D815A230BC5;
	Fri, 21 Mar 2025 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zdz4ojJB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B941EF08D;
	Fri, 21 Mar 2025 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742592373; cv=none; b=uFS8d93itpB65eyqLjqcd8YqJbSDMQW3lWIv2hRIcn5RcqskBItbMfOATiJ1yx3zukUVSFQ4PDGNToUuGea3Mcd/T6RFWdRuPC/RVT6Gui6DB8VQtCK2RxXChNGhYj/S2U5G/iRkFpxvSmAmlPib9Prv4cNEXrKjJKG+fIfxcto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742592373; c=relaxed/simple;
	bh=7yWa5TkBcP5B9+cF7B7AuTVZ/66PJU09rulukcDVxzE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cdbDPgE2hbmQoLI6cnOsZrK4LTOBQgcS1NbjFS82+OcPge8U5w4le5DiUzZD6ldF9WHViAAxagd8FAocuSb8yfCM1LpyE13FQKPYYksY4OuuQOjaDW+7XRorb4iakqeX4nf+NeLIZQ08R2YQddSiSyQ98FPDd7kjjWjYZvnHRbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zdz4ojJB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7067CC4CEE3;
	Fri, 21 Mar 2025 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742592373;
	bh=7yWa5TkBcP5B9+cF7B7AuTVZ/66PJU09rulukcDVxzE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Zdz4ojJBzm089AJL6y78vo6PO9OXRIhYavrXsfv4cW60xWTIiES41WCgkctC12OVu
	 dcm7DvG6pP0FoSgG7o5k1oCp7q5lyvUC8ScgemI1IOmpxPTx+dDNgpDZMmWM3GFFuV
	 EAL48iccdpnH0NazAPivU5qzi2BrbumwR9he24nwPuv9P0KIED4JCwthcR2Ay/iYI5
	 torH/QdvnUhlaqlM0xmoHi5t27LO+cId5UoYFEP/Ywrqwa6Bz5ReL5MWn4VbFQr5W3
	 UtN7fnZLT0noF+wQnmRWmX7lioPBvv9HTeug9BvM9GFSyGlMs4My9rPL80Pw2uYlwy
	 5iQ+1kgXawt0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2D53806659;
	Fri, 21 Mar 2025 21:26:50 +0000 (UTC)
Subject: Re: [GIT PULL] pin control late fix for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbGrLAO6R7kdCLUEYV7_MrWQ+=9C12nr9pYXv23UBFP9w@mail.gmail.com>
References: <CACRpkdbGrLAO6R7kdCLUEYV7_MrWQ+=9C12nr9pYXv23UBFP9w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbGrLAO6R7kdCLUEYV7_MrWQ+=9C12nr9pYXv23UBFP9w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-4
X-PR-Tracked-Commit-Id: c746ff4a67f4842e90fe232d2c9fc983f4034848
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e49db00df1f8959a6323bc0b21f44653677b302
Message-Id: <174259240922.2631089.2043232128368229073.pr-tracker-bot@kernel.org>
Date: Fri, 21 Mar 2025 21:26:49 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 21 Mar 2025 12:08:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e49db00df1f8959a6323bc0b21f44653677b302

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

