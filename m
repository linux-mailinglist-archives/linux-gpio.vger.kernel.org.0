Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB9541BBED
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 02:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243472AbhI2A57 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 20:57:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:51064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242694AbhI2A56 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Sep 2021 20:57:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9BBBB613D1;
        Wed, 29 Sep 2021 00:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632876978;
        bh=gXOrLl0XVSljc9cDH2RdYW+Hd305HHntfoljlnUsx7Y=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=KhxCn8e3lhNxnRDGNE3DA+bzDKBxzmWYMuBWIuVUyb5aRJS/O6RXsxdTgrVXHwrH1
         BF+Vt3/NbuzZZxuAwKWiPOwF8DY8yndJwuBaPknfYfZtFOi4R1l/2+mwxcjetfDFTl
         16ua4w5wckH/OW7M8/5+4RbR7PuSPNk8NfKPSIRliTQ4Ef819fdqFa25uVXGcBMhFB
         +WRM4ywi7wvJZTkJvL4A8tX2MCjGfl3S82ckailS3POzPsfz7mzeVKgLwQQkR38VmI
         eeP+WiFQf60vGmuL85AASPM75lcebBBGmc0/sDNi4nElmEcXouEn/ngYjkeWYdZxv2
         iNzwoH53NsY6A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 88DC8608FE;
        Wed, 29 Sep 2021 00:56:18 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYa_patWBGC=gnVHkPQeo5BtvKrG2hzNKi3vZGvo5bKQA@mail.gmail.com>
References: <CACRpkdYa_patWBGC=gnVHkPQeo5BtvKrG2hzNKi3vZGvo5bKQA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYa_patWBGC=gnVHkPQeo5BtvKrG2hzNKi3vZGvo5bKQA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.15-2
X-PR-Tracked-Commit-Id: 28406a21999152ff7faa30b194f734565bdd8e0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4e6f95a891ac08bd09d62e3e6dae239b150f4c1
Message-Id: <163287697855.31747.10921981462418607901.pr-tracker-bot@kernel.org>
Date:   Wed, 29 Sep 2021 00:56:18 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 29 Sep 2021 00:11:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a4e6f95a891ac08bd09d62e3e6dae239b150f4c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
