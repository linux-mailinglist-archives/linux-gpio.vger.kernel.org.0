Return-Path: <linux-gpio+bounces-20802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A9AC94B8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 19:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220C7A802CB
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 17:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDA1237172;
	Fri, 30 May 2025 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPv86XE/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4CD7260A;
	Fri, 30 May 2025 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626084; cv=none; b=ejgAdd51ISnFEqJVgFuNQoSaH7AGhrSvcpGfbRBohZgYKxxBbJ/z89TPf2svDE658lWfXuWzh2osvnFodxN20B0ILOVwyYFC3pVihjcOYzMCMIQJC/YY/kiPeavWY6Iwqgchm1NridA44zPqD2tSM5LOgrA+gMQYzP1NphIiWVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626084; c=relaxed/simple;
	bh=WGCGD2OqK9sBpY96Mk+kaGilLcEFW9efg2e/lsJqlYY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eQ2ZpWnQAGBqoI8yM3KNZXF0y7V4MTfpaYQ4Ae3LMJEBHFGuZMpwvYWpckNUtKa5pAhwOEiaYOJoeXvd0BRKzgJSerH4+yPrI4XpmcK0JGsLG6ajfTIfUqkNr8sj0sNmNdt2m12psYzHy7RkslPvEToPPfjBhGXIXGcysVEOaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPv86XE/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD65C4CEE9;
	Fri, 30 May 2025 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748626083;
	bh=WGCGD2OqK9sBpY96Mk+kaGilLcEFW9efg2e/lsJqlYY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TPv86XE/kFgpgZ9pSbIUJ4N8ZLv4A2Qz653NV8ZdTuAf8nUnq/AnbGrtRtINje6SR
	 i305MqumJ33jhlJQkcn2+DmyItq/5SCx0Q5EDuP4n8ivlHoq3fE86pXKmrJvl/bynT
	 HpvGdmiWen2ayJfTKi0vsEy2CMYYTEZYjNmbuXRrhy1UT82vnCBvgWNct3vk5zJgYP
	 bk9L5skaovnCe6LvwYvXjje0erftzJV6oAerfI38n0cY5zecZOVfzaLh4D61X//DwD
	 71aOFk//zvIgr1ZYakZCgj919hgO96QIT/ojXKOkEOk0vs3NUiVZmjFESF3Axbx20+
	 elcMiuNKn24RQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7101F39F1DF2;
	Fri, 30 May 2025 17:28:38 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for the v6.16 kernel
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYuGv=mQJB+i_1itMCdeSYHVj4bcxrbVL1z=uJCEci8OQ@mail.gmail.com>
References: <CACRpkdYuGv=mQJB+i_1itMCdeSYHVj4bcxrbVL1z=uJCEci8OQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYuGv=mQJB+i_1itMCdeSYHVj4bcxrbVL1z=uJCEci8OQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.16-1
X-PR-Tracked-Commit-Id: 08dcbe30be481bc66eb5ee1e82a577d64e451612
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eafd95ea74846eda3e3eac6b2bb7f34619d8a6f8
Message-Id: <174862611692.4033976.14109493280754242765.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 17:28:36 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 May 2025 16:51:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eafd95ea74846eda3e3eac6b2bb7f34619d8a6f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

