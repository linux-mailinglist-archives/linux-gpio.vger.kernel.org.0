Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3460E7B4FC7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 12:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbjJBKAA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 06:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbjJBJ7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 05:59:49 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B57D9F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 02:59:33 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-495cf1bf9f9so6132303e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696240772; x=1696845572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpADBQVeHbIRHJaTMsTz7x+KU4g4QU476C8qCet021k=;
        b=IVKia2CZmJuzXJK1HCE9Z7utPkqt1y9ftUJH6qq36a35Tny2uNiaFKlqG5x16TN/XT
         +MNK8ZcdDUiL9K6w3/mAIZ7658R94/thvIAAGGVQ1QQ7mYG16JDrLUWezb2GlnK1seXJ
         P02H+vJD8ZE9Dnt+TvMEOaS/SWhcZTecww3sTUIRHqLUyRCdA6+l/OvupMB3GiL+SbkN
         yNW++78uCrX7K+wippD91/EM/sZuHEmzHykSg3l8x+m/wW7hQZWCzqrjYsNbMHyhs1D3
         +ALVohdqvUeBQ7ZalEde+IlM92KX1U96ReR4lNIH+Nlp2dmOjQ3F3/IbVjFdcJAoyN/I
         9rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696240772; x=1696845572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpADBQVeHbIRHJaTMsTz7x+KU4g4QU476C8qCet021k=;
        b=Esi5GqA9epXsM0NDLZqKk0ALX3rxVAD3xFQp0nKKiVV3uPOaq2Gm//mKCXcrpvXD7M
         xRELb+ee3c8CCT0RlJe4mrO2WJLnLIbfOTf5S2S9XHT7Js54qSLVcRW0UUXbw7I3RYcC
         q/XxKqCdXZvBHdK7u6q7E8ymTNiOgy7v1Rrw3MxcIlo/S4xOYswMv7FIfpr3j3osnGql
         ZM25SkuBBxk1th7123SfgSTzYV6/b3lBxlwtcn8ien3vOVfVCU0xeS+LYj6ZUJuua6j6
         C0MRPHG+yDt9gHw1C9wfNzxQKeBmW3hdivx87aHUgY5gAy4AMuBFxu96AO5iKV4JgXJj
         ByIg==
X-Gm-Message-State: AOJu0YxIVcE32O4xUyrjgLAHsvV8yAPDmYzOyfjdQPsDmoRy5KMSgTo3
        a8By++vowef8IbihSba12wnVo8r/4CU5o+rC5Cbzcg==
X-Google-Smtp-Source: AGHT+IE8ubq22pILCS8LRc9ka3dzKYLPr2jswA3LPcMeu3jullkr8Z+iIybQQJ2jsplDFL1ZhQ8ANGzAUHGnRKOfLKk=
X-Received: by 2002:a1f:ec43:0:b0:495:cac2:253b with SMTP id
 k64-20020a1fec43000000b00495cac2253bmr6632247vkh.0.1696240772053; Mon, 02 Oct
 2023 02:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230927142931.19798-1-brgl@bgdev.pl> <20230927142931.19798-4-brgl@bgdev.pl>
 <ZRqQbzbcNHOtJm7z@smile.fi.intel.com> <CAMRc=MffRnq2ABRGAL9zuQxytfE6E-cJWwUrourgY2k=RNv-Aw@mail.gmail.com>
 <ZRqT+qZ+Xrz4x1IQ@smile.fi.intel.com>
In-Reply-To: <ZRqT+qZ+Xrz4x1IQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 11:59:21 +0200
Message-ID: <CAMRc=MctV5xEXBARLun7T9jOtptFzfv=thFG29Li=g2V0DBYRA@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] gpiolib: provide gpio_device_find()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 2, 2023 at 11:57=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 02, 2023 at 11:52:52AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 2, 2023 at 11:42=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 27, 2023 at 04:29:23PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ...
>
> > > >  struct gpio_chip *gpiochip_find(void *data,
> > > >                               int (*match)(struct gpio_chip *gc,
> > >
> > > > +struct gpio_device *gpio_device_find(void *data,
> > > > +                                  int (*match)(struct gpio_chip *g=
c,
> > > > +                                               void *data))
> > >
> > > Why not
> > >
> > > typedef int (*gpio_chip_match_fn)(struct gpio_chip *gc, void *data);
> >
> > Because gpiochip_find() will go away as soon as we convert all users.
>
> And gpio_device_find() does not. So, I didn't get this argument.
>

This symbol would only be used in a single place. But whatever, I can
do it as there will be another respin anyway.

Bart
