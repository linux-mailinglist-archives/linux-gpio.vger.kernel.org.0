Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F4517FDA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 20:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfEHSaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 14:30:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbfEHSaP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 May 2019 14:30:15 -0400
Subject: Re: [GIT PULL] pin control changes for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557340214;
        bh=I+uPXP+HjRDNkRKVRHVofBX4QbgRklvSz84xAFg1kFQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=GpxSR/RRAmExfkXzl23r6O+ogJWUafPJ3n687kfVEDO9h+DU9pNRmg8wQk7rfXQQN
         LQQtBN8dUjkOwOq/EiKi2St9pEHaXmFmgyEa3i1JgFQ3IsLVbPzLI/RJuo0Q6UYMy2
         JSfAZRalDm6Qn4sZCCDYAW/+jcpnpvrbpDXz7ff0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYMDCQEhWUGGqKs6SM-TB_dtPtjcAL7RJnLuHu4Wto=kA@mail.gmail.com>
References: <CACRpkdYMDCQEhWUGGqKs6SM-TB_dtPtjcAL7RJnLuHu4Wto=kA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYMDCQEhWUGGqKs6SM-TB_dtPtjcAL7RJnLuHu4Wto=kA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.2-1
X-PR-Tracked-Commit-Id: e0e31695b53b649dc2784c4dd517bcdd09bce189
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe460a6df6a8427d4ce7c731a0de43b6e10e9f6b
Message-Id: <155734021464.8790.1091749190534215079.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 18:30:14 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 8 May 2019 10:28:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe460a6df6a8427d4ce7c731a0de43b6e10e9f6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
