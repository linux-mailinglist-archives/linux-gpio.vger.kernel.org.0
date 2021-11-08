Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515EA449D14
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 21:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236349AbhKHUaM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 15:30:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:42022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238879AbhKHUaL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 15:30:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D8AFD610A0;
        Mon,  8 Nov 2021 20:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636403246;
        bh=iJXjh68lb8Q5EnOICfatjJkOK+ox0u4x1oilozxwy0E=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mdqmmoZHGIzEqzCKocvXgcb+4/F5qKFyQVzg6fPtLFl3G2DaxeC5EZeluq5m2fZTN
         enZHLMLW+LyJ032bbSLOEF19xcF+5YVQA4NlF3AEiH++Dk78yn9CEGvrE63E7EFGME
         kiLSqkpJwZGYVA3rwjohYzZeme76ocTDTLLsYoRF5edxh+A1QURU05wDDFI/33VLkm
         pTqJzj6OUZMT+IdZTjnc9JG+okjXm8s15+f/tkINGYBuBrwXLVCQsXTqwGNmANCM5d
         2r1Pip9gdLckybocX+hqbijYQ9WhjCeSPtTZ1OPcxT6e2f4/tDtKyZqTcJrIXIubxu
         S8W0DEGqKeUZA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D1FE5609F7;
        Mon,  8 Nov 2021 20:27:26 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211108132456.10033-1-brgl@bgdev.pl>
References: <20211108132456.10033-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211108132456.10033-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.16
X-PR-Tracked-Commit-Id: 7d0003da6297eb128f3490e396e6fc6df71557cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d20f7a09e5eeeeef5db679adc9a490fecb6a4c87
Message-Id: <163640324685.16718.14075811319235480983.pr-tracker-bot@kernel.org>
Date:   Mon, 08 Nov 2021 20:27:26 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Mon,  8 Nov 2021 14:24:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d20f7a09e5eeeeef5db679adc9a490fecb6a4c87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
