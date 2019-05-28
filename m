Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E562CC98
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 18:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfE1QuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 12:50:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:46562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbfE1QuQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 May 2019 12:50:16 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559062215;
        bh=yryTIORFujiT7sUdeULow+fh1QkMuOSIn4FJCcW+f+4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=EKyUNjZenWur8Q2i34rbCenoDn76B5lWYh93enek/THQsKCdIPqIoelv2Yf7Cc2dp
         NAh5gVuAA6JpHG/0EuvLxoRRj2Z/i5El8EFlDG2fbTZNLq1xaLM7B+YWoZ2BqZjkcH
         p0/+8MuEwajigkpEM5dbP/R22nYzkAdi9AvdhxwY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
References: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 tags/pinctrl-v5.2-2
X-PR-Tracked-Commit-Id: b1fa7d8592c730d1b44536b5cacadeb318d369fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9fb67d643f6f1892a08ee3a04ea54022d1060bb0
Message-Id: <155906221546.16286.17261469406240264372.pr-tracker-bot@kernel.org>
Date:   Tue, 28 May 2019 16:50:15 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 28 May 2019 10:43:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9fb67d643f6f1892a08ee3a04ea54022d1060bb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
