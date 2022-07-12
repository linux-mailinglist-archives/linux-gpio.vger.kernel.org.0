Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B802571725
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 12:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbiGLKUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 06:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbiGLKUj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 06:20:39 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2D0AD86E
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 03:20:37 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id b11so13433994eju.10
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozaUeoGi3u7WP897E9FYN6L8XxErhvpYIqmXDVkaws8=;
        b=oY0zxEH4gl02SnRbgAFxJ2+lBq/GxElIYWnEWPfG+LGU3FWG06Dsm3AHfsmOTJzf2t
         DnfLDxFu4JBi+55gE4MZ3A9K+NSNqEJUl0Ob2HT/fj/+Otbf7nRRIilGliNhK9OjMAxX
         0+F2QZZZMMqFuVDS+3UOlPNVmmH0jLHrfmS8FjD8h7fi3PULhu4SCJbwlpZVxbMCoJ3n
         CjR1CHyK2Flxs0eZ9YXrU5SUHhpbAdKfIrVrVhNviXCidtgkn6nuG/C8YtJBl/2mrxQu
         rBe6/Njiic1nltnDUfsC83MbVKW4nNkS7w3AlNFGBDhBVfh98MyeMb0vSj1AXEecYmvg
         ZhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozaUeoGi3u7WP897E9FYN6L8XxErhvpYIqmXDVkaws8=;
        b=w3ddsoINl66irWXHhpPvRN+HokSUyZbTof5b+kIUm9GvspWQryJm/Nwbipt4K3+fGD
         zirs7re3ImX2XIBRAoJCjr0ef7wbIJmGt5RpqetvGBQRa/swzyKnF1pDZntCudaik3PW
         7kH188zu71Z4bezY3bIbWSYOM5vmcyIseVsRtxms9efpoRgQOsGHn4OkD1gYaMAu7azp
         Wjqu8hTE+zm+1uDofRPk7T3rk4+K2ahVBUGYmgSmSbq4I0BkUT4fdTD5cQwWXYgwczaO
         nsFRlqKdB8X3CIoX9F/1UTrG00DJGBMS9SWkB+c6gyn8oUKSnuho63AfZqhfSEzIXzsa
         3zkg==
X-Gm-Message-State: AJIora8wCUyBJoqo8SZitPiGLQB27nWu448o3Bg4FYa6u3s6PjXQH44L
        0uS3iBa0luhtivrp5T49ceYXaXtpIBmzM9AUUaQiLg==
X-Google-Smtp-Source: AGRyM1tPRLVa7IMVqTA4GFU4n9EOzVyNXdCLGRWuzDCY0akWo2JtYKzBbAIIPKP9iwkIHZHXQWkcKKHZ0BS6QE2IbCw=
X-Received: by 2002:a17:907:7d8a:b0:72b:86ef:acf6 with SMTP id
 oz10-20020a1709077d8a00b0072b86efacf6mr1153989ejc.101.1657621236031; Tue, 12
 Jul 2022 03:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220711125238.360962-1-windhl@126.com> <CACRpkdZJBT86um5VM0e2mnMEv=cVrg7PmZNGbZ0GwxC-1nXbBQ@mail.gmail.com>
 <CACRpkdY0HH1c2bWz+W9wna7wP1-HjuOL-tRBsvUo0iEuGx3VQQ@mail.gmail.com>
In-Reply-To: <CACRpkdY0HH1c2bWz+W9wna7wP1-HjuOL-tRBsvUo0iEuGx3VQQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Jul 2022 12:20:25 +0200
Message-ID: <CAMRc=MdKRL-TtWeOaJ0kr0gpNA=G2MpZbS0mrcEu9zW-v6mTqA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Liang He <windhl@126.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 10:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jul 11, 2022 at 3:23 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Jul 11, 2022 at 2:52 PM Liang He <windhl@126.com> wrote:
> >
> > > We should use of_node_get() when a new reference of device_node
> > > is created. It is noted that the old reference stored in
> > > 'mm_gc->gc.of_node' should also be decreased.
> > >
> > > This patch is based on the fact that there is a call site in function
> > > 'qe_add_gpiochips()' of src file 'drivers\soc\fsl\qe\gpio.c'. In this
> > > function, of_mm_gpiochip_add_data() is contained in an iteration of
> > > for_each_compatible_node() which will automatically increase and
> > > decrease the refcount. So we need additional of_node_get() for the
> > > reference escape in of_mm_gpiochip_add_data().
> > >
> > > Fixes: a19e3da5bc5f ("of/gpio: Kill of_gpio_chip and add members directly to gpio_chip")
> > > Signed-off-by: Liang He <windhl@126.com>
> >
> > Patch applied for next as nonurgent fix!
>
> Oh no I shouldn't. This goes to the GPIO tree, took it out again.
>
> Yours,
> Linus Walleij

Applied to GPIO tree.

Bart
