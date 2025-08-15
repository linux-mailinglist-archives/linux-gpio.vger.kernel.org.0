Return-Path: <linux-gpio+bounces-24435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B645B2814C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 16:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9287616551B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426241C7009;
	Fri, 15 Aug 2025 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tjj74kw2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00200A926;
	Fri, 15 Aug 2025 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755266757; cv=none; b=WwjxJofxr1JsPWoSYq43owGVL+SJ1Z+gbdvnfDsKPYSkd7rJLhT3/eMiYZq1c9T38mlhaolrVo/Dy6+GvRs/VA63BbQbBMtDiUfOwWAoi8wOWHBWFu/XvKzm3bKYdBFNiRpIYrXyXyhijj0iYLbJzrjKw11eW4pEhOE1mM9PbJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755266757; c=relaxed/simple;
	bh=rYU+LGkeyKvz6XVky/grqqgo21x5POFS4Fz9gpykfJ4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pP2llxG4uyPuELy9Qgbnxe1an5EuMZO1Nj874oAxY8S1KnCpur5CNqZjoYe03/GNsti1omPR5TDPQ8UKl5tOrFpMzcimNvwoP4I1gowfy1Fqu3y+TGmlYuito8br5+trTp2w2RwRLDlzU/gTZeS7R4lQ8XGyCgk0x1temi6HQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tjj74kw2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE39C4CEEB;
	Fri, 15 Aug 2025 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755266756;
	bh=rYU+LGkeyKvz6XVky/grqqgo21x5POFS4Fz9gpykfJ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Tjj74kw2HMl0QvA+p000RMKtzi9hyTgpsXJmtRsUoxTvUTKCDQzKnXjoB6YWftSEv
	 xVs8L6LXmequuHnZE5TXtEbu2ivxrGcH5w1IH5drbRXJpm22Xfo/xeUQGomMhhYJbV
	 Rl//7g1IkhJ35QS2DceodmwuzPPooYSf8EKSme87B/XJz/tMeMUijoDvkxbvLmRWGm
	 GaGZ6vmhbqBZstRzfeCcCezPgAfhRq8ygX0QsJmKYU6OUW5PRCz4u08HUZezsDm/ds
	 vKsR09GBfjFjc8bC+RyCt8XpMnHCdwU9IUSzUlbLkzkaABXHZT06d7GD+iW74hQFLy
	 I/4etIKUMQ+Jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C4639D0C3D;
	Fri, 15 Aug 2025 14:06:09 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.17-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250815084740.13431-1-brgl@bgdev.pl>
References: <20250815084740.13431-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250815084740.13431-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc2
X-PR-Tracked-Commit-Id: 810bd9066fb1871b8a9528f31f2fdbf2a8b73bf2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7bb7780e3c845009d37f61e3a8a29c0f962a4806
Message-Id: <175526676768.1083334.11059815079435111397.pr-tracker-bot@kernel.org>
Date: Fri, 15 Aug 2025 14:06:07 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 15 Aug 2025 10:47:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7bb7780e3c845009d37f61e3a8a29c0f962a4806

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

