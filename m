Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E420DAD02A
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Sep 2019 19:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbfIHRZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 13:25:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730062AbfIHRZH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 8 Sep 2019 13:25:07 -0400
Subject: Re: [GIT PULL] GPIO fixes for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567963506;
        bh=attUapCLzUJ/ifnefYrBBjfMdzUXLrmmu8gFgrvM0vA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=BI1QY5uBf+GY1c3dDMOnaKsN4LIYEgprka9UX/6aTCt+Jm3uEyxPXk/L1n2EZw6+z
         u5S4Gj7QmvmvA3+8+ckNQvf+GUymSyZO9dE0NlzOxy616L7p3wwr6bH6muWGI9C6dM
         T1guJa7DV4tCHxuEgVpSiuJpic9f/dD+op4Iv4LQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYEPBOFnKvNiH0kSOZWTujMaMNhQQgRTGSZUosbbqAdkQ@mail.gmail.com>
References: <CACRpkdYEPBOFnKvNiH0kSOZWTujMaMNhQQgRTGSZUosbbqAdkQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYEPBOFnKvNiH0kSOZWTujMaMNhQQgRTGSZUosbbqAdkQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.3-5
X-PR-Tracked-Commit-Id: 89f2c0425cb51e38d6b39795c08d55421bec680c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: def8b72f0e40f2c9d9f1843af020a955e36a7cf4
Message-Id: <156796350642.11336.16509095222641659616.pr-tracker-bot@kernel.org>
Date:   Sun, 08 Sep 2019 17:25:06 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sun, 8 Sep 2019 09:00:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.3-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/def8b72f0e40f2c9d9f1843af020a955e36a7cf4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
