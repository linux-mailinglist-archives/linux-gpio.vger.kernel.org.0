Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448B8E02B7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 13:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387801AbfJVLUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 07:20:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387786AbfJVLUG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 07:20:06 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571743205;
        bh=tCcnDzs9CibPEhnrwLdPMnchK9XFJ/YHCcJPFtzrVPA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=yXIUgZw1WA+pc2s+ggBYusH5mNM8dR4vWOs8083Y79FiRWCy6y3bFMib0+O+TRIs0
         M+TnfnxmjFwKSn44H2A67zWERiU8grlXyncrw2D4VQi87wAaUVzxHDBg5JVbBYDpbs
         IDxlzULfaovOQeXyQDiOR4S9D95Bl9uVUVQl8fyY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbiyY9AT5Y8OwMmFgwgvn_DGUFrJVHWbZwyAxnK_bA7HQ@mail.gmail.com>
References: <CACRpkdbiyY9AT5Y8OwMmFgwgvn_DGUFrJVHWbZwyAxnK_bA7HQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbiyY9AT5Y8OwMmFgwgvn_DGUFrJVHWbZwyAxnK_bA7HQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.4-2
X-PR-Tracked-Commit-Id: d6e7a1a5119c4e719b0d63651f09762d7384bfed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b7c59a1950c75f2c0152e5a9cd77675b09233d6
Message-Id: <157174320587.11205.11116457943132650143.pr-tracker-bot@kernel.org>
Date:   Tue, 22 Oct 2019 11:20:05 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 22 Oct 2019 10:57:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b7c59a1950c75f2c0152e5a9cd77675b09233d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
