Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1041029D4E9
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 22:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbgJ1Vz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbgJ1Vys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:54:48 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EACC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:54:46 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id r9so1109315ioo.7
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMdQrK37mtSB6EQ2B228uPQYMX3FyYjxsHYaiWDDqyY=;
        b=hj9k4SLtEAGcw8dCW4wHi01gTLUIYrdCA3RdIVLh8TdPnEU5n0uyQVpt+vODtkTGmd
         wQT9U6kdtajS2vx5kijqMkJPHKet46z1X+2sHUP8TgZ6U0Q9gr8TXF71sePTNfSamgwR
         MUVdTznZTKEiMPbBD7p3jMNh3LkBnr1SO5IqPZtK7BsVVliEYkCqLemRAQ9kMdUBod/t
         bEJyIvZkGps5w8FeWnvW4RVdPdiDJ+DrsDJlBg5QNHZ+DQYJrTweA46kIAawj+CVciu1
         IFYPi0hme6p8e3vF/pg4GmEI24suI38DuYd/wy+yy9EHXxe910c/uiR8OGD+WmBLbyEg
         vbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMdQrK37mtSB6EQ2B228uPQYMX3FyYjxsHYaiWDDqyY=;
        b=kjiSKBNtWkhxBzG/JKg4PoOkzE/rbcIn2guZ5b6oQl5Qohqp+TSCuByyc5YKSztbkL
         pJ9z3oOL4IQ4fnYE3KGGVN+opx9uJV+bGhs43N8se6s3vy9h5SUUHn8+KwBioDsgx01f
         FaGQhDT3auzCZFNPPTpmVLR6O99yr8ERk0xVTvEYXSFmBrcQw2Rn20vyUMuFiWSendmC
         SKbsfBLtn01HfNYQp8B8j7mtUu6/hzvJVu1y8wo50hYFPjoiPEwA8lrDljg9OVkBj5SG
         1ZR3oI3Ib6ZEx4NBaapVpjdOtbJrLQ/sSUxzdJPVZuL1v37CgmzTLMOy2QYY+ICN0U5V
         5NQA==
X-Gm-Message-State: AOAM533luGOeTzw5mLSoC3HpH5JHQZQHOELnwySX1gY6Sq1DQOfM9YB9
        EKIUx9ZvD/lLwdj/VxsJcwFUE8Dfsem45l/S8LhdH4iH20Q=
X-Google-Smtp-Source: ABdhPJwEVSK4xvmtlrp4xUBgAaeLEUFNpG8UjjI9rwY6iCquhULuJjtRs4YhFJJnL2FIYJ523qRoySUIxuyd6M7pon4=
X-Received: by 2002:a92:b610:: with SMTP id s16mr6895872ili.6.1603902422100;
 Wed, 28 Oct 2020 09:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201027091715.8958-1-brgl@bgdev.pl> <20201028093928.GA152368@sol>
 <CAMRc=MeyFR450u7=LUhGNqs7jKv0PAduUAHvM-um2SjfEMRQOw@mail.gmail.com> <20201028150322.GA221014@sol>
In-Reply-To: <20201028150322.GA221014@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Oct 2020 17:26:51 +0100
Message-ID: <CAMRc=McvhpgKdyV4W8pN6cy5UyQi2jZWvaTPKBDumo0YsMefrA@mail.gmail.com>
Subject: Re: [PATCH v2] treewide: rework struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 4:03 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Oct 28, 2020 at 02:19:05PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Oct 28, 2020 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Tue, Oct 27, 2020 at 10:17:15AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > >
> > > Subject should be prefixed with [libgpiod] according to the README ;).
> > >
> >
> > Oh come on! :)
> >
> > [snip]
> >
> > >
> > > If you replace the gpiod_line_bulk_iter_foreach_line() here with
> > > manually looping over the bulk lines then everything from A to B above
> > > can be dropped.
> > >
> >
> > Something is telling me that dedicated iterators are more elegant. But
> > I guess we can do everything manually for now and see about that
> > later. Fair enough, I'll drop it.
> >
>
> Good thing I'm here to let you know that little voice is wrong :).
>
> I've got a couple of commits in my working tree[1] that apply to your
> patch and drop the iters as I've suggested if you'd like to compare.
>
> Cheers,
> Kent.
>
> [1] https://github.com/warthog618/libgpiod/commits/for-v2

Would you mind if I squashed those changes into my patch?

Bartosz
