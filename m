Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7CA1EF40D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 11:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFEJ05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 05:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgFEJ05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2020 05:26:57 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43352C08C5C3
        for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2020 02:26:57 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id w9so7908741qtv.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2020 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zqYhFxyDAtILiqRdQs/A/VOm/gA98AIgqjG6QWawGpQ=;
        b=W/jujRNmhvoNrLVbefR5GyiMcKSZuBkvaj1S58j1CaQm4s76j3544+zIPQElpPkDjV
         gIIOpD20sCFWanYxUYHq2NxXbxGNHsRN3EmCM2CtZJ7R7YWZdihzXxJRP4ZQIDVDCwJt
         YKliH8cv5t3/FSJ5Y8dQR3o9izwhgJLP8g+34fUhIPn3R8Mu5ixpGw9hQ8ND7mu40JUa
         kMfVO4UF7iI7wdC0M8Dle7P77Mk4lSAMWGkjXt6l8H7qceGvvo4crPqgY1OP7Oz9xPN9
         KUKa0pvcDrliTl0ZqSB6XuxQxd1yKIi+m+YXbTS+RiWF9QJ6wwCLkBUh7y4EOsLTqh64
         cM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zqYhFxyDAtILiqRdQs/A/VOm/gA98AIgqjG6QWawGpQ=;
        b=qyRf6AOn/Q9951bH3XTDmA2bZjnOeVtj74j86Z/dznnx1ny5gndes45PyqLECVGKAg
         IrzC4fkGMte9v92CtK//4RyzZ0IirETQpbOOtk4zyyQEofCpFQ0hRJ4P9j+hzV3B5azO
         HEzSOdg0/J9WaaPk+c2EEuPPViGQ56/lL2sXvdgQ7/lBruXvtjv9otQJXYqFMofilx3K
         /okAgC35z6Wl4PdGYIVoSyzgvVTnnjEUCMcoO82NBxfcIZBv2Xt6fGGAvdTRK7IJKh7R
         ij+4Y3/ehZbtJM8ZAmqgN2L1i+Alyu2PYkOzdZqiWPYGTqKMKov0lfP4B2FdutGI6BIC
         tK7g==
X-Gm-Message-State: AOAM530SJ9lBHy5WA/iV3PlDun9jXq3pVX0egRKFuT8yMMvHaOweCAaL
        GJf91b5Xb3ZeBAb+nMXrdZh9sPoeXCzLlra1lvnnNdin
X-Google-Smtp-Source: ABdhPJxgv+zPrPnHQh5qFdqGMjVhfrtsQcWtJgQqLKtJggpDyQwHdIc+w3MGZ1bWTRC6dyZ+GUoP0t6NLmYtKIKWp0c=
X-Received: by 2002:ac8:6bd3:: with SMTP id b19mr8644372qtt.27.1591349216356;
 Fri, 05 Jun 2020 02:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200602141048.1995-1-warthog618@gmail.com> <CAMpxmJUjYn5SHg3BpCeKbYc_OpCjd8d943yfYL_TF15wyTenfA@mail.gmail.com>
 <20200604141804.GA5050@sol> <CAMpxmJXyVO4unLQOzC0xf47CTmK6VurTk+Q=9RDWhcP0pu73pQ@mail.gmail.com>
 <20200604233043.GA8913@sol>
In-Reply-To: <20200604233043.GA8913@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Jun 2020 11:26:45 +0200
Message-ID: <CAMpxmJXX+rDFNfBqrBg3hKMApLKDnbFL6S1ZNz_BBi=zO7+aPQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 5 cze 2020 o 01:30 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> On Thu, Jun 04, 2020 at 06:22:43PM +0200, Bartosz Golaszewski wrote:
> > czw., 4 cze 2020 o 16:18 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > >
> > > > Is this comment relevant for the character device?
> > > >
> > >
> > > True - that comment should stay in gpiolib, and gpiolib-cdev should g=
et
> > > one of it's own.
> > >
> > > Any suggestions on how to maintain line history?
> > > I know you can trick git by moving the original file into two new one=
s,
> > > then moving one of those back to the old name, but not sure if that i=
s
> > > what you would want to see in a patch.
> > >
> >
> > People don't seem to care much about this in the kernel. Files get
> > moved and git blame results get lost all the time. Don't stress about
> > it.
> >
>
> Oh, ok.  I guess that explains why I couldn't find any examples of how
> to do it in a patch - I had thought I wasn't looking hard enough.
>

It's not like this information is lost: once you see (with git blame)
that a file has been moved, you can check out the revision from before
the move and see the file's history. Rinse and repeat if it was moved
more than once.

> There are still a couple of commits in gpio/fixes that will conflict -
> are those getting merged into gpio/devel any time soon?
> Or is there another branch I should rebase onto?
>

Linus W already sent out his main PR to Linus T. Sometimes he does
additional PRs near the end of the merge window so maybe we can get it
in this way?

Bart
