Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B00B4466B7
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 17:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbhKEQK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 12:10:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:49162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232766AbhKEQK4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 12:10:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 802CE6125F;
        Fri,  5 Nov 2021 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636128496;
        bh=rhVYeB7G7i2FxcDMvISinXVJNJr+4iUEooUqVXXYUnk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=d5O5Td9BQ7iacfCc8STxySAplWB82Flb1znaT6b08rOuQQu3h2tCzbT+HI/xm6bzG
         /YzpTZOBQv1K0s+cVTpCG8wahXaE9W6MERHGbSgh0ADo43VbHczWbBMeO170UjF8SN
         w5Bevxbt72C1anPg6qpj3wwKpeQb+35neOSd3btH8k6w+iSnNG+ERVxOzTL/2UUIJe
         4uBDBKPh12h+lgtgQUUwfdNn70Y781FkvByocjRIBHBH9QULIRtD0LOlEbhP3e31dr
         VmOxMyWYwFhctzN4G6B1c7H3og/DAwUTEF2ovNh59thcTVL7V+TDycAdh/+NGozNlg
         rE+z4akbsNLSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7615F609E6;
        Fri,  5 Nov 2021 16:08:16 +0000 (UTC)
Subject: Re: [GIT PULL] Pin control bulk changes for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbRu_NTJpSeyOeMRq5TFgj0-7Ny1vTvcak4K9qaY6nunw@mail.gmail.com>
References: <CACRpkdbRu_NTJpSeyOeMRq5TFgj0-7Ny1vTvcak4K9qaY6nunw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbRu_NTJpSeyOeMRq5TFgj0-7Ny1vTvcak4K9qaY6nunw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.16-1
X-PR-Tracked-Commit-Id: a0f160ffcb83de6a04fa75f9e7bdfe969f2863f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a1bcbd965341537c354e3682f939a7274ac3f5d
Message-Id: <163612849647.17201.12232426041374782302.pr-tracker-bot@kernel.org>
Date:   Fri, 05 Nov 2021 16:08:16 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 5 Nov 2021 10:49:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a1bcbd965341537c354e3682f939a7274ac3f5d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
