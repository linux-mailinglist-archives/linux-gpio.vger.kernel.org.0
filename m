Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA872818F8
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 19:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388307AbgJBRPl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 13:15:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726096AbgJBRPP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Oct 2020 13:15:15 -0400
Subject: Re: [GIT PULL] late GPIO fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601658915;
        bh=KOIh7BI+DOV5YR6vs45kzphqwU6wLG0agYIwlwOdNgU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=rHNwnqLCuQl+5ihc79xpqajJU+ga2FzGRg2DQ2DaXfzRbn8P4Yhmil3WMuk4/2kWa
         T/hlZEv1fx3AouPHjk3cOHXDksmwUngkMg9BKzLeOPMl4iAARtV0U1DEWcfZWYymx4
         catiWmWhELgeypaNBKlBW92k5rHfA8jM4+YJjoRk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbpo65JS6fQjrnb21RSiSG6wbGGYs0R60_vPaa=6WVbag@mail.gmail.com>
References: <CACRpkdbpo65JS6fQjrnb21RSiSG6wbGGYs0R60_vPaa=6WVbag@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbpo65JS6fQjrnb21RSiSG6wbGGYs0R60_vPaa=6WVbag@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.9-2
X-PR-Tracked-Commit-Id: 8c1f1c34777bddb633d4a068a9c812d29974c6bd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bf0dfda003eb98ca2b26441dec28751991d76d3
Message-Id: <160165891511.31225.10771165970430372879.pr-tracker-bot@kernel.org>
Date:   Fri, 02 Oct 2020 17:15:15 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 2 Oct 2020 11:31:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bf0dfda003eb98ca2b26441dec28751991d76d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
