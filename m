Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC661F1064
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 01:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgFGXU3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jun 2020 19:20:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:32894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728007AbgFGXU0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 7 Jun 2020 19:20:26 -0400
Subject: Re: [GIT PULL] Pin control bulk changes for the v5.8 cycle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591572025;
        bh=LU0P94n3W1KJvtoZNSnoPaCtRms3WhAriJoh2850sU0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=fTZXrGsxapBcmW0MyCml3lbi+KGAgT+J2ecEVl76iwBskK0L/RN0MrgqUHYCRDxWH
         xXxllG7J9IDCEMmV1uEticcdtb09p9YNfIZBp1sz68zJ7e8hWuxvc0kyvrV42YaShW
         /sjTMS7lXd/j3QNBUqfx6MlPbaQL+FlkomVPiHD4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYfwd-4gPbTkQZWybkjLCHOHPi6mVg8fjF--54qj3zcEA@mail.gmail.com>
References: <CACRpkdYfwd-4gPbTkQZWybkjLCHOHPi6mVg8fjF--54qj3zcEA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYfwd-4gPbTkQZWybkjLCHOHPi6mVg8fjF--54qj3zcEA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.8-1
X-PR-Tracked-Commit-Id: 94873f6b46f8c103759c28adc121a58022972d01
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf0c97f148e9e50aa5a7ddd1984a604dd2bde4af
Message-Id: <159157202578.17419.6978691349982915472.pr-tracker-bot@kernel.org>
Date:   Sun, 07 Jun 2020 23:20:25 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Mon, 8 Jun 2020 00:08:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.8-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf0c97f148e9e50aa5a7ddd1984a604dd2bde4af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
