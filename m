Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDD75632E6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbiGALu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbiGALu7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:50:59 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532137B357
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:50:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id e2so2653610edv.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyQeznPQ3vinDWmATOmVWGjNnGlxn8MSK8bXY75HTf4=;
        b=I48ndf2IWnm/AqKC8eDSmh/n2+2UWlan6pUzhqp1rejVSbVN7WblvxHdWTCcQJYDl6
         JYKvPgTYrxOFkhbMM/Na5idIrj/70benmT+hS7uHahnux/qtjsfXGbmtAGhdcEIh23jo
         MqI0+Bri/hFgxEED0cooJzFqmHfYfj5OlfTQVH0+h/tPHs5c7tibnu/3SOKpJYoHdTEw
         S1U2/1trIxL89IttToLQF7VkCO3ClLzb61y45pQBTSLRGghwQhA4oD+5EEPh5/c8BXIW
         0AYkVjmGvzJMGqcnOB0kEyKpCfjcJm0DuHjbuYRadFFZTVfDMRIrMydnFr+kiHHz2b5V
         kw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyQeznPQ3vinDWmATOmVWGjNnGlxn8MSK8bXY75HTf4=;
        b=hz33LRx+RyDNAew+UcDNyQ/LFV7uYsiBRBx29vw2Nmvd2zXTHhRkLh7K7MxWXFyvch
         XN/wkHYOIgciCcqCfBpzNAO4kEXpOcxxwC9iaX1V2barzsw/oE2XSnG21Df7iIc3mXb1
         I0WXt4iWsyNYaXx3aFrlwwMIkR+8qxbA0A5s5T4o0ekdeG2pbkIQGQ1FmDs2i8rxfp7N
         NFEYwncge+mGeDGtgYJAds5jopFsOZvsrtjsIEAxf4DHk19h0nnJSAJiAcNiqNuByUo8
         B1n46nfXoOALNpnFvOVxAmNnFEfReYfZR5p+R/kUYFKv4uwFqce3ZhHekzp/c0qfWI+4
         ZPCg==
X-Gm-Message-State: AJIora9Xez9kJwUXkl2PpvT2lSqbIeAM5IkROcUosn1RXbNoGrGX/dWn
        uzpZim7hxGvBMmxpUYE/R1rfKJNfEbdJ/xVB60xUcg==
X-Google-Smtp-Source: AGRyM1s+TM/Mpvv+C7F98EwHOUR0bNqHN7CaFoa/LBJ1GU0R5hrgFhAVIM4QqUpnv+9HDfHwdQkqAXu1iKZTKzMxivg=
X-Received: by 2002:a05:6402:150:b0:437:b93c:3a9 with SMTP id
 s16-20020a056402015000b00437b93c03a9mr17749677edu.82.1656676256879; Fri, 01
 Jul 2022 04:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110056.58502-1-brgl@bgdev.pl> <20220701114351.GA41317@sol>
In-Reply-To: <20220701114351.GA41317@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 13:50:46 +0200
Message-ID: <CAMRc=MeNfO0-1sn8a4aPpb2tskueVMT=oALbx+VK0x0_yGo-fA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] misc: make gpiod_is_gpiochip_device() not
 set errno
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 1:43 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jul 01, 2022 at 01:00:56PM +0200, Bartosz Golaszewski wrote:
> > This function should just report whether the file indicated by path is
> > a GPIO chip or not. Let's rework it to not set errno. Failure to open a
> > chip should still report errro numbers like before.
> >
>
> This is will break my tool patch, for sure.
> My gpiodetect uses the errno behaviour to give a clue as to why a chip
> might not be available to a user, and that work was already done in
> gpiod_is_gpiochip_device().
> There might be other places the errno was propagated as well, but
> whatever, I'll sort something out.
>

Doesn't it make more sense to call gpiod_is_gpiochip_device() and then
if it returns true, just try to open it and then report failure?

Bart
