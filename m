Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AE71A82F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2019 17:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfEKPA1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 May 2019 11:00:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:51600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728635AbfEKPAQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 May 2019 11:00:16 -0400
Subject: Re: [GIT PULL] GPIO bulk changes for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557586816;
        bh=u9lJiCpsj+VZ2QNXRJvGZgciHAGie8v3YeL8uSIeio8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=wR55sUGLtYAie9cC+baOPeEOs7/PSJFP35RgQT+Zd87jrU1uoYO+Cetsp33nWhcsZ
         zyC098uAmEf2rBIVKD0IDSLTVO3os3JdRSAbpIfTk0SUUFe+z1rBKZ20tVBeqlbV3q
         M9pEdEmq5TY1fXzV42lz2wKWDGX/M9rVbfcQfqqc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZg0=f1KvwDhYGo=iv0ntQWzjTqYno1BgLE4zYxq-RAUQ@mail.gmail.com>
References: <CACRpkdZg0=f1KvwDhYGo=iv0ntQWzjTqYno1BgLE4zYxq-RAUQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZg0=f1KvwDhYGo=iv0ntQWzjTqYno1BgLE4zYxq-RAUQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.2-1
X-PR-Tracked-Commit-Id: 0fbee1df2078fa1f61e2da14f51ceb357c79ae69
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8148c17b179d8acad190551fe0fb90d8f5193990
Message-Id: <155758681608.22634.4406728706001259037.pr-tracker-bot@kernel.org>
Date:   Sat, 11 May 2019 15:00:16 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 11 May 2019 10:45:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8148c17b179d8acad190551fe0fb90d8f5193990

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
