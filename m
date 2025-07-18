Return-Path: <linux-gpio+bounces-23501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA00B0AA96
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 21:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81AC9AA58AE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 19:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0A32E8E13;
	Fri, 18 Jul 2025 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6f4mZj4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA9F2E7F39;
	Fri, 18 Jul 2025 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752866017; cv=none; b=lTiAI2Y35y5/7iUtFunfPljJrcN73vE7v34LM4Pne2bdgTuMKmEzru2QQQk4oDis1LvK/gPwN9ZPH5FP7wF9UMsVLtrYs2b4cqUfdJAH/d6QWkr/Ac9G2AP5QhzEIc6ZT1ErBk+RXJdNnvbCAr5t/Qo2UzfIzl+PT0UpXURAAAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752866017; c=relaxed/simple;
	bh=ok9aI1aAyN0OzYdXzrtgBMu/TPLAzaX1VYEPF0nT2MI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uBfrzU4fJ+CNBYKjV7NmaGBfc+n6PlAv276rAg1yUM010Y3AAlvl7lD0oIZmmZY5vg2U48MsImNpfsSVYggKEkK5Vqyh+aaWrMbAXIgKsxe0SQCv3IFBJ2ccWwYcjP1ei1E7zZGNfGJzqHl4UXHbFsW4Aftr0K3cNeFXFilixHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6f4mZj4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945BCC4CEED;
	Fri, 18 Jul 2025 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752866016;
	bh=ok9aI1aAyN0OzYdXzrtgBMu/TPLAzaX1VYEPF0nT2MI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=s6f4mZj46DiZTpt2rg5U3XS3dPehpAoJw8ioqoZ0S0SiTrsg3k2Of7SmgVSCOhwCu
	 0oqEWwKZKZ5GrvSFTM/QyFH0+iwr/dePJcxRVKEaL3TogWc51wjtBV1WKBx2k7mb8I
	 b9Z5MwWiEhTFAor6pMgYUbdkwTHm0YqDoUm2/vxHaNMuF2kLXvoAE/3ymN3bhhPT9g
	 zPSqsCo6dPy02Oqr1eQmzazi9QGOrpKZjxh248AC2l7oPQrodohinv8Sb/7GXey65w
	 4yhhCbTmncs1yeR8t/1qDXSrZadjbL5Yfc/Cge143g/DIvttZJ4H1fBXEwVe+xO+OV
	 mZUTwCb+xKIJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C81383BA3C;
	Fri, 18 Jul 2025 19:13:57 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250718083830.81316-1-brgl@bgdev.pl>
References: <20250718083830.81316-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250718083830.81316-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc7
X-PR-Tracked-Commit-Id: 11ff5e06e02326a7c87aaa73dbffaed94918261d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16e14971df69ff8e655196b77515821b1724c61f
Message-Id: <175286603594.2766060.569537168213695422.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jul 2025 19:13:55 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Jul 2025 10:38:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16e14971df69ff8e655196b77515821b1724c61f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

