Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C292D7E33
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 19:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405859AbgLKSgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 13:36:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:36058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405891AbgLKSfy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 13:35:54 -0500
Subject: Re: [GIT PULL] Late GPIO fixes for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607711713;
        bh=mG94QyQCNioYqA9lkBgZiFfr22b+SVdCC85HE70C6nI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=BjOwN2Yt/h1U4f/vxh4BA/W4SxeCAOhGTkrlhZGGlQ4qFYc0PVy4LEvWyGwmjfGO2
         F+D5sY8/OV8JYXnFxdCvNCqD0VxgVYXYTnPbKqOg+CbCnhz+5/17nsAUHCMvb4/9uB
         GusYym7rLmobyA1Ic7CH/KrdA5JQxPXwg79iFQzowVzOi+M5LWxKdh4dWtAAd/C3Yl
         0v2lF2rwGq2S/ELn3ZdPtHB/XHuUi+wlatjA+r6GMRrFlL6RZ7QvQsR3BT1hL62BIc
         pOO9sLZAq+0tNeY2vprm/Dl2x9gk4po9Vr2Msb7xyoCLk2Zulh9eiGqzE5NJ7xYjES
         gXercHjrE/1Rg==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbVVZPFs-=pyDO-HpR4yY-f2nyYRgTTwNbA3nMzXaYSNQ@mail.gmail.com>
References: <CACRpkdbVVZPFs-=pyDO-HpR4yY-f2nyYRgTTwNbA3nMzXaYSNQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbVVZPFs-=pyDO-HpR4yY-f2nyYRgTTwNbA3nMzXaYSNQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/v5.10-3
X-PR-Tracked-Commit-Id: 263ade7166a2e589c5b605272690c155c0637dcb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d47cdecaa45c88ba3858323aa54ec9aa1de1a9b
Message-Id: <160771171391.31675.6615597234235156074.pr-tracker-bot@kernel.org>
Date:   Fri, 11 Dec 2020 18:35:13 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 11 Dec 2020 09:38:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/v5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d47cdecaa45c88ba3858323aa54ec9aa1de1a9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
