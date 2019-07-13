Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F061267C4D
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jul 2019 00:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbfGMWuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 18:50:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:38156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728026AbfGMWuO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Jul 2019 18:50:14 -0400
Subject: Re: [GIT PULL] Pin control bulk changes for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563058214;
        bh=n/2RX+EYpOi6Mx2SSQGjaIEylLShIe8jstvRAdZhf6w=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gQ6qXeEXtQUj7ZagxJcMZRlQIlUoQ6eldDB2yHmOhC1HFfWr/6ns58Iq8HkKvzavD
         Dk+T56oTKgjhCOIdfVVu4phCKzeuQFKoJkStBqp0liJcjkjHmfOVHmZAZ6aCCJ2JJn
         clWDV2xVb0rMWB2ikjgQArj2tsagvLvzC7MXF5Wk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaaO14KOdsPBqjyx+78ohdGJ9Z0YrF+GcG7-geO1w1R8A@mail.gmail.com>
References: <CACRpkdaaO14KOdsPBqjyx+78ohdGJ9Z0YrF+GcG7-geO1w1R8A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaaO14KOdsPBqjyx+78ohdGJ9Z0YrF+GcG7-geO1w1R8A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.3-1
X-PR-Tracked-Commit-Id: 4c105769bf6de29856bf80a4045e6725301c58ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 43c95d3694cc448fdf50bd53b7ff3a5bb4655883
Message-Id: <156305821404.12932.9253627724064501407.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Jul 2019 22:50:14 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 12 Jul 2019 11:10:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/43c95d3694cc448fdf50bd53b7ff3a5bb4655883

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
