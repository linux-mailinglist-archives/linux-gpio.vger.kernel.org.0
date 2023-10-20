Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051067D16F4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 22:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjJTU1M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 16:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjJTU1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 16:27:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C123D63
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 13:27:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 173E0C433C9;
        Fri, 20 Oct 2023 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697833629;
        bh=OlKDXASXa0nhS++XXS4xCwQkrv+aZh6KIvK1yxbFdXw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Gsstbt4S1qJzya3fom0wUzG3godJ77yYsU+8vJrIWQMysWa3n5U2o+fGtUCabTL8m
         MgIFY9vQ6IZ2Ihp2jFe7xVtDLkur1H4T8GOQDFlujy0CgkUNdc7aRP0UQ4D3Q9WKQm
         I3v7Hbaj98vfNyfG4Via/AdwhtbXVzwA2NWjpSeBT7/Lpd5ptOBBKDlWgvBTYQwZYb
         fwBTlqLvGiaA+BM1VuBziHAREJyBFxxYAoGbcjI0OOR8PEm+aI1WcRRuMVr23VOvRZ
         zWSA2t1SVRKRnvOHIboIX54pXCGM0MHVZar4H+BLJIfiCVeruoGNpp0/A6j4g+O7xW
         CablZ0EwGHmDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 05AF2C595CB;
        Fri, 20 Oct 2023 20:27:09 +0000 (UTC)
Subject: Re: [GIT PULL] late pin control fixes for v6.6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbYHwfAVWtMjbaAsm89KYJmM5KTCyn43+XkFu+iDCb1vw@mail.gmail.com>
References: <CACRpkdbYHwfAVWtMjbaAsm89KYJmM5KTCyn43+XkFu+iDCb1vw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbYHwfAVWtMjbaAsm89KYJmM5KTCyn43+XkFu+iDCb1vw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.6-3
X-PR-Tracked-Commit-Id: 62140a1e4dec4594d5d1e1d353747bf2ef434e8b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 659eaa0015dbc640293e8d80b8cf772b1c60c09a
Message-Id: <169783362901.7501.6630130066975259231.pr-tracker-bot@kernel.org>
Date:   Fri, 20 Oct 2023 20:27:09 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 20 Oct 2023 21:33:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.6-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/659eaa0015dbc640293e8d80b8cf772b1c60c09a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
