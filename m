Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD05E3AA453
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 21:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbhFPTa3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 15:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbhFPTa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 15:30:29 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEAAC061574
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 12:28:21 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id t8so4603828ybt.10
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 12:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oHKQ7IZskBYlIJQPIn1lKqRPgqkgh8MxD7WViuLTtlc=;
        b=x1uclulWTzqNtRCuHOnCKH9nS1MdomeWlmGUpiARAen0vO4x261/4WigwW0diwxn13
         LIdUYnJi0GN6lm86QofeE4uB6zzZtYrvSjh/RO9YC0uME9q6gufs7ZwOQtVTt38vEkGr
         kE3lwKqevCRGeT3mOQ9QbpvoStIHAVC39lWu+JySkxJeRon3eiVM0c7irRm+srttipuP
         PmD2NHOTai/bQEwl7Wmr2YmdYvjgguFQDcTdkAfNezWZCKVp18Gls9moRv91IY4tdMu5
         edB/8nF4Iydk8GoyJyXR4LrplnS8Eoygpu3kPB2xhZzaki6Ibs7WNcQykv7z0hQaYMTe
         7Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHKQ7IZskBYlIJQPIn1lKqRPgqkgh8MxD7WViuLTtlc=;
        b=uGMRKjAhxFoH7BHRvRpYnX1SifHx9Z/jOLHty7A5Ixm6CYMXM1KOjKFgBpLJFUmMLD
         ekJ062h/on1UaDiBvNEL79Bg9Pk8lSZEHZlori80n0y5yVX3WcnojNQHAa2W2VSIfJyr
         K+PtMYzXiGP0FOZaDkOCVBwp1/6DzQZn1nRkq7X5JTpQ+1zfNBvfuhV6kedawi70H7Y+
         9+f4LQW/DsVI/P8OPWI+aSIwyjrjowkjLqHDM1w5JYZdkjZbB3XWNhGzVo7NkvN3WZFh
         HaQRK2iwSv9cHAfdGAEQyrodnHQW+M8bV+U7f0aUV0NO+OKL7SfTgkKP+AmxQfHl6IL9
         ATGg==
X-Gm-Message-State: AOAM533Q3QpEER5dhdx4MNwosIipo1y+NpQD0Hj5RYiOIo5Q8OvZRfON
        gvcZ1XV0RSiCpms70vYaRvYdcyK0uEuqGQ0FtgDvGQ==
X-Google-Smtp-Source: ABdhPJx2c0hagRgPQH0UPQao+RhRzo8zDIxtoFM6OZgLfl9gxzGXMKTj07UvsgsfKAC6AeSytOliRo8G40r2kSs/HcU=
X-Received: by 2002:a25:740a:: with SMTP id p10mr870583ybc.312.1623871700971;
 Wed, 16 Jun 2021 12:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210613220326.831040-1-pbrobinson@gmail.com> <CAHp75Vc91=PSj+4F652Wo4iEHsek_NuLGuQmyovWtQ1UMO2xeA@mail.gmail.com>
In-Reply-To: <CAHp75Vc91=PSj+4F652Wo4iEHsek_NuLGuQmyovWtQ1UMO2xeA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Jun 2021 21:28:10 +0200
Message-ID: <CAMpxmJWt0N_O+P=NrX2-GMtGmaLU6kz3W+JHJo2U+UTmEhcycw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for the On Semi pca9655
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Peter Robinson <pbrobinson@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 14, 2021 at 10:10 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jun 14, 2021 at 1:05 AM Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > The On Semi pca9655 is a 16 bit variant of the On Semi pca9654 GPIO
> > expander, with 16 GPIOs and interrupt functionality.
>
> I don't remember the context...
>
> >         { .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
> >         { .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
> > +       { .compatible = "onnn,pca9655", .data = OF_953X( 16, PCA_INT), },
>
> ...but the first space (before 16) seems not necessary and the idea as
> far as I can see from here is to have those columns to be indented
> nicely.
>
> >         { .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
> >         { }
>
> --
> With Best Regards,
> Andy Shevchenko

I applied the patch and fixed the indentation problem in my tree. Thanks!

Bart
