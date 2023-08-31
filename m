Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CC578E509
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Aug 2023 05:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245272AbjHaDUs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Aug 2023 23:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345788AbjHaDUj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2023 23:20:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5C4CE4
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 20:20:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1D7CEB8214E
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 03:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF2EDC433C8;
        Thu, 31 Aug 2023 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693452021;
        bh=4uERiz/OkBnbKjvY57rJnjHqARRNZOiTVR7N02/WvRU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=uBV+VlAYYmdLHDafLlPmYYHhf1Ym6V0KDMXB9+dE0X41HXhSMb26e5ugwB4EsFDtJ
         x4pKiIk/0yxmOuNnnbd4WZjUdvbGnG2kuYyO8hoAupkuN/Fchl7+2D3+kn+bla1ugn
         +PnzodAh44KxZdcxZG0drR+mJT9KXDH+slO7qV0enZKJZdNnrZeS8zrhbKDVSOH+8h
         Igdncs1dCmypLMH4iMgrPV5DBXSDrIefbVrOhIqBQvMwdJfRDj4ZnOtFOwO69oufin
         INjEMx5f3B2CR8WgBSqwWtHnXcteIEMPN6+N7Zn5I89S8G3CKBQoU9pdbxmIsvfkE9
         vAu/lFO0q3rdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB646C3274C;
        Thu, 31 Aug 2023 03:20:21 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for the v6.6 kernel
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYJc3vdfdWWfk-E2AhBZq7TqJKvVJAzMmoFYfw8kVtMfA@mail.gmail.com>
References: <CACRpkdYJc3vdfdWWfk-E2AhBZq7TqJKvVJAzMmoFYfw8kVtMfA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYJc3vdfdWWfk-E2AhBZq7TqJKvVJAzMmoFYfw8kVtMfA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.6-1
X-PR-Tracked-Commit-Id: 82a65f0844852cec6a70ac05c7d8edb0586c851c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a3b1007eeb26b2bb7ae4d734cc8577463325165
Message-Id: <169345202182.31998.17597188621009307697.pr-tracker-bot@kernel.org>
Date:   Thu, 31 Aug 2023 03:20:21 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 30 Aug 2023 16:07:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a3b1007eeb26b2bb7ae4d734cc8577463325165

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
