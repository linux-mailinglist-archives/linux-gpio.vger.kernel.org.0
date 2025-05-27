Return-Path: <linux-gpio+bounces-20621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53ABAC5D64
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FF249E43F3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2751219A8E;
	Tue, 27 May 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEsVvo2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD0A219A80;
	Tue, 27 May 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386052; cv=none; b=fOXa6scX2kRO6Rv7PkjQLIw7qxVqeYE/tZGKLupncX/t0fV6/pk5kFb33RF1jhTLUo44HdOE9Q9XSTImx2daYFJAdxQeZ6N95MzMciRnP5wUu19darpZeu2odyChxJgt9HY2UDpbG74p2LIztfkdhPuHm+U0Nj9jcmLxOYySepQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386052; c=relaxed/simple;
	bh=+G0YrzecO+Lcej+dWKJ4/UWGZ3VCtwpiqqyQup0MIMI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VWi4f6CoFDqxuduhVgq6oU+jWeaO3W72XZfBe+piieEoDULSAdpEeTTSUjeZHxPOa+FH2rQ4CIt0quKbuIT2sL8mUzinptPQqEou+pzNfa4Uz2qVaHHPSVBzOKb6EeaZTVMkDr5PeX2Lvl7SCHTHc08kK66L2gqGiebORf9GOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEsVvo2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42108C4CEE9;
	Tue, 27 May 2025 22:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748386052;
	bh=+G0YrzecO+Lcej+dWKJ4/UWGZ3VCtwpiqqyQup0MIMI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SEsVvo2xZa1bT/BtfpWwVsgDmMIWEGVDqPstgr9EKWsiMyiQ0gfg9aAcqIeD1XFh+
	 pOlYoHcYpVA27Ya28i3NF50n5PWbd8jb8grWc+5WbcHKSsynxkOu+8StNtndpE+kKr
	 gVHKTCHrBLM73UIQyWzs3/O1gnc+rUW44gIQretiCozsKsAhRpC7ebTwagiXKqqTPu
	 0BA54XNiQ1lFXQPxV8PqwhEkrOCiO7PR/VoIuL6CSAdgNc7w6SBc9oQL7eJTZ+9vAd
	 lEdQIhTY/xlqbxoetgqW/pPil/BOTtp9uUmsd+5Djd6CaPCYAJSS+aye8ZQ6kaU043
	 J6ZurnNFojV7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB1380AAE2;
	Tue, 27 May 2025 22:48:07 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526095541.34708-1-brgl@bgdev.pl>
References: <20250526095541.34708-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526095541.34708-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.16-rc1
X-PR-Tracked-Commit-Id: 8b8ef309093ff196967a21ee51a9cdb404a13bf6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aacc73ceeb8bf664426f0e53db2778a59325bd9f
Message-Id: <174838608628.1808984.13401859106713454753.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 22:48:06 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 11:55:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aacc73ceeb8bf664426f0e53db2778a59325bd9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

