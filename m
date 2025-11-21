Return-Path: <linux-gpio+bounces-28972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E3C7B79C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 20:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE1E63A511D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 19:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88182EA168;
	Fri, 21 Nov 2025 19:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5w+k/xB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7318FC80;
	Fri, 21 Nov 2025 19:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752812; cv=none; b=aRmQViq7GySCFqMWSyagymh9p+JJnUgqBkuXNpUsriv81x32j+zJSbhVqZ38wscVk09pGHNS98d7qEf4iuifdFkzKko2Ixx+ydctaX2EgJrmj5AHc+6Ht36PdK9gcrRD+WsQRpMKK6eQRLkMdBMie1vDfxR08+W/gbbeoi4vPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752812; c=relaxed/simple;
	bh=DHYMcY1nbI8tK1Qdtrb8HtO5vDgn9KGWyibHa24P2/4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QWMrDyjD0DKsJWXHrdEX6Qqxb8pDJv18MyHdh4r8fe2kKbiYW1NsiI0b68GtuYs/0EkFzxbMeHMFu8sZWziScRoHK04L+gZc7YyzPbmkYOqb0NhFm+5ytANP0/EH6ymFlgsg87BMmjEsJYTz0qob2O31kdFi8BFc7d35Gq4BCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5w+k/xB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5777EC4CEF1;
	Fri, 21 Nov 2025 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763752812;
	bh=DHYMcY1nbI8tK1Qdtrb8HtO5vDgn9KGWyibHa24P2/4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N5w+k/xBMOc0T+JCw/xiQfctsrRIGNxWJEIK27L+bRB+2RuISPqmJh7hdKUSMnneq
	 5WbLpw96AxJhn8L12tJWIb3o/3bynvVOk67LdxViSQP0iiQZhgACFgh4fVmKKqdAVF
	 hSE7A5WA5MfRU66alK3M/Zyq7ZjtIxoYQ9u9VJCgipUv5rsTfHZrgkzrlPaU7AY4nt
	 gleaiHq6hGljn7/DnzAoijmSKzAU19KdblQYmCS6XzrrG5yBfnyRWYDl7bC8qHcSJj
	 AeLWYFo05h3A0WphvXLzgKOA3wy5HorFCpKQ0QofK/PmI2NwQ2aehLbflRwrxHCEPw
	 +Lwd8Xb8lcedw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D763A78A5F;
	Fri, 21 Nov 2025 19:19:38 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.18-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251121144056.70302-1-brgl@bgdev.pl>
References: <20251121144056.70302-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251121144056.70302-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc7
X-PR-Tracked-Commit-Id: 2b6d546ba83e8332870741eca469aed662d819ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c26574cc4ea41266d9a09441d0e05a9f09192de
Message-Id: <176375277681.2554018.4306938790652410883.pr-tracker-bot@kernel.org>
Date: Fri, 21 Nov 2025 19:19:36 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 21 Nov 2025 15:40:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c26574cc4ea41266d9a09441d0e05a9f09192de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

