Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A980C1CFDD6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgELSzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:37376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELSzD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:55:03 -0400
Subject: Re: [GIT PULL] GPIO fixes for the v5.7 series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589309703;
        bh=t+/MSg95b7mQI+QeMa8tHaMdB+fOWvrpJNwQ1LikcQs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=r9vviOiRotYHOK4JOA0ZuQBoIjnsme469+MzU60Yz/SfdOupl9XYNjBXdwVLqc62e
         YabMUVJ9y1LlyFKeDp8onuwgJJGqg0zobY0n9wTb96Hvn8FIuqZsxLh5SeagcLySgy
         tzN2eZLDNmektBG3yhD79PesSmcxUFyh3LCeCTUQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdafEGdhvn9kgBp7SAXw=JwqWRRoHu9CmytcWGeOYoixzQ@mail.gmail.com>
References: <CACRpkdafEGdhvn9kgBp7SAXw=JwqWRRoHu9CmytcWGeOYoixzQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdafEGdhvn9kgBp7SAXw=JwqWRRoHu9CmytcWGeOYoixzQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.7-2
X-PR-Tracked-Commit-Id: 0cf253eed5d2bdf7bb3152457b38f39b012955f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ec91c0fce1500306a858d0c35d1383fd9eb6ba6
Message-Id: <158930970357.9866.8152621540479928779.pr-tracker-bot@kernel.org>
Date:   Tue, 12 May 2020 18:55:03 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 12 May 2020 10:28:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ec91c0fce1500306a858d0c35d1383fd9eb6ba6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
