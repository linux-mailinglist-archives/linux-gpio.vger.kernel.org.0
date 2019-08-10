Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD22688CED
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfHJTaK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 15:30:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726024AbfHJTaJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Aug 2019 15:30:09 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565465409;
        bh=cKcE2p2umTvbxXH9qkmleUtUr6AkaJN/nm4H3ex+Fis=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=UA2XEZMhnHZbh1mDM5d/FjLxpCWYKRc91Z5Jr/Ae14fKv7OnbV7tyEzziBapU5rN/
         qaox36aOaIRuqrdpD/9s6iJgm3+ZIVqd134c4hzMvq60BLygS6Fz38EmmcXk2lTcTu
         BXIQHcMHOI20f42t1zwhjp03A+ozH2js37UfoGQs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaMp16=-NGxOhe_Gz-vvoZrN7S+CE6zVmD+erVU051kmQ@mail.gmail.com>
References: <CACRpkdaMp16=-NGxOhe_Gz-vvoZrN7S+CE6zVmD+erVU051kmQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaMp16=-NGxOhe_Gz-vvoZrN7S+CE6zVmD+erVU051kmQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.3-2
X-PR-Tracked-Commit-Id: 8c4407de3be44c2a0ec3e316cd3e4a711bc2aaba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97946f59fe7fecff44032f8e775975991a612d18
Message-Id: <156546540895.17840.14387024581232214836.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Aug 2019 19:30:08 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        YueHaibing <yuehaibing@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 10 Aug 2019 11:01:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97946f59fe7fecff44032f8e775975991a612d18

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
