Return-Path: <linux-gpio+bounces-26409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E55B8B0FE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 21:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C12176CAA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 19:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D2E284884;
	Fri, 19 Sep 2025 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwfhqD1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B042284B20;
	Fri, 19 Sep 2025 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758309099; cv=none; b=LFyIhvT/DDtvSv2Y6JVx75jdZvxVFWqCY5xdzEqTl0nWuqLjEUGlQRZ3REYt7iOnNzIAw4jav3ZYETqdRvl9XEXDJByQoyqYMjBlLFTrVkQpUXJxu/8NyRmBZgctAosO0SU5KOWly/KppRVU3QPfBh4jnl5RodvYqveg2ikPx80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758309099; c=relaxed/simple;
	bh=89wBBiISmsoOKuQ+N7VCMs2ogovtvXRq3xT5BG9Ekrs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nQK2BmBkTQ44Ua3DZePAN4MUEb2L93OKX3z/raGkXbVUPhVwwmmf2GPI5PGwUY0mKkv40o7HYxMLSg6PlnpLjTYAfToZ0KNGDnxWJrF2MDrp0KdZ2dDbNNUwXWwRfjsSBTTSCZnGrxqjfABqH0WLya2KzHOs+6KUpDfm3kejZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwfhqD1U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980B7C4CEF0;
	Fri, 19 Sep 2025 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758309098;
	bh=89wBBiISmsoOKuQ+N7VCMs2ogovtvXRq3xT5BG9Ekrs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DwfhqD1UcVZKZg3+yOiN6PxQEMAHJ5rybWfwcFgZWliydEL/7adL29cOtHmzmMBZe
	 ZbgtnxO/2Kegb+TzSLL892zADKHopHMHyL7IKAwak3kGKDsUaE5RBU4AWQTnoRNEK2
	 KAw7Js4YJy2tAQT3k00KLB7cIQeJvo8ws3+ShyT7DCG9BeJEtuixvKfFHgSi1y9KCn
	 upeD+4Jo6G+JyWfnr8VSMgZuYaMJwTobY91FsnylQ0w+afn3gJOGiJNxFn6fziIVw8
	 x5T0xr7zrwbvWr6dlZQtuU/wSjs6VKCCc7R3lypzAWyotzGEiJ4eNgGlQHvfJQf15R
	 R9gFGzEoeIjPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CED39D0C20;
	Fri, 19 Sep 2025 19:11:39 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.17-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250919104209.9264-1-brgl@bgdev.pl>
References: <20250919104209.9264-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250919104209.9264-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc7
X-PR-Tracked-Commit-Id: 2b464fd599c583e53fb35dbdc3b4851e30895ff2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0903d0985ab0bb4f41bf611f686af1791d0301e4
Message-Id: <175830909765.3669786.10615299197003810634.pr-tracker-bot@kernel.org>
Date: Fri, 19 Sep 2025 19:11:37 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 19 Sep 2025 12:42:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0903d0985ab0bb4f41bf611f686af1791d0301e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

