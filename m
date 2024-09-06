Return-Path: <linux-gpio+bounces-9898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F796FBDF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 21:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CCD01C21E8F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 19:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705D01D6199;
	Fri,  6 Sep 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkeMJ2K3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E321D54FE;
	Fri,  6 Sep 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649956; cv=none; b=L98TKMtsyvu0qTH9jQR/3lBK7VI0KwWUI/lxjCj7rLQbPAwCL6KdbKLFz79b1VvD005MfDa+6ZXSwdP7HZEq8HWJzFxissCNV8NO2HzSk/ZVfY4ffyt9zvzKK0T/BzcbSM68ex0rI7o+jsteBbxiaPk3s1mpCafF6E2usqV6VZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649956; c=relaxed/simple;
	bh=pU5lwXrS8BqbJ7N4vWInU0WT62qk6D0+QzINgQMrK6A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DsltslTeN/APexBOM8VB1K78FZQZpCmaeUj/C/9A5a6cbURkaPbDlwQLa3bzJa0X3LYmmLWpVOF/4wcQ2gERnA8JzmmUnSKme4YNJWHnI++/ZERys/rwg29i6RGp9GJalGuMKYk++Zdx06fm/MNylAQUunf/cNRgyeP3iTJL+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkeMJ2K3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C844C4CEC8;
	Fri,  6 Sep 2024 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725649956;
	bh=pU5lwXrS8BqbJ7N4vWInU0WT62qk6D0+QzINgQMrK6A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NkeMJ2K31FVUj3zxebr95fRSgXmIfVYtyNk0uI+p3KERI5QajKlyN1XIyW8oH7Zhb
	 Z3cSzj5w2y1EPeQXzL9k3CYOrSapf6augA/gUjIxlbcBBoN44ayCFJ5eBhgbfhBkgc
	 2w8CQsl0uGYr1blarfliMFtsslDq3Z84ThrCfFsR/6Jittl9HW3G4EVKGwvgU17tla
	 zZO3FqMfdLqMxO1fIlbELoDFP5M6gOCrGKX1i0qp4wbwdXTIOOU79VpPkcfpALLzk1
	 wxqwJHMxSEeoO5dikrgFw//WGMYUeOfXHt0SHWOajKH3RSA+qxqli6EkjJBfR5BPwV
	 zAgJDxjCz28VQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F1C3806644;
	Fri,  6 Sep 2024 19:12:38 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240906095913.15772-1-brgl@bgdev.pl>
References: <20240906095913.15772-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240906095913.15772-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.11-rc7
X-PR-Tracked-Commit-Id: a5135526426df5319d5f4bcd15ae57c45a97714b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0de82f0dc433a89841c3f6ffe0e496d580ad43af
Message-Id: <172564995670.2497610.18379990911645964604.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2024 19:12:36 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  6 Sep 2024 11:59:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.11-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0de82f0dc433a89841c3f6ffe0e496d580ad43af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

