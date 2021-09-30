Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C657E41E36B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 23:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346215AbhI3VgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 17:36:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346099AbhI3VgW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 17:36:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7394761A08;
        Thu, 30 Sep 2021 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633037679;
        bh=6qiqqtaFUmsbEzR9gXZw02ewjS63+mSJ0Lh4Gl3qjMU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=VcSYwFNVnb8nqDUbw7ZQ5qcCDoQ/bjmeIm0/uV7ziyUAIGHopFRVOUONTWEVuXYHZ
         hN+9P+Yb5UVmVkNZr9vk1Q9hGj86gbSXLt5Vt9kTlD903dGQWrzjoh/sRhIRTKQGd3
         9gYS0Nbm3Axv8O+TD3C9LroUsZIhNmNMuCZ6ct0dfa7sHy24KCX9OXFQkQoML6ZaVI
         A3jsZ2hD267/T2gFTfOpLYI13bs3+fMvjsLwJWmtHaz9NL5sI7HKrapOnrXvqeWBda
         Q8MXGl+0rssJBU0XWNAvoDrII0Nr7jFdSpr0KMBlh+THC8RiG6454YpWM4IFPDJr0a
         zHQw8J+Rpqh/g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6D68760A7E;
        Thu, 30 Sep 2021 21:34:39 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.15-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210930075421.13146-1-brgl@bgdev.pl>
References: <20210930075421.13146-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210930075421.13146-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc4
X-PR-Tracked-Commit-Id: 040d985e27dc39353d50d0f75a6be3330f4fece2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 115f6134a050bb098414f38555a5ab780ebbfef0
Message-Id: <163303767944.5240.5538848633086183181.pr-tracker-bot@kernel.org>
Date:   Thu, 30 Sep 2021 21:34:39 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 30 Sep 2021 09:54:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/115f6134a050bb098414f38555a5ab780ebbfef0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
