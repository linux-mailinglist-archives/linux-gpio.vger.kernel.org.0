Return-Path: <linux-gpio+bounces-26737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A45BB1878
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 20:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7863F1C8511
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 18:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6212EC0A4;
	Wed,  1 Oct 2025 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0iK9gxy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB082EB5D5;
	Wed,  1 Oct 2025 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759344168; cv=none; b=jCi7o72I3m7rygV7+UV1RMy/28xTFyEItc23AMgBn1T9h+ZQFIsLK+06y+PiBTyyha//82pcmfI9w2fjv/TAbUTgDsK31qR+62xObo4cNRI1Ot2ysWvKXVvHqCIphP5VY+6JoIAa7ziMdHl4TKMdh4bDI7+l+qKbSJj1iBZk5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759344168; c=relaxed/simple;
	bh=xpknENcn/KIIleH7pz6jAP2ugqCxO6W9g62CvnIkFcg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kPqGKi2xyDWjHH7xDsaDNifu6Sa+wfpCkDjC7hvhy9a7eS04tIsxzW2M11NC0Cw8arIP+d2O6Q56BemWqm/5LZchCe6UVd9Ybk0shjoi+PldbWXqzcujzraajmV/DaFZ8nODLQFN42zs1eFNIsOg9KuUdzZFh+dDe2FSbixPLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0iK9gxy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003FCC4CEF9;
	Wed,  1 Oct 2025 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759344168;
	bh=xpknENcn/KIIleH7pz6jAP2ugqCxO6W9g62CvnIkFcg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O0iK9gxyXt66SimB9a6sZDGUr9SdhTOEC/93J3BZveJiarprwlDJBS73iR4nie1z5
	 diBCIunuItIilQ905B3IFYR5EopppN95/7g/yZFGmvBCi8wqIOsamPH0NfRhGF5Rt5
	 xaujPjsNfYVtEjETkSlNRifJLhBdETHhCovwKG0GpCFzcctwKXgF25jTmiM9i2jUxQ
	 WdXR3Us+MZ4sc+FSUVw3d9YatSOiVclBRqPrqlrVQL490AqPJTjANTvQ7vnhCZSINh
	 AbYu6tFNjBXt2UwYrk5LYiVt0jS/UbFW/g7eih85HSen8LYgpnSapVk3EznuAWHMA8
	 HcNYqTZL4eRig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2F339D0C3F;
	Wed,  1 Oct 2025 18:42:41 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250929094107.34633-1-brgl@bgdev.pl>
References: <20250929094107.34633-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250929094107.34633-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.18-rc1
X-PR-Tracked-Commit-Id: bc061143637532c08d9fc657eec93fdc2588068e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5f74114114cb2cdbed75b91ca2fa4482c1d5611
Message-Id: <175934416045.2574344.279001484667902480.pr-tracker-bot@kernel.org>
Date: Wed, 01 Oct 2025 18:42:40 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 29 Sep 2025 11:41:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5f74114114cb2cdbed75b91ca2fa4482c1d5611

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

