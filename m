Return-Path: <linux-gpio+bounces-6535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A18CB3DD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 20:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFB1F1C21523
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 18:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3177105;
	Tue, 21 May 2024 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rukp1Yxp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FEE17722;
	Tue, 21 May 2024 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716317578; cv=none; b=iOCSOFVVXcqMqb3YA+Hqj66jgBNKwKzRksYuZFasSYcyAoPbhYIBP29ezRSGM9MitGdTNXVHlx8BfX+az6lyQd8AdlmuK4h4j+w7gnJqHuVWPOJZYIFVddsO1iXVidt60/pzWOpZx48NWS9sAnTgpMbLQFCqC1wCzLeoqVR64aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716317578; c=relaxed/simple;
	bh=AAvyzUbd6D772qh1l7EyGzHy9yHZy1bRsfbDgqanwEE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NcyZ102nZFAqXkH21ciP0i/nZthZV+hY0Gt2lhgx1i3NzkGFbdQg+vkk3gC/4m5ztcCAsxRu95hVXQKUQBbAABzz/to9KGBuoLmg33WvIlKak06DfScTrXb5aikJXKe3txQTHiDjlqgxZ0mUs8L2RlCtKFPU4pYxAga4ZXY1Qkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rukp1Yxp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84101C2BD11;
	Tue, 21 May 2024 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716317578;
	bh=AAvyzUbd6D772qh1l7EyGzHy9yHZy1bRsfbDgqanwEE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rukp1YxpiTd4TOmNtCr0yhuXKWcQq9g+gsJmS4mzrhIgt6oAqesQR4wWbQ0zSedPD
	 mS8Qdm1zN6H8ko1EatZn8Me/T5tIuWzxMN1AhYsp5Yfufc+FLepO5llTqxym1cVd6f
	 5HE5bcx20tEu+XL7Bzlp0TsVJQFEo2EUGu8Lc/l8ZNgE/Qf991yftEz+dS7sSqOjVH
	 qDReX436Vn1BeNrue5decZffKJSrwEIVJQwK07hhW+MLuOG+w0sWow+YIN0Denxxrh
	 R7SNgbvDq8zRTu9DPeochgBoSKeIVJ5epIj33pRd8ZMPI4ipi5xBqLoEf+uSgJ0H5I
	 onIombnjhd/EA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78284C54BB2;
	Tue, 21 May 2024 18:52:58 +0000 (UTC)
Subject: Re: [GIT PULL] intel-gpio for 6.10-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZkzQWCBqagIVsGeB@black.fi.intel.com>
References: <ZkzQWCBqagIVsGeB@black.fi.intel.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZkzQWCBqagIVsGeB@black.fi.intel.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.10-2
X-PR-Tracked-Commit-Id: adbc49a5a8c6fcf7be154c2e30213bbf472940da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b1440380d5dd5d779db7a271b772d5c28bab0ee
Message-Id: <171631757848.16717.9793600313576237054.pr-tracker-bot@kernel.org>
Date: Tue, 21 May 2024 18:52:58 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linux regressions mailing list <regressions@lists.linux.dev>, Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 21 May 2024 19:48:24 +0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b1440380d5dd5d779db7a271b772d5c28bab0ee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

