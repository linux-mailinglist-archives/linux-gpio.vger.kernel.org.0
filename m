Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64529140C00
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 15:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgAQOFE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 09:05:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:47528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgAQOFE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jan 2020 09:05:04 -0500
Subject: Re: [GIT PULL] gpio fixes for v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579269903;
        bh=y04g8Y4MEnLLitmvnhpe7B5JwNWD6+j+7MPe8rGyiK8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=DCv684DTOHI02penZ1dPhUdE8i1Jr1w8F1G2OfOQCnIZWQcsgJB4gRt61YmV9kVuJ
         TACa+6SHY0OPk3b65bYDPPJK38Aexl7tDLAXAZ4EsyJ08zNhlN9Rc5E7YKccrTAjTe
         gl9Ydj925kulko2FnclDBY7zYIFTUgJXik7GUTjU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdatPeRrqDzb7ynELvRD_TUfjAc3XCYPKmE5BrQdFXakiQ@mail.gmail.com>
References: <CACRpkdatPeRrqDzb7ynELvRD_TUfjAc3XCYPKmE5BrQdFXakiQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdatPeRrqDzb7ynELvRD_TUfjAc3XCYPKmE5BrQdFXakiQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.5-4
X-PR-Tracked-Commit-Id: a564ac35d60564dd5b509e32afdc04e7aafee40e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 13b2668d6fc95dcecd11e4f86f47be24fda7da1f
Message-Id: <157926990376.9623.15557688693663282462.pr-tracker-bot@kernel.org>
Date:   Fri, 17 Jan 2020 14:05:03 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kevin Hao <haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 17 Jan 2020 08:57:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.5-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/13b2668d6fc95dcecd11e4f86f47be24fda7da1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
