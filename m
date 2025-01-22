Return-Path: <linux-gpio+bounces-15013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C6DA19900
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 20:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DFCE16CEAB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 19:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFBB215F63;
	Wed, 22 Jan 2025 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjWKjtOV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3752153F1;
	Wed, 22 Jan 2025 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737572796; cv=none; b=qnOylLqr72NSuZ1Dl3mVbbpt0DWcL9JUaDFbZOesvfAx6j+WxB/dQZS9oO9HgETS+CVEnjhbaSVly6B0R/SbR2S0FHEDPuHHq2RTXVrrduRlMQfAKL46FxXiLEFWnhiCXHLJQojkSDMd1Eyj3QvoPjW2KHeAXHP1iZQAkxYFttU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737572796; c=relaxed/simple;
	bh=0j5qW41gQKfynv5pjvnUD7orMQofPX9Juqb/XHX15pY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nTtEDyYN0YQOUUQSemSIGTeIUq2npClrgVTpmwp1UxR3peba7HZct6/ZSlnJl2JlryBBeSUjTJWUB95BPl/fkv0azcZ+VZD8fKLidJT94pD89M50KEdnFwltc4LLy1X+FEKY7+kupx6w1lGkNeci2DZGUr1qpDONzZByK1yDrTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjWKjtOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE1AC4CED2;
	Wed, 22 Jan 2025 19:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737572796;
	bh=0j5qW41gQKfynv5pjvnUD7orMQofPX9Juqb/XHX15pY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pjWKjtOVy2WIiczZdCl8GdIqnmxYQqEXbHwCRvUAzvprvojsGybNN6ZSqT6hmNfv0
	 1BS8mCJZyioPlAqsd8WrgR/yQZYqYYyCJkPeyqb3U1dchNZOT30MWXgzgWxMi8KSxx
	 xi/6N8sDjPHdmbduMw97YpFymXvMDiPE/xYpvc3/ksV9xkM8Dg8vC1Oub8+GecQmZD
	 8WBX4YJRN7j4Sl1gq2yrG54gYy++r2TNnJyMv4A/8DURplZcNqVUloOcuCpit8eovk
	 YPeT6dunqoscweHeGVRvDtjL4mEdy5asL5j1mxOlAJPsmUDvMS+L7W0E7WxgOtJEPw
	 cQWyp68iWlbOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D00380AA62;
	Wed, 22 Jan 2025 19:07:02 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250120141718.329518-1-brgl@bgdev.pl>
References: <20250120141718.329518-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250120141718.329518-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.14-rc1
X-PR-Tracked-Commit-Id: b0fa00fe38f673c986633c11087274deeb7ce7b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4abae5b6af811ab2b53aa761bf9ae2139757d594
Message-Id: <173757282081.783272.7060393401461455874.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 19:07:00 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Jan 2025 15:17:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4abae5b6af811ab2b53aa761bf9ae2139757d594

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

