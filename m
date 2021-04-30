Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7723701D2
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 22:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbhD3ULk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 16:11:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:47792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233410AbhD3ULg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Apr 2021 16:11:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B679C6144B;
        Fri, 30 Apr 2021 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619813447;
        bh=pR5N+oiFbElu2GBx/oDNZDMXxhU9QbD/MUxC10t0HEA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=OBScKiEqr9TaljSuJ6jbB541LH7oHNlsDFFA8oACuX1NrrDBIAagfLvkrDXk/R5d4
         2r11a0lFWhGKD0OBWXsR83Kksx4he3HSWyIQZ+djbf0vdJbiKc8F2BDULhqSITQeFl
         cqfG8C6y9HqAlu3ZTKbUxul0Oup1V2mFTRZHfhBRSqV9kWvBO/8SB3wp5p8EdZZNgu
         LxZ5124VZ4lM7g3biE1MDRa/SkFCj4/nyuIqxqHTYtjd+WskAXlJaUjnmqQva41HCv
         o703jkirjVr32H0kyP1WvYcF3Y4+UDhBmq4RnSSdlLitzlD7Z+tKHMpgx5dUnOw1Ei
         8K1x/4uiGXrrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B1B8B60A3A;
        Fri, 30 Apr 2021 20:10:47 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for the v5.13 kernel cycle
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZUvurFuE5sJdg4mRmb2MNBR41auOonaoDz5N9VLqD5Vw@mail.gmail.com>
References: <CACRpkdZUvurFuE5sJdg4mRmb2MNBR41auOonaoDz5N9VLqD5Vw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZUvurFuE5sJdg4mRmb2MNBR41auOonaoDz5N9VLqD5Vw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.13-1
X-PR-Tracked-Commit-Id: 8b242ca700f8043be56542efd8360056358a42ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65ec0a7d24913b146cd1500d759b8c340319d55e
Message-Id: <161981344772.32283.13043056019664829363.pr-tracker-bot@kernel.org>
Date:   Fri, 30 Apr 2021 20:10:47 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 30 Apr 2021 13:23:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65ec0a7d24913b146cd1500d759b8c340319d55e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
