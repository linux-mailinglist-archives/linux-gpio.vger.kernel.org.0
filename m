Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1EA7E0DEF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Nov 2023 06:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346159AbjKDF0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Nov 2023 01:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjKDF0K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Nov 2023 01:26:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248511B9
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 22:26:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2DCEC433C8;
        Sat,  4 Nov 2023 05:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699075565;
        bh=LOmYDCNuoUPQBeVxGn2U601Vxh3hyy5mmpSa6TQpT0c=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Y+oKMkyuLlClbEfR0XRA4/N/KIBkdzcV2WkIbs5KBfG4vLc5phqGL3xuP7QclgtlS
         KCmK/CzanZxI7qk57Ojhrhunnj4duihWEs5QARVnZ0Glcxk1XmHKIX85oLolSa60hA
         Ux1IyV5UJuRZ3xzWB2pQz2hT8lZn0s8om9JNcv1mWHAopxPmjAaNgEkglHbfWJ2XON
         95QBF0bXh6j/nhjdDp5HFvlLtyFszGWYND3kRdt+mPdkY2wRNS/coudpizoZGxfgGM
         Q0QEzJKAwwdtqtzzoPLaIWNvzXtYsEIFjfQU67MbQa7hmThu4xaurO/0wJd7I/M0uS
         Jpu6bFxZB2CoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFBAEC4316B;
        Sat,  4 Nov 2023 05:26:05 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZS13QkWAzfZo_PfKnm0SxWU0DtLSt_1st6jWwv3+-Jug@mail.gmail.com>
References: <CACRpkdZS13QkWAzfZo_PfKnm0SxWU0DtLSt_1st6jWwv3+-Jug@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZS13QkWAzfZo_PfKnm0SxWU0DtLSt_1st6jWwv3+-Jug@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.7-1
X-PR-Tracked-Commit-Id: 63bffc2d3a99eaabc786c513eea71be3f597f175
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90b0c2b2edd1adff742c621e246562fbefa11b70
Message-Id: <169907556571.8300.15425529579776659376.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Nov 2023 05:26:05 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 3 Nov 2023 09:07:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.7-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90b0c2b2edd1adff742c621e246562fbefa11b70

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
