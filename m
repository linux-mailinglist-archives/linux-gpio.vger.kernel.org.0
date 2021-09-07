Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344C8402F11
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 21:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhIGTlT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 15:41:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhIGTlT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 15:41:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 561B76109D;
        Tue,  7 Sep 2021 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631043612;
        bh=LwA5ivW1/x4izrBvvwjEDyU6Hm/flkT+of54hKRipoA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Gm5GRD7uqNWjPKwOutEZkqGBQsS5mOL9vhfpvVlw4aY0maQPhejKNx9rhN541YnHC
         X7lFA9HkKEeKdj4ookjHPTUtZECGo5G5YLU4AhTOIbTsTgVn3ZIMeWdLHpRNdCAbr9
         O7qCXlV3oYdudkGBbHI+yvmxvBA33GoxVSTSuyaOEZo5h9oBTHWk4AzYhc/sjVPP/A
         5GOD9L2m78vXc0gWA0H6C3EDiTzhud4TkRH8F33nSFl7HFjl+g2+NGTGmqoBjXyzmL
         wc2gDqfEHueJNGNUScQSQWxWFNDft187GJgadTlJkHjcIs+KJypPWs0vKPI47XTALG
         /0LbbjM0TJTqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 434AA609F5;
        Tue,  7 Sep 2021 19:40:12 +0000 (UTC)
Subject: Re: Re: [GIT PULL] gpio: updates for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
References: <20210907083613.31268-1-brgl@bgdev.pl> <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl refs/heads/master
X-PR-Tracked-Commit-Id: 8096acd7442e613fad0354fc8dfdb2003cceea0b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c23aa51477a37f8b56c3c40192248db0663c196
Message-Id: <163104361220.4526.774832613459764535.pr-tracker-bot@kernel.org>
Date:   Tue, 07 Sep 2021 19:40:12 +0000
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 7 Sep 2021 12:36:25 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl refs/heads/master

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c23aa51477a37f8b56c3c40192248db0663c196

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
