Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913815230A2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 May 2022 12:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbiEKK0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 May 2022 06:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242098AbiEKK0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2022 06:26:11 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C2E23160
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2022 03:26:09 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i19so3046945eja.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2022 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYugU7S9X/8H3usW2crV/tMlQne9bZCdkG0vtH/tzWc=;
        b=N7sXz7D/O3Eu2QR52vC4Stf0V501TehzUvB/p3h6e0FKTje7bVC/wybu+3K1ifyny7
         qsczQd6fRFHTufLWz07iOYYvO8bsSMBMn7EU0KA103+9Hq+Tk5ST6pJTc4GKmgfJT4LT
         Y8Lp0C8cw+zts5L5gqCn0JyytA5l2j75ZCNWARLDEvTeUD+/VbGH9GCUd7wStI4Wd3kM
         ByV9mtidI8rnHg8y2tI0AtcfRLsxp9fGBcU7gRN37lIFLnQjeMrcDfzaKfSOyqM5bWmT
         U+5jAkZPCmEmOSS1Q+s6rzMnbkbsfZWw+QsvVW3TNzOwhO0NgyWPZheCjj9Mts+VD5bx
         3UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYugU7S9X/8H3usW2crV/tMlQne9bZCdkG0vtH/tzWc=;
        b=XerQSYMrhPGXPMQnM1DDj0MSZxWtxd1tLTGEslAkao2JoaXGBqtoqfzSknlVwGiPR8
         ufix9hZAvfvmU8mhAkTaL491qL+G6zyjkg86MPA5Hmlihj8Us53ugKf+QbJse4Ygjnbg
         irVSpbxqYAlZOitft806IjmyP6lNhkWt8jQ5DjyADJgpTNy8Kt6H0pRkyCzeHZgYLVgc
         Iqk1u956pjIk1iy9TxLT95J7FKt1TN8qJi0KXH7FLTgMrk3aOq4En8IYFG3rqQoxFM7K
         VotkKSXdUEd4JFDAn7oL4w53WnxnbO1NFO83YmvKvTk9tukb3Y/1WVI1hoQtB4p+dv5X
         eFNA==
X-Gm-Message-State: AOAM531rSEdFsjoSSvFmZvL00mcmQ0j6qgx3pnHZSYT8xAMtvJhRZOju
        wx8u3qxMGtdFLHwai5y7HtoYvIrI55qGruuydts=
X-Google-Smtp-Source: ABdhPJwPy2FZHyG0Cwe2/r/Ngx61wcoxoPAHyRl+86/zOn+IvPOW50OHLAqJDvA3mo0WNX5PmDgHS872nivEit6VjL4=
X-Received: by 2002:a17:907:868e:b0:6fa:2fe2:92d6 with SMTP id
 qa14-20020a170907868e00b006fa2fe292d6mr14376724ejc.639.1652264768368; Wed, 11
 May 2022 03:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <0498c761-1a80-a37a-264d-a6665d8873e5@tibbo.com>
In-Reply-To: <0498c761-1a80-a37a-264d-a6665d8873e5@tibbo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 May 2022 12:25:31 +0200
Message-ID: <CAHp75VcX2pha17QbwT++abRm4GRaPW2Jefzj+5JaYJm5046exg@mail.gmail.com>
Subject: Re: gpio ->to_irq
To:     Dvorkin Dmitry <dvorkin@tibbo.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 11, 2022 at 12:03 PM Dvorkin Dmitry <dvorkin@tibbo.com> wrote:
>
> Hello!
>
> I have a question about gpiochip ->to_irq().
>
> Kernel call gpio_to_irq() requests IRQ for the pin, previously taken by
> *gpio_request().
>
> But for sysfs when user does echo "pin#" > /sys/class/gpio/export
> gpio_to_irq() is also called at the time of export there:
>
> https://elixir.bootlin.com/linux/v5.4.100/source/drivers/gpio/gpiolib-sysfs.c#L171
>
> and there
>
> https://elixir.bootlin.com/linux/v5.4.100/source/drivers/gpio/gpiolib-sysfs.c#L378
>
> It is a problem for my driver.

It's much easier to answer if you may share the source code of your
driver. Ideally if there is a publicly available datasheet on the
hardware in question.

> I have 120 pins and only 7 dynamically
> muxed GPIO irqs.
>
> So when somebody requests gpio_to_irq() I am creating the mux to the
> first free gpio IRQ. But When user just exports GPIO pin using "old"
> sysfs kernel interface in the filesystem, it should not be done.
>
> How can I see if gpio_to_irq() has been called by sysfs to prevent
> unnecessary dynamic muxing? Or there another way to get rid of this
> wrong behavior in my driver?

Generally speaking nobody should call gpio_to_irq() in the new code.
This is a legacy interface that mustn't be used.

-- 
With Best Regards,
Andy Shevchenko
