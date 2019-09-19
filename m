Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAB0B8368
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 23:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404879AbfISVaj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 17:30:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:60652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404864AbfISVag (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Sep 2019 17:30:36 -0400
Subject: Re: [GIT PULL] pin control bulk changes for v5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568928635;
        bh=rAudkxjrnojRjWhOlu8DRJL856WKEG2t48JP9yKb3yI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jxHW4Se9LcGxu6mpWsLYUnWu3qlaeVKRC9oL4FZyz+zSypP7cqu8SaAm1fK7tcEOV
         7UMu+t6nW3xTLcBP5J32TgvauSOKyoHoHNUaXT66UlGS6A+BEatxrQp/br51i5g7qI
         EBN7+0gHKjtA83HdWMtyzPjpT5/pWWUR9IOYy1K8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaHfhNjR-3GJOO-47rqopmO1SE9dLAU+AiCaWTuLje=8w@mail.gmail.com>
References: <CACRpkdaHfhNjR-3GJOO-47rqopmO1SE9dLAU+AiCaWTuLje=8w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaHfhNjR-3GJOO-47rqopmO1SE9dLAU+AiCaWTuLje=8w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.4-1
X-PR-Tracked-Commit-Id: cb0438e4436085d89706b5ccfce4d5da531253de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c2edc36a77420d8be05d656019dbc8c31535992
Message-Id: <156892863593.30913.11813652033877690149.pr-tracker-bot@kernel.org>
Date:   Thu, 19 Sep 2019 21:30:35 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 19 Sep 2019 23:07:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c2edc36a77420d8be05d656019dbc8c31535992

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
