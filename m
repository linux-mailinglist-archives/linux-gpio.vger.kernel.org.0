Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D68D2FF525
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 20:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbhAUTxt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 14:53:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:48756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727555AbhAUTtN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 14:49:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D5C18224B2;
        Thu, 21 Jan 2021 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611258512;
        bh=yDuJiRNGJ1fr/X6Tqb8i9aDfd7Zg8O+kwZdDjT8KwTI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=AJFEFH2CH/GyiOl8BuoITwKWn3TqN4anbwS34sAJeY4DbYztjxVTkOIOViT5ph+WO
         zdeZTScdjyRBNJkV51crKIMGpJGNb4uGqqRt7lG/wcvZKD8k2WFNAeQb2faMa/H2lh
         0QgC47/M0XXc4I0r/2ErWcYNZtsVdqTGWOppq6DEAZURom+zrpwy7N3SF7A86Vyf8j
         Dko5naOfM+j2hu+ibFZRc6de2/gambKX/S1X78xoOtU3SutCPGiOb8Mou412Duq8pB
         Alp6A0wJ1lDlg82Y+krjhRPuBqkhKmuBuqrnLz4Wk7ngtL52vBuhMxm6lAkBF1rvmZ
         W1RuV1Vb67dDA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CB06060192;
        Thu, 21 Jan 2021 19:48:32 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for the v5.11 kernel
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYqT+jt=aNt3JN0fak7snCwxvT___QVV8L8Bjr_YSB+0A@mail.gmail.com>
References: <CACRpkdYqT+jt=aNt3JN0fak7snCwxvT___QVV8L8Bjr_YSB+0A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYqT+jt=aNt3JN0fak7snCwxvT___QVV8L8Bjr_YSB+0A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.11-2
X-PR-Tracked-Commit-Id: cf9d052aa6005f1e8dfaf491d83bf37f368af69e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 63858ac326561af6a1e583ad4314cc1be16852ad
Message-Id: <161125851282.32181.13972393198581325206.pr-tracker-bot@kernel.org>
Date:   Thu, 21 Jan 2021 19:48:32 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 21 Jan 2021 09:52:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/63858ac326561af6a1e583ad4314cc1be16852ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
