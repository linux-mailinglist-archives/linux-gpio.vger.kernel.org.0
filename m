Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5866C3A503A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 21:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhFLTLs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 15:11:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231512AbhFLTLr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Jun 2021 15:11:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8B54761001;
        Sat, 12 Jun 2021 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623524987;
        bh=z34QiRyINkAhbWILvOAIGhVphoVaG7+8QtauwTRgAu4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=enpPPSX/jrHuYgGfSjCYJZCFoUq3KefK4dq2gdXMCFo9HO38CAgY0XGm48cwSBJNs
         kvs55jCDhvIOIr9ODiJxVGEtq2kTfYpKT1ntdkFTQ59RbWfpntWoF7HBK9kVkYXKp3
         phbrEzPaN4ws3aDxqcPRB3njC3E6bku9cNEp06h+8rkRqSkv6FrTGpsml+VOmEa6te
         bX7VOWicPWmxTeOwCaG3IIIctcqw7iWXDVC790HTLB8Le0P0CnuEslA8ZsK/LSxuAa
         uyZhUBgM41DIS5/PFJLky09MTHWE9rzTHQXI5mvxuXctos91iG2zyQtZEPv7I8z2ss
         9OESq7C8VmF1Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 819FD609E4;
        Sat, 12 Jun 2021 19:09:46 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
References: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git tags/pinctrl-v5.13-2
X-PR-Tracked-Commit-Id: 30e9857a134905ac0d03ca244b615cc3ff0a076e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 141415d7379a02f0a75b1a7611d6b50928b3c46d
Message-Id: <162352498652.5734.16100087693827735034.pr-tracker-bot@kernel.org>
Date:   Sat, 12 Jun 2021 19:09:46 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 12 Jun 2021 12:07:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git tags/pinctrl-v5.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/141415d7379a02f0a75b1a7611d6b50928b3c46d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
