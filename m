Return-Path: <linux-gpio+bounces-30370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC3D0B65E
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 17:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBC0B3026194
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 16:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046B4366550;
	Fri,  9 Jan 2026 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AelcWLRI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F73366543;
	Fri,  9 Jan 2026 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977018; cv=none; b=dG0iDlNXXqS9plFL2F841A2MWNC3GZtqm8BxZ7feVg/lafz8t/ScMGA7xG7n3ZSl+VoPVg7Mqj8fkgWzGZ0p8l7w1ZecC6Od9UujGjrMdxizejxofLA7DTCOHymTKUmwgZIOnv+D2FitVaExYd825IlNZ6e4gnAm4PJmuLHG3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977018; c=relaxed/simple;
	bh=YPsZSc7yDZgRs7YTiw57F9HDWdK7XWaw3rnKBj/gszw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SgST4LXWyD0qKR2Jyda9LvGPJrsTlhOSnATjDfMUfVjEf5+xoJfq3eIbknEyx5RqEUttY3D9XfyhvDkfGuoJy90fnjRDsycN0i2ZCl1CIgnXfwbPc/VOGR/nNQ8jz2OV5cH7YGVKNZdnb2UQXTbbV4u7UyU9jnQnPY7V0kqzA8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AelcWLRI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E5BC19424;
	Fri,  9 Jan 2026 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767977018;
	bh=YPsZSc7yDZgRs7YTiw57F9HDWdK7XWaw3rnKBj/gszw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AelcWLRIf3xaQ2+kcKt5JTreqfHtY+dWBgQEJ34EMKm59vWylNvBxOGEYNXeV3dVw
	 dpKVj6eh1eseCmNLd8sQKtZ86nDY8DwGx6nHoPDKSHEf74SR1FDWYs0dqdYwuUvGtB
	 4IqBcu1BusQcdWz1bD8MHV4Je3CdFB0xhYPZyvsOGy6LNp9jMFFxcCGBzyqYvTNAS2
	 96my9+ckKQ1Apq06qWBfUlchwlE6CMiFHSy5sJH13T9GaB0O7qwuZfp1OiY7bf/gDL
	 JbICr1Kj5wnnyMPigqNwNNNdPa0e1hpfWgbIefPQSkT0HLICK0I7pV1s6vkfdhOMBM
	 IyhlX3LGz75ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5BAA3AA9AA0;
	Fri,  9 Jan 2026 16:40:15 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260109135218.31712-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260109135218.31712-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260109135218.31712-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc5
X-PR-Tracked-Commit-Id: d578b31856cec31315f27b3ba97b212e4c6989b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a81668db9e2c46d7274fe00892f943ed68f86481
Message-Id: <176797681532.322717.13725825034170505030.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jan 2026 16:40:15 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  9 Jan 2026 14:52:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a81668db9e2c46d7274fe00892f943ed68f86481

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

