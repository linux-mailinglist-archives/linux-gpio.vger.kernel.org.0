Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFACE38D1FF
	for <lists+linux-gpio@lfdr.de>; Sat, 22 May 2021 01:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhEUXdJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 19:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230091AbhEUXdJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 19:33:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7858F61026;
        Fri, 21 May 2021 23:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621639905;
        bh=tk8Dkf4+DVyB0Yb08/EZnfxDLd0zSrjcWaydDLb3xi8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MQeEDQgMKcZyTu9AuktDx+I07581Tfsed/Ss6KC3RdgR/jaC0slN4fhgsAZa2xsmz
         XyWdbePtChmm8f7uEjjtXvcykPq+OqFMU5P+K44AENbl7gLuiEXJEZssEag71NPuw9
         ZdIqOBQqqEqpGgdAgJGP9xjxfsl4C8kLph4Zz3lbuoPH3z1HLmCSpOcsS9wzuTZ85P
         3cHrGa9o8Bxe9e8abnPfWCG57mw4lruSQfd6qQ3ACDuya9ComiPujzCgH+Cn20ERcY
         C6BhkAQXBjSZn/ruA79G4UbtmFKgIGOS9KDVJTWDB8Qrykbat+ASpTl/UKjYw4Fg4R
         WjDgtbikLnzgw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 721A1609B9;
        Fri, 21 May 2021 23:31:45 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.13-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210521164139.25088-1-brgl@bgdev.pl>
References: <20210521164139.25088-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210521164139.25088-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13-rc3
X-PR-Tracked-Commit-Id: bdbe871ef0caa660e16461a2a94579d9f9ef7ba4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8085a07097b217adeb2f0cad3ea79ac1f8750e5
Message-Id: <162163990546.25567.1180439700931873574.pr-tracker-bot@kernel.org>
Date:   Fri, 21 May 2021 23:31:45 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 21 May 2021 18:41:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8085a07097b217adeb2f0cad3ea79ac1f8750e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
