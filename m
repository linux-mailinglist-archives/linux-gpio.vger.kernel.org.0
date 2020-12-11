Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1DEE2D7E32
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 19:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394974AbgLKSg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 13:36:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:36072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405884AbgLKSfy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 13:35:54 -0500
Subject: Re: [GIT PULL] Late pin control fixes for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607711714;
        bh=8kFqnTDA1/HWzX8rnVodhRelzUsg/iERMqAJXLiKD7I=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jfqtATkBD94JutUQUzErLiMR6IqUNT9X030hMaZb2nHE0Lw/oW9u38tmnlaIzb55U
         fp76MhjSzHFK7K4atlvKl3zULVRJk9AXu2OIu3TewYKR9B2jfELJKEStmh+JXeMGTn
         aEufFyZzFZcAyRS7zn8IRoAsw3tajW/UOVYUSwIOxFu3PLhfP+pjskneWqlcPpiC+w
         5jBs4Z173yyzOvyn8pBF2wnQ/Zf9uzHUfmobHadY3yX1YdWduf53Cj7PxBjRe3gOBj
         CbUxO2mUcfIFjUA6M9suu5VMN+w6FzeM2+y+4/QaJQV8LAZ1Kl9nCaPLRl3eod5+0Z
         ddW5ElTsO2hoA==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYD3585mDYKNH2dZhOncpef4WJkm0iEGA7g38aghj7Xvg@mail.gmail.com>
References: <CACRpkdYD3585mDYKNH2dZhOncpef4WJkm0iEGA7g38aghj7Xvg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYD3585mDYKNH2dZhOncpef4WJkm0iEGA7g38aghj7Xvg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.10-3
X-PR-Tracked-Commit-Id: e8873c0afd34beb67ec492cd648dd0095b911f65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 94801e5c6d461045726e1563ba2369ef7ce21dbf
Message-Id: <160771171405.31675.10464589465760820714.pr-tracker-bot@kernel.org>
Date:   Fri, 11 Dec 2020 18:35:14 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 11 Dec 2020 09:52:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/94801e5c6d461045726e1563ba2369ef7ce21dbf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
