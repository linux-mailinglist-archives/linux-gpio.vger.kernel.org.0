Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE92D3BC316
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 21:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhGET0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jul 2021 15:26:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhGET0e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Jul 2021 15:26:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F23296197E;
        Mon,  5 Jul 2021 19:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625513037;
        bh=rn65EngJsi/t8GvC4xgMwfOuK/YD0xc7xna3k9ChUaU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=R4cT7EDooqJfTs5f5JA1hLhFlU80dHU6qwonxcDsotmajnDCWBi8sBemyODhqj9gw
         TTxbSepzbOoDHEwrEfm1+ZThWvHpRd3GVjCcXRMR/jNmUK07N8kRDM0X26HwFV5+Sl
         7xeFEoj0Yo13EMf5dm9SxAaZ5eyCMADJ9PsL8jp5I4bXN+fJOaTTNIvbpqJnxmwFIA
         WF3ovo75uBRelt21eiaGJYsxmj0B7kta3eL5DYw27bYHmjGQ+y/AQDkZMI+DJdmwFC
         UGfjbeLi1/JVIk3O9D93/mmqShwOstJ9h2WEEpH6AW6JiHqPzrmQT/VoheG8J7f2v+
         xlQgL112HwycA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EB90860A4D;
        Mon,  5 Jul 2021 19:23:56 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210705092848.14495-1-brgl@bgdev.pl>
References: <20210705092848.14495-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210705092848.14495-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.14
X-PR-Tracked-Commit-Id: c34c1228fc1cfe83aed909995f5b82e0ab7cb977
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b8052599420cd94505baec1f22b4e7c9e5ae5fce
Message-Id: <162551303695.9654.4983597494319182829.pr-tracker-bot@kernel.org>
Date:   Mon, 05 Jul 2021 19:23:56 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Mon,  5 Jul 2021 11:28:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b8052599420cd94505baec1f22b4e7c9e5ae5fce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
