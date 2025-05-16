Return-Path: <linux-gpio+bounces-20263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB668ABA0F1
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 18:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6A157A510A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 16:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D1D1D63FC;
	Fri, 16 May 2025 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPxsy+B1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914037261B;
	Fri, 16 May 2025 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413826; cv=none; b=kfHBf4iqTtWCN5XHNeWXANh39A7chYZtQdrXJH+zfxdUU7Y9eEw6Ctcn7CdJxKd3V7NLl0hdlzpzDjxQevaPh7ZJFv7rkme8x9fZwioelslDpQQCLkK46RJsME79zMEj16cH992HF2RmO6mFoG6+DKlZMFOnweanbqTs1dVWtss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413826; c=relaxed/simple;
	bh=DhY1S5xS1URe45hkYU8L8vE1etkyv/eNQjS0NzVRiuk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=laawYIaGDYP/2VfF1UTdLIVg9TIcvQ2JnU0qCD0LPJNv37nbNoSvpNKvJw7Zejz5uTMWUDce33pP56K6iXCIewQLUxW/W3Q/yuGW6koV03SLTGSfE4uoDr7PmRxJoL2m6v0Sbi3hiKMqUXua38Y/4TBFlTlddk9RV7knxT3kng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPxsy+B1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A93C4CEE4;
	Fri, 16 May 2025 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747413826;
	bh=DhY1S5xS1URe45hkYU8L8vE1etkyv/eNQjS0NzVRiuk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BPxsy+B18J8ns0KltGWAcNvX39+t0/jusH29hAXctvEqGbDME9YLifCPI1xsxXN9d
	 KacQeV1OUNSemtYWuy6OOjromk1u/0K3+SdkOCu/0OXeX4SLbbLSczjbSqUrZNM4EZ
	 X3J2tbebVtUfavjFnwP1NkbJYKZGk4LTGexcrTLbxRxthRobXR5okAGNow9t0AD4Wj
	 fpkhO/nxE9wEOz94e2W3DwIYr9x5RBdpTuW3zCqPVKzE0vQwZYrjM5S+T5SED6nqsq
	 NTJCoev2lHbGUcMCwfmZ/K1oleR45XRElxNbsNfeFE2WfprAOyVfNkO2YRuU4X6fJE
	 318RcWIyMh1FQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 891033806659;
	Fri, 16 May 2025 16:44:24 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250516101215.5822-1-brgl@bgdev.pl>
References: <20250516101215.5822-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250516101215.5822-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.15-rc7
X-PR-Tracked-Commit-Id: 7118be7c6072f40391923543fdd1563b8d56377c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7dc774fde73afd3a127b58ec99bd58b975abc8ab
Message-Id: <174741386331.3992786.7707607690612994801.pr-tracker-bot@kernel.org>
Date: Fri, 16 May 2025 16:44:23 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 May 2025 12:12:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.15-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7dc774fde73afd3a127b58ec99bd58b975abc8ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

