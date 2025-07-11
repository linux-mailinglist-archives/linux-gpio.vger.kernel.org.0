Return-Path: <linux-gpio+bounces-23168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F073B022F6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 19:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809BA1CC2985
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 17:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B937B2F3636;
	Fri, 11 Jul 2025 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1Q9Y/jA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7392A2F362B;
	Fri, 11 Jul 2025 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255842; cv=none; b=gUR+U8RDQIOSUW5Skcc3n7tQlpoPy0WE9/piwjTEhX6AUc938lxneqi+NzouLIYN1f3PdAKfBMnFYdCmMWHFIuJuS3KECQc5UxBTrPjuLOhsbZ1yNM4H/pCenG3wpD+zL4GIlBcBvXaZnayJkRebA4Ry7suzRZKavtv/+4/Ea9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255842; c=relaxed/simple;
	bh=gXGaeJNTYGH5z3eW+v/9cNYr6tR5jAcBUmNuumYo3sw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nqPzbd3UNYvoi1dLNJhMDLngrn0mtJLypCMBEI4Usoi75EuCFYnLge62Oa/5J1aKdlMwaM5hoIw5F5KqO8J+KMYuTK2R0WchKfRHyyreL8Bw4rtv7M2T9pglQCHLi6ICkD7yQtbq5NqWiuz29AWgwzQOdVy/Q+5zg5Uxam/kPP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1Q9Y/jA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D12CC4CEED;
	Fri, 11 Jul 2025 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752255842;
	bh=gXGaeJNTYGH5z3eW+v/9cNYr6tR5jAcBUmNuumYo3sw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S1Q9Y/jA0Fb1W1Z9iA7yj1TDkJd1YETnJxk5+9XS9Qqb1p2fwSCOwTzsuRBAqNUsM
	 OFCuckroVBE6utFWQH7+S1xO0V7JxukxeqOPyMW87cvKeW9WOelE/6ZgZcyEU7BcGf
	 XQuQwcndkpjf0dhPc9h1QYRJKaKqq5H3uxS/OmjROgZ2iU90Y2EQwxGrQl0m12ZGgR
	 La2s7tttMEIzafmcAgEA9ildYvcQfDN3Y/WoZXjCLyM4joA3X3BqbSooLgniD4SAOd
	 XsRIWvqQ8Gk1yMGuL3QJZLsbQAsXjuj4ZL3er+cHPumLydyOISIXYU88fpdi/q2knf
	 LuvVDxdjgFzqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7157E383B275;
	Fri, 11 Jul 2025 17:44:25 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.16-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250711120607.56044-1-brgl@bgdev.pl>
References: <20250711120607.56044-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250711120607.56044-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc6
X-PR-Tracked-Commit-Id: edb471108cf1477c44b95e87e8cec261825eb079
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5265593a28d91aed5529c31e720be8d3e78e0695
Message-Id: <175225586391.2350666.18216578568345414289.pr-tracker-bot@kernel.org>
Date: Fri, 11 Jul 2025 17:44:23 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Jul 2025 14:06:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5265593a28d91aed5529c31e720be8d3e78e0695

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

