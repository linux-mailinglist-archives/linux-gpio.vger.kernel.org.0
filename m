Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D2F417B04
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 20:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348153AbhIXS2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 14:28:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346239AbhIXS2W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Sep 2021 14:28:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E242161241;
        Fri, 24 Sep 2021 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632508008;
        bh=WSncdtMrMz+LB26yERBpXs/M0Uw4PNRq3NUMJBNhmGQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Fw4HYgOOppcTQ/kMcpVaj5e8oPm+N6XBIDXVnT7AiR81/sy8FWx4kL13DFZgsYLEp
         VOrQy0LMlBGT3DjdCPwUKiPcD95hVDtkMSkWbUEhboV7FptO1+p4T74hFbUqoXwjrY
         tBZ2F7s30x8p9Wc72DwtlJ/MQEe7GqDq7SPMrYrh69RJ4Luq38TOmXlDC1jC2HCCKr
         16d8MskhkNOIgmZ1BSRYwrv0le/GNVNd9CO7GZqdDFE4f+TnHUM2B2Obr6hGtFlshy
         FurMvIGpt6c7YalN+uQ66v+Z612sEoy4ik1GU1enscwyJbkp5n61EcV9eTU3MRJysE
         IM2QX9Og0KQ+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DB3E760A88;
        Fri, 24 Sep 2021 18:26:48 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.15-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210923082641.32745-1-brgl@bgdev.pl>
References: <20210923082641.32745-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210923082641.32745-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc3
X-PR-Tracked-Commit-Id: b22a4705e2e60f342b1b851c9ebdb3ea02f21f8f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d42e98182586f57f376406d033f05fe135edb75
Message-Id: <163250800889.5900.13212763265511660211.pr-tracker-bot@kernel.org>
Date:   Fri, 24 Sep 2021 18:26:48 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 23 Sep 2021 10:26:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d42e98182586f57f376406d033f05fe135edb75

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
