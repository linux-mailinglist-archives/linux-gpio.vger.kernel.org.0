Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E38209B79
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 10:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390739AbgFYIof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 04:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390025AbgFYIoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 04:44:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86507C061573;
        Thu, 25 Jun 2020 01:44:34 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so3004894pgq.1;
        Thu, 25 Jun 2020 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPuyZpiaeMW7v65IWK0vJIfRpGGit+CNrEvkfOmMaMI=;
        b=h0L6gU8JGT61YqfoP+6NtN2CGutWMoBlAPkHcd0b+WTQUkyP3+uZwq2EPf7xRZw1ik
         L3LTpgiJk3k87izqf3vzxiQLnqp+Gsa8Ls3SCDIyxJvUEHiPzbsbWgoyxpQEnwZdJ8Ef
         FP7BH16dCiXgYKUXAG3pfmrbrpgy6t5iAWXD+oebejGXRNROLQlzBQtT14XA8RwJP/0g
         kdMHSOqYXcAOqIJ0UuH63pHG9THW+EcIwKzZAYlPxFtJI0m9AKpEX93X9PkUZn+GtTrm
         oo/gB8ThYGQ1WLK4CnJAMrJioRQmov0i7lj0r9n48XdOyQFhtQUE+Op5V5AZFd3pB4If
         yU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPuyZpiaeMW7v65IWK0vJIfRpGGit+CNrEvkfOmMaMI=;
        b=AnI8hhg6BSzPg0zwdwJwek7EMQJ1y7oCeceSz+OB7hZjnIT6q/dUEXPscJRuLDCKPJ
         6USrwEpLNQRVlD9YgwGDuhaoes+2kgF0XZnvdd94oyJlosKwsnGCmKBHXmlmkCCwI2KQ
         CdAJvNSBvp+D4/a8YNq6+1RUnWmircijQprVSLsbjnsoPu4J4RlFixBcoF/FQzcwpmH7
         0KXX3zmuIV3CdKJrIsEGhdaKetn9YQ3v89BfC5CzEFmquGAJRbVxo+HFi6IlYHE6Vo3b
         Fuv0fRTT/870sNdGIZv7a9J5sXfwSZsffVbrMh9xyzmuJkWzcYDbdIdT282eWExcq5mr
         o2gg==
X-Gm-Message-State: AOAM531D8OzsE25kZKJdj6ABIMGl7JGF7/pRCbnHGV1RXLZ9nWmmH0BE
        pO4oaz37ckbMw1dHptLl6BgiL9sknxwR4NKZ4as=
X-Google-Smtp-Source: ABdhPJxnPbRn1omTeH5cZ7Nex1nPz2Ru5X+fyfNVcPe/WaqCZQrrv59LHmA7bOPKHoxcgD1pC5cc6RbAYesk3IsSj7Q=
X-Received: by 2002:a63:ff52:: with SMTP id s18mr25908886pgk.203.1593074673817;
 Thu, 25 Jun 2020 01:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-11-warthog618@gmail.com>
 <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
 <20200624155714.GB8622@sol> <20200624225803.GA3600@sol>
In-Reply-To: <20200624225803.GA3600@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Jun 2020 11:44:21 +0300
Message-ID: <CAHp75VdCGpvoK8RZGwbehOd3eORE+qwFR31ucFxtU4vdc5pvYg@mail.gmail.com>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 1:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Jun 24, 2020 at 11:57:14PM +0800, Kent Gibson wrote:
> > On Wed, Jun 24, 2020 at 05:46:33PM +0300, Andy Shevchenko wrote:
> > > On Tue, Jun 23, 2020 at 7:03 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > > I stumbled over this myself, but...
> > >
> > > > -               if (test_bit(hwgpio, gcdev->watched_lines))
> > > > +               if (test_and_set_bit(hwgpio, gcdev->watched_lines))
> > > >                         return -EBUSY;
> > > >
> > > >                 gpio_desc_to_lineinfo(desc, &lineinfo);
> > > > @@ -897,7 +897,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > >                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> > > >                         return -EFAULT;
> > > >
> > > > -               set_bit(hwgpio, gcdev->watched_lines);
> > > >                 return 0;
> > >
> > > ...I think it's not an equivalent despite races involved. If you set
> > > bit and return error code, you will have the wrong state.

> Perhaps you are referring to the case where the copy_to_user fails?

Yes.

> To be honest I considered that to be so unlikely that I ignored it.
> Is there a relevant failure mode that I'm missing?

The traditional question for such cases is "what can possibly go wrong?"
I wouldn't underestimate the probability of failure.


-- 
With Best Regards,
Andy Shevchenko
