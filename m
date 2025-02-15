Return-Path: <linux-gpio+bounces-16067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B7A36F55
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 17:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00EDB1894A1B
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 16:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4741D8DE0;
	Sat, 15 Feb 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExOKTVB8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165EBD529;
	Sat, 15 Feb 2025 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739636257; cv=none; b=AjFR6/IJeU5WApmZszDVi1svRq1vzdAqoI4wtzQ/3on6G2zvxlEZ3/Ob9uhjl0hnwPASiipgzKTcduaZHtaeWH7uIlLOl78V9e/MI1EGB+GncRvTLS1Iws3GtxKdJL5S21/8kxwemLIa8VOo3bfQ6nqp8QrVYe5lezkuDU1GSz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739636257; c=relaxed/simple;
	bh=7Y8zneOxUR44b1m1nN9u7Cnlk6W916zNl0JV8P9Imk0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M2xwykKakmuzZNwlTnro0Vw5I3bSraePVTl3GWZZg4IPsMDqDjJe/4eRd6+uME+smyMrttxa4GhYfT8bC4Ing2n79/Tbs8m5xHXD54G/EXYkBeYSD8FomydzTXiHnuNEiQ7eRe3IHd+czw/J7FD+jjpRfRWVAjV7NiB9YVNMoao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExOKTVB8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94004C4CEDF;
	Sat, 15 Feb 2025 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739636256;
	bh=7Y8zneOxUR44b1m1nN9u7Cnlk6W916zNl0JV8P9Imk0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ExOKTVB8q6DFW3v+rWpZHo7Z95/dr5l2gZPjSRpfVTBSUAp3PSA92cEh8Z0dduPoA
	 nx505O18gOc6d5Vid/hanGeje99RT/p1+BVmVIAQGYhAaBufaa1Ro7e8CDKYWPHTqw
	 9wJe4KkbOiNqWc2gxUa7HVt9ybQCW8VnD0VPWFePTNpCVIsY2s2jwji+cIVBKM1bji
	 e6pJpg9k+A8MedUA2oHtTcbSdrASuo5WOdbuSHtL8xxinJTn6B+Ch9Ag9DGyMZ2xBC
	 LHHJUwECpwmUgGFrWrzJMuJ5/1rlUiHBEGCANJ3lhpD+I86DNIt22LNKVQQSdak9l4
	 Y3xmAqa/F4BqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71395380AA7E;
	Sat, 15 Feb 2025 16:18:07 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc3 - take 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250215092508.5849-1-brgl@bgdev.pl>
References: <20250215092508.5849-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250215092508.5849-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc3-take2
X-PR-Tracked-Commit-Id: 7b4aebeecbbd5b5fe73e35fad3f62ed21aa7ef44
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6452feaf29a6a1cc1c904520c4b1b4cd90133fac
Message-Id: <173963628616.2294964.8421624057006025098.pr-tracker-bot@kernel.org>
Date: Sat, 15 Feb 2025 16:18:06 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 15 Feb 2025 10:25:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc3-take2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6452feaf29a6a1cc1c904520c4b1b4cd90133fac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

