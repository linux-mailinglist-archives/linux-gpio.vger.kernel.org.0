Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27119D0053
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 20:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbfJHSAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 14:00:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbfJHSAM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Oct 2019 14:00:12 -0400
Subject: Re: [GIT PULL] GPIO fixes for the v5.4 series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570557611;
        bh=UsDaocAr1E5NE0v3z5+39cBBWvPqJFEjZxqwbjo/Mxk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=iudHz0pm25AbclNF5qE6ZwKE7sltXVOSR+WWIT8aACneJrxe6lq7iMMb8xHgJXVDw
         tBqHqijxIGxQox7cBJ6HzlfVaJvAdHVrJWc0RNOUUeQrwOmoosQpNcor79RWapO3Is
         QKEl9qzUlVp5YRd1mZ0Ngs78APG88FKd/xKCbTEM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYnnZnOko4q+NmLwdKeObT--f8Xgv+e+fBLLXUAWqh7bg@mail.gmail.com>
References: <CACRpkdYnnZnOko4q+NmLwdKeObT--f8Xgv+e+fBLLXUAWqh7bg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYnnZnOko4q+NmLwdKeObT--f8Xgv+e+fBLLXUAWqh7bg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.4-2
X-PR-Tracked-Commit-Id: fffa6af94894126994a7600c6f6f09b892e89fa9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5001955c281c014a3af6d1559db40b5756ad89a
Message-Id: <157055761194.21274.1648893737131642776.pr-tracker-bot@kernel.org>
Date:   Tue, 08 Oct 2019 18:00:11 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 8 Oct 2019 10:59:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5001955c281c014a3af6d1559db40b5756ad89a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
