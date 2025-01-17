Return-Path: <linux-gpio+bounces-14926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE37FA15A1F
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2025 00:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 826E216950B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 23:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C301DC9B8;
	Fri, 17 Jan 2025 23:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt91ZN6l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCB1DE895;
	Fri, 17 Jan 2025 23:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157508; cv=none; b=YwmKVgOL18YC9EI2S6c9CndMrkiabgJW1iElHIG8ZKjVQobpnmWKHrknT9pwuuQRLkQgu8Y5ZWlePFpJiD/CkJlSwsdQuKdBqh6c8qH7KM6IOV1qFfW8feDw/hvCLsG1t+axtTZG3C/Fq+gaDv+Msw3XMSsUtAvp9m+nCxe3vX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157508; c=relaxed/simple;
	bh=coHKAXb307fpTJwTASNDpf/fkij0Yt6kjh4n1CiNQbQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TDmVNGleK0mASdQEpMaf99n4p2zRyggC/RI+ZwiFi4zFuG5rXGs5+dpciWbzh+088Zr5j7F2YWrjJ5Y8fmqrCgl3cbvPR4rLWj/5KmuUIZM3XDZri0Guu8mfHr2tJxJyRgLZNorw4dbbrA/2V55nvsosjZSkjagH6pfyKXvI2W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt91ZN6l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94572C4CEDD;
	Fri, 17 Jan 2025 23:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157508;
	bh=coHKAXb307fpTJwTASNDpf/fkij0Yt6kjh4n1CiNQbQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rt91ZN6l+tyrd75CVWUv+Lk9jsIFSH6dp4EWYgy+MJLUoQV0cdXzvvlafyv848t+/
	 NIuVwlC95jG/1rW/w0DKLsuN3/Fz43V8os9pyWEdVysUwITn+r16NZ577ebg8nZQg4
	 G4Pbd6sqkeRrHshP21eLIVte6bgRwpW62pnVZTz40XmEbiEkzSFN+bAlpKNgxSdJlF
	 GsWv0wlKRuKb8qA+RziGgbImqzsV8IfSNETXQePimqYfZ3hpvAEYrK7/EzWdyBDb/b
	 aJKfjSo95xXqxChDMJqy/4e6Hj6FCfVJi+fvNyTUXvDUWJUp08HOM2H3Jt2eszgEGH
	 AkO3ZOiG+uCYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 346BD380AA62;
	Fri, 17 Jan 2025 23:45:33 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250117123159.38472-1-brgl@bgdev.pl>
References: <20250117123159.38472-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250117123159.38472-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13
X-PR-Tracked-Commit-Id: 9860370c2172704b6b4f0075a0c2a29fd84af96a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fed891d6ebdbb6de549eacab225f93aa91c1498
Message-Id: <173715753173.2291664.6459105661122896604.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:31 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Jan 2025 13:31:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fed891d6ebdbb6de549eacab225f93aa91c1498

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

