Return-Path: <linux-gpio+bounces-14675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D351A09778
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 17:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2928C16A953
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42619213254;
	Fri, 10 Jan 2025 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBSeEs9B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F417D212F8A;
	Fri, 10 Jan 2025 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526462; cv=none; b=VCceJl30v2M3pMFgtIVN4J+E3vg5OuMvQOqc371yeENGG6iJUE4HnJhE+TxaAuSg5Qqb9r4fAeabxfziaNx3OS1JHhkJggrAslCJ8Mah09feYbfsg/7zVKcFeBlE3o4eOEQ06s8hsC7pbSyZ9RCdPn7gs5n3iQ8ftMKM/rPVFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526462; c=relaxed/simple;
	bh=2NAdvkR2PTbGwkE4t45RugMpj29rHtGDZjNoUtTV7oo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gj+Zj4wwRRHUXzglKBQqnCp3l+08oAosraPd31VfkmBpeoV5AOXgvc1kOzmeMjuc30wPO6HDFpSVDMaNfR5GhQk4O/a+HQCEEAP/iKy+6Rd565o2USgjfe37MsPEiMlFQl5sAYhxqZF/SQS+DcvMjeF2Q7flAi5n0s6K8sw6mP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBSeEs9B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8634CC4CEE0;
	Fri, 10 Jan 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526461;
	bh=2NAdvkR2PTbGwkE4t45RugMpj29rHtGDZjNoUtTV7oo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MBSeEs9B4gHqmLUbeJfnYIEbqWuIYln+kKK5Mur24KeSLJa1aRvP9KgKxGIwXlYnE
	 W+ChlYyPo6njgx6A0S9Ya/c7qCnygk2iAUg+WTRcQ+9Ukd3OH+0UZ8HG+B4b6H/i4H
	 +POprsU8Wj7VgMcqBjlh1yJREElv4k1DkObVhHJj5sk4X3ARP4UrQBAKAHTJxxmUY8
	 bFNWvpR3qyHb/h2MLI5sKuwbUuKiVK2DFKWxr1mPuWQQGW9KlDm0FbQoCiP2XwsZAk
	 5BqcdQqowxCtlcf2NZnF9iA7Y5DBpmLfpA4wPgZA52oLabLAJniwWN9xAZpJFXxphY
	 V2x9l4UIzmYlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE383380AA50;
	Fri, 10 Jan 2025 16:28:04 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250110090631.12335-1-brgl@bgdev.pl>
References: <20250110090631.12335-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250110090631.12335-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc7
X-PR-Tracked-Commit-Id: e59f4c97172de0c302894cfd5616161c1f0c4d85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d64558493fef271a38672d048f16e3617e3290a
Message-Id: <173652648327.2125399.2135798273316837111.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jan 2025 16:28:03 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Jan 2025 10:06:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d64558493fef271a38672d048f16e3617e3290a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

