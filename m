Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5A942F57C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240322AbhJOOhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:37:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:38032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237347AbhJOOhN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Oct 2021 10:37:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 61A656120A;
        Fri, 15 Oct 2021 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634308507;
        bh=H7Zks1WMbrND2KkFlt7Tm3bFC4VeGtobqC4N8p6FKXo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ePpeCV/8UdUzCH0wtPmko+KKzF8dvF5Ft4DhlPzUZTLZbOuiuUos0VBFFszJWz+Sf
         CvCtYN9+kGV/73kuWLZqnh9j+9Smb+IsZiTEQebIIX9aAcSFGb2sjIX06tdpyU7Rej
         r8f0S4fJY+X5igUNqozN5YLz69ReZ07dmKEjskNst6eobOyudwBbX5rj73zKC+pas/
         Ull7fcMlCesPTo8qlw9koWLJYAF8NxQ3M0wytsp7RoYj2hCQUor/eevTn9VzV2Zd08
         sNp0OfZWqfPdgPHQxBukRZC8JLbSYiN1AFupXjFN5DscJC8i+E83m2HaFqoJVLrIIa
         3iCa1Lvd/9+dQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4F30E60A44;
        Fri, 15 Oct 2021 14:35:07 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v5.15-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211015141112.23965-1-brgl@bgdev.pl>
References: <20211015141112.23965-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211015141112.23965-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc6
X-PR-Tracked-Commit-Id: 6fda593f3082ef1aa783ac13e89f673fd69a2cb6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fe31e0995f048d16b378b90926793a0aa4af1e5
Message-Id: <163430850726.21069.726097731780977527.pr-tracker-bot@kernel.org>
Date:   Fri, 15 Oct 2021 14:35:07 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 15 Oct 2021 16:11:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fe31e0995f048d16b378b90926793a0aa4af1e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
