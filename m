Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473381E9371
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 21:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgE3TfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 15:35:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728998AbgE3TfC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 30 May 2020 15:35:02 -0400
Subject: Re: [GIT PULL] GPIO fixes for v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590867302;
        bh=eZNpktKbozxPhlkU450anxPh5BNvA1kHTGvrbYG93BA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=KhRmm+WD1i9O4mvygXjoflIIPozQm22wAMYk5d+j/Xfjn7RpovcCzyyxwxT0AQ2+2
         onpsrl9pGsyPAM+PWk95MRWFGLMW1ErizrvFY6oJjQgq4kzZiybi7NUoI1nljdbZey
         8He2gXZfyhVBX1FSyD5ovfG7B4TvDWo0knrtEH3g=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdY0are=TC79q_4vP9R1tzSjRU4aiqOGd1-5CXDbhpMj0A@mail.gmail.com>
References: <CACRpkdY0are=TC79q_4vP9R1tzSjRU4aiqOGd1-5CXDbhpMj0A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdY0are=TC79q_4vP9R1tzSjRU4aiqOGd1-5CXDbhpMj0A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.7-3
X-PR-Tracked-Commit-Id: e9bdf7e655b9ee81ee912fae1d59df48ce7311b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 900db15047044ef50b32e23630880f4780ec5b9e
Message-Id: <159086730207.6123.7590365123806333324.pr-tracker-bot@kernel.org>
Date:   Sat, 30 May 2020 19:35:02 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 30 May 2020 13:09:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.7-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/900db15047044ef50b32e23630880f4780ec5b9e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
