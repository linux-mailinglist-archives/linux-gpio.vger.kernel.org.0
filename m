Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345A2527117
	for <lists+linux-gpio@lfdr.de>; Sat, 14 May 2022 14:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiENM6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 May 2022 08:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiENM6D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 May 2022 08:58:03 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EED55BA
        for <linux-gpio@vger.kernel.org>; Sat, 14 May 2022 05:58:01 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gh6so20943455ejb.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 May 2022 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IoHz3rKQ6T9DaUlQMzQ2pFXtAHjOXDI9HT3Dr8Rzuok=;
        b=hC4p+y23s4tTMoDduWRP5QBttUikdqsg60mshzDwMopKtzIsU9DgJKE/YFviXguGDI
         yxq1sROw2U/WGFkXXYncIkCtg3hteWXXkYRlbgLt5AU5PN/quFmKfE8AxlNxn4po9nH9
         KuTK7f1QHgoEv5VHFiqf40zuMyNnUlOitjhP1reB9NnrSdHWuZRPG4L0T33phKxesQ2y
         f0rSGhUs+5XPcJdNc+vy2R8AZWb2PinM0aKmRAkASu+Mhuzbm2fj6kvbQEDbEy4HDYTF
         QGmsWuD5bQyccBF6g1YuTNQAsoXkDtlbQSLppSpMxZYQz9xR69DWOIbTZVoanIzqKL7k
         C4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IoHz3rKQ6T9DaUlQMzQ2pFXtAHjOXDI9HT3Dr8Rzuok=;
        b=kQCfBZLYkzN7/OYHaXEcEuwAxrg/Y2IwZ7s1CGFUPtHH+WPvwjzgfXGJvbTqmz33dl
         jquqh+4qtpqlCAobVcXYqC779nq4LmNCS9w1CrUZXv2cEChIy/H2nZ8qEi1ls38mqfV/
         DfQRc90rNcrbv+ypxweTuNk0DNf0YsrcCJWQx8Mw2CyRltbrzoB6uh36b10uxIQbj4vQ
         Od/z9P5lR5VL5lD9tgZYw3jBMNXNfEh14pHt3y+5Ll906ARQ9PZpD2yJ8y7UZgP0u6XU
         H6iUtHvbqzIiLLq0VxIhugxIY7wUc8WQFhCpxClLy8jWUzlt0GNmCcRP8K8Zabd9X6/2
         44fg==
X-Gm-Message-State: AOAM532tKOuuzIAWx+YknsT5ii+FgETY4DFe/GsIa+0Dk5A7cmD6sul4
        OE8iZY/VoHQ7K/KIzR5dIfRiB1cH8B2woL5u+fdwQA==
X-Google-Smtp-Source: ABdhPJxB+qCZngUdr4yUrII4I3bVfMSmqFg4fFYMQefU2ZKYL/N11BE4ANEiHNyf4wlRJqEhTo9ni0XfLPjSahUOlN4=
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id
 sd4-20020a1709076e0400b006f4d6f3c72amr8361063ejc.636.1652533079660; Sat, 14
 May 2022 05:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652201921.git.william.gray@linaro.org>
In-Reply-To: <cover.1652201921.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 14 May 2022 14:57:49 +0200
Message-ID: <CAMRc=McAe28ZwcGknzrju-PQTEZ7x2XAfoRyfLFMWpgGB8DVLw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Utilize iomap interface for PC104 and friends
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-iio <linux-iio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        schnelle@linux.ibm.com, David Laight <David.Laight@aculab.com>,
        macro@orcam.me.uk, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 10, 2022 at 7:31 PM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> PC104 cards and similar devices do not need to access I/O ports directly
> via inb()/outb() and can instead use the more typical I/O memory
> ioread8()/iowrite8() accessor calls by first calling ioport_map(). This
> patchset converts the relevant PC104/ISA card drivers to do such. With
> these drivers now utilizing I/O memory accessor calls, work can be done
> to consolidate some similar devices (e.g. 104-idio-16, pci-idio-16,
> etc.) into a unified driver in a future patchset.
>
> This patchset spawned from a suggestion made in another thread titled
> "gpio: add HAS_IOPORT dependencies":
> https://lore.kernel.org/all/c3a3cdd99d4645e2bbbe082808cbb2a5@AcuMS.aculab.com/
>
> William Breathitt Gray (8):
>   counter: 104-quad-8: Utilize iomap interface
>   gpio: 104-dio-48e: Utilize iomap interface
>   gpio: 104-idi-48: Utilize iomap interface
>   gpio: 104-idio-16: Utilize iomap interface
>   gpio: gpio-mm: Utilize iomap interface
>   gpio: ws16c48: Utilize iomap interface
>   iio: adc: stx104: Utilize iomap interface
>   iio: dac: cio-dac: Utilize iomap interface
>
>  drivers/counter/104-quad-8.c    | 169 +++++++++++++++++---------------
>  drivers/gpio/gpio-104-dio-48e.c |  63 ++++++------
>  drivers/gpio/gpio-104-idi-48.c  |  27 ++---
>  drivers/gpio/gpio-104-idio-16.c |  33 ++++---
>  drivers/gpio/gpio-gpio-mm.c     |  43 ++++----
>  drivers/gpio/gpio-ws16c48.c     |  65 ++++++------
>  drivers/iio/adc/stx104.c        |  56 ++++++-----
>  drivers/iio/dac/cio-dac.c       |  14 +--
>  8 files changed, 248 insertions(+), 222 deletions(-)
>
>
> base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
> --
> 2.35.3
>

I don't see any dependencies so applied the GPIO part.

Bart
