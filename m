Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 708A614D000
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 19:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgA2SAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 13:00:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:35424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgA2SAF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jan 2020 13:00:05 -0500
Subject: Re: [GIT PULL] GPIO changes for v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580320804;
        bh=IBKquskWmh0IVLeX3vdXIl1qBhjbUwtuhGyUbIRg23E=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=xETKEsJXb8lRTS8aFBSRuYToMOn++zrTzL3uqcx8/dIfsX+XpTScbzodIeDO7/8Cn
         EXc9VJbjWOFNpGDmm7vIcFVcoSEy3Ip+6LHW+TnF88a9164Z4KnymnsDH/SLntcoh6
         FPxRS8r3C/QFqzDLspszgZjcs3vfv7Mf3cLKEpB4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYYKS0jMOUu77cudjzOFnHPm3K3aOnmGgUkdVFHz=RSmQ@mail.gmail.com>
References: <CACRpkdYYKS0jMOUu77cudjzOFnHPm3K3aOnmGgUkdVFHz=RSmQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYYKS0jMOUu77cudjzOFnHPm3K3aOnmGgUkdVFHz=RSmQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.6-1
X-PR-Tracked-Commit-Id: 0282c72d30d32913d641dc81f3f38607ace98802
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa889d85551e0bd962fdefe1cc113f9ba1d04a36
Message-Id: <158032080482.27486.5904736769628447314.pr-tracker-bot@kernel.org>
Date:   Wed, 29 Jan 2020 18:00:04 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 29 Jan 2020 09:08:01 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa889d85551e0bd962fdefe1cc113f9ba1d04a36

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
