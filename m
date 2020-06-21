Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D24202CA3
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 22:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730570AbgFUUK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 16:10:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730572AbgFUUKY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jun 2020 16:10:24 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592770224;
        bh=r5XNGsM8i15w6AiOwSOXVMf22RNx/3POG+gIzIv7kbk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=sBqGsOr2Amz/fwBmM8CrzYP/U89QhnVXBG7Vg5q9BVK+J4Vp1DQMPIAPsFrIa6tUA
         JtiQhqCANLvM8ov5j0Qpif+Dd2Jt+EQG6iE17IyseCRenSXLS/QScHqy3Y11Idyk+3
         DS8qfegtSASTU31J4zDaG9Ea7JJaS4y0qUhbYrt4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdasTF7DLFejjC005vuBfcv2upbNjd5Cw9j_d-CUnHOMDg@mail.gmail.com>
References: <CACRpkdasTF7DLFejjC005vuBfcv2upbNjd5Cw9j_d-CUnHOMDg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdasTF7DLFejjC005vuBfcv2upbNjd5Cw9j_d-CUnHOMDg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.8-2
X-PR-Tracked-Commit-Id: 25fae752156db7253471347df08a2700501eafde
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16f4aa9b7c2304e439796bd097b2c0a7663f5d6e
Message-Id: <159277022405.13621.14937365123490140575.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Jun 2020 20:10:24 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sun, 21 Jun 2020 20:24:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16f4aa9b7c2304e439796bd097b2c0a7663f5d6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
