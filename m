Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AA321BBA6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 18:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgGJQzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 12:55:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:33902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728214AbgGJQzH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jul 2020 12:55:07 -0400
Subject: Re: [GIT PULL] pin control fixes for the v5.8 series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594400106;
        bh=cUWvaNw36CURi1cf7rCqKXQeFUfDzNnJTX52vYnWDHE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ajKd6ncvQ+vtBDsOApGgi5rdwACvZe3RIozFgWZpPeJqlZy4NTuxJTvnE6xaIVYCX
         Lvsgdik4jJo/dthdlHmEdHmW3f9fv/KxqU8F9KE6jZIqjgwKYekzBlIcTEC6Ldtyjc
         gGA8bbiUFLbDnVbVf8Ocja8Eh0g6wyZa8h2lRNlk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkda48QqW7P9wKghFTk6T9B74drHLSxjQSANgfEFxmgm=Dw@mail.gmail.com>
References: <CACRpkda48QqW7P9wKghFTk6T9B74drHLSxjQSANgfEFxmgm=Dw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkda48QqW7P9wKghFTk6T9B74drHLSxjQSANgfEFxmgm=Dw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.8-3
X-PR-Tracked-Commit-Id: f8e99dde21995d185e2379e34ea2b96acf85702b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25aadbd2a8ad05ed0477cb94c7659075f540d158
Message-Id: <159440010686.18761.8126690621871435872.pr-tracker-bot@kernel.org>
Date:   Fri, 10 Jul 2020 16:55:06 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 10 Jul 2020 17:40:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.8-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25aadbd2a8ad05ed0477cb94c7659075f540d158

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
