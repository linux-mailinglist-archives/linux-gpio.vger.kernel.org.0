Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC72E3B4BF1
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 04:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhFZCMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 22:12:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229906AbhFZCMY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 22:12:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6FC7F61941;
        Sat, 26 Jun 2021 02:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624673402;
        bh=LWj40Z4yKsLe4e4OkelHtGTuR65Xje+sfgl8wSxT9yc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=AciPhdbvhU8x3Py1Et6Oscy0XjXYCzrvhgYBLxHdMETw7ebOtH4TLxFrrHY7v3Z9m
         mfbZnik5Zm5RevBnIMmBxNUjLeQ7OZsFfOSjygDk5TT4tIhjyapktIQM6J89xCkn8H
         wWGKsL3TtfxyoXKxeLaO+MlXYHk8Rp7e6bEm1If3txeCkGYV3QnTE1HLwZQhgAiuqW
         WCnGCGLwq/IHnD07mkvI1ZdrsxJOQTY7NmPy/zsnkDpRjjA5KuUYTGlB9Pi4s3iPC9
         6Yc+ZV6tU8bDWhjsNt6AVnXp2YkWaVtFAyZRqw9xPu4ICCHaG6Ohane1BPVxcVhxfh
         8Slf9d2G18GDQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5C3A060A3C;
        Sat, 26 Jun 2021 02:10:02 +0000 (UTC)
Subject: Re: [GIT PULL] Last pin control fixes for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaVqdFPKTxOuhFt=auFYjxCivRmRz7mQ7ank6rbcVQsQw@mail.gmail.com>
References: <CACRpkdaVqdFPKTxOuhFt=auFYjxCivRmRz7mQ7ank6rbcVQsQw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaVqdFPKTxOuhFt=auFYjxCivRmRz7mQ7ank6rbcVQsQw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.13-3
X-PR-Tracked-Commit-Id: 67e2996f72c71ebe4ac2fcbcf77e54479bb7aa11
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7050b242430f3170e0b57f5f55136e44cb8dc66
Message-Id: <162467340230.13453.14696485961492233602.pr-tracker-bot@kernel.org>
Date:   Sat, 26 Jun 2021 02:10:02 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 26 Jun 2021 01:34:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7050b242430f3170e0b57f5f55136e44cb8dc66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
