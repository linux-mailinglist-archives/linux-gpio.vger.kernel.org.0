Return-Path: <linux-gpio+bounces-17995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 452B9A70FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 04:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3B9F3BE874
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 03:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957F31624DD;
	Wed, 26 Mar 2025 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drSZ07vb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536632E338B;
	Wed, 26 Mar 2025 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742961537; cv=none; b=tZP1BkLobqi96rLkf6szWij4uqgMFmjEq/fGED4Fx5zlPbsAv7V2ODdsxf/8DVkL2Jm8ZyoeYrn5cSofg8pAwLBYbk9zTyjCj0NI+F//lcUrh+ddz6EEdmmoj84tJj4g9cB5VA8n01ONO1F/ABqhmTUR9sPxmzNU5AUX/ULKfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742961537; c=relaxed/simple;
	bh=ATv7xuDBcwDRQdImiVhhyK1x/skDbK9ydZ5ag3tTcnE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FK1CWI+yZZf/0XXSDU4alm4whGu5aKW/7MZbybmrra+ezWvogkkvWdHMChymDot5xOui2RtB0e28/c25RL5ZuQPlQ45dtPWKtx8hutu55mXPU7qg2dYVel+gKWf2sBHkZXM+5PH9SNLmfJ0hyUtD3FcwisplpQr3MuRePe3l7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drSZ07vb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0E1C4CEE2;
	Wed, 26 Mar 2025 03:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742961537;
	bh=ATv7xuDBcwDRQdImiVhhyK1x/skDbK9ydZ5ag3tTcnE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=drSZ07vbqmpCKITJ5+f3wxxTB4qjIAcs1U9hw0w3vno+MrVCl/XpHl/CyISKJxNJD
	 zcEivhccIrn8Jp+jN4FhgS7u8E381XjCYuLt1nenQ3A+8iKWXyDf+6448QUIZ2ffCq
	 kQieeBXRUFKWjP8Fd75Qoh2LdOWIdzchPvvZCsM8zr38+15Q0rB1Y9VPCj6zziqMtf
	 FkUtoyCdmSLr0HkVkVtQzWuzPYHtda8W4rHoMlYdR4imKEQD1AN0XsodO1oRyRjvNB
	 3NDA8sYdUO+NpAg4u0kauJ7cQaWnfLgKcim0mqfLyqN0PjvaZQaC43YhEfcDVl763T
	 ino+HjHO98Ljg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDC3380DBFD;
	Wed, 26 Mar 2025 03:59:34 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250325111107.41070-1-brgl@bgdev.pl>
References: <20250325111107.41070-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250325111107.41070-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v6.15-rc1
X-PR-Tracked-Commit-Id: af54a2fbdf45b1fd32cdcab916f422e6d097f430
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5143840cef6bb1ec4f334604ecc55130dd196fed
Message-Id: <174296157314.837738.14676125149760763274.pr-tracker-bot@kernel.org>
Date: Wed, 26 Mar 2025 03:59:33 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Mar 2025 12:11:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5143840cef6bb1ec4f334604ecc55130dd196fed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

