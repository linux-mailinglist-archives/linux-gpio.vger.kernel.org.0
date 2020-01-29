Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0B314D002
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 19:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgA2SAG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 13:00:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:35436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbgA2SAG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jan 2020 13:00:06 -0500
Subject: Re: [GIT PULL] Pin control bulk changes for the v5.6 kernel cycle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580320805;
        bh=QhESBAiw7dwRYWBRHAdpEnX6b2o4NudzOnPf8BfBK2Y=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=f5B4auvKg2lmeOicBajDwjcPcx2t5FEDS3HtG0PRdI4s7L9eP49vZtzaXy79uuR5V
         M8dLPEV4Wm3++PrFnTBgQ+hptcgx9/ZdgQ52EgXZT5uk16h2yUyDezaYmiYiqjXwHZ
         mcs+NxnCm3MuFfcX1y9pEdUikuLXjsnYZTm9DpS8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYOsqTh51Ta4UR1c77zpu2Vstri5wCQRVYb1iV9Kkt5Aw@mail.gmail.com>
References: <CACRpkdYOsqTh51Ta4UR1c77zpu2Vstri5wCQRVYb1iV9Kkt5Aw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYOsqTh51Ta4UR1c77zpu2Vstri5wCQRVYb1iV9Kkt5Aw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.6-1
X-PR-Tracked-Commit-Id: 122ce22cb37b087e7e28ebb16044a622b0a22233
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6ba3d7066c71d2103da255df19eb613d299bab15
Message-Id: <158032080544.27486.10311010542133012524.pr-tracker-bot@kernel.org>
Date:   Wed, 29 Jan 2020 18:00:05 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 29 Jan 2020 09:33:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6ba3d7066c71d2103da255df19eb613d299bab15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
