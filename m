Return-Path: <linux-gpio+bounces-6376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F18C5D90
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 00:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA139B21C71
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 22:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D993181CFF;
	Tue, 14 May 2024 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE4Czvo0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5641DFFB;
	Tue, 14 May 2024 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715725019; cv=none; b=kkxfKD1EdVTOC1b1S6aUvlBJYzLLCEF2XamvgztLJimVhtn6wd5m+fd+f/sn894Xe/eTJsJCNm2U+rl/ycKctbkpeRr0czkqraSlsfA5LAN1hb6Wks0Nc1k7EeM9A2tYucYaIvCW/AX/VJjZiUPpEiBSVXm3FYm7xKkXrsQB12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715725019; c=relaxed/simple;
	bh=1NnISV+0NXzSZ2q2vuEWfmKpGYGCoi1P3ErJP+oY57s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=s5fmROp2NZGAi2KdC1p+RLPxpgM4J+EBQvz8X7i21tJcg7j6+ylt0TDzAhKZv+SOs7Zzma++eVrp4BNDQ7bckd7XqEWrl2SZ5D2XXk1IEi9ZrVMNevBRdd4Ja4R9gVHfcheYihrBss00CMX0IY6uPxXtosglgvrN3750nygXCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE4Czvo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDB8CC32786;
	Tue, 14 May 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715725019;
	bh=1NnISV+0NXzSZ2q2vuEWfmKpGYGCoi1P3ErJP+oY57s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HE4Czvo0SlyvgbS9kN71qxyvnsvpcR6O0R9M6PuY7hqOxjJ5/M6tnuFCA/pga8mjI
	 zkPm8GS1ZSjCSp7HV7Aiz0UwcdiWtnKgMeRVWv8qvH2DFxTBjtKji9FGTNC5mfoJiA
	 /wAtFRp0tb4mEAUbAD1ZRl523wjTWZV/0p1d/tMwocN47G36h82UcoRLqkG9ooMh2p
	 YoBkkGKfOhUJJpJ/mmRakbQhzI86r7OHkDujVd3h3NhQQQvpsYFuarG2Nhi1DvHPCb
	 Qny0DWSvGUTrp2DcJ91XK4zc0tCUAJh4foDAPOlt2cYYyZT8TpMRESdROUyb+nVpho
	 QUZkRPDomodSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E46A5C1614E;
	Tue, 14 May 2024 22:16:58 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240514075243.7008-1-bartosz.golaszewski@linaro.org>
References: <20240514075243.7008-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240514075243.7008-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.10-rc1
X-PR-Tracked-Commit-Id: 7f45fe2ea3b8c85787976293126a4a7133b107de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce952d8f0e9b58dc6a2bde7e47ca7fa7925583cc
Message-Id: <171572501892.5061.16629563788114529639.pr-tracker-bot@kernel.org>
Date: Tue, 14 May 2024 22:16:58 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 14 May 2024 09:52:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce952d8f0e9b58dc6a2bde7e47ca7fa7925583cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

