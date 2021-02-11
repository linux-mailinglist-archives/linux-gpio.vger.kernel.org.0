Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C432319461
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 21:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhBKUX1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 15:23:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:46654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231470AbhBKUXO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Feb 2021 15:23:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 33DB364DBA;
        Thu, 11 Feb 2021 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074954;
        bh=Mkyex0H4/L67kgg7K1BB4FweSwcndtW+MOqnA9Rofek=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Ifv+iO+YP7uSPZ7tSw7vwTfEWWrYcJjwR59cICvNsm0081ZLYuQVMwG3DVi0ENpFK
         UBG5YR66Ho4z60Raq976FjDW0SZQxToUpA+6gxGBUvz/LKn1WApmaE4KkTn2s9RAgO
         w+u3ZvvU908rVGROMjllCHhOtQLCpSF5DulaAi/LbWYCOKrYHmQQzUU1WqzkBU7Gct
         m8P5GU5xPfceE+dgaB1kBhksdBT4Jz4l15bSyMbSxG6KP2svT6avfAm1rj2kWmD22u
         GCclqbBkjCs5EL7WJecL4T+1PlQzrlpG2BAgIlEB6sH/cUdyoszRAJiT3tSE+Fe9dW
         q/fXDsx1wUK6Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2025D60951;
        Thu, 11 Feb 2021 20:22:34 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.11
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210211141843.32699-1-brgl@bgdev.pl>
References: <20210211141843.32699-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210211141843.32699-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11
X-PR-Tracked-Commit-Id: 28dc10eb77a2db7681b08e3b109764bbe469e347
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c05263df6c1ab82277cc3b2778b183b469a71a60
Message-Id: <161307495406.16659.14078858185078572322.pr-tracker-bot@kernel.org>
Date:   Thu, 11 Feb 2021 20:22:34 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 11 Feb 2021 15:18:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c05263df6c1ab82277cc3b2778b183b469a71a60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
