Return-Path: <linux-gpio+bounces-23033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEDAFF0F2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 20:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CCE3A7659
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173EF2356BC;
	Wed,  9 Jul 2025 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or5IiARp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C62367D7;
	Wed,  9 Jul 2025 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086185; cv=none; b=oM++7nzFA1SJ/CrkJC4UYPpiiGMiiIB7+uJsyEUofLkIa5QSRDfBYIZt+SO7J18qYvlAsnh+nEio61nnfHlKW8fSQDzENJIBocqmY1SEERdWzXVq7u2C8H88x0l9Rm4OgZ//gIque3ck3ab7Fl/jjWvim8lbhWw0Kl8vkKrvkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086185; c=relaxed/simple;
	bh=KwD9SH3Q/eUIKXVMnFqSMfihEKGjWV6UeIeKoPKNfBg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OjyEt0aLK58xqlN5VP3eUWAJ1sQXlaPQC6yB1vQ8mb+Dy8nFAISNfd+RND1YpAb0rRLpEUDDJ9Fb/gKYj256dF/xPQHTOsMSUuPGSRYa6sf6tEJHHg6ymT7yzKzQ4rNB8Wne7Q/DorZPl5IrfFY3mQPGkrj1flwnBS0plv2b3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or5IiARp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78AFC4CEF0;
	Wed,  9 Jul 2025 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752086185;
	bh=KwD9SH3Q/eUIKXVMnFqSMfihEKGjWV6UeIeKoPKNfBg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Or5IiARpBNyETbPKCY3CWlR2i9sJfnnrXKYRRlWdVznS97daTcwCqOQ10EnPi3APC
	 ClEjvSuJ6QJ1ZUJ/oocfLGG+VDwXY9jnw7BgEf71jAioziTzk7TcY4HCTFAPwasfWR
	 0j8v0JABOlq0BCwjaJNdRTVa3cZPKfUS3ZkdM59wMkUkKZJSE7RbZoW3WiZuvt4/4U
	 bR4H8MCDT5ya7GxASm3+Knzh5Dc7jas7Zq1osFkpm8MigVdsC+M9AD7waf+aIyo8cP
	 +oCxeYfq4dNzRJxXcSMr7oMp2EfalHsbCdyOYqel0+3aTMwdek6P9tqYAfVRVWlvJl
	 ylpK1+x/lVAwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F90380DBEE;
	Wed,  9 Jul 2025 18:36:49 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZB=mYnmZU14Gn9buB7jE2b-7Fu+dgf3pcAcVj0FgvHiQ@mail.gmail.com>
References: <CACRpkdZB=mYnmZU14Gn9buB7jE2b-7Fu+dgf3pcAcVj0FgvHiQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZB=mYnmZU14Gn9buB7jE2b-7Fu+dgf3pcAcVj0FgvHiQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.16-3
X-PR-Tracked-Commit-Id: 5285b5ed04ab6ad40f7b654eefbccd6ae8cbf415
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9adf143357bf5ea6400f276ca60bfbc7cd92c19a
Message-Id: <175208620809.814034.10219543334786452134.pr-tracker-bot@kernel.org>
Date: Wed, 09 Jul 2025 18:36:48 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 9 Jul 2025 12:21:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9adf143357bf5ea6400f276ca60bfbc7cd92c19a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

