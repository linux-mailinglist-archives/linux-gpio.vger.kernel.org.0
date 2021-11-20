Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637C4458016
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Nov 2021 20:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhKTTXP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Nov 2021 14:23:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:50174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229823AbhKTTXP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 20 Nov 2021 14:23:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D563D60D42;
        Sat, 20 Nov 2021 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637436011;
        bh=rigkjFKZ2iPVtV4j7r6jq8VtAmhvkL9eYggcnkprcKQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Kv3iXwrbg3fBRFYxmidFQAvszD3VWrx3bfP57k+0ZilWiyLLWwQRyFL4R/X8P8niN
         aeZxohXlajDycZSOrua9ZES6doRdWY74Y18QjFqNQ0mE5H0JAuBQl/QA1+c9qs8rFr
         4NrJjqodCiFw9LoAfakrzjCpeKSZohHE41YOQ+gcz7BdUm1joqSVuM/6qekThPXDrT
         gpRSO8jc+02ISt9LG9Wy4d16uDLfQZ2Jr60bClogULN4WdL7qZON+dNIeSNQn9XYH8
         n+dyDvTg3oWsYpsF/3GtfOiBuThemVmfOf3Y9GrIh+hzY+/vPrzVbOJ3slUF3cX9ib
         k9sDKzug3MZ2Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C16EE609B4;
        Sat, 20 Nov 2021 19:20:11 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdb0H0NH4t5iRW6_ba=Mym1vH=yG+decH6O5uo9k2opcXw@mail.gmail.com>
References: <CACRpkdb0H0NH4t5iRW6_ba=Mym1vH=yG+decH6O5uo9k2opcXw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdb0H0NH4t5iRW6_ba=Mym1vH=yG+decH6O5uo9k2opcXw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.16-2
X-PR-Tracked-Commit-Id: 62209e805b5c68577602a5803a71d8e2e11ee0d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b100274c70546decba3ec12cd614e1ab895515a5
Message-Id: <163743601172.29153.12715935085157307199.pr-tracker-bot@kernel.org>
Date:   Sat, 20 Nov 2021 19:20:11 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 20 Nov 2021 03:26:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b100274c70546decba3ec12cd614e1ab895515a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
