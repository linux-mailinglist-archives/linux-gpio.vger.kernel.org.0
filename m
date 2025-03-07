Return-Path: <linux-gpio+bounces-17277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAFEA5734A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 22:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28B3189760C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 21:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13428257AD7;
	Fri,  7 Mar 2025 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg2dYZK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E932580F4;
	Fri,  7 Mar 2025 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741381428; cv=none; b=O4oDWvG78ZT5tiuC0Esvhqi+UdraBhajTpv8hzH7WkNkZuYsIXnczyGjHm0NjLZzJpoGR5FK7jEZKanFSDdGz/GbxJF+6y97DwACqa+1azCjMXjGs1BdMOPTVwETlWv4oaCIl8ZqsnUrEV4rBnUlI/3ovd6MeB6z2C0T/L8/FOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741381428; c=relaxed/simple;
	bh=p9+AsLzCWnCU9SlgSd2SiFSgyg9D+/En/GILfFZ7b1w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VG4HjZnid3V3ejVMXng8dHPDZ/ZnXEvgSsmmc8JaZRIbCOqiGf8JmvzYd/Mss8pGgza+3sa+YQ40qF4yF1B614fipUZne4O1H8hCzO/y2d9xxBw87gyg3ZsROGQCyW3aG5uBP+sedP9unWZqDoXqg2N6k25+SVOQZwAUNwbSWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg2dYZK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E36C4CED1;
	Fri,  7 Mar 2025 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741381428;
	bh=p9+AsLzCWnCU9SlgSd2SiFSgyg9D+/En/GILfFZ7b1w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Tg2dYZK3QgtfiqtcLgQyJQ6ks3p5OGjHy0aqlUT8tAiqi82wDF79z5tUb8A+VzcKC
	 1NoiKvOOTRhZzL7s7q7u1Yl5aQDHSt64n11E1yMGCV3U6+7HFAbNCbffyMOOQcz6ai
	 ylkp4WTl/+devHD+s04IRNLoiO96Wd8LuiYzlt7mhuuflQOdHh7QunKOCjmvO1CpMS
	 eWjNrZosiM4Whz6RpSUwC6Dgi8PmsRNnoRbfAmqtpiuQvbuhlByWEyFS73os9OG9An
	 en4dQ/Mfg1aGjChMiB2iWxFsyRJdDzL0RiSWdRw78kqcbBH7GC+ZvrIGPXZ1w5a88n
	 04xuMkFivHTAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D89380CFD7;
	Fri,  7 Mar 2025 21:04:23 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250307123249.28832-1-brgl@bgdev.pl>
References: <20250307123249.28832-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250307123249.28832-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc6
X-PR-Tracked-Commit-Id: 391b41f983bf7ff853de44704d8e14e7cc648a9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1222390d138d1f375fe28a9a052780009d2ce6ef
Message-Id: <174138146212.2483503.17879764159434588911.pr-tracker-bot@kernel.org>
Date: Fri, 07 Mar 2025 21:04:22 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  7 Mar 2025 13:32:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1222390d138d1f375fe28a9a052780009d2ce6ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

