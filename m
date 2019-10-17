Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C072DB1F3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 18:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390563AbfJQQKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 12:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732370AbfJQQKF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Oct 2019 12:10:05 -0400
Subject: Re: [GIT PULL] GPIO fixes for v5.4 take two
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571328604;
        bh=gOf5KfGMa4SE/pvAKru4Aniza5jKOqXcY9GOmUFaRBA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=yxK5VAnkrg8tKPQ9Hm0kidFvqmpsttHAgMEmMSLfhEEi/MMC+imk/3OHl+xYUJ5m4
         a/YXDQZzXao7ypyFWK8jZra+Ub0W+0GRcI3QlEaYF0z3dsBWcByApP9fIjg9BicGPb
         5w4jD2cN55tj0p9bnUXgzIjtnvDmuSR7NFsazciE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdb_iv9Ywpddu1AiG+b+AMC7LUcnPRjf7yPHnt78JNDtuQ@mail.gmail.com>
References: <CACRpkdb_iv9Ywpddu1AiG+b+AMC7LUcnPRjf7yPHnt78JNDtuQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdb_iv9Ywpddu1AiG+b+AMC7LUcnPRjf7yPHnt78JNDtuQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.4-3
X-PR-Tracked-Commit-Id: 75e99bf5ed8fa74bc80d693d8e0a24eeaa38202b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7801158f83fc90cbe2d5cceac6ef58a4a6cf2d33
Message-Id: <157132860439.23315.1320863808102241760.pr-tracker-bot@kernel.org>
Date:   Thu, 17 Oct 2019 16:10:04 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 17 Oct 2019 09:18:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7801158f83fc90cbe2d5cceac6ef58a4a6cf2d33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
