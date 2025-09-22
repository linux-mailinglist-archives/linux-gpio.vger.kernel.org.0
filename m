Return-Path: <linux-gpio+bounces-26509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341EAB928B4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 20:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1361A18875AD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 18:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358131691E;
	Mon, 22 Sep 2025 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVYlM5e/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF81289824;
	Mon, 22 Sep 2025 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758564292; cv=none; b=tFr/47I8Uw3185iGs0vN8TT8SlMOG1PjUpHN8t93jwsjYQAqwTTm9vgkvbA5T9FwFRSrkANtNi+0JgeU9kun+/U2gseF0jWK0HcWFcfVzj6Nzpdu68vyFt6AtmDscOyopbS7MkRcsxVFx0vBUNWcyb2sk4w4WJqtEMA55FFoU70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758564292; c=relaxed/simple;
	bh=C9Ufhab19sDYaiUr+xR+vcICFdED+LHF9Y9g6/8ueoo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LyBkwcwenc7MdtzeDEq7A09FHunSBf0oB2Tm7ojQc2E4ti8fstFdVY5lU6FJKls2AG8IU0FhEKOF7DOZcO7o5w0trlvbvrpTDJwtznd5/yH4ypEo507+i0H0nS8qwVH9ndE9FNKnyi3GIbBFulhRC4QKVsEJht6JB2Nl35iZRDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVYlM5e/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22586C4CEF0;
	Mon, 22 Sep 2025 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758564292;
	bh=C9Ufhab19sDYaiUr+xR+vcICFdED+LHF9Y9g6/8ueoo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uVYlM5e/PRhVlQhgzeK7vGUSWr4Rve2R5l2SbVIfzDf0adpKfiy3CK1u4WJWz/SJz
	 3tNVHl4TvDLX4gM8AdprTaAgFVJYzUUh7KaXAZE7nQ3KT2ObxGkmQK1UIqBsSO15Yp
	 sY+x86vYiZFy5iReYdWVRjgZdWBK/BGdaJ5Qq2EapAmIF1kigTslY3K8FgxxIH2xNf
	 uoRh2WfEMHDik85J+6wyIrs0bCt0pc5EMlrHUTFnBxdXPDjWvajMnRWTwG9Bhx9T3N
	 6eK3sFfTJgIp7hFOaO2Ivs14rqy09N1UAVAAkzrmdwU8ixL5m5iqSVAzHFxDk1Bova
	 AHj4cCo+yAfag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7DB39D0C20;
	Mon, 22 Sep 2025 18:04:50 +0000 (UTC)
Subject: Re: [GIT PULL] late pin control fixes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaY7qoN0r9zx4uKS8U3LS8-Zt2=omH8RhmcHV9F+jM1XQ@mail.gmail.com>
References: <CACRpkdaY7qoN0r9zx4uKS8U3LS8-Zt2=omH8RhmcHV9F+jM1XQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaY7qoN0r9zx4uKS8U3LS8-Zt2=omH8RhmcHV9F+jM1XQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.17-3
X-PR-Tracked-Commit-Id: a061e739d36220c002da8b2429d5f16f637eb59a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33468b56f4e2d55be4b49dab92daddf5e28cc14b
Message-Id: <175856428943.1104153.11352910011999524544.pr-tracker-bot@kernel.org>
Date: Mon, 22 Sep 2025 18:04:49 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 22 Sep 2025 10:24:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.17-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33468b56f4e2d55be4b49dab92daddf5e28cc14b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

