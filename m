Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5EE3988A6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 13:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhFBL4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 07:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhFBL4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 07:56:12 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019A8C061574
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 04:54:30 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i4so3466432ybe.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yg+v5/kXrzHYvX0Jw+7F773cEOq2rwIlZqjbglsclKE=;
        b=UmNEJw6Nr0gpzWivO1xV/PjQKAM5QEpkxO4PIWKdvqnVFtdgmN2aovcHDwnTBERh7z
         4t+EsYtXq4JQSY11zALaw3jYg6yLyTqwMbO0HX8RT2u26GAQzMBMrlUSoju/2pFeGGba
         VttsmK8ffaSnEyYT9lLwIwFLroLHWLNR2qOx68fh9ItdNTA1bcrNpRI89B+m9WgTX0Eb
         rutmtKlxgkL4s1hWfEGp/5L2VUu2enP7NrAvWbIz1tPyKf4fd1KrHDLlJg46xfdWggfq
         p64Bfkeq4Tiv/7fJcnTwM6gCzOjxW1QykND+ElnBrzSDoTThKomwrOgWdD/bPG8P//6J
         mUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yg+v5/kXrzHYvX0Jw+7F773cEOq2rwIlZqjbglsclKE=;
        b=MeufHjKkZnXuUQH1I2xpvokd2xqKfVJgNdQScmNY5MXlautWYlqhybL5gUpADinavr
         5IH0/a54CGV+uRgCyaxFDsunsXyUUuDscZjqnMVtdxwFMFQv5nAiu2beLtY4ZhIXZMsg
         0yTqrMsAilnFKJpG7krSAOzmTQo1AI72+WQRkgYbie9V6m8kDe/sZ4FzeJ79dUEAm4iz
         m1GAmIDOMqXf2BQtEYaFtkYZAwgS7/eKSv5OiVqEyEOnmuccMmbppEoYRqAGtS0Ke7rL
         8RVSH2njcyW7luN1V2EO8BT6ly2f+n3VHhpcJvYL57AePuaFupVsfHhQvfCOnK3wdhLa
         K4Cg==
X-Gm-Message-State: AOAM532r8pLzSU23msHkStbubb50yLPNLGeJt5bj+PItyOEstMjSqkGD
        AvY3Ziy+j7lEc9qQ6/iCKbgxEeRjRCQzHnsLx+IIGA==
X-Google-Smtp-Source: ABdhPJw7bRhoYK3Ux5ni1GXhoeIH3eF72GV4KTg37uWDy3Ygzg/e/Jfol28vMdjJzcXgSmBy2djug+FawUB9D8iKn2w=
X-Received: by 2002:a25:1ec2:: with SMTP id e185mr2000202ybe.23.1622634869238;
 Wed, 02 Jun 2021 04:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <cf34b0268bf298314392b0ed8831a4d9cd14efca.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <8c1f817e48bce8a4cb730d79c1ef0330@walle.cc>
In-Reply-To: <8c1f817e48bce8a4cb730d79c1ef0330@walle.cc>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 2 Jun 2021 13:54:18 +0200
Message-ID: <CAMpxmJWmmB1tuYS-zy-n165WFnAmz12-7+3LDQxxh+jvk=QD_Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: gpio-regmap: Use devm_add_action_or_reset()
To:     Michael Walle <michael@walle.cc>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 28, 2021 at 7:17 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-05-26 08:10, schrieb Matti Vaittinen:
> > Slightly simplify the devm_gpio_regmap_register() by using the
> > devm_add_action_or_reset().
>
> Reviewed-by: Michael Walle <michael@walle.cc>
>
> -michael

This doesn't apply on its own - looks like it depends on patch 1/3.
Would you mind sending it separately rebased on top of my for-next
branch at https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/?

Bart
