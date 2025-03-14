Return-Path: <linux-gpio+bounces-17633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67688A61D7D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 22:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B9431B60CB2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 21:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5E71FA856;
	Fri, 14 Mar 2025 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwrYJe5w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3E81DDC37;
	Fri, 14 Mar 2025 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741986212; cv=none; b=lBJ1OERnIhI2iCp5K7wKHlTfKB034PBZiFLF/PH/+1LhJ1/sactdeFwJzl8UgZPx8O7bSvXt/7zZOlwQYbBoJcw7eGdEzJE9jeuNvI4lSogMbJIXorRyAkwEiarCLIUlEyFvpRYYKC8gyAaZNloN0o0ISGOf8xaZkxQzwTjiHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741986212; c=relaxed/simple;
	bh=S/1xapIYWQXYGM1EzYJfZ8j3v+12OFWYAmAGbjiFJjQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M41HIivi47H+N06+bkMIOrg05OPX7o6wGHuscL7xAX1W345eJVnyypm1PXQpJWQBJO009cD4SBfHNtI/wwXdXZIRURHZSegQ8Z3CoQ7ZmRaHFtdSXcSHvW6k4G1438hAvV3HCZdhZPap8yvCXYxJ7Kb0EtDrFOD6klybFk7jdis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwrYJe5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E66C4CEE9;
	Fri, 14 Mar 2025 21:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741986212;
	bh=S/1xapIYWQXYGM1EzYJfZ8j3v+12OFWYAmAGbjiFJjQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NwrYJe5w4Y1+By+zM1Vh3MtMcQ4CsHDfvxuNVccaBzTooqWZQqhyL4FicWKNY5BCz
	 UCLit7P71dHqFDdMJkvBAWbzdt8p4W3bM9S18mjQKeD6zEwxMhY9R7BWa9liOllw+n
	 gZ+9YqFIC7ixRXqOnXqJpdI/uvTzXNXLZ04pmsQDALf9jGQYeAxavK0JXGO2O3g5bw
	 O9la/L19BYCs6JdUlk8Ay1/siFRCN7vCYVxYKp9Cq9s71HZ66V13Q5hk8MWnQyXINb
	 Ec7OCiaxo9rz194MY0zOeKi/BTd0l6CHAeY/ImaebmN4WqyBR0Ok40bUOaOnlWl9xO
	 ZaVsrKGCQRbHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D24380CEE2;
	Fri, 14 Mar 2025 21:04:08 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250314142740.49129-1-brgl@bgdev.pl>
References: <20250314142740.49129-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250314142740.49129-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc7
X-PR-Tracked-Commit-Id: dcb73cbaaeb39c9fd00bf2e019f911725945e2fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6efcfe105c7ace776e011bd82e4f781876fdb38e
Message-Id: <174198624668.2382486.8400141837217895184.pr-tracker-bot@kernel.org>
Date: Fri, 14 Mar 2025 21:04:06 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Mar 2025 15:27:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6efcfe105c7ace776e011bd82e4f781876fdb38e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

