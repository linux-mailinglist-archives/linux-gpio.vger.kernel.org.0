Return-Path: <linux-gpio+bounces-7807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554591C448
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 19:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56EBF1C23089
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 17:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1A81CCCB1;
	Fri, 28 Jun 2024 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f70goEKA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11A1DDCE;
	Fri, 28 Jun 2024 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594067; cv=none; b=VL7B+6DE7Bmt6oqr1ca5K7961ADT6E13dlu4hnfnFNv4FbhRk5QfTwPDnUFjrTGJYdPpw194GCcasBWIdn+C3Wyawcl0F4O2w9HE7tCgytuzdG5HxswSJ1+ETRetlRp2xZjw/TabyFpyoV3CACJ+Hq3l8y3cvgZNZe3BK8kDpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594067; c=relaxed/simple;
	bh=t2YFmrv6mOwlGMs7c72lkDDmVSV1Gy3UanVtRbLXMHM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZXOaXeWRAD6NHnn2Q/JV4bqHgg+MwLVsC8woydHTn9sAP5JShbsrXGu0gEVzt2pgZUoq9lWS/WuHh1UKdJ+ebR+Ied8gAhxBmEH1aanbxuANoNOlX9BCZ2YfPfZXQAAW63/4VoNilMUNut59czP7lgTM4kC8m9eVTkwOcJTazLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f70goEKA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DA3FC32786;
	Fri, 28 Jun 2024 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719594067;
	bh=t2YFmrv6mOwlGMs7c72lkDDmVSV1Gy3UanVtRbLXMHM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f70goEKAvvNfkwR3LB0+xFqfXybXBAXxcBBkAEbsTPPFQ8pdFM98ZrMf/Tu4v9Ahm
	 3FnnPY3E8pqtGMbEkJ4B+Q19dBzT45jI9YyqOUCI8whAKwgzhkQ6jEbgDOBOKu86nT
	 ibGIozrTDhwJqBxg+e9KxFv/sOjid8+hBJ/VrjUK3q6kvJYnzKJkdlFKlxP9Dxrpzc
	 kRBjNU4EumD6TUr79kY3NB45CrU/c1jp04JzGJ0pk1TclXJHFagjie1YOGm9LI99MC
	 glmR/6PjFY+6kBdFj7GF7UG+vPY0c59FufRKdx6uskSAcrU+IJBx0c74rNCthdYrxN
	 04P+iKqDKF2+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80356C4332E;
	Fri, 28 Jun 2024 17:01:07 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v6.10-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240628101142.33339-1-bartosz.golaszewski@linaro.org>
References: <20240628101142.33339-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240628101142.33339-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc6
X-PR-Tracked-Commit-Id: b440396387418fe2feaacd41ca16080e7a8bc9ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1cf066846678feed9038aef9e03dde34852c84c9
Message-Id: <171959406752.14402.9885742032967896957.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jun 2024 17:01:07 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Jun 2024 12:11:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1cf066846678feed9038aef9e03dde34852c84c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

