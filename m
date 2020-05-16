Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FA01D6400
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 22:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgEPUaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 16:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbgEPUaD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 16:30:03 -0400
Subject: Re: [GIT PULL] Pin control fixes for the v5.7 series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589661003;
        bh=NsRtbbK41tjrYgFdMXoo6T5LBeAraKLbGQwp8bAa8RM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HtBWcrJD9noLS08yQ4B50jv+c9CCbfHljaPrJl2KPXH81/bTnaNfl3eJ7gGgRNDwV
         ErtVXkKPliMZnXDkMl/ojJpZ3QGzlWbwYPLKRfyhXG/HPfl88+S6+jz2R9o1NeBMQ1
         nlm8i1pQFy5Vjv8CzqG+cx8CWBxOJhecNc9wLt2Y=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbpt9GGegm1TZSQ1-ohDB6682cLpQbipHT24dpuKHLBvQ@mail.gmail.com>
References: <CACRpkdbpt9GGegm1TZSQ1-ohDB6682cLpQbipHT24dpuKHLBvQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbpt9GGegm1TZSQ1-ohDB6682cLpQbipHT24dpuKHLBvQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.7-2
X-PR-Tracked-Commit-Id: dca4f40742e09ec5d908a7fc2862498e6cf9d911
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf0ca701a01cf631333855831fe48b717ed1f20b
Message-Id: <158966100318.3231.3656320232076146308.pr-tracker-bot@kernel.org>
Date:   Sat, 16 May 2020 20:30:03 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 16 May 2020 11:16:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf0ca701a01cf631333855831fe48b717ed1f20b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
