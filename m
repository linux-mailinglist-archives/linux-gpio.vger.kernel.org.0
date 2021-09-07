Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B77402F49
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 21:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346449AbhIGT6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 15:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346464AbhIGT6D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 15:58:03 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5805CC0612A5
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 12:56:50 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id p4so41019qki.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B/Edk4LBvfx9KZTPxI+wCQZQrNHzI91hTxxTHmpXYcg=;
        b=THT107TMWHUXrfqR+8kWpmGAqYj44+aNM71kA+mDhbI2QpWNQIk+F1tRBpCciU3r/b
         FrA2/GjjdY79cFGVTuDVK/uPHa8nM0wVqY/8xTWcnuvvXowj9W04bJap+FlPfduTg05d
         kk6PAVx5GNvDpX473oeEGMCASW/rfguG4GYr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B/Edk4LBvfx9KZTPxI+wCQZQrNHzI91hTxxTHmpXYcg=;
        b=IshzWwfy7Lo+DNptXk7Q50Tyo3CbsLQR3CaMQBE1t9o2nyDZPc3MwCPbeSyzvTnTRE
         F2e45p799/E1MGsDIY2jirdC2NcJ8U3zLy0qK2pc3MXG3guWZL3wtQx/a4gcHw6fCy9H
         P/TaC5N2k7cVVIqZMGuKDUeP/oFouEoExVIxzja7IANyx7vib3mjq5pQXqSdJ2Up1RGQ
         xlnHob3j5kf4F8PLzxM5/84CWO5AzRbSh7ke0EFlkxbQ0M11bY+6H6TnLMFK4U5BOL7J
         zFaa/hUtykcxiKsxVdPJBjWwMDPZqFu3h9HgTg3/mkMbGY4vNpZ+tvhcdGZSmsFRIyA6
         hafw==
X-Gm-Message-State: AOAM531ULQ5MsAsnVttwpK4hoMcHN6AsNbnk5MIde/zdPT7ApOZho663
        Qm5MqpKUA1RsPXrExWx5n12JoQ==
X-Google-Smtp-Source: ABdhPJxAnNBJwxIS/AdEwBflPdiomQ4uO4hxydRTqQWkwIZmInKPj9+HszAE/vWgBXHSlBs5TbpAMw==
X-Received: by 2002:ae9:dd43:: with SMTP id r64mr17060789qkf.225.1631044609470;
        Tue, 07 Sep 2021 12:56:49 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id l13sm17947qkp.97.2021.09.07.12.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 12:56:49 -0700 (PDT)
Date:   Tue, 7 Sep 2021 15:56:47 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     pr-tracker-bot@kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] gpio: updates for v5.15
Message-ID: <20210907195647.jutizso7o2r4mddj@meerkat.local>
References: <20210907083613.31268-1-brgl@bgdev.pl>
 <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
 <163104361220.4526.774832613459764535.pr-tracker-bot@kernel.org>
 <CAHk-=wgAi8jHOFuk8iqXsL4Aekst996HGeN18aKQhXd-qu2dcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgAi8jHOFuk8iqXsL4Aekst996HGeN18aKQhXd-qu2dcQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 07, 2021 at 12:49:03PM -0700, Linus Torvalds wrote:
> > The pull request you sent on Tue, 7 Sep 2021 12:36:25 -0700:
> >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl refs/heads/master
> >
> > has been merged into torvalds/linux.git:
> > https://git.kernel.org/torvalds/c/9c23aa51477a37f8b56c3c40192248db0663c196
> 
> What what what?
> 
> Konstantin, is pr-tracker-bot confused?

Failure is always an option. Let me poke at the logs and see what happened
here.

-K

