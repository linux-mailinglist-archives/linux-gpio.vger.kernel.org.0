Return-Path: <linux-gpio+bounces-13880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA89F14A2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 19:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 369D7188E970
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4979B184528;
	Fri, 13 Dec 2024 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHhpvfjk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF017736;
	Fri, 13 Dec 2024 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112833; cv=none; b=GbJMq5m5RXpetml6XFM1ug4Ft95BTKIDr5ZvsL/saRtb00YW3ChpC+2BEfUpylQkBid9zh58T9ojL2i44Se0jXrC5uHFVJyQYcbvzRGmzV3CsTZCl1y9SoioMHZeXhA+IOtUMZRjt8swp28YXcvfclXxOZCmFtD0Dvn9X7wQ8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112833; c=relaxed/simple;
	bh=caYfRh2aNdaDocC7AlM+LAg7jWufGTJ/xVbux2M4bs4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fiQqQueD8RGj7Lav6PtEw3Bb8Jix4cW6ntSI43rMS8jJe9zDKqezWgr0GXHlgOuNf69QW4NlapG0wZ8/3EDXogDW1L40wVonaZYNs7/c4mn6/FrZM8Zek5W8ib8JRT0eDRJXGQTB2GYbgIAvVM7fGodx6flkiouQUXKD9HsWh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHhpvfjk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C57C4CED0;
	Fri, 13 Dec 2024 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734112832;
	bh=caYfRh2aNdaDocC7AlM+LAg7jWufGTJ/xVbux2M4bs4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GHhpvfjk+h6YNV/M61WC9mD32n/t/kuHdhG2Ii8TUUotki58c6kdK3siO+ZolB9oY
	 IrFO7sxa0ZOjMB5u/L2KDeLUjEOr95YFR8I69H9LwkuYecgfXjRnHUIePpEGSefN/B
	 8R0PhaQigJghBbbt3JzQWRwrsUeO17/vK8/xTxlu5xqzXOI19Q+56SEozV6zxrHsoJ
	 DSI/rmZ1Obv20ipO0h48/xXyWHrXcn3JuRK1QPEu9v+Gk1dZii0y2FgMJH1eJeCAiA
	 u7Z7z9ywNSXH2q30LSF8jQtRLcLMcQXCzJ0fRD5lUX7h3VA/HbtF3ccJyrNvn4oZ6H
	 wnOIzjNyZYo/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F089C380A959;
	Fri, 13 Dec 2024 18:00:49 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241213134801.49391-1-brgl@bgdev.pl>
References: <20241213134801.49391-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241213134801.49391-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc3
X-PR-Tracked-Commit-Id: 9ac4b58fcef0f9fc03fa6e126a5f53c1c71ada8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 243f750a2df0662bc45119f9dd5d7da031a17f36
Message-Id: <173411284954.3116882.5697512328901302958.pr-tracker-bot@kernel.org>
Date: Fri, 13 Dec 2024 18:00:49 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 13 Dec 2024 14:47:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/243f750a2df0662bc45119f9dd5d7da031a17f36

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

