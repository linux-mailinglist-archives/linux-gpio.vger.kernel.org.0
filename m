Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB36369DE4
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 02:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhDXAql (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 20:46:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229957AbhDXAqk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Apr 2021 20:46:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2C8BD6144A;
        Sat, 24 Apr 2021 00:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619225163;
        bh=HFH/c8ZLE+PdHTtTGzoN88oMkZgiqLWX4VOXwSYg/vo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=bWzpj3rIZ2TBFvpAyJiWTnOTHVWuyxwFgCPWHLYgT3Ap0VkPuI91sts/h1l8iCEGp
         MDg3NTWVfCk30DYJxfuqrfGG97PxtcmoOHN4jNQloiYSh1hhYgisu6LlpN95rc7JEQ
         LAEd2uOcgRnNvqwtXAkZCy3MYk0R+tFQIF4++iQ5rsVrmAW4qmtNyXTaYc4DSVOgLg
         luBeKFWxYpe4LyZhz+wQ/URve5MWdCd9HOdXDonYkn8J73oaUlugcmOuLX+d9cvoDj
         gOnIF+6hHOZs0F6mnvsrV5SQIcIHV2xFu6uPNX/kzeX8I5ScHExoN6eHS1pBm7saRF
         3Cko5ZAVocD+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2304660A52;
        Sat, 24 Apr 2021 00:46:03 +0000 (UTC)
Subject: Re: [GIT PULL] final pin control fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdY6g7eoqyJ-OHijbR_Gw2W7uoNF5Z6+-at5OBvaH9_kqw@mail.gmail.com>
References: <CACRpkdY6g7eoqyJ-OHijbR_Gw2W7uoNF5Z6+-at5OBvaH9_kqw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdY6g7eoqyJ-OHijbR_Gw2W7uoNF5Z6+-at5OBvaH9_kqw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.12-3
X-PR-Tracked-Commit-Id: 482715ff0601c836152b792f06c353464d826b9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8db5efb83fa99e81c3f8dee92a6589b251f117f3
Message-Id: <161922516308.16732.9291408720338397856.pr-tracker-bot@kernel.org>
Date:   Sat, 24 Apr 2021 00:46:03 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Sat, 24 Apr 2021 01:22:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.12-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8db5efb83fa99e81c3f8dee92a6589b251f117f3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
