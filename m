Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667C82353BE
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Aug 2020 19:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgHARPE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Aug 2020 13:15:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgHARPE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 1 Aug 2020 13:15:04 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596302104;
        bh=DG5Tx/vPXCYTCi9vi9lxJbhvZLHpZ2H1q7xLnSOR5MU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Fj/SfM3xSeMAs+RJnKHHwsFaY1uAVifv3DxmjqgGWXo4oevOdEko7zy+JhdGKLNI2
         fMd132foQQEbuYvx9a3vxoK2PQzcfGpqbj05kTmoID4yuL9gXI5bV5w/zsombxIDUQ
         cF7odeQkPkptmHXn4dUPgfxpm+64gsVEnkMV8MVU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaiGkpOv3fr4+PKdTiQr0jbjhMUkYo+OnHuC9yqJVvQzA@mail.gmail.com>
References: <CACRpkdaiGkpOv3fr4+PKdTiQr0jbjhMUkYo+OnHuC9yqJVvQzA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaiGkpOv3fr4+PKdTiQr0jbjhMUkYo+OnHuC9yqJVvQzA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.8-4
X-PR-Tracked-Commit-Id: c3c0c2e18d943ec4a84162ac679970b592555a4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d52daa8620c65960e1ef882adc1f92061326bd7a
Message-Id: <159630210404.19073.11077325187393350310.pr-tracker-bot@kernel.org>
Date:   Sat, 01 Aug 2020 17:15:04 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 1 Aug 2020 16:25:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.8-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d52daa8620c65960e1ef882adc1f92061326bd7a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
