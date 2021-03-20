Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DDE342951
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Mar 2021 01:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCTAJj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 20:09:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:49954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhCTAJV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 20:09:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B21A6198A;
        Sat, 20 Mar 2021 00:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616198961;
        bh=vFb1htbZIlY99xmhL1KPK6KxeSzKftfGkeBxTxy3Smk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=YjNFzjR3E3Fo7Jrm3T0KsgwL61HgM9QKauaBYiFIAQaGQv3wwImeR3f81KgfKWf3i
         1/9ak8N4j5RlpOHIS7fv7XogL7vOWZzgi5ji/ZLMvavhmvNjTFkcTt+8z4cx/GjApj
         UByHuSbML2jsG+R+HsZQHAzNskcqOARtAK0NoXAliN7SM5GOoGjMy56ahTFH5K+orC
         RtfytReTiL+uoDmsREweCc0sQ6PwQKY50OYpx04fFUpm1EByqCShzUNWIuqxeceO82
         b9vO00RY27j3LezIdgbjboDCUWfhzfgwllc1DUphw6SWmyryz8DdRw//Z0VkVWFnWJ
         jveGTSLxZ1g7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 154B060A0B;
        Sat, 20 Mar 2021 00:09:21 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.12-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210319202226.24590-1-brgl@bgdev.pl>
References: <20210319202226.24590-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210319202226.24590-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc4
X-PR-Tracked-Commit-Id: 6cb59afe9e5b45a035bd6b97da6593743feefc72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3149860dc717e8dd339d89d17ebe615cb09e158b
Message-Id: <161619896108.24257.18161299935008017206.pr-tracker-bot@kernel.org>
Date:   Sat, 20 Mar 2021 00:09:21 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 19 Mar 2021 21:22:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3149860dc717e8dd339d89d17ebe615cb09e158b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
