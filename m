Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CAC209BD5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 11:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390847AbgFYJYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 05:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390836AbgFYJYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 05:24:03 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38F4C061573;
        Thu, 25 Jun 2020 02:24:02 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ev7so2264309pjb.2;
        Thu, 25 Jun 2020 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nkHtLK8Qn/URDh6hoRXRpKeBEGLYTiIfhxiyKIBGw6E=;
        b=obZB5gx69vABUSmu58Zx5DBvcInMdzcqZiUUNh/ka8ysbFJz8u+08RyuRLN3a90Fkp
         6K6T4nVzf6iYuR3DbeCxmw9JEDuQUC9JatV7Mo6sTdGZxeA2y3cW07dKJEIECuuO+qfO
         janUxNM5qrfxi9Z61Tf0VzGjEdFVyUWa5fST774ndNbSDiJkJMSWe6D/VBtzAJlc2GYL
         vu7UZrWjd8s5FtPQiKxXw4NeiNYRBuBGGtImUOuc+rOcwtO4jmWuEnrQ7sQpzp8Nw9ho
         kxhcClkbaUIriqr00v8NrvSPbJ/5KLpBqKrjdaCQlBjZDoRmuOWqJDbMehbcnuWqWg7B
         wZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nkHtLK8Qn/URDh6hoRXRpKeBEGLYTiIfhxiyKIBGw6E=;
        b=iltZHCNTsLdD2jSJ35W2tRnAPMgLhBxiQOJ9grzBUGk+yWsnuNM52/gDQjyEmJJWzH
         InbzrNfeC7r4WSW8nM1dFQf8saVeK2SZHSc4U5kanRglh2RR/lqYbkQBEvh6RXc5zGZt
         OYlw8E070k3Ze9HH4lsCHIilrTwBKU/wJASRmPtkRHPG5EL/93rM7Z/oSbeKy+0iZDAr
         AaUwd9XzQktHinSxI5dZ17kqrHQEplTYdkrrSGrTPJD2I7sT3jyoxbL6Kb0EZ389yMtg
         CLFQGj2wp2BSEDMMan2M8jbjrV2/tjlJxTTAnOUWPTbGersUQ32mJhumxdnx4k06ugGP
         qlMQ==
X-Gm-Message-State: AOAM5334xZr7ROCzRMPjV7qyyy8R+ca5u99DHM0mbamnX2VIiVZXVVtw
        cSpS9pND8R8oZEybSn5zkitRL86V6lIJ1gShSdIhlBiB
X-Google-Smtp-Source: ABdhPJyqDiiu1xpT21Pa0yl+XVySAwjE7bCHJnetIiIk2S61SyT9be62+IUjbeukO0CQIIbS8lISW9ZC0NNVxyj9kX0=
X-Received: by 2002:a17:90a:220f:: with SMTP id c15mr2358463pje.129.1593077042444;
 Thu, 25 Jun 2020 02:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-11-warthog618@gmail.com>
 <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
 <20200624155714.GB8622@sol> <20200624225803.GA3600@sol> <CAHp75VdCGpvoK8RZGwbehOd3eORE+qwFR31ucFxtU4vdc5pvYg@mail.gmail.com>
 <20200625091307.GA16386@sol>
In-Reply-To: <20200625091307.GA16386@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Jun 2020 12:23:49 +0300
Message-ID: <CAHp75VeDOGArs2MxJJRNHbNRsJU4K+KYPY=pF+mgtwbakQf4BQ@mail.gmail.com>
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

On Thu, Jun 25, 2020 at 12:13 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Thu, Jun 25, 2020 at 11:44:21AM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 25, 2020 at 1:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Wed, Jun 24, 2020 at 11:57:14PM +0800, Kent Gibson wrote:

...

> > > Perhaps you are referring to the case where the copy_to_user fails?
> >
> > Yes.
> >
> > > To be honest I considered that to be so unlikely that I ignored it.
> > > Is there a relevant failure mode that I'm missing?
> >
> > The traditional question for such cases is "what can possibly go wrong?"
> > I wouldn't underestimate the probability of failure.
> >
>
> The worst case is the watch is enabled and the userspace gets an
> EFAULT so it thinks it failed.  If userspace retries then they get
> EBUSY, so userspace accounting gets muddled.
>
> We can clear the watch bit if the copy_to_user fails - before
> returning the EFAULT. Would that be satisfactory?

Perhaps. I didn't check that scenario.

> Back to the failure, is it possible for the copy_to_user fail here,
> given that the corresponding copy_from_user has succeeded?

Of course. The general rule is  if on SMP system you have not strongly
serialized sequence of calls (means no preemption, no interrupts, etc)
anything can happen in between.

> If so, can that be manually triggered for test purposes?

Unfortunately not an expert in mm, no idea, sorry.

-- 
With Best Regards,
Andy Shevchenko
