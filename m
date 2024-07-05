Return-Path: <linux-gpio+bounces-8074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 232BD928DD5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 21:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7557284C4B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF10F175554;
	Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsVckVo2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB422174ED2;
	Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720208278; cv=none; b=ZSBwJmvBF28zvbbuUM3eo2mK92Ox1Gf94liNht++kFX+llad2ofLhp33WDaflQMq7DebLuOyABoHi/CIqT0ttM7tSKScRzCc5dZ7koYwoDfDpY6O2hwyZrCRSk1QrXnTN/WI5YfEPDwghRnEm7t/PcAG06u7VqUK+jPnZSinTKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720208278; c=relaxed/simple;
	bh=ukG3g/4s6SjGXiDwtlyZghF6hYJF6xbyU3h9dbNjrbY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=G+IWsJ2z9YvL9pN/fe6OEHgB9gg/tvTOKiOigrOIR4hZagPG7kYgg7Av0i8kAYPvFkCXgLcNNlxCLewxPmeyVI/5HyQerfdZ90W6lln5I21y2A2S35xMEPGI5RKanLJxdzQHSoJpO+i4xMdqAs0BeCkSD49qy0+3E9/+Ol0hZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsVckVo2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DAB9C4AF07;
	Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720208278;
	bh=ukG3g/4s6SjGXiDwtlyZghF6hYJF6xbyU3h9dbNjrbY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TsVckVo2TsvuiZgX/EYJbWzjRrtY81HzswD/ojlB3ZWhmkEmWn3f4JK2BWLTShTJj
	 HTnJFP+AQoEfYv4K33u95r+RAESR1erk/FLZLjIF5IHYPfXpDGLyVr1XWcpt/ttkBh
	 6IokHDNfvHXvldVg/1h/9QxNNadA842TCcZUqOQyLxY2b0XHgemD5O4DYWudxQAkcm
	 zNtGjxhuE1Wa0+wHsS1wMfN4RLGsDFG7CK/ANINtGhJ7apZmskbJeIUEgg2qTPv4Oq
	 oT/G04j6fTi7kJ8FN/8qMxtXXJbuiRWPCQcyHxgZCpE5KvOQ22px9skDBIYfi6Kq78
	 BigcXsdvaX05A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8054EC433A2;
	Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v6.10-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240705141544.20101-1-bartosz.golaszewski@linaro.org>
References: <20240705141544.20101-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240705141544.20101-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc7
X-PR-Tracked-Commit-Id: f8d76c2c313c56d5cb894a243dff4550f048278d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 968460731f95be9977bc59a513acbc5afc71117d
Message-Id: <172020827852.9250.2179849653996406405.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jul 2024 19:37:58 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  5 Jul 2024 16:15:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/968460731f95be9977bc59a513acbc5afc71117d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

