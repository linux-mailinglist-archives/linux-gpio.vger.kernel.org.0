Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE0A2B25D8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 21:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgKMUuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 15:50:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:59256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgKMUuM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Nov 2020 15:50:12 -0500
Subject: Re: [GIT PULL] GPIO fixes for the v5.10 series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605300612;
        bh=BWxd84NmNu858k6YKZSmLz6/pZZBPINBdMPgb2yZ7EM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=rVct9rr2KrBUOPrw6x9SdYU8/BGMl8r/gllZ612YFSlpcUYxVYguG5xc4tu4Hqvfh
         1xqCVPBkCm84z/G8DIqclmzyicmGjjEMGcN1GH/EzH4SW92RZ+R4mDCYlm+TDUGQsR
         rZMNYG+EiiCwau7bxC0/ABTvBCPqf2ClHfAIU87c=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZMomW2zVepq6y6P-EjHjN9xMJvVFm0n3WAsPKS3-QgYw@mail.gmail.com>
References: <CACRpkdZMomW2zVepq6y6P-EjHjN9xMJvVFm0n3WAsPKS3-QgYw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZMomW2zVepq6y6P-EjHjN9xMJvVFm0n3WAsPKS3-QgYw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.10-2
X-PR-Tracked-Commit-Id: b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29eb6b7d62b09fee6deb796c58256ba38cb4a07d
Message-Id: <160530061203.27782.12673517958065877949.pr-tracker-bot@kernel.org>
Date:   Fri, 13 Nov 2020 20:50:12 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 13 Nov 2020 14:11:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29eb6b7d62b09fee6deb796c58256ba38cb4a07d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
