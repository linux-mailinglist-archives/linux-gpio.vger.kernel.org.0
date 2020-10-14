Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8795028E912
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 01:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgJNXCP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 19:02:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730982AbgJNXCN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 19:02:13 -0400
Subject: Re: [GIT PULL] pin control changes for the v5.10 kernel series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602716533;
        bh=c9e1mYetEIzaOWGwmlHpf7KSTKzNUWiXM4CjgbbjsFI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=NHSyOwPaHsLbhseJ0n7AD/X4IE6kgxPENpsmxrEaXF7/rnZ604iN8UgkZ5j+XQO4S
         OUycrf2UMDARtSh4lMYec8bgcpq9xyG/jkXi5zKf2gFjYJa4q6mWOTY+wVqLngkTYS
         BEqzH/7F+7WsJYs+HBtqLZuEipOEoKGlyFqJHsQo=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbNUUAiF4Hbb=utPr1Wstwx9U0wJsJLLhSzcsJcD8gprw@mail.gmail.com>
References: <CACRpkdbNUUAiF4Hbb=utPr1Wstwx9U0wJsJLLhSzcsJcD8gprw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbNUUAiF4Hbb=utPr1Wstwx9U0wJsJLLhSzcsJcD8gprw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.10-1
X-PR-Tracked-Commit-Id: 55596c5445566cf43b83238198fd038d21172d99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4e1bce85fd8f43dc814049e2641cc6beaa8146b
Message-Id: <160271653324.18101.4897213579100275081.pr-tracker-bot@kernel.org>
Date:   Wed, 14 Oct 2020 23:02:13 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 14 Oct 2020 14:58:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4e1bce85fd8f43dc814049e2641cc6beaa8146b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
