Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9554E46DFD0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 01:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241638AbhLIA6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 19:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241624AbhLIA6R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 19:58:17 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86849C0617A1
        for <linux-gpio@vger.kernel.org>; Wed,  8 Dec 2021 16:54:44 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso4609675otr.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Dec 2021 16:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oayw19YcubpFrAM2rcGj+T1Oq/bzfF0MfoBjvEgDhvY=;
        b=DrC9twi4Lta/weWbKj7I1tdRFQUzvZcDA4bRPMXw/xdzUC5w/r7G4HputChGNvDqDi
         H761KnA9rgUpg32HJOuMzcbMRLV3n/Dl0ekGuVRBniHdYULujTaZ7DtTn9Y6F5AUZ4cU
         XPTEIPo7Nssr618Oxgciyvxi1LGYYHvWGJ3yPZR1yvp4aQWx8wm8pn5O6RwwRY/oePTH
         lUdzs4Xoq+plOyFsgXSXHQv0Ef6BRemc4znW09nkfnZQLRCmX8miDDZQJ0N1XcXXddQM
         iFY9ss/q7GfZe1N+dB7WdlAS37UecYu5sCRGWGCEM/b7/f3plB8jTT2oK86tWZVGStmA
         Tb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oayw19YcubpFrAM2rcGj+T1Oq/bzfF0MfoBjvEgDhvY=;
        b=bABc10CdrjZsDWxqbWxJAbflXc7CcB8e7B14/bG+ckE70cssIg3j7FB9G9LAlmkEhp
         wcWTQQFMjGMxhEGkOHUMDSqaywWQ5Pt63G2asGtDBIYSwQ8AuHRExmnvZkElZ5qGprMu
         OJHeKjIw6+q4mvpXxwnue2ndxYYywOV7MZ8/zJXeSx66CjByHD+NwVFy9QEsbIssLF6M
         XIOjUDlvSRAKFo7SZtOhq+uiPCJIBMvZCYM3oU37Gx7Qbq6+JkiX10X7q6EF3aLGiVLr
         Ll3QBzYXMRZHfXU/hYDOgZGM7SoesVokSp6XQZttmMjtRWzrRhiTxkurXiiIqE+Ex1s4
         jQGg==
X-Gm-Message-State: AOAM530NgMerPzW6vcIu1ci3j2aFv5qdIMvlJxJvwff+OoboPh4uTf5l
        c3AlZ0ST5PA/EA8+9KA+uUtzIHzAfnWMD/gO5ZQDmQ==
X-Google-Smtp-Source: ABdhPJzGomSzkekQE828bfIUo/WHIX1ZFsfqM14FCi2GjwhNdEgjuJeCXj0n+HSC4lxJQZf70dA/USaOLKrkkQOCskw=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr2615930otl.237.1639011283934;
 Wed, 08 Dec 2021 16:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20211207093412.27833-1-brgl@bgdev.pl>
In-Reply-To: <20211207093412.27833-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Dec 2021 01:54:32 +0100
Message-ID: <CACRpkdbAs+ZpU_uQziXmz2inPG7VHD=746MmjmR8iY3szfy9+w@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] gpio-sim: configfs-based GPIO simulator
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 7, 2021 at 10:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Hopefully this will be the last iteration of this series. Just some
> minor changes requested by Andy in this one.
>
> Tested both with configfs as well as device-tree.

This patch set:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your perseverance!!

Yours,
Linus Walleij
