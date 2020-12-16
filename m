Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817F92DC976
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 00:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgLPXMN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 18:12:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:56512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729034AbgLPXMM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 18:12:12 -0500
Subject: Re: [GIT PULL] pin control changes for the v5.11 kernel cycle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608160254;
        bh=AHWqnTtWRT3PE+Zv1J0t5TSfrO4roOQwrJW10B5Bvsc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=SHwCDKxtMl3Z4ppDOPm7ESp4YGiaoXbSiczRLTUXfRO5/Lp4645E0sWiJfrFqSXVK
         70kTIwOyKlEFtqwg2ic8lHxJsGGj7bVZW0mIRejr5D2YTx48IhMUZdUV7VND1YYVJV
         xUal8ikiIY/CW/ZfH+BmBQXY6Y+9CZyc143420l8TFH8X1bt0VfyTjncAOjH9pCpXj
         QhlRTmfNhu8MceYXaAH7XtQUjDGcDgIs78203Um/39gTtFUcqCbYuMVXEvhWgjNdL9
         8Y9PZWl3+434GfhRltAuWtEJnTxIYqgAnoNGe7dEyCy885Nd28y3WYEyZhR/06n12g
         r/uN9FHqXi6sA==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZt184k8wpPZZEKwXDUbeO311KB0JOcawZPdhJJuiuYow@mail.gmail.com>
References: <CACRpkdZt184k8wpPZZEKwXDUbeO311KB0JOcawZPdhJJuiuYow@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZt184k8wpPZZEKwXDUbeO311KB0JOcawZPdhJJuiuYow@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.11-1
X-PR-Tracked-Commit-Id: 3df09cb8c92e2bdfb78c81f678f6990bd780f09a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f68e4041ef63f03091e44b4eebf1ab5c5d427e6f
Message-Id: <160816025410.24445.9598625162546194084.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Dec 2020 23:10:54 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 16 Dec 2020 21:47:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f68e4041ef63f03091e44b4eebf1ab5c5d427e6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
