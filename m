Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8595332FB2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 21:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhCIUPl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 15:15:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:55032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231387AbhCIUPK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Mar 2021 15:15:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2861464F64;
        Tue,  9 Mar 2021 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615320910;
        bh=bCQFVTvbowoHiQJO4CgyE4q1znbQhIwCk4PAWzsp4F0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=KVEODTaHO4q/8v361GWcf8hHuUu9y9qUKbP8PTpAMzepm426fhAegvJtw/0+0/rze
         nACveXtB8i5LmGsqMzLm7GIsBo3Y9HLi9OFqhfr2zwaf+45P3H/HQrxX2Jj32MK+A0
         ZQ493f594aQo45EwLJTWTPWA4L51v2kcIwINnJaZJhpC45/huqaFgo3h2kAE3ET0pM
         xt+QZstppJ7wpFa2gOG4D9rsZnH69+p1gl5lbCbnVrYahAN0qq5oFE4FR5k9sd7tkW
         AcDWbG9sTocAOum+eQo+8jAG8D0000ZfXFONJ9RTkWOkYnkof12UjHGOJeEwaOGtTq
         BQ3HP5nzuXJDw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1DD2860952;
        Tue,  9 Mar 2021 20:15:10 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.12-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210309153443.16647-1-brgl@bgdev.pl>
References: <20210309153443.16647-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210309153443.16647-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc3
X-PR-Tracked-Commit-Id: b41ba2ec54a70908067034f139aa23d0dd2985ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b3d9f9cf108ebf2c48fbbbf30a8d1346d9cc7d6
Message-Id: <161532091006.26915.7204180747862496077.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Mar 2021 20:15:10 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue,  9 Mar 2021 16:34:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b3d9f9cf108ebf2c48fbbbf30a8d1346d9cc7d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
