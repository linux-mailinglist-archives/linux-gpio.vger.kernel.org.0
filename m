Return-Path: <linux-gpio+bounces-13166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA71D9D4353
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 22:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 773391F22406
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 21:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB25C1C4622;
	Wed, 20 Nov 2024 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai6JbdYq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6FE1BBBE0;
	Wed, 20 Nov 2024 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732136430; cv=none; b=dtDkAQzWZOEAGze5fZVTgJUF/XUtJhauxAfI7TWcE/pbsGodCofRWxq1U9jyTAtFU9iRZWgqN7gYkypQJRgkV/PJYzNUvDUmiQ4MVBBDrJM/h2iPK9KTyN+889+PGLWx5Zx/buL2NqLZGsuZ7X4m5NIbZCUqzqpFovTrM15p2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732136430; c=relaxed/simple;
	bh=ErYEEIdaYprSFGd6Fd1ys6fhltywqc1oy5OW1KZF/2E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=McOTmkdeYWtImfcu9UxaB4TVOM/o5ESRhkZIqmjEo6WZ7VGkg3Y8aTYohV4ODfN41tIcdiSaH8QBXdo3ysxOrFW0RcGSnpq0/OxbEQwxw9sWQ5clNLppfH6QTNdwKhS8qeX77JZfi+qRTZFeRnY27qesYp/LVh7/O7eTDSH1sFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai6JbdYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8A0C4CECD;
	Wed, 20 Nov 2024 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732136430;
	bh=ErYEEIdaYprSFGd6Fd1ys6fhltywqc1oy5OW1KZF/2E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ai6JbdYqZKV7b1+8ZjigSgPM1X2Y0xcRBbBXJBsYJfLymL8NBEHtAH3P5T6pQcm9o
	 AMchvzjHjtA8wVeAFJ6IixK7H8WWUHqnreuMq1b+y34K5JA4a/7qR0Nnwb1O/0MXbj
	 c+XvQwJEBZqRRvx4o+PqZeziyC7Z1B5ERZkAfKAKmt9BVFeFul/U6ncU5PasEabBq7
	 Z4hwS7BXf8pl0Iccz9JKF0RzdD++XVGXNHd3D+/8TfDv4rhzRxHfZxB13jbUOx/BH8
	 bzDCw/1eQR3uMrfC7oAwlbIG40zQzmN1byeT2hG1osn64AmXhwLHZ/IxbMyLd6Zy6R
	 7Sysqy3dbMLOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 358063809A80;
	Wed, 20 Nov 2024 21:00:43 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241118125515.49743-1-brgl@bgdev.pl>
References: <20241118125515.49743-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241118125515.49743-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.13-rc1
X-PR-Tracked-Commit-Id: bef29ca3a6458582ac13320d47bf2646e5734dc8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 131561f2ca075f3737c2b4821c4d067dfba0f55f
Message-Id: <173213644177.1349251.13835411673402905075.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 21:00:41 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 18 Nov 2024 13:55:12 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/131561f2ca075f3737c2b4821c4d067dfba0f55f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

