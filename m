Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A75783A52
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 09:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbjHVHI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 03:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbjHVHIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 03:08:25 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD95ECC7
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 00:08:20 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso1023977241.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692688100; x=1693292900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dzpiJWmjhBHJZVOntDh9DCFQCdymj4+iYdAizm0EOQ=;
        b=MXwYYb8/u6sgiZkBKOK2InJrbA3v3TINKKGtkKkLsUoAnn3EbhUmgO2gVoWDE0mujX
         t9wJeRucJmUd8XjfVtBPxRSsHIupOiNAFl5P6bz9MPB1bKUEZo7GWe25kmrYV8zDUBso
         f4jNhtADsT9dIzXB9JIOK1Z9KYPnh4vTQTEoe5kz2N1gPw+qqFL0N+mei2WE4nfJF6T2
         siUgkCzuyHBpmwPV13H/iow5rBSeWw5WqB5NK3NAPsqGy0CPO/McIDjPkXe6LEVvDjGR
         7+UabwPMKObPzMKTJDMqBv/ERNU3LJXR6IromGKdfyzTkRmHxTtRvG/K7Oxd2PkTwgxi
         cDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692688100; x=1693292900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dzpiJWmjhBHJZVOntDh9DCFQCdymj4+iYdAizm0EOQ=;
        b=JVEm+j0lQffVl0f67DaltysMWTA5HyFfdGlc8MQlCGNIYGdEny0N8VOf2EYdG+Nx14
         tAMxYKxJjjoDK2pbleKNoDUfvBuTvReqo6MhEEJxivYNftKsaWwV7OILapzOYHyM+Tqh
         iyNOx8W3wRvfoYls+hJoKVdd1Js+CnL5Sj7Nqj5mQwDRjRHqu9zc9YoJ2X9HG6WaMAko
         XOJgqBE5Tk+8zMzjb7haftFon9QtlPIQxs8bz7VVUnVXa1/Kc9Ka5knyTMs2yKQhMoG6
         d1NeBrxKo/WgImpAumUMBIOs3M+gLOnBKkSbqJXODzt9YF1JHIIcgOgxWk7rPwJjudDc
         KDLQ==
X-Gm-Message-State: AOJu0Yx8ovn63esl5kWhn1fzXvXOEyayKrFSWIAPhki1P2JnR+uahVU3
        MfqW8QR9HAfpLidNPnZArvpABR1c5ce+1lNSu7XJCA==
X-Google-Smtp-Source: AGHT+IH+f33qGFPwCbTLBHh5IHXvpoPQnv9wW2fNLLYFFf+YxlyrLc4vh2VT7GAxr7AzKIGvidEGAH2Vfkpnp6M7BLM=
X-Received: by 2002:a67:b603:0:b0:443:b014:e5af with SMTP id
 d3-20020a67b603000000b00443b014e5afmr4026173vsm.6.1692688099790; Tue, 22 Aug
 2023 00:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230821153339.26305-1-brgl@bgdev.pl> <ZOP/n30hYR/8zN60@sol>
In-Reply-To: <ZOP/n30hYR/8zN60@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Aug 2023 09:08:08 +0200
Message-ID: <CAMRc=Mep_AZPht6cQFQ-Pz8UJC-q1r4F29SJ=+_WgJX1cz5wtw@mail.gmail.com>
Subject: Re: [libgpiod v1.6.x][PATCH] tests: mockup: unbind mockup devices
 before unloading the module
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Tue, Aug 22, 2023 at 2:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Aug 21, 2023 at 05:33:39PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpio-mockup relies on the GPIO devices being registered in module's __i=
nit
> > function and them being unregistered in __exit. This works with the GPI=
O
> > subsystem as it only takes a reference to the underlying owner module w=
hen
> > a GPIO descriptor is requested and not when the GPIO device is
> > instantiated.
> >
> > This behavior may change in the future in the kernel so make the behavi=
or
> > of libgpiomockup more correct and have it unbind all mockup devices ove=
r
> > sysfs before unloading the module.
> >
>
> Never knew that unbinding was even an option.
> Maybe update gpio-mockup's documentation?
>

Yeah, I might once we agree on that reference counting patch.

> Just clarifying what the potential impact of the existing libgpiomockup
> behaviour and future kernel behaviour is - the kernel may log errors but
> otherwise correctly handle userspace unloading behaving badly?
> So this patch is pre-emptory noise reduction?
>

No, it's a bug-fix-in-advance. gpio-mockup will fail to unload (until
we unbind all devices anyway) if we couple the module's reference with
struct gpio_device. So will every driver that registers devices from
its module_init() function and tears them down in module_exit(). But
these drivers are wrong to do so in the first place and unloading them
sound like a rare thing to do anyway, so I'm willing to give it a try.

Bartosz
