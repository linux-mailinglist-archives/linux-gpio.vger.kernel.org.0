Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99C1439DAF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 19:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhJYRi7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 13:38:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233395AbhJYRiw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Oct 2021 13:38:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E0AC960F6F;
        Mon, 25 Oct 2021 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635183389;
        bh=qEVqHR9hUkrdY7q3niszJAwWxfAHLPU3FjHV4O6JW/U=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=aKd/xyBjm1XK/yx15sWnP/I7pRLaxWae1b0QuRSAOWULy6rcYnzpBrSPpa3shQD2q
         d7CPU/tHfg4ytsdiq15+Q5TFGZM+VoWrbTlrxIgtP1Z2I9a7Qh8IYmcR3OUawpcGHN
         CjlTUw0af7OcR9VdT2y5LEXWWryhUcm0DE0f3HnYqnwYk+ENJD1+zbfjK6Hcm0qh8l
         ztQYBa8sUk5CrzDoxPWmpIOQHJ7KQ8VbPSgtb5WIWtOl4AAhlCphALjWoZNMTA52ed
         M6gvcrvYQs0xHvNPIz8Uxpis1YIDGHHIdvFB3S5AqxnUwiFYueIe7I326wxcxzOkSH
         TU9tdC7AEWZUA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D15B960A17;
        Mon, 25 Oct 2021 17:36:29 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYY43-Dj=ZQ3brn41-3OZm0_vT+qHmcG9=EsMFy6J_Q_g@mail.gmail.com>
References: <CACRpkdYY43-Dj=ZQ3brn41-3OZm0_vT+qHmcG9=EsMFy6J_Q_g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYY43-Dj=ZQ3brn41-3OZm0_vT+qHmcG9=EsMFy6J_Q_g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.15-3
X-PR-Tracked-Commit-Id: 4e5a04be88fe335ad5331f4f8c17f4ebd357e065
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a51aec4109300d843bf144579109d5288856f72a
Message-Id: <163518338979.28134.16136876932332663263.pr-tracker-bot@kernel.org>
Date:   Mon, 25 Oct 2021 17:36:29 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Sachi King <nakato@nakato.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sun, 24 Oct 2021 22:16:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a51aec4109300d843bf144579109d5288856f72a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
