Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0252F193285
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 22:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgCYVUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 17:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:57858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727389AbgCYVUH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Mar 2020 17:20:07 -0400
Subject: Re: [GIT PULL] GPIO fixes for v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585171207;
        bh=5ae2p5Y7Ug8W5ccwV++cNZifFhzHxGzvm+S0AmteZSo=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HMTOXZLr0EfwJ8KN7s0fv529J1Ni7zZZM5bE9zAbo9E8McfAAMmEYJ2tJhoZ136JC
         AoZkCvderrsEBuFt3EJ9DaphhT1BqY4m9U/CFbvmQGsBFiCOPCAsV2OfNqTG/7NVRv
         7N497u4wSRGisBAGJNBGWH7NpR2BRcqqw8d1Ccw4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdY8d=zG-z0Ju7k3Suj+seiexAdyQezcMxWV5rKHJhE3+Q@mail.gmail.com>
References: <CACRpkdY8d=zG-z0Ju7k3Suj+seiexAdyQezcMxWV5rKHJhE3+Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdY8d=zG-z0Ju7k3Suj+seiexAdyQezcMxWV5rKHJhE3+Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.6-3
X-PR-Tracked-Commit-Id: 0c625ccfe6f754d0896b8881f5c85bcb81699f1f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1dfb642b10158b45068102402decc3bcf853cb76
Message-Id: <158517120696.13294.16689977262821746392.pr-tracker-bot@kernel.org>
Date:   Wed, 25 Mar 2020 21:20:06 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 25 Mar 2020 20:00:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.6-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1dfb642b10158b45068102402decc3bcf853cb76

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
