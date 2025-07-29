Return-Path: <linux-gpio+bounces-23871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C528B148AE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 08:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A064E482D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 06:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAD226D4EF;
	Tue, 29 Jul 2025 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmFxoQuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8B26CE3D;
	Tue, 29 Jul 2025 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771807; cv=none; b=HM7m/9Z4LFqwWUHZMbn5Xbt41wwwTyTND5+XMOAPhAAjrQJj0+CgkjpdDHE1EgxfH/F1b83MAqDOqiAMnt5edzLuzBgBmhXQYL3kQXf+5Cbo+vg+49IGmlUmJUAebNid7vuPdsG3hBabVQtizCI1eEp+ziwuNLzZSpt/UFBXt0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771807; c=relaxed/simple;
	bh=000731iVeIAxTxNZEwDV0OY6LRI1OQxFLcqk5mYGVPc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZTX8WBOiTMPB0uG4J30+8NiRjDwlzCzMyqCvCIz2DnknrmZS/JTLwLRE7eQx+iDcFHDM/oCT1yq/RX+FhSQDUxIkE0xZsLmv3Uh8xBGkq9XsKVXWQQ0N/+ZJvxhuUexECT9IRdch1rmlK5oBKpbtA3aDuevZD6dL91LPaus8jHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmFxoQuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F293DC4CEEF;
	Tue, 29 Jul 2025 06:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753771807;
	bh=000731iVeIAxTxNZEwDV0OY6LRI1OQxFLcqk5mYGVPc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QmFxoQuNOYAPB0Vrp0qbklH8p9SOweiEK5biGWu1A0Y/1sUKnieayIA0gKz2eUz6l
	 oNfucJTpvzEBSMLbN66mwqJ5lHqAXNv4ibJTEXWU/zIP0B0glcaC05SEwzmhygFmRR
	 5havL/9h2DRxS/JcDPbTn4HbG5GPKyF5oL7O75XaCHDxLNMwj3K+fYPAvF314BfmmW
	 kqQYS2j4U6wYTvuk3s+p6qvvjLe5uBbqhhPxRHM+3ZgzeZT7nm4kI+jSdKWgrNPjnm
	 FqkvV92im2O+1sauWniB9EfN3cQSgXhdpWA45cjipwbfEmd68aVFCL917VGFloCEJE
	 MTixOk3rA3WIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A5DB9383BF60;
	Tue, 29 Jul 2025 06:50:24 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250728101658.44311-1-brgl@bgdev.pl>
References: <20250728101658.44311-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250728101658.44311-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.17-rc1
X-PR-Tracked-Commit-Id: 6b94bf976f9f9e6d4a6bf3218968a506c049702e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fcb117e0758d1462128a50c5788555e03b48833b
Message-Id: <175377182354.1356386.17372153004402685331.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 06:50:23 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 28 Jul 2025 12:16:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fcb117e0758d1462128a50c5788555e03b48833b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

