Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EC830E363
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 20:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhBCTjW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 14:39:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:43692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhBCTjU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Feb 2021 14:39:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 82B4564DF0;
        Wed,  3 Feb 2021 19:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612381119;
        bh=iZWmYN1xevWShUBktxjFQZ2BFASAFqpoThV8zMcmH6w=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HYJqYUi1UpiYFnBOZIKoaNMPMOlGQM64CRua3dYn/nilskyuyuHFPiqsFPMyKnb41
         b9HUjztF/sFylAXrVTsosf0jwcBLaL+ua0zGaPs7U1zhL7PTdtyHx4f5Fl+PiANTVw
         f6Djm98INx8qZoBjSstl+UIKr+Fa5FBuPtGJ7OHqJBUr6GqRiQEp3BLDsv7cWD5cz4
         fArn/0CWNEkYggIXSs7fiv+TF/f22Ni/rFvvGLup76aMciJozamJq6sPVAMUJkowuH
         R6dRFfFZpcvaLX5zOCnYy3e0B55oha/dZhEvsN4wmCZ7i4y+0CI73Ist0+WM04iCuz
         xac47wc3kKy+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 707AA609CE;
        Wed,  3 Feb 2021 19:38:37 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.11-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210203130857.17648-1-brgl@bgdev.pl>
References: <20210203130857.17648-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210203130857.17648-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11-rc7
X-PR-Tracked-Commit-Id: c07ea8d0b170c0cf6592a53981841c7973e142ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40615974f88a918d01606ba27d75de2ff50b8d4e
Message-Id: <161238111739.20071.9186222587200219577.pr-tracker-bot@kernel.org>
Date:   Wed, 03 Feb 2021 19:38:37 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed,  3 Feb 2021 14:08:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40615974f88a918d01606ba27d75de2ff50b8d4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
