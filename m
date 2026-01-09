Return-Path: <linux-gpio+bounces-30304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6265D06E0A
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 03:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0005D301D0FE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 02:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F96D316904;
	Fri,  9 Jan 2026 02:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6D/ZEsc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319D20C461;
	Fri,  9 Jan 2026 02:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767926701; cv=none; b=Th1AfbWUsUgdesS4f3M/uplvjeK9+jkHvaLr1UBo3QyTmDOELtjsiOZk6ukCz5KLeFVZpI+kmHKdL88PgbONLKN2mSAYkCw4/SiJtLSudSJq+1BWNF+AZv6ueJmXT3Ku2H1R5gwbXZ8n8RdZePLEWgqWgxdRgkBUnuP17FHBZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767926701; c=relaxed/simple;
	bh=zO3yUb/udjixAwJO/19XpPE+S0AJbdtmi4sXtrVBR88=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZJmv+4zMV5OGaiTOvkebrIG/FNsOSH9L5v8G/IGgTMCWZVgYF9Vvr7GX9nFpc0bNSLc6BbPujLp55Cb4fBP5QfL4Iqn6dAqCPsjO36nG4JNy6EUTsuIcCfZrPQujMW5/rLKa+9GIVeI3TwPMvtPwZXvJBbLHAYlPX98aO87/ieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6D/ZEsc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B15C116C6;
	Fri,  9 Jan 2026 02:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767926700;
	bh=zO3yUb/udjixAwJO/19XpPE+S0AJbdtmi4sXtrVBR88=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D6D/ZEscAU0TJewTEPgFKiUOUXjqWR/9Wb1RaXfe1q1EPv8EJJYSMiyjTuqy+od36
	 bR2+aQlERlIF6dYuCpoZh+xGrL1y50Hg8Z8/TznGrEn4jhoa1IfShyJ191I/Ql0eLP
	 gOmjYrdARh71phBO8n6lQZK0esoDb7RfYpRDxjDroqYtsSe2+anOP1VuTq27frWC5t
	 Z59ezJWJcpEv8sEvUxBQrrhOfPu41636iZrG4c0NXgB5m2I0FfKnCK0ori26MszTUG
	 REAx7e/1C1S/So3iXVrzuHUAIP9PEUCrGVdZDe+byM8zWqlILFqwjlRoAtjBK5aQim
	 UAFRU4alDItGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3F453A8D145;
	Fri,  9 Jan 2026 02:41:37 +0000 (UTC)
Subject: Re: [GIT PULL] Pin control fixes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLn1Ba7MH63VOtGQHDOA7a_2A9Ez0CQG+Mw_LkvhruswSg@mail.gmail.com>
References: <CAD++jLn1Ba7MH63VOtGQHDOA7a_2A9Ez0CQG+Mw_LkvhruswSg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLn1Ba7MH63VOtGQHDOA7a_2A9Ez0CQG+Mw_LkvhruswSg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.19-2
X-PR-Tracked-Commit-Id: ebc18e9854e5a2b62a041fb57b216a903af45b85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 623fb9912f6af600cda3b6bd166ac738c1115ef4
Message-Id: <176792649649.3874217.1665155660943559644.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jan 2026 02:41:36 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 8 Jan 2026 22:33:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/623fb9912f6af600cda3b6bd166ac738c1115ef4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

