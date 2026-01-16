Return-Path: <linux-gpio+bounces-30680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA8CD38774
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 21:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99879303EF8D
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 20:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8522F3A4F29;
	Fri, 16 Jan 2026 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzbN9C53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2168D3A4ABB;
	Fri, 16 Jan 2026 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595120; cv=none; b=eRvq52BXZVOxjvKKL9MzCZiJW7r+/tF3d8i7LK+2/VNAfeFjyF6Q0RNFBTqK4Bru3h456fbjvD73FbWWzHMrujq5r8L7CGjjE/608lu6GJbd1ZqDkYa5X3UMhuHPHXl5XuTcEutDRrBVshK01b+FAkdtB0O8QbNYaUAs2bYl3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595120; c=relaxed/simple;
	bh=/ZQkrJoYMooAg3gii1CM/DsZxUu9bh/TS5nDYrufRTo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HZUtg0io5aO4rLV/m5bHX6ZDfrSTiu+JsmhGA2QYgl0vx4OZ7W9O0J4tn46KGTyq2ETNz6sIk3cWOZ+SQ0FV8RI91UwkEUbi2BXA6KDEYJzbSz2nij82MaQ5cpaR+af2sUhcpou+mU5EntzBal4c8aQdu7bc8QZjy+WLQFJF/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzbN9C53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49716C19423;
	Fri, 16 Jan 2026 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768595118;
	bh=/ZQkrJoYMooAg3gii1CM/DsZxUu9bh/TS5nDYrufRTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jzbN9C53qWcXysyWW1qDa/VJjgCuuR9cPm59Zo91bOBQwsFM94D0A5tEhDGVsHFTN
	 5IZlK8+6HqrPMLJ+KLNMShaHxAnmPNy8VodeaXj64/9Q0qlWZ0bR9Q4QzjV7BFns5u
	 M7gtETAGPTUjblk74St7b1VlvVCokrg2nhtkYxoVwNcJPjnX+nkZSQZvi6Pf3uFwwu
	 LhralM5kYdNUA91+Dot4tdzQ5Ux+hB0qFGI0eW487zTqmcpFjz5l8igwL/s5dcH4wQ
	 bRiAppazx4x8HMhAfgXVGjQpZSEEl5ijl1IeaR9+X31BOFdicTH5FcD1z27qTC7HaU
	 4tyGAMYbXKJtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2B33380CED1;
	Fri, 16 Jan 2026 20:21:50 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260116112608.11227-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260116112608.11227-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260116112608.11227-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc6
X-PR-Tracked-Commit-Id: 471e998c0e31206ff0eac7202b2659698cf9b46e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2a44a02d785b5dc06d68060079e2daf67a67e5a
Message-Id: <176859490964.789588.11067370899538254018.pr-tracker-bot@kernel.org>
Date: Fri, 16 Jan 2026 20:21:49 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Jan 2026 12:26:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2a44a02d785b5dc06d68060079e2daf67a67e5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

