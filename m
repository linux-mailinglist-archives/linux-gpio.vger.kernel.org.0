Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17A22DDCD5
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 03:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbgLRCMP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 21:12:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:55534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgLRCMP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 21:12:15 -0500
Subject: Re: [GIT PULL] GPIO bulk changes for the v5.11 cycle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608257494;
        bh=OJsDMA6wwwwaI247wBmBem+uffChZXca17z4R5hr0JM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Rl2fgj0O3+D4k6uoit9h34Xe4Rrp/DVBV0psIYWarOt0jiShW1cOGM1IBd3SeRhga
         Ix5jjJlV/XkCWitAJ50x96NlMuu63GRoFiIlRScZ3sSfhzmJAzUFKeMH+a3jAZNQB9
         7LMtyqxZgY5HM8ggfMuhVEkNQLXC3aS5TWiNXfdY2yiPPTz+92hX3H/DNR2CGxlX8Y
         2Q2NuMTjXj2bwYBJu2JsuqxT0laul3iS/wHjPLNwqwFgbUwyfgN2pVkUw6xheNM/bE
         bqnr+18gTvcTm+Bot1QPX4GL51oqeSYw1mpA6g+YOJ6BMuYX+2+uKZT4M+Dkdf4qKf
         IKFED0cgj+tSg==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdakznwYRtF+kjpubhk7AnY2wvsYGDmgEjo56gC4oZmy2A@mail.gmail.com>
References: <CACRpkdakznwYRtF+kjpubhk7AnY2wvsYGDmgEjo56gC4oZmy2A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdakznwYRtF+kjpubhk7AnY2wvsYGDmgEjo56gC4oZmy2A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.11-1
X-PR-Tracked-Commit-Id: 7ac554888233468a9fd7c4f28721396952dd9959
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a409ed156a90093a03fe6a93721ddf4c591eac87
Message-Id: <160825749489.20122.15117251284122943792.pr-tracker-bot@kernel.org>
Date:   Fri, 18 Dec 2020 02:11:34 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 17 Dec 2020 22:59:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a409ed156a90093a03fe6a93721ddf4c591eac87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
