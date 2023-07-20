Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB76075A924
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjGTIZ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjGTIZ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:25:26 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D442D2684
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:25:25 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4815b8b341bso234660e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689841525; x=1690446325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA2tTm4sGlKjRSkuaCkbPBOaVNqcwWGwpuGlzJrz08o=;
        b=qVzuN+K1A2BMTe7kNQ/2ttG+pjn/eyRDtD5SIC14oOitPz0KZ2p0AiE5YWs1yRe78m
         B/0lekF0ZRk3JZCBTwm1UVb4o0ctoXrNz2rTOjWRQnznpT8ACvqPm3fuCKjMjV4ATXuk
         Z1efK7Q12sAkcmhxLHerFUfiKit0y2f/9OBXMWu2ec4vBk9/U2b7gql37tTvF7GkiaGp
         cACA1w4YkOwm6SkHos8CfeUy9Id9cuqGqJYvIdPSZiUezllavWJhbBIdjpP7FRxIP2w7
         U9sIHlGcezSdstY3fm4Chw5y4SfR9s9/fFi/Be35YcIpI6c1Hi33fzf8bJm7nMK3ibJZ
         jsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689841525; x=1690446325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA2tTm4sGlKjRSkuaCkbPBOaVNqcwWGwpuGlzJrz08o=;
        b=RMEVDv5zUf/Q6YE5VswFrARW8vPGdpS0hka8q1UycT3fkLCt9Mk0tankcwZ3HYZ6PJ
         3bOsK0XXvVmnwwfwix20/Wv8h++8Gfc4XDEQ58BTgGR0Rc8hnxYk0JQV8lVTb+5Ihw5F
         wjTqEPoDy51p+G1JKwdtL/EnXPwFOslg050EhL4ZZRoj/F4t7ROKW2tq0icNf+GkSzbH
         2n4Jo3t7r6LhEHkCzAQdEcvKDv/FePezxTqrYfvq42RS16u9x2ieIOczTikkesF5Vvkh
         6pLEoQ3mTLaCfk+dWSoqtNXi1JcVd+RYnGVJckQUQIWvyjNX2RaxNK0SqYGLjV01Pw4L
         Rdcg==
X-Gm-Message-State: ABy/qLZJ7OTfC5/WtHaG5GDH9c9yLsz/F4HxHtJa2ZHRStx2LqeOgxfF
        9jjnuwA8t9E0Vindq+cqpkQyy0zM9Uu9MJCBU+GtSQ==
X-Google-Smtp-Source: APBJJlEU4yU3Qe8DQdu+zckm56QUS/cgYEWA47W9HNyFw8ZBdiWa6Usws/E+JjoIdNpVpPUHUpiPEwsxckkBOEm11TY=
X-Received: by 2002:a1f:5cd7:0:b0:483:9adf:af19 with SMTP id
 q206-20020a1f5cd7000000b004839adfaf19mr5737175vkb.2.1689841524951; Thu, 20
 Jul 2023 01:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192057.172560-1-brgl@bgdev.pl> <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com> <ZLjqtVcTCcStYac4@sol>
In-Reply-To: <ZLjqtVcTCcStYac4@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 10:25:14 +0200
Message-ID: <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 10:05=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 20, 2023 at 5:27=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > While working on the DBus API, it occurred to me that while we can =
obtain
> > > > the list of requested offsets from a line request, this information=
 lacks
> > > > context if we cannot get any information about the parent chip on w=
hich
> > > > the request was made.
> > > >
> > > > We cannot reference the chip in any way as its lifetime is disconne=
cted
> > > > from the request but we can at least provide the path to the charac=
ter
> > > > device used to open it as a way of providing some context for the o=
ffsets.
> > > >
> > >
> > > No problem with this conceptually, the only question I have is which
> > > one of these should be stored:
> > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > >  - canonicalised path e.g. '/dev/gpiochip0'
> > >  - chip name e.g. 'gpiochip0'
> > >  - chip number e.g. 0
> > >
> > > In this patch we get the requested path, right?
> > >
> >
> > Yes, I think we should just use whatever filesystem path was used to
> > create the chip as it would be the one allowing the caller to reopen
> > the same chip.
> >
>
> So there are instances where those four don't map to the same thing?
>

Not in a typical situation, it can happen if the chip was removed and
another one took its place which is very unlikely.

I just think that we cannot have any "hard data" as in: a programmatic
reference to the chip in the request (their lifetimes are not
connected), so the next best thing is the filesystem path.

Bart
