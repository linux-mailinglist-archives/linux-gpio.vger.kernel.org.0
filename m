Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2C97AFEEC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 10:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjI0IsR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 04:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjI0IsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 04:48:15 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68EFDE
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:48:13 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7ab9ad973e6so2964718241.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695804493; x=1696409293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UePqMDDAbqRhi0bsJrfurhqXQouyI8L8X5n7XzM0aw=;
        b=FfgwJS1Rvsv35goPZ8b9P23dOQOPPUlV7AExFRNOR7J8BjwtqnzOKRsbZCibiJwTJA
         mbD+wzPTx5xEmcy73G/DyVHiNsRVEROv33QSb9WUlEOF6J9BWwJdVmMrpKCeJb7KHAbN
         NV2KlQcdq4Wh4cK7HBRQRkmyVL2V138IJQZFysKfxIq4PfyLYQsSPAmB+6Mhta73cRdY
         KPnJ1u7Axrzm52VddpmuULaLD1ae1Jwt/tS19Osa+YjN+vi2yUhqEsawCtURYSYewIWh
         Eza8dzNEeIGMrRyYZrY8T8aPFFjOsMu6Q5mWKvnzZK3xHO8vnTn8Tn+v4u33Kg6LQ+LX
         q7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804493; x=1696409293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UePqMDDAbqRhi0bsJrfurhqXQouyI8L8X5n7XzM0aw=;
        b=lIAyM3RkL/eWRgGHoNtibvo9Yr0cJVF9tgBcnMN7WmL8FLNBAoOIvGH1U91NlOHM0U
         RMeM2THtIpucCdOQiuhil61YzubeYd1cUCUivw7xnAGTTSml4ruPgyXfJNHhxhf+6ZF0
         fe11Vn2jS4uL78kDyuDnxsy3SrI0uW+9DneQczTMV5R2milxOqHp7DdSj7IWlVHg4cDR
         vILv9ifo/vRen1sapXXVNj03tyCbuwOgElNpxQxJzcV8FrByNqGb9BEfjUfwUnQ4vAmK
         fOLEwEe25/nVqhwTczYG0Ge/0FRzil6oG04Pp/sZws+9hGJrXf1kMFdle3sHTJ42SKBF
         zJYQ==
X-Gm-Message-State: AOJu0Yw8Yzamaes+dUPwzePIyGe+4EwKlmVw6FQJE4FomUUaU1UOHzgZ
        bc+lnJ3PIO0WNdydBdtawsPNUoWYSospnOzco1pPxg==
X-Google-Smtp-Source: AGHT+IFQJtKsE+gtrZBKTdP3Ub4DSJkvgu5MeAUur4etdFKcriSX73VjALIHRe+/2tItrB4gRzHHuL+FlPlRAvpeIt0=
X-Received: by 2002:a67:fd17:0:b0:44e:8ef9:3371 with SMTP id
 f23-20020a67fd17000000b0044e8ef93371mr1313754vsr.8.1695804492779; Wed, 27 Sep
 2023 01:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230926145943.42814-1-brgl@bgdev.pl> <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
In-Reply-To: <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 10:48:01 +0200
Message-ID: <CAMRc=MeoRRzc+JHCSyOqYb2t5p6GMLdA5wX_-uq15O3tdzC1mQ@mail.gmail.com>
Subject: Re: [RFT PATCH 0/4] platform/x86: int3472: don't use gpiod_toggle_active_low()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 27, 2023 at 10:38=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi Bartosz,
>
> On 9/26/23 16:59, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiod_toggle_active_low() is a badly designed API that should have neve=
r
> > been used elsewhere then in the MMC code. And even there we should find
> > a better solution.
> >
> > Replace the uses of it in the int3472 driver with the good old temporar=
y
> > lookup table trick. This is not very pretty either but it's the lesser
> > evil.
>
> I saw your previous proposal which added a new api to directly set
> the active_low flag, rather then toggle it.
>
> I intended to reply to that thread to say that I liked that approach,
> but I don't remember if I actually did reply.
>
> I wonder what made you abandon the new function to directly set
> the active-low flag on a gpio_desc?
>
> For the int3472 code that would work pretty well and it would
> be much cleaner then the temp gpio-lookup approach.
>

You did reply, yes. Under one of the other patches Linus W stated that
first: adding the ability for consumers to toggle the polarity was
added to handle the MMC slot quirk, then it was used unknowingly to
GPIO maintainers in other places (including this driver). I then
acknowledged the fact that it should have never existed in the first
place as this is HW description and should be defined in ACPI, DT or
lookup flags.

I'm not sure why this information needs to be hard-coded in the driver
in int3472_get_func_and_polarity() but maybe it could be pulled into
gpiolib-acpi.c with other quirks?

Bart
