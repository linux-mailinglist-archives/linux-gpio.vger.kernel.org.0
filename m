Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFBE52B0164
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 09:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgKLI6t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 03:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgKLI6s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 03:58:48 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEC1C0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 00:58:48 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id h6so932029ilj.8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 00:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ufmFFpoUsIpvor8t+lJACcvJdTeTvaw0bNfpBWkn/Tg=;
        b=03aL15pccIDAUg6UdkuWeqskXNsdMxCwPllQ7ZBx6tYvfA9k4lScXLW8XcJfXAopoY
         xxizDJMQIv0WTzRRo+FXN65fGAxroDMY1FLE5FlIEgQJeJN4M1eRvt4Zq8zOThExnXyP
         O0ZTuEIhkSCP7eofEqzd4tVyecK0XynC/CABUwH7cPonOLfvjqbsRRAf/xjGgWxWR6b6
         Z82LZ4ZZBlrfj5G613M+1v0o+rp/XsOQL9m2M0j4yPdAbg7jiVRLmuTu5EGfjy8Ga5RH
         xAZzkexNi/DG4ThzIPMQO31YRnu7FTmWNmqK/tYMSm//RM7v8u11rKNZi7RO4vLs/gz4
         A1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ufmFFpoUsIpvor8t+lJACcvJdTeTvaw0bNfpBWkn/Tg=;
        b=JyavajnR0a4g6ClX/XkhfHHT4OLyk9Cc5tC6gEmB87YNa9hvUzEb1XB8uDLrbXOnBT
         wQUqcSwnsW9PU/cvJ8AYHBOLljgPnl6fyN8znzGfgiacunq/sCiBJt7RtheawW4MC2IZ
         FAXsm/TapoupafE4K1BszhiA11QKCslCf4eniJFYteLFUjlu045QTAFU2+CZKty4w5sI
         2vsTpOb6oZ9uSUV1R8OglcN7sfEjXmW968NwhExCJzJz9sEhp8T+szwPoHzEZeOQxYgE
         J7ZAl/YaiN0aF/5tYYGm6wjH3ZSIFbeo7LGH9jIJH5gp4cdTFwGsRyKtaCGNhLOTmkm1
         Dmpg==
X-Gm-Message-State: AOAM533mBe4EflkFNe+MZxznu7yNXHJ9+tHZFrOgbnpizI46Reqqs1Pk
        QOye/lEn6KvcucP+fbTVUTbcu9ouECRLdt2mz6x1Ag==
X-Google-Smtp-Source: ABdhPJxV4yr1wIknX2t367p/+cKw8KZn8d3vjrQbXA0iiKjqn6n8LfXOevFb7X3wUYyGUrLoZJgyH/6JWBnHpAt36BQ=
X-Received: by 2002:a92:dc07:: with SMTP id t7mr14563538iln.189.1605171527927;
 Thu, 12 Nov 2020 00:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20201110093921.3731-1-brgl@bgdev.pl> <CAHp75VeRvO-PpNpcQHKXBRdWQqavfvQwqai2gRys+FbhBuVy4Q@mail.gmail.com>
 <CAHp75VdoptjHM8aSiiQ7BHpYE0Zf2-Ojy55H5hTv4c_68cS1vg@mail.gmail.com>
In-Reply-To: <CAHp75VdoptjHM8aSiiQ7BHpYE0Zf2-Ojy55H5hTv4c_68cS1vg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Nov 2020 09:58:36 +0100
Message-ID: <CAMRc=Mcjbp_u0747F3P61R2a31_LMgMry7bNoxvFhvFKvE7AGw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: devres: shrink devm_gpiochip_add_data_with_key()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 4:04 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Nov 11, 2020 at 5:02 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Nov 10, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > If all we want to manage is a single pointer, there's no need to
> > > manually allocate and add a new devres. We can simply use
> > > devm_add_action_or_reset() and shrink the code by a good bit.
> >
> > Yes, it is possible to convert all one-function-based devm_*()
> > wrappers to use this approach.
> >
> > The problem is, it will call the release() function on error which is
> > new (and probably undesired) behaviour.
> > I suppose you meant devm_add_action() here.
>
> Ah, now it seems I got it. You need to release the chip in case if
> devm_add_action() fail.
> Dunno if devm_add_action() can somehow change the logic to be clearer here...
>

devm_add_action_or_reset() is correct here - it undos the previous
chip registration on error.

Bartosz
