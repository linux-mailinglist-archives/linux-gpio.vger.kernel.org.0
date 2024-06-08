Return-Path: <linux-gpio+bounces-7270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B229900ECC
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 02:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06121F23298
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 00:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AAB28FA;
	Sat,  8 Jun 2024 00:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlIgXRaO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B663379F3;
	Sat,  8 Jun 2024 00:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717805755; cv=none; b=ZGeb2lsnYTSxQp7FdbWK7K++XMg1Cf+O+lZqK857Zd7/v8dQWOC3hC1TgUtqLLZAHEKtBGj3p8Y0vtB4eeWB9AT+9wy1Lwx0OYTSu1uw6DDojDdtHNR54k6JosIggsQK/zCy54ISNAuZv7/SCDm30NOEvAV3vla7fmpT72Yab2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717805755; c=relaxed/simple;
	bh=0hNzXTDWe/ctRtWO5OYNVVZhVpwSJ+70obsQNJ8K5M0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=K/Uwv8WZ9DooMvggGpShbpyHNCkDBTKrylrGDmLwihKnUdqwNutC5NbtaktNj1lL6Qi4fylDanSbvY2evuVbihy/4FDPIURpORBybeg6Wq6c8fr5ZsvsB/MXw49Hg+02FnbUBtjBFQ5dx9yK1vqt4n1mx7JI1E59Oiihl58fs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlIgXRaO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97C06C32782;
	Sat,  8 Jun 2024 00:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717805755;
	bh=0hNzXTDWe/ctRtWO5OYNVVZhVpwSJ+70obsQNJ8K5M0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UlIgXRaODuA0oFE7ggLcLolTyWFagJhmV2I3TXukUz2dJ7YuO7mgz+TfExoByDfdA
	 gDVAllRDzRQZIQ+yO9RBSG6gKv6YWr+bHVoaS1XxuH2kCPpt4zT1qao1tKBqOZ2XEq
	 S68qa0pM4MI27hNVXlEUJq24kd46c1yfyQjnaF+YrIwiTdoC58dYanw7Nzy8Sm/O17
	 umt9jwaMkIW4fjz/lCX7X4QUbL0CAWAucwtfnWuzcxmQYYEP+mdkjkM0PSDDuuzft7
	 4lOlDEJJovPXY8woUoRH22tDMOgGSknT/FhLyEjvEcAMRvgzOfj247vSAte3C/T6GZ
	 WC+k4Kc/XpRGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E3F2C43168;
	Sat,  8 Jun 2024 00:15:55 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v6.10-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240607190540.30622-1-bartosz.golaszewski@linaro.org>
References: <20240607190540.30622-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240607190540.30622-1-bartosz.golaszewski@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc3
X-PR-Tracked-Commit-Id: 64054eb716db52e4246527dc9414377c5bc5b01d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e60721bf3ccaebcaff8dec3548a2daa6578f9361
Message-Id: <171780575557.4241.2081000257414743958.pr-tracker-bot@kernel.org>
Date: Sat, 08 Jun 2024 00:15:55 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  7 Jun 2024 21:05:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e60721bf3ccaebcaff8dec3548a2daa6578f9361

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

