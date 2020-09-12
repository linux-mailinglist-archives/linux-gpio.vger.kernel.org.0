Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9893F26792A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 11:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgILJcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 05:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgILJcI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 05:32:08 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7A3C061757
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:32:04 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so8304204lfp.7
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2+1+lFS9e2x2hBzwkej0Ucg9+b0mRnWv3h+Nk0VEhc=;
        b=F/LmfzKwVmJGkJp8JUKJpYXw7183G9gmer0hMVh67ZTsQ3b2QfirEOW54AH3eG2BH2
         Khz7k36m/ev0ExNW1uA24WxPUZMDwc21qZm1Feg0Dlg/TfuudGRjyyi7isasXA9Z+frM
         Iu/H0Q/kd5+ijGvHn4tL7TFHZE9oL2IEENJY53ZMhkO95nsnaI0ggb5ZonK7Ccf0kA5A
         f8CCvMxbcRkmwzhw3gwABj9zu8fRVG7v148Coc3ZFEuViHOxT9wBctYMe1CLT8JmIp3j
         PMeOSC+WQfeRlmktm3WdzgWvhQ4xpa4TancIkG1+YyetUplCXw/y4ousBXiLniACsGY+
         Nknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2+1+lFS9e2x2hBzwkej0Ucg9+b0mRnWv3h+Nk0VEhc=;
        b=pOVzkdXYqg6Y4tMgTodYAAuleMfGWZbZIowlDpNkL5FLfAe6kTU4WaMD0orXpyHJmH
         jhugpmEyUu6423XuuUHdXbygd/98A2lAA3r+1Q1zIKTT9vRV6LI4Po7BKR7Xu37W2H9R
         +xnhqMHPT9pFcJYhBdUYXJABY2dv6p/PTxSLARhhkk1YsbXmnZbXCTITWiAaNlXKUOy/
         A6LWtZBfC/yuSEogSBVx3IYtKO15+onu3sCoR1d67Bsy2vQuk277Aj2bSRuxa9TANk6B
         DILvxcpFKW6RqAq8k/uJaowuzy1ImQ2SSseIKWNV40nq04fRhur+i/pFAHv/08sBrKY4
         1yOw==
X-Gm-Message-State: AOAM530sktWLgurBW0OiNzgMsfrMl9NM3qJ+v1Gcvc8d470FdaHnOh5y
        Uf/y4kBfMsOuPPGpuWHeV67Dt7Pn9/VwUFQQSW0pP65VZJI=
X-Google-Smtp-Source: ABdhPJwA7lxb97H7/GSEpzY7AhqxbEl9kOazDzHAzC46vevwdTRefjbg4JQOpNxmfn2dwH+RbV+Ka8hs2iFnFEUNQ9g=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr1380440lfb.585.1599903121665;
 Sat, 12 Sep 2020 02:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
In-Reply-To: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:31:50 +0200
Message-ID: <CACRpkda3fz8mnROr1Rx3o7k8=90yRjDV3wS2qqutv-5YxKdWjw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mcp23s08: Fixups for mcp23x17
To:     Thomas Preston <thomas.preston@codethink.co.uk>
Cc:     Sebastian Reichel <sre@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 11:32 PM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:

> Hi again,
> Second round of these mcp23s03 driver fixups.
>
> Changes since v1:
> - Split up the fixups patch.
> - I'm pretty certain the "mcp23x16" structs are typos, so I put it as
>   0001, because the second patch doesn't really make sense without it.
> - I lost the `(MCP_GPIO << 1) + 1` changes because the regmap handles
>   GPIOB 0x13 with `.val_bits = 16`.
> - Dropped the interrupt-controller changes.

Patches applied!

Yours,
Linus Walleij
