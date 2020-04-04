Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5566719E6E1
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2020 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgDDRu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Apr 2020 13:50:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgDDRu0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 4 Apr 2020 13:50:26 -0400
Subject: Re: [GIT PULL] GPIO bulk changes for v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586022626;
        bh=QR0SRq7v4sEsNOTfmR2H46SgRrsCKg2QnhZJxkPR4ys=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=JOzX6GcCwq7BK3jmrZXTkySAQXy/nokw3MKUUubPZnInBnPg9FHnMG50xjEf7HpKg
         NELN0YbJJcQfcX9i9R8RqrXYqwr795lijQJlGD1rWAgzv1QJC+GPUhdYgBoL1fhXmc
         EezLCpn84XNEpFdCJZPXm3weunQd3o4UGYXJPqfE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYMcy0ctKsUTdeXQ7EKZ40AeQVEo4fE4BpgXODJ+U6K1Q@mail.gmail.com>
References: <CACRpkdYMcy0ctKsUTdeXQ7EKZ40AeQVEo4fE4BpgXODJ+U6K1Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYMcy0ctKsUTdeXQ7EKZ40AeQVEo4fE4BpgXODJ+U6K1Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.7-1
X-PR-Tracked-Commit-Id: 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 828907ef25e0133f50c346ef5a3c79a707a9b100
Message-Id: <158602262630.31764.14239984515947823534.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Apr 2020 17:50:26 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 4 Apr 2020 14:08:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.7-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/828907ef25e0133f50c346ef5a3c79a707a9b100

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
