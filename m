Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E86B8CCB8D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 19:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbfJERDO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 13:03:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33271 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJERDO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 13:03:14 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so9587137ljd.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ddXseKGv3/4SKLZ5SVHPZUcCGGOrS8Arg9a3AfDJ4U=;
        b=Xqf61BwvcS/rFfd0wz4vNV9veNGdL7VAfXV8dSdJ9cLhFvhz6TbDdSXAfBl3w+tsEk
         bE6Se2xBAaoy0VM2T8kU0o1r/pp57sp3P/H7oHuZ4Lz0UQXNuOPUA9nnFYJeHVF6adBz
         tKqH8jMFJpW0gWbstEwFPhsshv5ay7/rSvwmr+d3hZzhqZZ3fXBFpzrNr3Kf/X/yw6mT
         +FCpvIaaQdUmgz5HjOnvf2SrTIW8t0J8KyyH6zO3DS95waglbQ2mlSbELrK+FwCgCopv
         kGWKCDuj0o7xhlUdLR9Pqz/FllWp863da6pdFOsAgeRzi2bmVGTP1Rj4XfBWK1MgguLW
         AXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ddXseKGv3/4SKLZ5SVHPZUcCGGOrS8Arg9a3AfDJ4U=;
        b=LVryYbgmosoLDkimmwN4xtVUcmIwbjcPNo/qR+AdurNoHE1+zXgQDsrOkDiG93/gDy
         vJSgVKRU1uVqrsq38DfF05eWBcpnZkuPRHyE08NArbAyW38BsCXMso7r2QC4lr5+8xDf
         fBrJg+QyGpnxdUYta+lFaH19CJ0sxw487xr8/EprXRgSY2hoHytGW1Oso44o6ieMVo6W
         fovKsLeAzFTyPCnFvI3vraDoDCcVF/KwiBUgYbJ2EfZvAS8xeOpxpQ0Iiki5ebrRNOky
         Gw5Emps6RU130SrP553JPWhVBT6Wt7n0pJu1Ht/hbeZGYaV6/K5UYaxMD4qAIfcwnE9b
         vd6Q==
X-Gm-Message-State: APjAAAVVJQoFQGbiAZhIJrsWwOqr9p3an4eV5wljgZB0Q/lOVT2Skoru
        7U/VYcmC9syKltzMxkS8puHjGMIUFyUu8R1amiOHWEP6/Ew=
X-Google-Smtp-Source: APXvYqwx2pmDu6fo2GmW7KjDXSgU9KCpAgfn1umVPmNgf9cwxEakvOiLABhSZCeVxH+vPM/w25JxcW7jjbz4fyLAQNY=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr13342905lje.118.1570294990791;
 Sat, 05 Oct 2019 10:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
 <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com> <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
In-Reply-To: <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 19:02:58 +0200
Message-ID: <CACRpkdZP8GYPUk4ZB+2Ei4hrrT0Orq0MUEszJ+YM=npuh1uH9w@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 9:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> The config ioctl (or
> something similar) you're mentioning may appear sooner actually -
> users of libgpiod have been requesting a way of changing the direction
> of a line without releasing it - something that's possible in the
> kernel, but not from user-space at the moment. I'll submit something
> that allows to change the configuration of a requested line soon.

Hm! I guess I assumed that userspace users would be using the lines
for either input or output, not complex use cases like that, reversing
direction and what not.

What kind of usecase is this? I certainly hope nothing like doing
userspace drivers for complex hardware ... those should be in
the kernel... the current ABI is a bit oriented around industrial
automation and prototyping use cases.

Yours,
Linus Walleij
