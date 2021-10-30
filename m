Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3940440670
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Oct 2021 02:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhJ3AkF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 20:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230506AbhJ3AkE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 20:40:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5849860FDA;
        Sat, 30 Oct 2021 00:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635554255;
        bh=y2Zs8XJPWM+Ey9LfBq0NLktQc13rb1IJWNTSOt/bL3U=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=CvcPbtquP4kmhHtgDgcDBCEDaBQ/osqrF7uAzmpumzAeSapGVGAQjuoT40mp9Js8G
         Y+ukejm9Wt6XFdeyzITbmniI5Ub6ZCLzd8B7uOUixwzFaarMSrcNefwa/Bowd1Dvh3
         sV6vqMyOmdqJgIDvhiucmmLplDGGGAolf/NV4yQdenfI7H4HBcyWI9b9hUaUxesaAc
         z+KbbckCrlRP7pyoxw7vi7uxzoNPkfN7p2k9M0vfnsmsjiaFgOvXj7hWNq0x1aDt8x
         siy+c450jWWgYIKjxzgdhEkJowPGRueUKDAkbpyQinVIrk6MTexUaM9IfnR6k1tM+E
         Qmu63E5MYXZZg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4857B60A1B;
        Sat, 30 Oct 2021 00:37:35 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211029204550.24882-1-brgl@bgdev.pl>
References: <20211029204550.24882-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211029204550.24882-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.15
X-PR-Tracked-Commit-Id: c0eee6fbfa2b3377f1efed10dad539abeb7312aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db2398a56aecec058643d35828e8cca56a0ac0a3
Message-Id: <163555425523.1437.13927049465909591185.pr-tracker-bot@kernel.org>
Date:   Sat, 30 Oct 2021 00:37:35 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 29 Oct 2021 22:45:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db2398a56aecec058643d35828e8cca56a0ac0a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
