Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60012B25DA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 21:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgKMUuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 15:50:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:59280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgKMUuN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Nov 2020 15:50:13 -0500
Subject: Re: [GIT PULL] pin control fixes for the v5.10 series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605300612;
        bh=DwB+AhgLys0sKRsCkGgbRMFCH3ARz13J202oEHe8iSM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=V4ZOfU50KzM3phGKZW3fJvx5Mj/SgY9wjpDdIPRn/G1jv18eEAJu/8aw327KESmQi
         fwc9lDxDQZUhVpyD/WD7xPaQRdE/BI1UpetKtapYudIwm/eSWVNoxxnDpzsH78o90z
         4CxJydPLR5MUwFAQWLNmrtkCfsUAwCsVm+9G8CKM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYta9FG-aYN1KbpFrsvO_ZGNTX=CJqiL8uL3e7QQQR4Gg@mail.gmail.com>
References: <CACRpkdYta9FG-aYN1KbpFrsvO_ZGNTX=CJqiL8uL3e7QQQR4Gg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYta9FG-aYN1KbpFrsvO_ZGNTX=CJqiL8uL3e7QQQR4Gg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.10-2
X-PR-Tracked-Commit-Id: dadfab0fbf0173da6e24c8322b69083fef03033d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4de010e2c989a90e28272a92ca66e4bff4e79e0d
Message-Id: <160530061228.27782.5286241455760271996.pr-tracker-bot@kernel.org>
Date:   Fri, 13 Nov 2020 20:50:12 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 13 Nov 2020 14:22:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4de010e2c989a90e28272a92ca66e4bff4e79e0d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
