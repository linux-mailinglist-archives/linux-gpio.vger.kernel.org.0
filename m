Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2087021B7D8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 16:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgGJOJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 10:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJOJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 10:09:35 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52367C08C5CE
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 07:09:35 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ch3so2666716pjb.5
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6Z/nwDKLdFCkAXEBqyuG3izXJ//6va9st2WwWNZZuw=;
        b=klRSeNZYiKSPrl6LY4tNV4mZjS/R7Vj5vSZOhshB/6YTEWthQlcL2dpNXU3vWZdu+G
         1gWO+VVnTa11JVh/ujOjIbsrOaYwgYtmpcHv6NJ21tkBcwe93NPXnvmcbnP8OBpxnFl3
         QL7kILDfi6tCxGLgta5Fh5uhiGP3+3+3xIxmjjtyZDkbiDm4ew+LMy5Dag6gmW1mUwTY
         Fd9wggcYnrtkpKF4BD0FjAuM/hYEk0kXgyPESBD32LgU1YOTUSGH4CmLrgj3Qs8T1vQr
         OfXg8kJMytgwd2tX5OQ2pz2QTuqCDfOOb7gFvb6HB0KCgsqfYyk9GfEQrguJRhyl4YhX
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6Z/nwDKLdFCkAXEBqyuG3izXJ//6va9st2WwWNZZuw=;
        b=IXJZI1qU3YIRWSs8IXoakVsJ5LymoMoE0JagiaVV8PP0bM1PtOTnSxqG85rvSAsvr3
         lrJNRLM3IpQ7/i31axQwBqyrevPb+/GdP4csg7i8EXKlgppTT7+lWv+Q8S8jguyxMYlv
         SExmD4tnEK/6J7h9rAA1F/bvlTp4q9f7JycIQDqL0jtyWmA5/rJ0WKJpRdf1dEIorKOc
         JeDtWJYuS9aWYVZ1+ATpFQw88Lfxk3fyyzBWnr8ANQBqV/7z/MzK34Rjxrl0kBcU9LfG
         SMo31iC1w2cpzTy+9BBLM8qYklqXU/SBewmW4cUsjEDYrfrJv6BcBOs5BqbGEYH4HF2I
         DMtg==
X-Gm-Message-State: AOAM530WiroYhhpD/HggpJQoKtH2iGB9C9vplF30Y55kKW78FLlG6Gr3
        8jW7KVtzJ3Ywenfd3a4sdAf0SZQKAfKgaRMPlGA=
X-Google-Smtp-Source: ABdhPJx0uE1+kL8vekI/evWQn7PikXkeYfmNiQxNrplrXdWK9jx+3fnOB3Y05WjPHod/IYzM5D1oiyS0L8OmIwNkpR4=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr5850738pjb.181.1594390174816;
 Fri, 10 Jul 2020 07:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <5f049035.1c69fb81.15cb1.53fdSMTPIN_ADDED_MISSING@mx.google.com>
 <CAMpxmJWDiF+x5YzYcgcQgH9C6U3rpZLex19UGFAAj7Dh-+BA=Q@mail.gmail.com>
 <CAHp75VevzXfUH2E6DPRt4QP82xcDqPAZeKfqFAmiwcNG4XaK2g@mail.gmail.com>
 <BY5PR12MB41141291F53618E098239A73F9650@BY5PR12MB4114.namprd12.prod.outlook.com>
 <CAHp75Vc8WTO5pO3wyuuRZczavE+QKJM3=ji1J3OEmzjFdjj+ww@mail.gmail.com> <DM6PR12MB41226F148D9D3F64A2C1EE19F9650@DM6PR12MB4122.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB41226F148D9D3F64A2C1EE19F9650@DM6PR12MB4122.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jul 2020 17:09:16 +0300
Message-ID: <CAHp75VfjjXMH8KmBCrEeqwJUw54qgiXiaFGPajatdJ=PQMX4uA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Add some warn print for easier to debug
To:     qiao mnlife <mnlife.qiao@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        mnlife <mnlife@foxmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 10, 2020 at 4:54 PM qiao mnlife <mnlife.qiao@gmail.com> wrote:
>
> It will print the truncated name in gpiolib-of.c line 246, but I think this is not straightforward, and I feel its printing level is wrong

So, it does its job:
- it's for development
- it gives developer and information when debugging feature is enabled
- it does show the issue

> From: Andy Shevchenko <andy.shevchenko@gmail.com>> On Fri, Jul 10, 2020 at 6:11 AM qiao mnlife <mnlife.qiao@gmail.com> wrote:
> >
> > However, in development, it is not easy to know that this problem is caused, just looking at the documentation is not enough, I need to read the gpiolib source code more attentive
>
> Have you tried to enable CONFIG_GPIO_DEBUG?
>
> > From: linux-gpio-owner@vger.kernel.org <linux-gpio-owner@vger.kernel.org> on behalf of Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Thursday, July 9, 2020 11:40:52 PM
> > To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: mnlife <mnlife@foxmail.com>; Linus Walleij <linus.walleij@linaro.org>; linux-gpio <linux-gpio@vger.kernel.org>
> > Subject: Re: [PATCH] gpiolib: Add some warn print for easier to debug
> >
> > On Thu, Jul 9, 2020 at 4:27 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Tue, Jul 7, 2020 at 5:09 PM mnlife <mnlife@foxmail.com> wrote:
> >
> > ...
> >
> > > > +               if (size >= sizeof(prop_name))
> > > > +                       dev_warn(dev, "prop_name %s is truncated with size %d\n",
> > > > +                                prop_name, size);
> >
> > > To me this isn't a reason for a warning. If anything, this should
> > > simply be documented (if it's not already).
> >
> > +1. This can only be useful in the development cycle.
> >
> > CONFIG_DEBUG_GPIO easily catches this as well.
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
