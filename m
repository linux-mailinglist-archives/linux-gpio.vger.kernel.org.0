Return-Path: <linux-gpio+bounces-16884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036AA4B196
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 13:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8EA3B0687
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 12:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7676F1E47A6;
	Sun,  2 Mar 2025 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6Ax541A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB41E3DE5;
	Sun,  2 Mar 2025 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740919068; cv=none; b=RL6pcbKQIe96tu/MUaZrxQPpbIa+uQEi0D+8HsVtfvT5/Jwd1910Fjq3nu2v8x3wY++D7klcL5gQnYdnL1DthyP4YI9vhu9h29g913mGOzOFIdGW4iyZvy/3XEgx08ilM6jXJN1wIaZnx9f7mpyErmspUrk9mU5r6mMjl2XsLnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740919068; c=relaxed/simple;
	bh=nXNB+yIqn2qIHYEvNnhVR1tpxnnczPL+gsqYg22B9Ck=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=frLsH+59vLV/xZ/9wLoIehdApKIiCcbFxxyuwlbYOUc/m3rRXCDyJ/L1M219oTcUfycXrf8IdDbdRDdHsKPAZXQq/jfftM/jP5K508oaYSceiNKjuqp+9eE9L/tdcwJivC0T1BZU5WHKpkwFerGI4Fdz6F1ZcUXu10yOM5/0MNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6Ax541A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8764C4CED6;
	Sun,  2 Mar 2025 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740919067;
	bh=nXNB+yIqn2qIHYEvNnhVR1tpxnnczPL+gsqYg22B9Ck=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=R6Ax541AfigZbUWpky3vje8u+ytRbsxCWiOOVX+OH6K2O+fRWFLnFpQOB56XoTVRS
	 S3xLwZCP5bRu7qEA79wcenxV6HzvqrQSsWdQNGtGZXUh0B8kvEhUTO4VbJrOVR06HC
	 8dOzaM4NlcPtEd/oU3TMjkVxNdmRcJaqFb93/1KLFFv5XdG7UNok0DQiyjiFb8Q/0R
	 R6uJtpKfPmDXX/0a8KirHRsxQrruxc9O89+oV5vx6h+RSnxoQCUIxgNS7xk7o+/zAx
	 n/HPDkOIgkmqVbtvewQMiTN+a/Nl2PKQt1NAwz37aBJPEb+fnSYWGTq/jmbGVcod7H
	 CCZES8vAGerEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C9B380AACF;
	Sun,  2 Mar 2025 12:38:21 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250302120410.5600-1-brgl@bgdev.pl>
References: <20250302120410.5600-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250302120410.5600-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc5
X-PR-Tracked-Commit-Id: 64407f4b5807dc9dec8135e1bfd45d2cb11b4ea0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1973160c90d7886c523e52e1f56164e6a74f0474
Message-Id: <174091910010.2619784.7732180794540778595.pr-tracker-bot@kernel.org>
Date: Sun, 02 Mar 2025 12:38:20 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  2 Mar 2025 13:04:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1973160c90d7886c523e52e1f56164e6a74f0474

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

