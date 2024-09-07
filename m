Return-Path: <linux-gpio+bounces-9902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980497039B
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2024 20:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31BC1F2245A
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2024 18:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E225C166302;
	Sat,  7 Sep 2024 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGljNhVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98D1662EA;
	Sat,  7 Sep 2024 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725734172; cv=none; b=AGKceShCtgjUwIGOby+1qjExEW3N+FZpLaxJhheYl9TZqbONmOKvNOAaPsWWHqwhqUKdY6kFPya5b/lekqs04Zqhoj9+KUQzz2UhilZITvsFhtd75L8r1x5j7+JEmD19GHNp4/b2jtFKAtO4F08Yon04htUQjBUzxJUvlYz+pZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725734172; c=relaxed/simple;
	bh=cm/aJC1kLxIJ/7FKv5b203mbf/onrD9/VJWBPw3glHs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L5+0LN3JmLWE+1emA3jb++thyYxDX90PYsiIKE9LT8UII0CndjqFZs2iN20ad8yVjbaQ1HJb82KtAGkonU4QjlmvoMYmPCiJcPn8adwIReKTUlxOIn057olpUDNVuWx4RK1Hl32SOWcYTfipU0P/vPPbVsTq2RFeDQnpZFNnKn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGljNhVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755B3C4CEC4;
	Sat,  7 Sep 2024 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725734172;
	bh=cm/aJC1kLxIJ/7FKv5b203mbf/onrD9/VJWBPw3glHs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pGljNhVUER7lOR/rm45gTDH2YMz+xyPmKIi+2246sHw3s9RWEiKM/Hj9UKzqoK2NQ
	 pRQEgbxAGNPMQaUB8xopJhwdvWhdb2/DLcL6Ljl00ETk56Syc2HY6e2ABzGteGG4ki
	 Y0CKoQxd4+0KvmJB/+uwsvgjUU2fSv95Boe807wAtsaAJzIxPcRTgMZyBWe22U3sy4
	 2sp5sBLLSKznt47etedGuYbKrjw6dPIkv+KZ6v8uF9rYakusF2qSBYnP5hxlTMp05O
	 tvuhb5Q0Uel4HWemajfmNOKDpFPfEwJnZIsGsALKfLjVQcBuISkVZFNmS0t8shTDjL
	 4uQBH6TybqtZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCFD3805D82;
	Sat,  7 Sep 2024 18:36:14 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fix for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdb130FuEhKC2M6Ge42-sMDnKE04LGFv6uyAAUEvKXWyUA@mail.gmail.com>
References: <CACRpkdb130FuEhKC2M6Ge42-sMDnKE04LGFv6uyAAUEvKXWyUA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdb130FuEhKC2M6Ge42-sMDnKE04LGFv6uyAAUEvKXWyUA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-3
X-PR-Tracked-Commit-Id: 602cb14e310a7a32c4f27d1f16c4614c790c7f6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 872765620781607809fddbfdc2823ab7f769b698
Message-Id: <172573417362.2736849.5052408575784746086.pr-tracker-bot@kernel.org>
Date: Sat, 07 Sep 2024 18:36:13 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 7 Sep 2024 08:58:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/872765620781607809fddbfdc2823ab7f769b698

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

