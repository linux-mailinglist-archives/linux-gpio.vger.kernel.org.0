Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF4C3CB7D4
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 15:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239904AbhGPN1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 09:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239391AbhGPN1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 09:27:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EC3C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 06:24:12 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id hr1so15182547ejc.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LnTIlz14bs7kHjCJfj3DwfovjklktHwzI8TQbal8cp0=;
        b=YXQhvx5yJ5aOhK1qi9zkyX8CjczHkLfUS3++M7E1lVEK1CYGoeCrPWsdC79hR6U1Xm
         B6nPifcInazAbiCSNnfjqyZTQEd5enxxrnUAxZk7cwHmGf3kJXyBwFbkYmvDh4T4whk+
         SY3oWmHT0TBu/I6Yg6QFN/P/2EftW13+xZnr2VgDn8eO+XR6tX86wA22xlohOIDLbbRu
         oaPt3gndNOlqvf6aFQ8zlEZLL1+OC/X0HtEZpvL6fBMHBxsMqlfyfXdzpQPEYE2NdsoP
         c6WwFewmMe5GJdoq8gJ7wl+lMJhDOx8MFmrLBYsmCPRbbzk+Xry/6glCNUiXBUNacoKF
         LE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LnTIlz14bs7kHjCJfj3DwfovjklktHwzI8TQbal8cp0=;
        b=BCTt3+6YAdkNJorA6JfZt/QsArUOAsVWy+hYoTKJKdDMPNNlxqV4PRAie/nq1Xx4iU
         iI6wMrGq0s0goHnLfET7yAR4kFS8lwxyEzI4MoQQxI2XuQn0DWrUOAg2PIr60qxz9JvT
         JtkjAUBDPvImdIaGmABEABzUkB9cMRafAhjHWzH8LEqtiZbd8RGOQTcdYMyOxk/sKRNZ
         weriv34XPKNbu4IiIwMNt4N9kZoueqn19uHY0Bro2lPXSO6TtFFyOlvYPeu+hQj5GjM9
         nlzMfb/DBpAqcBzTJ6k2XrwhNGFHECMerjZTUPCxl66EN0oUnaverXxl9EI9gXUsQAYm
         ZrEg==
X-Gm-Message-State: AOAM531Du4NJm+VoYGEEljtzP489c58gEhcMtY4HpRAtiOprELpKD7z7
        EQH4nznk9099vBB2TN4RZiqVTWCI7RBOSjOjMQXCG7OfMl8=
X-Google-Smtp-Source: ABdhPJxsll8guGH//bzGU2uz+6ScNEGFs0xQ7/gjd4zYgyz5V5sqC9aBQQpohSOHczi5NL8r7962jAyGux6GnktQTzM=
X-Received: by 2002:a17:906:4816:: with SMTP id w22mr11688063ejq.14.1626441851138;
 Fri, 16 Jul 2021 06:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210715201001.23726-1-brgl@bgdev.pl> <20210715201001.23726-4-brgl@bgdev.pl>
 <20210715221803.GA16338@cephalopod> <CAMRc=Md0DWKBT0BJGdKDdhTN0gG3Jc4Mf71xUnYqqhxRPheR7Q@mail.gmail.com>
 <CAMRc=MdjjX0z=9hwvbE9mcx8J7twhb-j6yFFJqpqdZB1vfkHEg@mail.gmail.com>
In-Reply-To: <CAMRc=MdjjX0z=9hwvbE9mcx8J7twhb-j6yFFJqpqdZB1vfkHEg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Jul 2021 15:24:00 +0200
Message-ID: <CAMRc=MegRa=zde8i7UivLDrSS8sKabDNdHcovE=PnP=N9i+kqg@mail.gmail.com>
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

On Fri, Jul 16, 2021 at 10:56 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Jul 16, 2021 at 9:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, Jul 16, 2021 at 12:18 AM Ben Hutchings
> > <ben.hutchings@essensium.com> wrote:
> > >
> > > On Thu, Jul 15, 2021 at 10:10:01PM +0200, Bartosz Golaszewski wrote:
> > > > This is the bulk of work implementing C++ bindings for the new libgpiod
> > > > API. The tests are not converted yet but the examples are fully
> > > > functional. More details in the cover letter as this patch will be
> > > > squashed with the one for the core C library anyway.
> > > [...]
> > > > +class line_config
> > > > +{
> > > > +public:
> > > > +
> > > > +     /**
> > > > +      * @brief Direction settings.
> > > > +      */
> > > > +     enum : int {
> > > > +             DIRECTION_AS_IS = 1,
> > > > +             /**< Request the line(s), but don't change current direction. */
> > > > +             DIRECTION_INPUT,
> > > > +             /**< Request the line(s) for reading the GPIO line state. */
> > > > +             DIRECTION_OUTPUT
> > > > +             /**< Request the line(s) for setting the GPIO line state. */
> > > > +     };
> > > [...]
> > > > +class line_info
> > > > +{
> > > > +public:
> > > > +
> > > > +     /**
> > > > +      * @brief Direction settings.
> > > > +      */
> > > > +     enum : int {
> > > > +             DIRECTION_INPUT = 1,
> > > > +             /**< Direction is input - we're reading the state of a GPIO line. */
> > > > +             DIRECTION_OUTPUT
> > > > +             /**< Direction is output - we're driving the GPIO line. */
> > > > +     };
> > > [...]
> > >
> > > Could these be enum class types, or does that introduce an ABI issue
> > > if you extend them later?
> > >
> > > Ben.
> >
> > I'm not sure there would be any benefit to enum classes here except
> > for longer scope when using them in code. I would prefer to leave it
> > this way.
> >
> > Bartosz
>
> Actually after a second thought, it wouldn't make it long - it would
> just look like: line_info::direction::INPUT instead. Maybe it is a
> more C++ approach after all.
>
> Bart

I tried to change it but if - for example - I implement the enum type
for the direction property of line_info as:

enum class direction {
    INPUT = 1,
    OUTPUT
};

then it conflicts with the getter of line_info: direction(void) const.

One option is to rename all getters to get_<property>(). What do you think?

Bartosz
