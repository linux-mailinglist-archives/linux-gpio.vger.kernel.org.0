Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E20D4F019E
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Apr 2022 14:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354095AbiDBMtg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Apr 2022 08:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344635AbiDBMtg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Apr 2022 08:49:36 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0A13AA69
        for <linux-gpio@vger.kernel.org>; Sat,  2 Apr 2022 05:47:43 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g22so5914362edz.2
        for <linux-gpio@vger.kernel.org>; Sat, 02 Apr 2022 05:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vkpbdzVpQAl3jTBafv6YVoKedWIYTHsfB1sNM0JAekw=;
        b=R4gjFvTi+8P+940w4HfE86Um9ZRzYoXLHuLyHXLoiZqtDPgj7Jcxdj+C7at1JGG5Qe
         Sf/yQaw+CsbkX9SZ0R4m2MPdbHt3oLPYWBi/RD4s7b9yeZ2OfrJkWOLmGKJC2qxbivaF
         pL/9sWMvVVnnRfcSHzEaHTsPj5HHRBBaHBQ9Og8NNHlQH7giWq/Wv8ba09JMIXActfJk
         63SSkVSVNThv789TTjpS7oVMcVrxiMrHdxaMxCmWijUlIr0PsR72LkgXo/f+tON0jBDo
         g3MfD1PkVZtGrlrVKYkOlg7N73adCPieo3NMgYQOMqf6/tt5K+dX7Ydjh9ahHbsh6KpF
         JrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vkpbdzVpQAl3jTBafv6YVoKedWIYTHsfB1sNM0JAekw=;
        b=JroJGg8UuXZHc33XwSwSo7c0wmmz8ia4H0hVCEN/cdWlFJULLiGc4JA4O64/jx75BX
         aXvUeu5W6u79k7Dkdm86kA/S+KYgAY8DsFQItg65yXWDFJ1ntx3Ls3Jxctop5fLtA2/j
         SoYbOa829rrD8kEm2IZx0cyP2AZ5LsDGL+Afz2OlMLbs6DrqlP6x+29vJT1eg5KRlPv8
         fKt6LkJ1vaPwboh8TucUGAEDQ7mA1KexU8k2hSHmgxKdw7g8DCQr6tZiVhmcOmim1KMB
         cfp2LzhnJTVEccZO1rjswvJ4/ZcxLRr2bR26eQepmlVD1bGvR9MWaEAb3nJQbby2U0yn
         yl4w==
X-Gm-Message-State: AOAM530mczGOS2S/P/SPgNdCd2pGYU09OGdHP6KpTVaKHbLAKQr+H1mm
        6afU/AaGRH76vVXpjg0z8uHhUMU8/SY7+qr5AM/kh5Evj6nT5Q==
X-Google-Smtp-Source: ABdhPJzfzK6rR1Dl2jdDtHsjXkgw0B4Ar9sPd+9E7bsJOUPVsObVK4OMRB3pTK5dqScqulsUdGt4Jx3npoqW0+pKRqU=
X-Received: by 2002:a05:6402:1259:b0:418:e674:5718 with SMTP id
 l25-20020a056402125900b00418e6745718mr25313564edw.69.1648903661882; Sat, 02
 Apr 2022 05:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220331011141.53489-1-warthog618@gmail.com>
In-Reply-To: <20220331011141.53489-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 2 Apr 2022 14:47:31 +0200
Message-ID: <CAMRc=MfqgEozMGR-24O=Eeoo+v2QYc8n_NHPb0A7GYDL_1bL=Q@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 0/4] core: add gpiod_request_lines
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 31, 2022 at 3:12 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> In my review of the CXX bindings I suggested a top-level version of
> Chip.request_lines(), and possibly a C API version as well, so here
> is the C version, plus a couple of semi-related tweaks I made along
> the way.
>
> The first patch adds the gpiod_request_lines().
> Patch 3 migrates the appropriate tools.
> Patch 4 minimizes the lifetimes of objects in the tools as I've
> previously seen confusion over how long lived objects need to be.
> Patch 2 is just a rename cos "inexistent" looks weird to me.
> Strictly speaking it is fine, but unless there is a problem with
> using "nonexistent" I would go with the latter.
>
> This series may be require my unsigned values patch.
>
> Cheers,
> Kent.
>
> Kent Gibson (4):
>   core: add gpiod_request_lines
>   tools: rename inexistent to nonexistent
>   tools: migrate to gpiod_request_lines
>   tools: minimize object lifetimes
>
>  include/gpiod.h            | 15 ++++++++
>  lib/line-request.c         | 17 +++++++++
>  tests/tests-line-request.c | 73 ++++++++++++++++++++++++++++++++++++++
>  tools/gpio-tools-test.bats |  4 +--
>  tools/gpiodetect.c         |  2 +-
>  tools/gpiofind.c           |  2 +-
>  tools/gpioget.c            | 25 +++++++------
>  tools/gpioinfo.c           |  4 +--
>  tools/gpiomon.c            | 16 ++++-----
>  tools/gpioset.c            | 18 +++++-----
>  tools/tools-common.c       | 50 ++++++++++----------------
>  tools/tools-common.h       |  5 +--
>  12 files changed, 164 insertions(+), 67 deletions(-)
>
> --
> 2.35.1
>

Ugh, I didn't respond under the C++ review in time before you spent
time on this. :/

I don't agree with this change. For C API I think the intention for v2
was to avoid having all kinds of high-level helpers and limit the
number of functions to only those that are necessary to fully leverage
the kernel uAPI and this one isn't necessary. I think we discussed it
multiple times and agreed that the C library needs to be minimal this
time.

For C++ and Python the issue is irrelevant because you can do:

auto request = gpiod::Chip("/dev/gpiochip0").request_lines(req_cfg, line_cfg);

or

request = gpiod.Chip("/dev/gpiochip0").request_lines(req_cfg, line_cfg)

respectively and achieve the same result while still using a one-liner.

Unless there's a *really* good reason to do this, it's a NAK from my side.

Bart
