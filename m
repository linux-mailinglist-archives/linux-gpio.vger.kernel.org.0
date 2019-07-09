Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475B963A90
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 20:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbfGISGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 14:06:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727360AbfGISFI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jul 2019 14:05:08 -0400
Subject: Re: [GIT PULL] bulk GPIO changes for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562695508;
        bh=qvM0afr/s4GLXs/4HLboaJ/wWsE7WBUL5bD+8PFYeGw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=dec5kEyX6Ki7K/q/lmxi7PM48Ai5f5x89m6qoeptCBP78naaJ/1SoK1AuBQhRu8Sj
         GoBEW/DlgSqLeXgdnXYcrD+I1WMEPsNs4CxXZ9n9087hc+A6E1EG1t3/CBJLC+44xw
         RCgnqHD5BXMQMkW3aiHJrOrXMU4sIF+glMOpamTU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYAJNVj98VjpmhY+suKfjH+WA4KWOvoHNAQvD60hzStbQ@mail.gmail.com>
References: <CACRpkdYAJNVj98VjpmhY+suKfjH+WA4KWOvoHNAQvD60hzStbQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYAJNVj98VjpmhY+suKfjH+WA4KWOvoHNAQvD60hzStbQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.3-1
X-PR-Tracked-Commit-Id: 9b3b623804a67d2274ee372c1587926ab0275833
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ec98f567888501df0140c858af5f5ea10216a6f
Message-Id: <156269550857.14383.8389829429625869463.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 18:05:08 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Mon, 8 Jul 2019 09:26:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ec98f567888501df0140c858af5f5ea10216a6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
