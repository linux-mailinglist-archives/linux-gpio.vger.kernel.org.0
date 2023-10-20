Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B35FF7D0BAC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 11:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376784AbjJTJ0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 05:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376771AbjJTJ0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 05:26:19 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3151ED7D
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 02:25:51 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-457eebf8e01so234330137.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697793950; x=1698398750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3n+mlq2jHg9E8YngtT6r3A6TvxLTC271t27uMu4pVM=;
        b=KF328bISD+4M1PB2z/MYZMag637w/BRFhy3SddegTCZdoDgOAD+rY0LnugvHoUD5eI
         ZpFLlwqpwaXiG/xDVkYXhPH4pDbGG9jqKGCU1v1um3vxX/t5GPmC/7mzA7NFge7pLG0V
         rpbDkVG7k2CfW2OJ7lUByWUokEyr/zoBiR8fEpbO68jcp4Vr4K95TXi1GB1TZhbgYGCY
         GKp6hhH80sHfeqjpY5BD75zobu3ucSHGInQwhYnetc5exR9I8G6NPlUIrDu1sXsF9Zw2
         PInbb54lw87LkO0K7ro3qUXxAgxEPiEFlCFcUWqCcg/11MPUrb+fHsQVtGSna8h2k9pC
         cidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697793950; x=1698398750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3n+mlq2jHg9E8YngtT6r3A6TvxLTC271t27uMu4pVM=;
        b=AmSQazl7WzIy0kFDFs3p87Qaqo6ujy8iINnfrT7DgDa6RAAIHkyg0IYFQAtnI6wBf1
         tC0pQr09EO2hW1VdGtJpyYBi9VwgbkrINEtuEasIzqpuOJZCCzo2xxCWcMh4d9EB7aPv
         fxazyF00JwkP2xbcyl5jMIoVEnnz/US4hmP+NB6hIC+UxhxQiDFLIyn8nMwNg1aVWGka
         HZ7k1A+xDDta0qF+MzeuW4KFXiMPLqwrQQBlgaFQDTw8q9L+C7CL2oTqQW7s0API0Rtd
         yslh/Toaszl8J8hT5IPiikZRzYRuboI3VXaw2PfH9HZtQanJ6u7qlvbDrKHrGs2BdoMh
         q7Jg==
X-Gm-Message-State: AOJu0YwEE36U3UZrrlDWieCnhMcNTuSxtaW76sdNM88/tMxNqXtvfZh1
        /yqhIOtlyqAkKB/FOryH19bStqCcUHID+yXF6W2aWQ==
X-Google-Smtp-Source: AGHT+IG78QH4iCELlvODiA2UrDujM1It9T1JK6XJ0sitNznrXFFaz/6tEuwgLLb8ygvnxHc/PCY8Pjkn76SgvSJLisg=
X-Received: by 2002:a67:c00e:0:b0:457:bc94:fc9f with SMTP id
 v14-20020a67c00e000000b00457bc94fc9fmr1330423vsi.13.1697793950031; Fri, 20
 Oct 2023 02:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231019173457.2445119-1-andriy.shevchenko@linux.intel.com>
 <20231019173457.2445119-2-andriy.shevchenko@linux.intel.com> <ZTGBcJl2flL_HVX_@google.com>
In-Reply-To: <ZTGBcJl2flL_HVX_@google.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 Oct 2023 11:25:39 +0200
Message-ID: <CAMRc=MfnOnkmQJTqrJGeNE3x3yMxbiZAh2r2bjxqjYOwScokiA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: acpi: Add missing memset(0) to acpi_get_gpiod_from_data()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ferry Toth <ftoth@exalondelft.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 19, 2023 at 9:20=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Oct 19, 2023 at 08:34:55PM +0300, Andy Shevchenko wrote:
> > When refactoring the acpi_get_gpiod_from_data() the change missed
> > cleaning up the variable on stack. Add missing memset().
> >
> > Reported-by: Ferry Toth <ftoth@exalondelft.nl>
> > Fixes: 16ba046e86e9 ("gpiolib: acpi: teach acpi_find_gpio() to handle d=
ata-only nodes")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Although I think it would be better to change
> acpi_gpio_resource_lookup() to take an index and return a gpiod
> descriptor and have a local copy of the lookup structure.
>

I queued it for fixes as this is a bug, we can improve it later.

Bart

> > ---
> >  drivers/gpio/gpiolib-acpi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > index fbda452fb4d6..51e41676de0b 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -951,6 +951,7 @@ static struct gpio_desc *acpi_get_gpiod_from_data(s=
truct fwnode_handle *fwnode,
> >       if (!propname)
> >               return ERR_PTR(-EINVAL);
> >
> > +     memset(&lookup, 0, sizeof(lookup));
> >       lookup.index =3D index;
> >
> >       ret =3D acpi_gpio_property_lookup(fwnode, propname, index, &looku=
p);
> > --
> > 2.40.0.1.gaa8946217a0b
> >
>
> Thanks.
>
> --
> Dmitry
