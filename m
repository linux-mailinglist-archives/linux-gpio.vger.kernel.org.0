Return-Path: <linux-gpio+bounces-25259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF8B3D479
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 18:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC173B7310
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 16:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8C9270576;
	Sun, 31 Aug 2025 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7AVmz4N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63A2629F;
	Sun, 31 Aug 2025 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756659069; cv=none; b=MEltqj6pMb+M2/+KHmvQYq8lGKSdbvzdLpAE9Ig9bXz3I1B/qpPtYtkmgK4kgsjg/cezV/C4ZJkw91lFDeibSe34Bvnx0RhD/C0SbgRggENqCQtXO6UqsOh0W8ZwY+snzNR0we0+enM7egLckiUev6CRZlwQcTemwNLp7QCsILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756659069; c=relaxed/simple;
	bh=rkKDJoFFvTAz6ctkglGOV0JJ1jFeJgq6PjeMco1uriY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MU+oE6vDa8CDQdrYvvV5c6O/vDIpbCmz7YN/ab4tYBZEzaxT8pBEYEpFqSmKzroBPafMxCxsFwFSAzCIxPiJs0TfrWYHY/fGSMIHxCxh5fCTFbCpqsO2ybFeC5xl8wChBDC2C22al4lpZr20a42bG8TvaShIGfcL2Ki19P8Adw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7AVmz4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E52BC4CEED;
	Sun, 31 Aug 2025 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756659069;
	bh=rkKDJoFFvTAz6ctkglGOV0JJ1jFeJgq6PjeMco1uriY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L7AVmz4NV+o8WBzMPgJHEPXHD0Ct9+Ixizq5gDybrTqifNUl+/S7bKkqeJ+bYil7z
	 J5LVL52Fym/OctgLmP3Gh+ffSeu0Yj4tTKX4cfZLhamkSLeQX5jmPukDBHJ1fgt6dk
	 h6Hntjek8eP4OQp18UdflORH5onRqE9P7e6wq2jmywEbRpnABTCo7ts7BeJe07MKz5
	 wYURsUOYyf/fjjWg/6SD96YxRAD+N1k5RYKC8+dXJHMW2O4hTmPBnQIi3WQmvgkOgd
	 GW8tTH1gX0m6DTMdT7OupAa/hk/Kr4vNgkgQfBHM1LHFk6LpcMahlVzYR7qtLOFPa3
	 mC2SJyhAATkYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F87383BF4E;
	Sun, 31 Aug 2025 16:51:16 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.17-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250830195417.8262-1-brgl@bgdev.pl>
References: <20250830195417.8262-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250830195417.8262-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc4
X-PR-Tracked-Commit-Id: 6fe31c8b53003134e5573cfb89aea85f96a43afd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c99e3e9f33add5e193591e051735b1179a4382a
Message-Id: <175665907495.2726201.12522225028597336453.pr-tracker-bot@kernel.org>
Date: Sun, 31 Aug 2025 16:51:14 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 30 Aug 2025 21:54:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c99e3e9f33add5e193591e051735b1179a4382a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

