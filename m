Return-Path: <linux-gpio+bounces-10392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE14983A3C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 01:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F9B282EC5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 22:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A3F1487C1;
	Mon, 23 Sep 2024 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/uXmiPf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AF5148308;
	Mon, 23 Sep 2024 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130877; cv=none; b=ckvxveerJIet26//zkkotZ7cfJvB7N03W+gJp4HX2a9Gv9YHyKgmgGwrBtMKy14921IRtFYyPQmgYQdpn6fov9ugFeRz8UgbPUX1vmuNeH1BBjQxXpfs/fbEZd2vC5esePmq6l4Cx7ukTdXsi8mFzsOr+RDigc3cVHXjIbJQCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130877; c=relaxed/simple;
	bh=qPR90HLX4NZurFWlbDTg6m5gahTWMDfPiOlRtsCzOgQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DSHYitYjYGWKi1C2B4Lu0fNX3sovDSdQbIOIKtKZ+23WJW9odRaZXobc0AfvUc/uKB+RZD4LzRtd6Em+u0DpQEZsy3MzPLx+77uyWKDZz56+Q+kMY+WsswBy6fAX0jM0HGoZWQo5zYNUjkAnm86HmmJLxGKqaDUxUuqp5kT+Frc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/uXmiPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26856C4CEC4;
	Mon, 23 Sep 2024 22:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727130877;
	bh=qPR90HLX4NZurFWlbDTg6m5gahTWMDfPiOlRtsCzOgQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p/uXmiPfSZk6GrhfoF2jl3U2JR3bycL+5A2921yV6fTj8cWvzWwUTQN+iHO1YlGGH
	 PClxdoriO+6/9Jgzbp8MQKjovff4IxkhhJI1rsIqWzhmaC3Y2BIOqO3dlRs8ATl5XU
	 0CJWNl5tYGdJx6HX37mOE26VDuT8zdL2BLMOovwGIwMvUCxGmUUI6VrBU+yxMSJ0Vu
	 5kJtvqukDt5SuPYhXm4HTCc7NdFzb08yDEXtAKPE1IbFjuoqLjbIa5/XhKU91h3/Nk
	 Gsg3RmoAitvs7q84G7bj/880XJcfD/G07Txg6hz4XZGJYActjWDG+t4U4BP4DCpVDa
	 RBHMozO9GZXmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3293809A8F;
	Mon, 23 Sep 2024 22:34:40 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaSYE1jPCSi8jE7QZ9=yxo2oYM7c4uwBsYBFgqWey3Mog@mail.gmail.com>
References: <CACRpkdaSYE1jPCSi8jE7QZ9=yxo2oYM7c4uwBsYBFgqWey3Mog@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaSYE1jPCSi8jE7QZ9=yxo2oYM7c4uwBsYBFgqWey3Mog@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.12-1
X-PR-Tracked-Commit-Id: 264c13114bd71ddfd7b25c7b94f6cda4587eca25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 962ad08780a5bfb3240bc793e565181eacfceafb
Message-Id: <172713087911.3509221.9659893572749530775.pr-tracker-bot@kernel.org>
Date: Mon, 23 Sep 2024 22:34:39 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 22 Sep 2024 00:15:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/962ad08780a5bfb3240bc793e565181eacfceafb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

