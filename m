Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5523CB4EC
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 11:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbhGPI7g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 04:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238357AbhGPI7g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 04:59:36 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25B8C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:56:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id oz7so10245220ejc.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vyNRidzcmXecceSj2i/ZFzcStzyiUAWy+Bk4YlU5Z6Q=;
        b=wc/j1XY/2eKV86sw5mf3gPAJQJd9Nl9dJiCnnVckVbU3sYyHjuuuwOR2zYjV3LSHbt
         W8ckBs6FPzkOITA4GT/Fah/5UUhNPOB6xz2SqRZyJSUIO+fvTfYO0qMHF6pBVR+Ta7Ml
         vt+/ZSAYBCYo5NLl1O7rQ912UMbwhPv3zmtVT5ZhJyEBGwtIb/lCpwelrfNcPmj/wc24
         ItcAnfgHbFmxbfV7/uVkGwiR7aUxGFl/Ygl/G7m/UgHlJGF2WovJyyS5olTBXewulzVO
         BHywu6TXu2xkmBr45TLo/qLidOhhLUT00shZzBjRm1fRCSd5BFsI7ToLvbsGZbRVOEGs
         pfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vyNRidzcmXecceSj2i/ZFzcStzyiUAWy+Bk4YlU5Z6Q=;
        b=gzesjz7mkIMxFaPIrXX44uufXl62K28BqxR8nMPt8fmuDDcwGoZ7PcpUcZ5txDirG4
         MR93odyxMaV5pByd9H+30/8FM/sWl2UNNMxbiiN6mCNrWlrgWJygrEN84D8RjuJ8PG+9
         opHxT5o/28lRL4+zYAtGpwhtmilJPadr4TN/VbmP1XtUJod7VBV/fNDnbsCAn72RV8ec
         jFi8FgE5LTbXpUI62JKEumqCsbjU746vxfo7WlQmoMFCog8ah47UBxYRjOykL071R8EX
         c6jUvLWsekbZ4Mq7WmhwU2yiW3sj4XYsdyMuOWDS4+/Z49CGg0EHEHgFein5Ce7+4TqS
         picQ==
X-Gm-Message-State: AOAM5312Nz4hJiAN8aay5tCKzAB2UDTYvo5YUKFTXkiPcAWES16RLdv1
        UTcB6VSM7QimfKShSo/wyoP92B8kcMP0Hmy2t1Tyug==
X-Google-Smtp-Source: ABdhPJwpk1h4Z0oOzFo2JIQLFq6BgEq9/CecLN7ddVMzxX4pe+dpRlfAVi3Qi0kg4113JU7BzMQ9g9J+pf5WWwrqdIg=
X-Received: by 2002:a17:906:31d4:: with SMTP id f20mr10317768ejf.383.1626425799569;
 Fri, 16 Jul 2021 01:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210715201001.23726-1-brgl@bgdev.pl> <20210715201001.23726-4-brgl@bgdev.pl>
 <20210715221803.GA16338@cephalopod> <CAMRc=Md0DWKBT0BJGdKDdhTN0gG3Jc4Mf71xUnYqqhxRPheR7Q@mail.gmail.com>
In-Reply-To: <CAMRc=Md0DWKBT0BJGdKDdhTN0gG3Jc4Mf71xUnYqqhxRPheR7Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Jul 2021 10:56:28 +0200
Message-ID: <CAMRc=MdjjX0z=9hwvbE9mcx8J7twhb-j6yFFJqpqdZB1vfkHEg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 16, 2021 at 9:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Jul 16, 2021 at 12:18 AM Ben Hutchings
> <ben.hutchings@essensium.com> wrote:
> >
> > On Thu, Jul 15, 2021 at 10:10:01PM +0200, Bartosz Golaszewski wrote:
> > > This is the bulk of work implementing C++ bindings for the new libgpiod
> > > API. The tests are not converted yet but the examples are fully
> > > functional. More details in the cover letter as this patch will be
> > > squashed with the one for the core C library anyway.
> > [...]
> > > +class line_config
> > > +{
> > > +public:
> > > +
> > > +     /**
> > > +      * @brief Direction settings.
> > > +      */
> > > +     enum : int {
> > > +             DIRECTION_AS_IS = 1,
> > > +             /**< Request the line(s), but don't change current direction. */
> > > +             DIRECTION_INPUT,
> > > +             /**< Request the line(s) for reading the GPIO line state. */
> > > +             DIRECTION_OUTPUT
> > > +             /**< Request the line(s) for setting the GPIO line state. */
> > > +     };
> > [...]
> > > +class line_info
> > > +{
> > > +public:
> > > +
> > > +     /**
> > > +      * @brief Direction settings.
> > > +      */
> > > +     enum : int {
> > > +             DIRECTION_INPUT = 1,
> > > +             /**< Direction is input - we're reading the state of a GPIO line. */
> > > +             DIRECTION_OUTPUT
> > > +             /**< Direction is output - we're driving the GPIO line. */
> > > +     };
> > [...]
> >
> > Could these be enum class types, or does that introduce an ABI issue
> > if you extend them later?
> >
> > Ben.
>
> I'm not sure there would be any benefit to enum classes here except
> for longer scope when using them in code. I would prefer to leave it
> this way.
>
> Bartosz

Actually after a second thought, it wouldn't make it long - it would
just look like: line_info::direction::INPUT instead. Maybe it is a
more C++ approach after all.

Bart
