Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36BDD18236F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 21:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbgCKUpH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 16:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbgCKUpH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Mar 2020 16:45:07 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583959507;
        bh=zxeBjc03GGTpm1E0YMnSwLEHXklOLkORMmtnLFc/rbM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1MMsjkOIdYJMSl53oC5aF3+ypQI2jbiAEzBA52ZRHTykYviOHYMC9IYb0JyRBoHVc
         LtngedRyKdbttipMSv+uq0BAxacuqJlC4ug1eCWWu8uKWGswqgaZrH37rVQLVNmSV1
         wcJqMes8mV+Se4KXnsYKZTJxYn0meIrX1h60VtFs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYZbx_3AgtTYSwtBcr0G4PisWt8As=T7nqq60rTPXjYCA@mail.gmail.com>
References: <CACRpkdYZbx_3AgtTYSwtBcr0G4PisWt8As=T7nqq60rTPXjYCA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYZbx_3AgtTYSwtBcr0G4PisWt8As=T7nqq60rTPXjYCA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.6-2
X-PR-Tracked-Commit-Id: 1cada2f307665e208a486d7ac2294ed9a6f74a6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6ff4631a61928061c166d3919b9f6e397851125
Message-Id: <158395950702.14877.746149326958817812.pr-tracker-bot@kernel.org>
Date:   Wed, 11 Mar 2020 20:45:07 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 11 Mar 2020 10:22:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6ff4631a61928061c166d3919b9f6e397851125

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
