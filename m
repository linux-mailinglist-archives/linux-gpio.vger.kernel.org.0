Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9EB5F15A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 04:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfGDCPF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 22:15:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbfGDCPF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 22:15:05 -0400
Subject: Re: [GIT PULL] GPIO fix for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562206504;
        bh=ZRFuGi1bNVwD5fLeiPbZ3ZklKfu1wLlFArMt2QLyxuA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=eX10C8IdB6yThLrr7ecEd8plLJAsakti6N54nkWdjW5dEmXgLywctk3f0wpBAVD0c
         oggad7bNKzJLNVImLbo4dMFVMN8QjUKlmTtNAaIycNbEkmO/OXf6fMsPTBmvU3P/oc
         IYOf5+2vfzYJoD28H7ViWMUJy6I9wl8+ouO9r3V4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZBhUF7C_+vPc6tkasBk5DAGh01g3eu8OYQ16QBehUZWw@mail.gmail.com>
References: <CACRpkdZBhUF7C_+vPc6tkasBk5DAGh01g3eu8OYQ16QBehUZWw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZBhUF7C_+vPc6tkasBk5DAGh01g3eu8OYQ16QBehUZWw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.2-4
X-PR-Tracked-Commit-Id: fbbf145a0e0a0177e089c52275fbfa55763e7d1d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 179c96d9f715a619811ded5dcbd35b1fee8caf69
Message-Id: <156220650467.16688.8382965574738944222.pr-tracker-bot@kernel.org>
Date:   Thu, 04 Jul 2019 02:15:04 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 3 Jul 2019 14:30:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.2-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/179c96d9f715a619811ded5dcbd35b1fee8caf69

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
