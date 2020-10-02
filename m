Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A02D281DE9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 23:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgJBVyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 17:54:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgJBVyQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Oct 2020 17:54:16 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601675656;
        bh=/Vw9E0a50ZIjvEkAjRiinAnML2NW/Z/qzob/ILpG3Ls=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=GYAFTgbVsrtCOP6NIQZjd0UqcWj/ZHCOluJCFzOOgxS+lIUcvfZayw2QPZNLdMN3x
         CF9g+11EvafiO7vTmD5XKyCPUqRH/12k8FSNFxzdU2dBiofOpS27spOmhu1GjHidCB
         Tv40/FZKPF2jwr/AM70jnkzD4QOWMt8J26nFA5a8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZ=EC589q1WpdkzCcswfLRUcVe25Uuht-vqywEn16R7Tg@mail.gmail.com>
References: <CACRpkdZ=EC589q1WpdkzCcswfLRUcVe25Uuht-vqywEn16R7Tg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZ=EC589q1WpdkzCcswfLRUcVe25Uuht-vqywEn16R7Tg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.9-2
X-PR-Tracked-Commit-Id: 39c4dbe4cc363accd676162c24b264f44c581490
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e
Message-Id: <160167565612.8763.6452165041366614261.pr-tracker-bot@kernel.org>
Date:   Fri, 02 Oct 2020 21:54:16 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 2 Oct 2020 23:45:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
