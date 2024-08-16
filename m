Return-Path: <linux-gpio+bounces-8775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA8954EE0
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 18:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D64BB23167
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 16:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D851BF320;
	Fri, 16 Aug 2024 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRlrx3d9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463181B3F0F;
	Fri, 16 Aug 2024 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723825952; cv=none; b=gHnS0JDIRS8MRIAUvbqVqYT4UbgsH1cn5rFHMMIkNBbRxpM5fIJ1URdL7bDvderq074Xzo3Nkwa24egPbsjeufvCAu4yJxcLHTpsyw0ZlDbPcDjYUj/Lx7RrVGkSlmxIvcXR8NAn7bmBGvZN80A0NPPTR9QkqgUFdUq0J2ic4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723825952; c=relaxed/simple;
	bh=/0oLy9WTpKH0+iIQX95+M0FoMi4VDRPWvWRwb2K2u/U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dB4QmalUbTe1xg4SC7uhGQTthgqp+XsxNUBO6xGY3VgnUbGoXOuRKv5rXJpUsf8z3FY4Hgg6hrWWNn4zO/wcO/ZchOE7Duw0u9ww/oBwT6bQCp4S1HIcvsWz17GApPNAhKZa5cVJdo2MH+0zDESg+vkC2GqN9Eqt1Yo1CgpRHoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRlrx3d9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D69C4AF0B;
	Fri, 16 Aug 2024 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723825952;
	bh=/0oLy9WTpKH0+iIQX95+M0FoMi4VDRPWvWRwb2K2u/U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oRlrx3d9do1mj29brlpZ42Kw5C/oP6qVwAvnLI+YgqXItrYyM441VxcSfZDgZ10wV
	 DnXLjSRlrx8d62ZtxkW8AXqhfYm/tVHxxlkBPPKbFTp9ajTfb5ofTMbcgOp0kNiq1k
	 uW4c8b77d+vYRI1o6YspnkcKchFgXDzU27h7CZDxN0dgB1iLd9X3e5cP2MFMgG1m/b
	 XQ30dWS4+5ut9bz/YbhYQ5Ul0L6EnVkekVU6YcGvhTiMHL597BwNEPP56/AcciRsEu
	 2oydxqYcKVxZtUSejWAdF1209pxVmNqtBndo6wK6mcIrKCVgWSF6T2SMEmzO2U1Rew
	 Etu7E8blviBLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0FC38231F8;
	Fri, 16 Aug 2024 16:32:32 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240816093423.12622-1-brgl@bgdev.pl>
References: <20240816093423.12622-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240816093423.12622-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.11-rc4
X-PR-Tracked-Commit-Id: aad41832326723627ad8ac9ee8a543b6dca4454d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9bd40f824a7fed9ffdd1660ea7567f4133f8b672
Message-Id: <172382595115.3569819.11391310376347718895.pr-tracker-bot@kernel.org>
Date: Fri, 16 Aug 2024 16:32:31 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Aug 2024 11:34:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.11-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9bd40f824a7fed9ffdd1660ea7567f4133f8b672

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

