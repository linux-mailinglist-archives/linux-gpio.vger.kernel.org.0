Return-Path: <linux-gpio+bounces-11225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424C99AF53
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 01:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44F31C26D65
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 23:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1413E1D1745;
	Fri, 11 Oct 2024 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6aSQOta"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CD01CFED4;
	Fri, 11 Oct 2024 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728689093; cv=none; b=nFGuvyjvoVz5g8qoW2OzgLqvMeEPqZyzdKpm45+fyRenzc7+M6LZCj3f1zs0O+WlzJCfDu3IupogPu1UVJwHyw7o8KljjoCdk/WeVAY21AavrQulAlBPAX/6OBJjgx9O2rkta7yWcVhth5Xp18Vjj/7L9/4+A6XBzUM7Uy0po3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728689093; c=relaxed/simple;
	bh=BJ4VgQcngCd3nHGs6rVWb7ekZ7OxD6KipVC+gNyN1As=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VjaucnKrMkAR68F6MwX+Ik/IJ0Km8byc9p2rDah1nHG/ViCCL/82w5dbnxr0NH4O/dqpPnQb5p3YPRkKfbVRPS8E25zIJuB60ZbEdBFDObbVVEbLoKA3nVAVy66dfo3NenGTjC6Z++CBwZCTj0r19nF6pgn7feCguIyl37SRfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6aSQOta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C095C4CEC3;
	Fri, 11 Oct 2024 23:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728689093;
	bh=BJ4VgQcngCd3nHGs6rVWb7ekZ7OxD6KipVC+gNyN1As=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q6aSQOtaJocq4P/guQ42Foja2S1LpWw52m1xEtWdIxMp+WZd8k4nSzneQ73MoVEdh
	 pQ2Zn2yLU8FH0PXJcWSjK7p1XpSw27CudA1ba/BVIoODn+andh+/V+SSdLQPsVnEf7
	 6Wg4jvTzAeCL1eJvqzYDtc7m5DnI0UbHi4JuhmWykvzp4xSjWsG5dJUCusHszGjWQz
	 3NRk7QhWIuzD09LuLU2c/y9fZhwkvdGFillMdSYa+opuN0Nakr1KfNT1kzN7ycHzwu
	 IfAzqjz41cXVD2dGbA3SU7+MRFS9znLw5rqurCYAEuARXO2gg2BN9QtOb6FPWof2uC
	 amtBCaIHRsh/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34CA138363CB;
	Fri, 11 Oct 2024 23:24:59 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241011193201.4443-1-brgl@bgdev.pl>
References: <20241011193201.4443-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241011193201.4443-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc3
X-PR-Tracked-Commit-Id: a6191a3d18119184237f4ee600039081ad992320
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 547fc3225a4187c25e296240a3371115821c5850
Message-Id: <172868909784.3026331.12254130904478249195.pr-tracker-bot@kernel.org>
Date: Fri, 11 Oct 2024 23:24:57 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Oct 2024 21:32:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/547fc3225a4187c25e296240a3371115821c5850

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

