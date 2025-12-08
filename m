Return-Path: <linux-gpio+bounces-29399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E82ABCAE446
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 23:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35E7330A4B3A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 21:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50992E0417;
	Mon,  8 Dec 2025 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey98Bb3e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18642DF3DA;
	Mon,  8 Dec 2025 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231167; cv=none; b=h19eVAwwPuA9GnasrrGnXdBGT7+0O8sqy7nhx/iX0oEP0Cg+Z7XwXEz+W91eru0Vhs0baisKIZHtYZANsLTvK26KjsbDEwXtTOOfDZjyp3TBrfSpTrGculvhvqg/2MgMVQNtETFuA8G4vlypiexAchOkA2zV360re21rrzaf0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231167; c=relaxed/simple;
	bh=F94Ib2cc6y0to3JAYBMF1dE1INj3elQ571X8hGyDHPU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NEtk431SW3rCC0uzFgsA6XOUNQNEN80htvpcA4KkJJ1W2fSouAKZxqxIVm1SNCAk/mZGKXxDhSVsNVTGylbeFeXv1Q6XEBcOgUiauIfiwHU37i59CPDnDKQKFSH1ufp5lVeD/L/Ye3uP+1ZEwQ7LwM2LG2qZQfgQ924EIfpFRMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey98Bb3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227A3C19423;
	Mon,  8 Dec 2025 21:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765231167;
	bh=F94Ib2cc6y0to3JAYBMF1dE1INj3elQ571X8hGyDHPU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ey98Bb3eMI6v8Vdoa9i8tlsjqTJnxZQWO7PJEuFl65kAzBPv5Ol3f6YJRXRgDc8Kc
	 g+mI9bmXwLJJ68rc2GmcLwl/tkHvELm0l34j8F6pmitmJYs/QyBooT/21hI2BG7W3G
	 vcKNfB6Dlct4R4kSgqt8RxXaIxHQUPwdwYasoQeRYumofLtuuG27BlEdNuBqLRMPlc
	 8dnLxNKvF8RagvFldG5wsz7mkaGlc+f7UBvZ7V2ipPmD5yUsro1WXfYcyu4s9p9gmz
	 VluVNQbVnerqx3PElGYN/jRJehQLaf5niIik5Bmrz3ZaXlWEGDUqiniTYLjzVimIE1
	 GLkePob0A6YIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F29CE3808200;
	Mon,  8 Dec 2025 21:56:23 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLkbd9tuMBD6UKY2SNHcyESAFWu78+yxYm=fkpufac1WNg@mail.gmail.com>
References: <CAD++jLkbd9tuMBD6UKY2SNHcyESAFWu78+yxYm=fkpufac1WNg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLkbd9tuMBD6UKY2SNHcyESAFWu78+yxYm=fkpufac1WNg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.19-1
X-PR-Tracked-Commit-Id: 666065caa31aeb812978740bae21871067bb14b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a110f942672c8995dc1cacb5a44c6730856743aa
Message-Id: <176523098268.3308012.5723471843437468349.pr-tracker-bot@kernel.org>
Date: Mon, 08 Dec 2025 21:56:22 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 8 Dec 2025 15:33:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a110f942672c8995dc1cacb5a44c6730856743aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

