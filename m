Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF4710E467
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 03:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfLBCFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Dec 2019 21:05:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:53864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727681AbfLBCFR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 1 Dec 2019 21:05:17 -0500
Subject: Re: [GIT PULL] Oneliner fix for the pinctrl pull request
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575252317;
        bh=30ix3BPiH2zbGQ1mKoLQ+Ch4hXVi0LdKv9c7G/bbkKA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=iiFzEa2Ul0LQvYaHQeZk29EAiVDpJSiRiOjg9PiCpLT9AQtKl6iKW2+m2j6c/vePX
         NOMLN3SJ2AcAS0D/I8G0XDkeJHCC6esn2HrlNIsBVfKCRDEM+Xv6f8H3lHQ9JG0hNE
         g+5FO6VQ9HoF4B17iNCniiZe0UAFt+S3eAt5xYwk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdb_5xjLBSPaGrDadHUj=4Npz13YELJw+Ov+JyigGPBZjg@mail.gmail.com>
References: <CACRpkdb_5xjLBSPaGrDadHUj=4Npz13YELJw+Ov+JyigGPBZjg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdb_5xjLBSPaGrDadHUj=4Npz13YELJw+Ov+JyigGPBZjg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.5-2
X-PR-Tracked-Commit-Id: 6d29032c2cef31633db5dfd946fbcf9190dddef0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b233da0cc825166b5fa06c898517a7477b54388
Message-Id: <157525231728.26823.4501025545170073476.pr-tracker-bot@kernel.org>
Date:   Mon, 02 Dec 2019 02:05:17 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 28 Nov 2019 14:18:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.5-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b233da0cc825166b5fa06c898517a7477b54388

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
