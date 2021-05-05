Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196DD3749AB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 22:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhEEUuT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 16:50:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:59540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229993AbhEEUuP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 May 2021 16:50:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 87BEE613E3;
        Wed,  5 May 2021 20:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620247758;
        bh=aShAKlU8qUUb7iVky2gEcSGE9fi34vy0ZF5uwES9/0I=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZR6/ZT3GQkoc+QnJAoYHVkqDmw/37H14Xs1qt4gYe3oOpDSZBjnWAPmIg7KKoHn/i
         X64bwhVw1YeTdDw5dyW8zDWU5kwKktl9D4vE2EwKQ77BajmX1jf/GDW5Rk7qIVuHn8
         mnUqgI6CjL8uJO58mWsruAXDdxCVgs62IARGIQJqV8RumHoZj0Jn5hj7694cJB1WOP
         mahfaGFxH+G4FU6LaDjSeLeBl1ofuuUOJK6d1NLE/93f6T2zZhy6/4R59K+Bw2ZR1a
         hGFpKnyPenyZ5doZiUAPCu5rsVZaW3kCnLQOatewjZ50gFo7eL/JZbbRptlmGAeR+/
         8Ayi9p4g7xMuQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 82207609E8;
        Wed,  5 May 2021 20:49:18 +0000 (UTC)
Subject: Re: [GIT PULL v2] gpio: updates for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210505141358.6065-1-brgl@bgdev.pl>
References: <20210505141358.6065-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210505141358.6065-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.13-v2
X-PR-Tracked-Commit-Id: 444952956f34a5de935159561d56a34276ffffd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d6a1b84e07607bc282ed2ed8e2f128c73697d5c
Message-Id: <162024775852.12235.13061174933319420795.pr-tracker-bot@kernel.org>
Date:   Wed, 05 May 2021 20:49:18 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Al Viro <viro@zeniv.linux.org.uk>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed,  5 May 2021 16:13:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.13-v2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d6a1b84e07607bc282ed2ed8e2f128c73697d5c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
