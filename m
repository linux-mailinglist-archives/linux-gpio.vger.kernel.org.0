Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219AC3EBF46
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Aug 2021 03:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbhHNBM6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 21:12:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236353AbhHNBM5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Aug 2021 21:12:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E24A16109D;
        Sat, 14 Aug 2021 01:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628903549;
        bh=m441pVncbtbET6aNLJ5kYSM3mGYbzRbFWyAZaLu53Dc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Xy27V8TP/GS+NO4LqmtUPTBrSgg/gcQ4UAAHJ7/aQu1niLqG7d3pDgx+U1/FevvPY
         2nmzSrfOXhoQ1m/6XPG+1o7/22YYDHa6WhpA/WjtXbuQcmmoomBAl0x24AkLoUhE/9
         kl6cVmWz+po52d3qlrFdnljhCE4Yxp+bu4gJ/OnJmFZwZP4RQAzoXhGV9H03zl6YwD
         CN5+IwhfoO7KgOEti3+ba7aYOsnPiX4e80z19rdqQXHCLUHeZMAmIl0VoTwagC1KXx
         A/PcmBJGt6rH5gxJr48p8REM4jwdtaMWpJI3H+Ooq1NnAJmrsd+BeVRV3MmhfQ9p4b
         uq17ROYDUyAUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DD045609AF;
        Sat, 14 Aug 2021 01:12:29 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZzV_cCt6QPTHRtUNgWAJt6grE=CFYJH-qjnsP_Z0nnbw@mail.gmail.com>
References: <CACRpkdZzV_cCt6QPTHRtUNgWAJt6grE=CFYJH-qjnsP_Z0nnbw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZzV_cCt6QPTHRtUNgWAJt6grE=CFYJH-qjnsP_Z0nnbw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.14-2
X-PR-Tracked-Commit-Id: c4b68e513953c3370ce02c3208c1c628c0b86fd3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 462938cd48f2516cfc56187617280f2daa3debf7
Message-Id: <162890354989.25277.15362299449872003838.pr-tracker-bot@kernel.org>
Date:   Sat, 14 Aug 2021 01:12:29 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 13 Aug 2021 11:21:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/462938cd48f2516cfc56187617280f2daa3debf7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
