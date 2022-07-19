Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F895794CC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 10:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbiGSIDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 04:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGSIDc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 04:03:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832AE286D7
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 01:03:31 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id m8so5051664edd.9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qUssEChQuwpiwUeyFYSOdlIgFZfxU+RbqNsZ8mfqrbc=;
        b=tzgHZY9F4XUEf5LUJRY1/iD2qRw3u1cRlsx1CU6FWL5fWdJ+OOzreVaNmzqQ9ymhOf
         q819ZVGU63OI1u+bzJ3wl8QhWQWuKC5/dzNYrZpGBRQlf8zmkUPk4frzrG1Lc2LxiNIK
         gMXh43zq0QS74zDE2O8aBzbmF6e31UCmn/El6PwrgFgi4BA3EdmlDcORGybWV3qkNAWd
         vMx16nOVU3gKI8VGLis1GakqhMDYZGlZw3H+uTbso02+jgv8FpmmcKBINIa+QgU47lKu
         nVXh2wcjjeBhoLNAtviJ0DBU6cpPPnW3EfTzTRzLCLT9wZMDK2460t+zREK6C2bKfWWo
         jnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qUssEChQuwpiwUeyFYSOdlIgFZfxU+RbqNsZ8mfqrbc=;
        b=MJWBuNrH1rxdBJepOHxvRpIbhpOXos8rNOlufUI3VgUg6x2IzqHMrgS/9e8lZlUsA4
         NBSvXgPka/finfR5y3peAWaaKD9fFqPDSzp4tqYGbWlBXNEzwussikxgHO0gCV6QlXy9
         ZsU2CfX5uJinn3PwqoUw6v6b+w0X6gvwHajUgMsn+YR7dcIDlkUN3t3T/G/KqyWQxpn8
         +DHvddmXhzGytHwQFMPav1KhaUPq/CDPaephNMjeDsVsdN4o/rNO5TAh8k95oLAeSKBI
         4V8PwfqJ6nW+645n7fvyJcX3//lDAdfmblEvYfeoHa9kIbDT+2DNayb+mEOsZHnSSCBD
         Kk4w==
X-Gm-Message-State: AJIora9FWYtjuhm3sX4GjgCzsEADPjHl7iv7X8ER2ANMTDYfKFcDXoiQ
        SuM6oY3orRK+jSn5Qhi2XVadZvxk0gkSyP3KIdPb1Q==
X-Google-Smtp-Source: AGRyM1tyDhOckHQe/dGpY9K+LRxtBUnBuEg7EIc4fUoEZkGIapYvFnhaJVYTS/7T+cuSr10df3iP53TGFuFZMPn4KaU=
X-Received: by 2002:a05:6402:42c3:b0:43a:46f6:ebd2 with SMTP id
 i3-20020a05640242c300b0043a46f6ebd2mr42848042edc.213.1658217810011; Tue, 19
 Jul 2022 01:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220714020319.72952-1-warthog618@gmail.com>
In-Reply-To: <20220714020319.72952-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 19 Jul 2022 10:03:19 +0200
Message-ID: <CAMRc=McYTg8fvbDTmo=_wfXoM+_UpiL=+Yh=k5Onw6+zBd32ig@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] gpiolib: cdev: code cleanup following hte integration
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 4:03 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> This patch series is a collection of improvements to simplify the
> code, improve readability, and compile out unused code.
> There are no functional changes.
>
> The first patch is a cleanup for my recent linereq_free() fix. I
> noted then that the edge_detector_stop() could probably be safely
> moved inside the line desc check block, but wanted to keep that
> change minimal just in case.  It can be safely moved, and so here
> it is.
>
> Patch 2 makes use of an existing macro to simplify a call.
>
> Patch 3 replaces some more if-else chains with switches, which is
> more readable (YMMV).
>
> Patch 4 reorganizes the line identification code to share code
> common to alternate paths.
>
> Patch 5 consolidates a number of separate flags into one.  This
> reduces code complexity, simplifies any future edge source additions,
> and makes patch 6 significantly simpler.
>
> Patch 6 totally compiles out the hte specific code when CONFIG_HTE
> is not selected.
>
> I've based this series on gpio/for-current, as it requires the fix
> patch -
> commit c8e27a4a5136 ("gpiolib: cdev: fix null pointer dereference in linereq_free()")
> Happy to rebase if that doesn't suit.
>
> Dipen, I don't have any HTE compatible hardware to test with, so
> could you check that this still works for you?
>
> Changes v1 -> v2:
>  Address Andy's review comments, specifically
>   - Patch 4 move ternary initializer into a helper function.
>   - Patch 5 variable declaration ordering.
>   - Patch 6 remove obsoleted comment and tidy some if expressions.
>
> Kent Gibson (6):
>   gpiolib: cdev: simplify linereq_free
>   gpiolib: cdev: simplify parameter in call to hte_edge_setup
>   gpiolib: cdev: replace if-else chains with switches
>   gpiolib: cdev: simplify line event identification
>   gpiolib: cdev: consolidate edge detector configuration flags
>   gpiolib: cdev: compile out HTE unless CONFIG_HTE selected
>
>  drivers/gpio/gpiolib-cdev.c | 291 +++++++++++++++++++-----------------
>  1 file changed, 151 insertions(+), 140 deletions(-)
>
>
> base-commit: 7329b071729645e243b6207e76bca2f4951c991b
> --
> 2.37.1
>

Excellent work as usual, all applied.

Bart
