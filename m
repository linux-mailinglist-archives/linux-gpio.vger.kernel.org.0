Return-Path: <linux-gpio+bounces-10865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C1990F7A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 22:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694131C20885
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 20:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C4D1F8EEC;
	Fri,  4 Oct 2024 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftdtf4pJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFF1DD898;
	Fri,  4 Oct 2024 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728068655; cv=none; b=TM3flVj82iYOK5cKBCOzyLdwdNwZ/AR84paMawJY4qpE7HqRrlQbs+i/KY18LNvKCwNiH0h/YTqZCYU3To3ZpFULIAt7CB/R94nUi8MctUmbzDb8So+/xObYAI+cuO8eC9NLZFs5VPmKHUb6MV3wA2mGGqh9PwiwwF8H+I+B8Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728068655; c=relaxed/simple;
	bh=Xk4XmSCUlpzGoF8qGdWYTEAPmR2pFT+0iPsmK/CWTLo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VZcmyACJ7w3Do9mGT83da3LAuQoAcirkw1PVK7TSc54TquIPj0rDs09W6Krh19EBGj96IbJRPIzNv3YTUnjTiwgM4wYqzNA+trQJQ7+rwaNAWXmz/66Ov81fF3yht3yBALpOk9dscloQFmKdnBWe+z5RYGGhgIBvbHqKc3mAF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftdtf4pJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C57C4CEC6;
	Fri,  4 Oct 2024 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728068654;
	bh=Xk4XmSCUlpzGoF8qGdWYTEAPmR2pFT+0iPsmK/CWTLo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ftdtf4pJSF+2HQjWjSE4hAWJGMGLdVUADA4u2zfcTE2FZBjfkjMgcMGnjbZJT7e+i
	 CqGdPHe7iVOtoVZvGNZFQf0eWkRXFJBcHbj0fDpvFxKwFfRzQ/dNJUD/1O6YdFiTaN
	 gi618hQ/YjEBdgxp5pB3AgdTY+0Bfta3LZ2JMopGv1/QAFRpZv5fXbaxBSPr+d9I+O
	 2WH1wkIbtTWDYi/EW5PiElUqlQJhI7rgpwwzGAXP+DrqlyXPtKdsY2fWkti9+n0Oib
	 c1BJPN8hKeE5E2Pr6wAjxUNt8n+CI2msxwP9jX0yjEGZ8FPlcue0QUD8hvZ+g7zwe0
	 oEtWTCDgvFjcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE8C39F76FF;
	Fri,  4 Oct 2024 19:04:19 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241004142100.53097-1-brgl@bgdev.pl>
References: <20241004142100.53097-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241004142100.53097-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc2
X-PR-Tracked-Commit-Id: 7b99b5ab885993bff010ebcd93be5e511c56e28a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc70ce8fccd3f81c58f1e983336568d7c9df0e3b
Message-Id: <172806865819.2706447.12112759096373086169.pr-tracker-bot@kernel.org>
Date: Fri, 04 Oct 2024 19:04:18 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  4 Oct 2024 16:21:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc70ce8fccd3f81c58f1e983336568d7c9df0e3b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

