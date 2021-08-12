Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5963EA61E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 16:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbhHLODd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 10:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhHLODc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 10:03:32 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25796C061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:03:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id o23so11802289ejc.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBQDInrqpR3xNcXu6R7F9TeNSiq2ysaFJIauTDeAHqg=;
        b=mwTSayquVOz29wg29ZqDA/d6jDDXhuOYFbifCg6dh3eKWxk1QyV3ioE+35Vg5kYpbG
         AueH7kVrQkMbfLm9JK8Vijv5p74sux4VpG48BAD2ePNnjKDN/ZofhDtQFJIjRR13J42x
         Z0GkVtiJnQXUd22bh7h4g1pfQsE/vz+g/YRpTyJMnSvj4moo0/Dzi3w4IhDevlvS3Krn
         gMBzUxmaX+WVVaz/b1+srtp1jT8JDjtWabiojS6igt7Y6LkugEAb+la6q2g+ytT2dngb
         xaSLsR2bc9m2RkzEp1pMFiEwycnhpFru0yPVqcOwilEOc4P3osoEoSgvnlBhKXgATcG+
         kejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBQDInrqpR3xNcXu6R7F9TeNSiq2ysaFJIauTDeAHqg=;
        b=TPKJNoB8zSwC0A0I5dgRxhdtcHETKh/hXxEh4F0IhkowvubeoCzgG+yK4xz9sm+V3O
         mkYQvfSEnZrFLmPtRS/++ILVfVwxSrVkriZ1TvpLnPiehrICII0Moin/9nVKPu539Mf1
         JOekXVJRuFa6AS9t+pl2lSQWYVTIQGYH+sV0TT5Vu4D/o3Yi7lURgGOZxXqJDcGV1E15
         5FMdyxU/hc5OqJ06PxnLLUZLSWCRgRIXxyvZbEAmQfD4T1SkNQCvR3CKdQVX1ym+jLic
         4LFtINjGgQN3DIX7xr0pB2H5O9K3ZI2SI/c6AzgA5OtX+AzMl4oTig1x2TiD0ZaNEijA
         Fsmw==
X-Gm-Message-State: AOAM532Tt6/BHuWdL+U1bqIP12eSkZixmOHBCnP7U9XLU9XWge9bkKkD
        e9rBXH6PonSMqHKnEUME2xkSt+SyJ/GrrOW4Xy2VVQ==
X-Google-Smtp-Source: ABdhPJxjP3LTXj9hI9iuCQ1QhAhFaWUXkt+B96Wiui6Xpjb0V5O6nfUiMHxVi4x7Mctgt6bCRxUuVYodiaU8U1MaM1E=
X-Received: by 2002:a17:907:2706:: with SMTP id w6mr3805112ejk.101.1628776985628;
 Thu, 12 Aug 2021 07:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol> <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol> <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol> <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
 <YRUcJ0kbNRa3ORl4@smile.fi.intel.com>
In-Reply-To: <YRUcJ0kbNRa3ORl4@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Aug 2021 16:02:54 +0200
Message-ID: <CAMRc=Md1EN4Fk4D5+aO-iqr2uG2UiiW91_knpgZH8K_0RdOocg@mail.gmail.com>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 3:03 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> > As you said - it's on the heap, so who cares. But this is also an
> > internal structure and so we can use bit fields. That should reduce
> > the memory footprint significantly as we now don't require more than 3
> > bits for any given enum. That would leave us with the debounce period
> > and offset as full size variables.
>
> Side note (I believe you know about): bit fields are the beasts when you have
> to have a locked access.
>

The library isn't thread-safe. AFAIK a simple mutex around every
operation on a struct containing bitfields will be enough for a user
to guarantee no race conditions in user-space.

Bart
