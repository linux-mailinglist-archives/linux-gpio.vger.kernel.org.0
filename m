Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3675A9DB
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 11:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfF2JaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 05:30:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:45408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726872AbfF2JaG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 29 Jun 2019 05:30:06 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561800604;
        bh=+D19obzEwtKVsEVBO3ftjkaUQN+a1Uh7qaiEvVSyqlA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=JucM3lMMAeBfE+nML3Oj3KWrjioMNF8vJUsnQrvLl3Y7pvorgmmc+2fl7x1TYqfTw
         tIDgi8aSDeNwFllXCFZ56zx3HzLdWFNqEsF+UBzUmf3NJEe6dJZvvn6BI1OziPwnaI
         LrTELI9wAtyyPyyp5Qc3trpeqeNceHZEwHkPaPak=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaiMrQyaxrLhy=Az5SCoz_C3NWRSYiQFqr=_BsD+qugMQ@mail.gmail.com>
References: <CACRpkdaiMrQyaxrLhy=Az5SCoz_C3NWRSYiQFqr=_BsD+qugMQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaiMrQyaxrLhy=Az5SCoz_C3NWRSYiQFqr=_BsD+qugMQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.2-3
X-PR-Tracked-Commit-Id: 9d957a959bc8c3dfe37572ac8e99affb5a885965
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 061913712d6ab77c77192584912afdbd8267c54c
Message-Id: <156180060395.8003.13899648496600477143.pr-tracker-bot@kernel.org>
Date:   Sat, 29 Jun 2019 09:30:03 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Phil Reid <preid@electromag.com.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 28 Jun 2019 10:35:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/061913712d6ab77c77192584912afdbd8267c54c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
