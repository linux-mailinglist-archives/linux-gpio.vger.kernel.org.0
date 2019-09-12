Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75952B0C64
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 12:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731034AbfILKPG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 06:15:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730386AbfILKPG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Sep 2019 06:15:06 -0400
Subject: Re: [GIT PULL] final GPIO fixes for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568283305;
        bh=5zpTjKGOM6Tl+Zb9Y1WxxL4hxjD14N+VLqAVLu+rTW0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Cg+XH5DFbxzpQCrkAqUyDVEfZNVVxAJSO7XrE55WRT08pjMPZTbQjW8NxIwlTiHrB
         FdVKjlZ2hxAXbCpfOsz7rMNbiFxqFrwYbjNmuZujSuyVixNdoXYwfGPHRs5D8qYT9Z
         LCqYmZtyo+UbamsR+xBMiz7Gk8fDtjXr8iODI0kg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbZE2dwmaE2-NF_p6XQodBb=34tOxyDgfbAWjiirTgj+Q@mail.gmail.com>
References: <CACRpkdbZE2dwmaE2-NF_p6XQodBb=34tOxyDgfbAWjiirTgj+Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbZE2dwmaE2-NF_p6XQodBb=34tOxyDgfbAWjiirTgj+Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.3-6
X-PR-Tracked-Commit-Id: 61f7f7c8f978b1c0d80e43c83b7d110ca0496eb4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c09f623487178867d8000af337585b84b1f53d9
Message-Id: <156828330582.21107.13403762778212378247.pr-tracker-bot@kernel.org>
Date:   Thu, 12 Sep 2019 10:15:05 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 12 Sep 2019 09:10:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.3-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c09f623487178867d8000af337585b84b1f53d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
