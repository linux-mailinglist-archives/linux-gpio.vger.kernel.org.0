Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621FAD46F2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 19:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbfJKRvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 13:51:55 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35203 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfJKRvz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 13:51:55 -0400
Received: by mail-io1-f68.google.com with SMTP id q10so23395429iop.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MvDRQl/jc66rQaxphMurQUOnNePTPwaryUJLMLi1L48=;
        b=M7sgtbDeNNHaZsR7urYOAtaKzNIBKPfE6TFaw0oxj1+QzLQEsdLOoXUvfyNzzsD8EN
         IASumORngeA4AMLci6/5MY2KICZw8dX18rmNkzDT9tVTTCd1jvAjrs2VXeK3saltEeKX
         hD+RNAu90SBRdH+Y/3k00aIsT8P4lR2q77uvzu4ON0ASR4kCQpjVuQsE1mgZItqZGYaI
         O5Mke6n1g8vzilaq6aE1/yGU0NbFXkfZBT9z+LoCVH9cr1oMEfX8HGhJm3jsAaumbwsV
         3qu1CgNhP1Ul4zCZeyc9x9GvnKMofG1Mo3WerBTx9X74f7Wq9mI1lzeRhjNJffjsAPQ7
         a2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MvDRQl/jc66rQaxphMurQUOnNePTPwaryUJLMLi1L48=;
        b=Rvb6/laW3kWLKoB1ORBKdzLx2kgbZgSZ9n+aTDznVKRo5Qg2sJeAPejTD3DLiRYMoY
         acvPxm3p2bVMAkNs63Ih5yYKftHoQOehOTwBKO1dfR8iWbfaXu9H/v04oBL4gY3VWjbr
         Mt7GY8KHQ9zh4K8fWkE1pnHj2mkd/hYOX42Oif2CszQ6m1XRhszPP+1TuTD1fVoxKKEh
         EHFZ3sQnttD+ihLiF7jC3jauVfvBufDe4HdnYWaGrytwLdyfd/ltuiPiGDD913yl8NI9
         U/4Mj9GpgnJ6H+2/CvRt7r+U0xsdaeStN29XjgRBuvdDvRFZmul3FGKDrURARvdixi+r
         gsYg==
X-Gm-Message-State: APjAAAUQx66EY6meYrFaiW+FBLmFAgShKruAGBHDys10Sak3KUZgLylC
        HFfJENRj4KHzep8PXvUyBHPUMqPNQnFBp0KPWCfIug==
X-Google-Smtp-Source: APXvYqwl+GHnpuGRszvV3eT4U7x5jS4LgS4u2KYOntViLuyJ7KHLgXny/unvKcl1IVM6+VSFpMCeBLtwACVLyrRnaIg=
X-Received: by 2002:a5d:8543:: with SMTP id b3mr205225ios.220.1570816314417;
 Fri, 11 Oct 2019 10:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191011154650.1749-1-warthog618@gmail.com>
In-Reply-To: <20191011154650.1749-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Oct 2019 19:51:43 +0200
Message-ID: <CAMRc=Mfkop3poFn7vaotxZfCJn=L+6w9uzNVCXTfa4AuVEmm1g@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 11 pa=C5=BA 2019 o 17:47 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> Gross control means enabling and disabling of bias functionality,
> not finer grained control such as setting biasing impedances.
>
> The support allows both input and output lines to have any one of the
> following biases applied as part of the line handle or event request:
>  0. As Is - bias is left alone.  This is the default for ABI compatibilit=
y.
>  1. Pull Up - pull-up bias is enabled.
>  2. Pull Down - pull-down bias is enabled.
>  3. Pull None - bias is explicitly disabled.
>
> The biases are encoded in two flags, PULL_UP and PULL_DOWN, where
> setting both is interpreted as Pull None. So the flags effectively form
> a two bit field encoding the values above.
>
> The setting of biases on output lines may seem odd, but is to allow for
> utilisation of internal pull-up/pull-down on open drain and open source
> outputs, where supported in hardware.
>
> Patches are against:
>   github.com/brgl/linux/commit/82fc38f6ab599ee03f7a8ed078de8abb41e6e611
> which contains the initial patch from Drew Fustini, with Bartosz Golaszew=
ski,
> that adds support for pull-up/down flags in line handle requests.
>
> Patch 1 adds support to line event requests.
> Patch 2 adds pull-up/down support to the gpio-mockup for uAPI testing.
> Patch 3 rejects biasing changes to lines requested as-is.
> Patch 4 adds support for disabling bias (pull none).
> Patch 5 adds support for setting bias on output lines.
>
> Kent Gibson (5):
>   gpiolib: add support for pull up/down to lineevent_create
>   gpio: mockup: add set_config to support pull up/down
>   gpiolib: pull requires explicit input mode
>   gpiolib: disable bias on inputs when pull up/down are both set
>   gpiolib: allow pull up/down on outputs
>
>  drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
>  drivers/gpio/gpiolib.c     | 55 ++++++++++++++++------
>  2 files changed, 100 insertions(+), 49 deletions(-)
>
> --
> 2.23.0
>

Hi Kent,

thanks for doing that, but please make it easier to review. The cover
letter shouldn't be sent in response to this thread but be part of the
patch series. Please don't rebase the patches on top of my
development/experimental branch - every patch needs to spend some time
on the mailing list. Rebase the series on top of the latest mainline
release candidate. Pull in Drew's changes and just squash my code into
your patches - it was not finished anyway. You can send patches from
other developers or make them part of your series - there's no problem
with that as long as you keep the authorship.

That'll make it much easier to review and understand.

Thanks in advance!
Bartosz
