Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2083FF751
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Sep 2021 00:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347699AbhIBWnb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Sep 2021 18:43:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347749AbhIBWnb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Sep 2021 18:43:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 381C76023F;
        Thu,  2 Sep 2021 22:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630622552;
        bh=4aUlYHvBzCqFQa64GvyxlbVMnHl1SyWbd2V7JWduEH8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PaRzT7w1t7FH9dl/99DBlvY65PltBaVq7qfVa1oaQ/qBw0hY1Wgg0udA89CT/tvAJ
         6WEFjmWnwzpArHNrLBeRvsQrTOs+MAcEj8aMXSeFn1t5K/He0L8fQkEHe+KWEdSjx7
         WMDl++zpqUbZDjfnL2uZ/WecTXrDHAd3PZIJj7kIf2LYFGEm/zJEz027uSQ/ZnjV5S
         Ow0oRCNm2C6h4Vf0eefYnrmaznz5AKTa7ww+7aIocQEwTPBlArJU0e/mIjGef37Bp8
         CWZlM7vlKqrOv+IQpQEz9SnpTK8A6WgtTRe78LM0sgQeztw8bV9G8wkUfEic59UdOJ
         nEKrZIMBxvaHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 294D160A0C;
        Thu,  2 Sep 2021 22:42:32 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaQGYoyJ2R1zF2P-S5VMFyPZtySdmNAhuv7KVAjE+o_wg@mail.gmail.com>
References: <CACRpkdaQGYoyJ2R1zF2P-S5VMFyPZtySdmNAhuv7KVAjE+o_wg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaQGYoyJ2R1zF2P-S5VMFyPZtySdmNAhuv7KVAjE+o_wg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.15-1
X-PR-Tracked-Commit-Id: 04853352952b7dd17f355ed54bd81305b341af55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c793011242d182e5f12800c12dbaf37af80be735
Message-Id: <163062255210.25965.5032934280915714613.pr-tracker-bot@kernel.org>
Date:   Thu, 02 Sep 2021 22:42:32 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 2 Sep 2021 21:52:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c793011242d182e5f12800c12dbaf37af80be735

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
