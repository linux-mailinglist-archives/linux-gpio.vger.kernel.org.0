Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE55136446
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 01:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgAJAPH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 19:15:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:36924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730033AbgAJAPH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Jan 2020 19:15:07 -0500
Subject: Re: [GIT PULL] GPIO fixes for v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578615306;
        bh=bNp8BM+V90h4bbEQ/kyFkRoZzVW+vSiT8eU3crkOFew=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=otlspGE6r+yystQ3Se3s6NhSOaAPmnlnM8iOxtJokScoUERZX3XwCkDQinsOQ4ikL
         tEpf2duuTH9GyadCcqoeOZrP3dULJagmd7YyaWsnNL3N/rJAHsZTyjgW4Kap7eqH98
         tvJ5wlHY+cdX3rd74upZGhYSx3QsSGCAjQVrvzUI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaUEAxP8Q9iLR+DBuDAkq0U9mAhSwJsrqT7dCF3zAC8vA@mail.gmail.com>
References: <CACRpkdaUEAxP8Q9iLR+DBuDAkq0U9mAhSwJsrqT7dCF3zAC8vA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaUEAxP8Q9iLR+DBuDAkq0U9mAhSwJsrqT7dCF3zAC8vA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.5-3
X-PR-Tracked-Commit-Id: aa23ca3d98f756d5b1e503fb140665fb24a41a38
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a3033ef6e6bb4c566bd1d556de69b494d76976c
Message-Id: <157861530680.24562.15864965051300616648.pr-tracker-bot@kernel.org>
Date:   Fri, 10 Jan 2020 00:15:06 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 9 Jan 2020 23:00:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a3033ef6e6bb4c566bd1d556de69b494d76976c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
