Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696F7398441
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 10:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhFBIir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 04:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhFBIir (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 04:38:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84383C061574
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 01:37:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t3so1924886edc.7
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PR190isKuStgQQOq5rkULJ1LLuWopcJylF8R3lRy4Ps=;
        b=bPrGJgci95Q6A3Kl1lLplCUHWgruAuntAbwhWXDrVo1fsWvYb5nVyxhLi6Lr0aCF0T
         q4JHHn0IS/a27DtCGWnLYf1g9QfaQ5N9sjtfvn86EKqj4PhtF4hYQhJ3hrOtXVo8nq3t
         vhap8Ule5SURC/HYowWabEXOn1W6YfZ7MXWLLmKLxK0bSEqkHB4IEMqCL/jamJy68mTy
         AdxsgW2P3tXaMEMTRa6iS7zYx7YqQ9pLXrbuVnnVZVOGWK4nW5yL8ZCf7iQ4qVUnQ5u3
         gS2MZqqoI6TG2qcOAX9JD8gdh4C8cqlndPFMbaajVpJxmysv52HhUl+02iEI3CcVCyCp
         wSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PR190isKuStgQQOq5rkULJ1LLuWopcJylF8R3lRy4Ps=;
        b=CasCGKt8R8beqNoZKLJiYmS3w6Fw6IpfIevtno6akM6p67Bl3EzbuzZ/gLuCOhU9vh
         9UvtQjgTnAdF9xzDzTwnG8qFIL6dMYENiMGZKx3ZLoqGiMgj71Id5m8hTf9zQZsUi3x4
         z3wh0DgvAiI6EWLt/8JeTekU4zqTnkG0GsJIpOELOrNGWxITud8eP/TamrVTLdsybVEm
         x6AUwHHp85Nxai03oTnehr+uKf5vVFKKGSrLO+6DXwUA24oZWhAAYTaEO51AXzj3y1c4
         zac71aCFbEwhXNa1RJ8cvc8UjS9kXXSBcvEzgs9LrHMxi3swh3SMz3WuWv6brOs0FnoB
         oWnw==
X-Gm-Message-State: AOAM531J9eT+H9ig03TDOPi+2z0JC19CZ4IRE9OUPL851TTCM4EazxvP
        ifGyvrzEkRcV6S6vzdXDF8fovEgL+kDUHIlSuXyAyw==
X-Google-Smtp-Source: ABdhPJz+tqc2l12N9r1tiDZ05J0gqMeyXd+V2RyXnvjEzHeNv6i029j3vLtFdifQ9BMHpU2czDJI8okgd9M/4/ktFHI=
X-Received: by 2002:a05:6402:4256:: with SMTP id g22mr36750365edb.214.1622623023158;
 Wed, 02 Jun 2021 01:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518191855.12647-1-brgl@bgdev.pl> <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol> <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
 <20210530004544.GA4498@sol> <CAMRc=McYaPqFrYiQqYnzVq9YAK8sXD_dW=UYwdiWgFOBTJt2iA@mail.gmail.com>
 <20210602031257.GA6359@sol>
In-Reply-To: <20210602031257.GA6359@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Jun 2021 10:36:52 +0200
Message-ID: <CAMRc=MdedHN8AFzuXCz7pZJX2D1h1AncbR+KH4c1-=+nLARpTA@mail.gmail.com>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 2, 2021 at 5:13 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> >
> > Ok got it.
> >
> > I think we're getting close to an agreement. :)
> >
>
> Well that makes one of us ;).
>

Oh we don't? I thought there are only minor disagreements on naming
convention and error handling but for most part we're aligned on the
general shape of the API?

Bart
