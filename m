Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954032FF523
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 20:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbhAUTxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 14:53:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:48748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbhAUTtN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 14:49:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BAF1620888;
        Thu, 21 Jan 2021 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611258512;
        bh=KyDVZYNpUl35gHFIEHGrqSFtSLOH+5OQtKQ39wPmLs8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=nNhYbvx7LPK3edkAE1hz+2AG9kN3PNAGfS9JmqZ0bsSS81a4yIKFymUeiIs5xqZ9X
         f+m6dPhL3usR7fxjWe5G6Cpidc8W9OXyQ3TqorLJXu9fd8di2O7kU9gEeTD2PRD09n
         OWYRSGENvu+XN6meaKl0pmAtObEPJL8xTlZLsqNUwbgx0xiOpoGJXbgXo1yScFuhAn
         l0PIqYahbmPma7umUCvZZudcNDUvMP+rwdCFu1M7ZUrjwJ4tGils3Sr6ULgUyrGDEq
         IFQpY/gtpuyNAjWTxSMn8PzUvTloPaj4yg9Hh2Cpf2t1xy8FPWq9RgE6tAWN7NAqwO
         ADYUZn/ZL7f7g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A187060584;
        Thu, 21 Jan 2021 19:48:32 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.11-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210121095246.11061-1-brgl@bgdev.pl>
References: <20210121095246.11061-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210121095246.11061-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11-rc5
X-PR-Tracked-Commit-Id: 298d75c9b18875d2d582dcd5145a45cac8d2bae2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d7631e4378f26c8e1ba1ad372888e89e69678709
Message-Id: <161125851259.32181.5561744363662207366.pr-tracker-bot@kernel.org>
Date:   Thu, 21 Jan 2021 19:48:32 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 21 Jan 2021 10:52:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d7631e4378f26c8e1ba1ad372888e89e69678709

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
