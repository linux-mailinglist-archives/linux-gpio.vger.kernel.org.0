Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9F5321EEE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Feb 2021 19:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbhBVSN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Feb 2021 13:13:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:37810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230492AbhBVSNY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Feb 2021 13:13:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 26D8B64F09;
        Mon, 22 Feb 2021 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614017531;
        bh=D8erod9JYUVXhNyeCUcNwNB7W3fMPAl0mID3LVo8E60=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Go7HrJzRlVInSm2pVKjDakefsIeG+/KpxBwm5P/2emggshvV52ePU0WXoLflK+CRe
         6KBjkutRdk/C3d6AapuNLMIOeVv0tmbJyEXfQFEV9ontTcZMx2j3J5KAmC00o5yPEW
         LUnIsjjgA8S8xNb9odr/W/H8275C9dqM5A0q0bMx7jOLhz39x9dNdGkOmY9vlT2D5R
         yrSM/63Y7y2cngVCtoL0kdneYIJERfshpD1GwyplYx10wYpBB4DLOMZaOxPfD39PK4
         wYmnfK41ZBW+nyqsMdbHYka1TQOVY3V+5XWx9DzGczEdcyy82cra/9BxAEmQcNOA8x
         p11iasq9Jpkyg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 22BEB60963;
        Mon, 22 Feb 2021 18:12:11 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210222153714.4961-1-brgl@bgdev.pl>
References: <20210222153714.4961-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210222153714.4961-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.12
X-PR-Tracked-Commit-Id: a8002a35935aaefcd6a42ad3289f62bab947f2ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 882d6edfc45cd2b6e33cf973eab9a1ae1dbad5d1
Message-Id: <161401753113.943.13116874791992514927.pr-tracker-bot@kernel.org>
Date:   Mon, 22 Feb 2021 18:12:11 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Mon, 22 Feb 2021 16:37:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/882d6edfc45cd2b6e33cf973eab9a1ae1dbad5d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
