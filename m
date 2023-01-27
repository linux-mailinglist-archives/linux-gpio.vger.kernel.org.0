Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484A767E08C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 10:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbjA0Jnv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 04:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbjA0Jnu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 04:43:50 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2598B68100
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:43:49 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id 3so4714096vsq.7
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6URuAWWe31FI6BT+wn84Rh6u1A8R/urt4l7hB1De8lU=;
        b=X43Dl44/ieP/6a2TA3QdPOfcOHR1A1wRypoV5XOyptY3OzK4sxHAFZR1/XIaBiOp3t
         RrAmx6fz09kGxq4Dhta2j1bfCm2OwBj47prf1IuJAvnrxN2lQ+sM1bfb8MrXlhUX6uht
         vjs+B3p4+DDtBVJ35ZCy4ot8wihzimKPN1vTBCnbQ+jdkb7/mU6XhDgJbLiwVRhcP4R/
         /8Y+2W0kNsCQZES9zJTkibAyLNAMKDjhmdAbLk93bcISxSQr3HlbJ+U4sEE3k7usNfAk
         mRKNvCRKpwFTURHyTs1nL31QvjjD/7QUwYBBpSLok88Rm71xUWH1XA0TNCOQvHqzJpKK
         cnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6URuAWWe31FI6BT+wn84Rh6u1A8R/urt4l7hB1De8lU=;
        b=bJQ/zot5SiyedWxqsSnfbcD2i4CsgBqPi4xhlPwW1sXw77JFUG/x2OP+rk9Wb3l1JL
         7gVTlqQPbTCPvSkPo8IBlKcKbKz6sk20iRwyD/5B/Zhr6POIKxSUnwZ2G5xL/76rmO8D
         FU8XxM/fxMfMwZilWwm6yfMraCM/gNpnwREyPtIlKGpEU8gwNcBalYYR8yQgi6hRBpaE
         TUfYM88fJgr+r8haW7EspimE+k7m9Huyq9tyjcLQ57Kkjt6zWuzyIUQ0JxQe+FZZC3WN
         gvpFfDuSeuw1X8ZabHwQAn9Lf3bhrs1AXXadZOkHd8Uf8MSKJC6ZC9DbDUZC3JO9jydk
         f4Aw==
X-Gm-Message-State: AO0yUKVZoGa039WAM+eUcWQehcKLUXLfRfvP9admzP0/MbFOZUzPRkMx
        kVubpMQlfFtkezDD5kvezMNjEHt1z5YEPK/hGPjF7Q==
X-Google-Smtp-Source: AK7set+cEzxawPln51thqHLl5XxJdcbCuYFylCD36kE2/XVQT0h6c2GvbPp4qAm0R9C/c9UZAz1n3s3PKd38sqQEgyA=
X-Received: by 2002:a67:f114:0:b0:3ed:1e92:a8ab with SMTP id
 n20-20020a67f114000000b003ed1e92a8abmr402802vsk.73.1674812628267; Fri, 27 Jan
 2023 01:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20230126132801.2042371-1-arnd@kernel.org> <20230126132801.2042371-9-arnd@kernel.org>
 <Y9KJpU4rynmTdQMj@smile.fi.intel.com> <21657e6c-1101-4c56-91e3-6b2f6f9e10c9@app.fastmail.com>
 <Y9OQ9/3IuVIU8VK7@smile.fi.intel.com>
In-Reply-To: <Y9OQ9/3IuVIU8VK7@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 27 Jan 2023 10:43:37 +0100
Message-ID: <CAMRc=McAAwdtCo9VCFtSuQm9hDRVWHZUQe+tMC9Fec=1YhJ+Ng@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpiolib: move of_gpio_flags into gpiolib-of.c
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 9:53 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 26, 2023 at 03:47:42PM +0100, Arnd Bergmann wrote:
> > On Thu, Jan 26, 2023, at 15:09, Andy Shevchenko wrote:
> > > On Thu, Jan 26, 2023 at 02:28:01PM +0100, Arnd Bergmann wrote:
> > >> From: Arnd Bergmann <arnd@arndb.de>
> > >>
> > >> There is no need for this in the header any more, it's just
> > >> an implementation detail now.
> > >
> > > I have published
> > > https://lore.kernel.org/r/20230112145140.67573-1-andriy.shevchenko@linux.intel.com
> > > Can it be used?
> >
> > Sure, I added a Reviewed-by: on that now. Your patch will conflict
> > with my patch 7/8, but we can work that out.
>
> Either Bart takes it independently or you may attach it into your series.
> Bart?
>

I applied it to my for-next branch, is that fine?

Bart
