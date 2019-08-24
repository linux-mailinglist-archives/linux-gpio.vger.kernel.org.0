Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DA59C09A
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 23:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbfHXVuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Aug 2019 17:50:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727956AbfHXVuH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Aug 2019 17:50:07 -0400
Subject: Re: [GIT PULL] GPIO fixes for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566683406;
        bh=EA9xCPYzTOMiystICS0U2wfYpmLVAQH7EJKGtmzwXOA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=b5KG/Ru1V3/tZf5IURn2K6ZvwHt3CYGTEgumRxn3RUJtiolP5Ta5VMpYKhhPlAmXp
         6M4Qhbz5XD155XXpMGF4WG5UmP7UHg5D8kujC9wfaJRPEmCNegTrjavp+Dja+xCHEa
         W5/Mngd5nKyBJiMYNAiBcZ/DMbgDi/xIUDu/G2E0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaWR9GZ0Hem4h-jdGcYc_Uwx29XvsHuEgvXiebRG6DCwA@mail.gmail.com>
References: <CACRpkdaWR9GZ0Hem4h-jdGcYc_Uwx29XvsHuEgvXiebRG6DCwA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaWR9GZ0Hem4h-jdGcYc_Uwx29XvsHuEgvXiebRG6DCwA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.3-4
X-PR-Tracked-Commit-Id: 48057ed1840fde9239b1e000bea1a0a1f07c5e99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 083f0f2cd402df40f62e16b1e4208e6033f52aba
Message-Id: <156668340693.6376.1697881964961621306.pr-tracker-bot@kernel.org>
Date:   Sat, 24 Aug 2019 21:50:06 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 24 Aug 2019 23:17:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.3-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/083f0f2cd402df40f62e16b1e4208e6033f52aba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
