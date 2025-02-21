Return-Path: <linux-gpio+bounces-16401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C884FA3FD1B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 18:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FCB07B18F3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367BE24C697;
	Fri, 21 Feb 2025 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6Vlq437"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573324BD0E;
	Fri, 21 Feb 2025 17:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157782; cv=none; b=fIxZ0armJezkNG7u7G0M+Zfz/kZBlLsTWHST7RG+GwoxUgmQLyCpm0DATJopKxQfQhgm1eYEggHt/Wb4aFCClK7WGIknnLMNHSKpLXmd6AODHHkQmgxb+wi08cs1f8Jdc1YR7rW3q1SYYXhu2RsHQM0yR9DsxDHu/DndzG6/DJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157782; c=relaxed/simple;
	bh=Sx8CUdWSR8m8fVhuRwZ8nVHVYSso8rrmeDD2S+IaxEM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fsGEPl3yLczWd00U3dqtstOl6ie3DGBKQI5zD0W4l/gP+cqnKsT9wsMqQwsfomLKTeowChEkHD2HPJY6RL/4xPNhFJ1df6sST7q1qnGo4kTNhzDyl+2F0D0heNjlMIxTjrI+4pQlQFj390+yWg9yFqdGKLcgZkVbB7+kHuH3lPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6Vlq437; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9271C4CED6;
	Fri, 21 Feb 2025 17:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157781;
	bh=Sx8CUdWSR8m8fVhuRwZ8nVHVYSso8rrmeDD2S+IaxEM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f6Vlq437iaUI3VyxLy8rKDR8ZCZjlT3yTdWtcNToA41n0v75Tvs5QKr5G1IZflaSN
	 /VtQxX0DWoze7dwhSI/h66E3JppoTyJPldGoZ66no/Qx3nn58i1B/FIDWu30+EJVsh
	 xJB300lbLPuDknKn6emzO3E/qOSeG0nu+WJlLrGxAyXAJk55JDCHfmJE+TnEh3xP83
	 tecybbPfMFb9vRDOMTrVU/yqABVS2FgkLEA35isvkXc+uby79aLc8/6w0J5AcuufOY
	 dXQ6bUI2seOfksgtppfaeqV3VzV87dq0Ig9A4wH2USq1ofNYfykQNnItX5Wqax6eew
	 f1bOCZJzbDuig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBF23380CEEE;
	Fri, 21 Feb 2025 17:10:13 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250221144750.108147-1-brgl@bgdev.pl>
References: <20250221144750.108147-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250221144750.108147-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc4
X-PR-Tracked-Commit-Id: 96fa9ec477ff60bed87e1441fd43e003179f3253
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 534a2c6217f21a66e72d246417e0cae25c5a3d62
Message-Id: <174015781259.2120607.15538489442058797181.pr-tracker-bot@kernel.org>
Date: Fri, 21 Feb 2025 17:10:12 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 21 Feb 2025 15:47:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/534a2c6217f21a66e72d246417e0cae25c5a3d62

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

