Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B09D3611D4
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Apr 2021 20:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhDOSPZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Apr 2021 14:15:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:37278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234447AbhDOSPY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Apr 2021 14:15:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 60E5C6137D;
        Thu, 15 Apr 2021 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618510501;
        bh=MEHqghrpLfxM2WugD2PWRHabB04JRDBC1VesLPoKEEo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=IiZUEhFUH1YpomlzNKED13Zo/Ng0Z6OqdKj65AI2+ORQtlqFx/WweEAhkENSG1KHu
         vhhk6MpGISoYhhUYc+QzzZvXrrs2yjjmmdtgRWdXkennWdQyBi9fBYSrhGifUA/XxP
         2K4m+3XSs6lWnyu11YYxG+XkXM+Jz4TpPJRPM/bnspg9uCQ7NbuwjB9qeuiOPtKJv3
         nMRoj7G36LxY2We9ElZhEPKpAGrC/bLHH9DjmZaqElZya2fegzoy24p4SF1xCvuIrS
         JefzQdmN1tATWg323mMGtC5he0/XbDth6wz/26pkYv2gwhALMegXizzMiTIw0XYxiN
         xEI1CP8NJZFrQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5A93E609AF;
        Thu, 15 Apr 2021 18:15:01 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.12-rc8
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210415135851.27595-1-brgl@bgdev.pl>
References: <20210415135851.27595-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210415135851.27595-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc8
X-PR-Tracked-Commit-Id: 23cf00ddd2e1aacf1873e43f5e0c519c120daf7a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33f0d9d94a0ef0814d23320c2536c4135d230114
Message-Id: <161851050136.16434.17611793206155054724.pr-tracker-bot@kernel.org>
Date:   Thu, 15 Apr 2021 18:15:01 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 15 Apr 2021 15:58:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33f0d9d94a0ef0814d23320c2536c4135d230114

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
