Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D917A43F0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Sep 2023 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238718AbjIRIEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Sep 2023 04:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238716AbjIRIEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Sep 2023 04:04:24 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A37E44
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 01:03:51 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-44d4c3fa5beso1625639137.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695024230; x=1695629030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRsXUkACsJ4o8H92RMLRHCSh+7BSn2mee0YqOJLL3tQ=;
        b=NtU+55PeFOQTX9op+8eikqxxi2YfwgBMBIJKE/lvr9KJKbFCEkqwVbIt1XZjlTZql1
         P6BxyCYDD1su/keXZx58sCNyuD7dTI2aARyU9f1fIi2xOTj5JKyOo4AWjhizBqKPk4U9
         lqI6XcS2j6kAbxsSUFd1piqoKAuDjNv1jla8g0aB6jECxIYe24bV/M0rQ9PBtTPMMAGN
         IZY0942MDU1iUarkPPDJ4W2DbgoOrZsZL11+K1nGglUC3E7StCIswLO7bcmda/imOoyL
         A4takTQOojkI9yZpKoL1CULsT4DphTPLnRU76QqAZ9aoroGCkZrqwQE+4kJMakWvCPkH
         BKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695024230; x=1695629030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRsXUkACsJ4o8H92RMLRHCSh+7BSn2mee0YqOJLL3tQ=;
        b=GW/DJvmILg9xFXJhMXTqHdY2SqiL/qs1BKZZewg1X+ppDqbIiMrcB3PtBp+pK1Bxlq
         LX4VkFUcps0qhWnxo3KKUd7DfuHDOfi5Qc56/8IYxA5ywXW9YSRmE6HRfjg3Y3dA149v
         78CdJ+D6rffAgdxnW9EX8HyXP9SqcV4HPyiSlIz3XnKgT+QIU8aeJlRdKol3o28yiqOV
         JFiaVoPVM7inMZgg0a2T3dmUOrQRexUXEX75iPETIuUElM6JVrhoKW1OOXR5lik1E+oI
         Frgd/9/UxaHyw1rJaGjZQJfsyvlB6o0K1wa890oidfarAhwy4aFy9ViggQ9fjyrd8ejk
         SWbg==
X-Gm-Message-State: AOJu0YygnZu6tWkoKA6aQA7HzB2w4JE5FdY4QPDneClJIm6Hdhc31VA7
        emvxG+uw4Xee8BjYCo6pmm5qtqfoIVhkFFPLiRScUA==
X-Google-Smtp-Source: AGHT+IG1Iww9gkKCj78RwGDzshqMBlGyjnM37rMtGGtqSIf0SA1ZnFbKz3eBshK1EMe959YYE4RsS4lQkySUf8KbRwo=
X-Received: by 2002:a67:ce0d:0:b0:44d:626b:94da with SMTP id
 s13-20020a67ce0d000000b0044d626b94damr7166456vsl.32.1695024230679; Mon, 18
 Sep 2023 01:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230915150327.81918-1-brgl@bgdev.pl> <20230915150327.81918-8-brgl@bgdev.pl>
 <ZQf6zTsoZDFaIgHO@smile.fi.intel.com>
In-Reply-To: <ZQf6zTsoZDFaIgHO@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Sep 2023 10:03:39 +0200
Message-ID: <CAMRc=Mc9k9Brxw9eQxLS75ukin1o3D6P6FrX=nbfhgM7_e9W_A@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
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

On Mon, Sep 18, 2023 at 9:23=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 15, 2023 at 05:03:22PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Remove all remaining uses of find_chip_by_name() (and subsequently:
> > gpiochip_find()) from gpiolib.c and use the new
> > gpio_device_find_by_label() instead.
>
> ...
>
> > -static int gpiochip_match_name(struct gpio_chip *gc, void *data)
> > -{
> > -     const char *name =3D data;
> > -
> > -     return !strcmp(gc->label, name);
>
> And this we had no check for the label being NULL...
>

Yeah, it was wrong. But maybe all kernel users already do assign it in
which case we should be safe just adding a check in
gpiochip_add_data_with_key() that would return EINVAL if they don't.

> ...
>
> >       for (p =3D &table->table[0]; p->key; p++) {
> > +             struct gpio_device *gdev __free(gpio_device_put) =3D NULL=
;
>
> > +             gdev =3D gpio_device_find_by_label(p->key);
> > +             if (!gdev) {
>
> I haven't got the fix for gpio-sim, shouldn't we have the same here, i.e.
> definition being done together with the assignment when __free() is in us=
e?
>

It should but I only got yelled at by Linus under the gpio-sim patch
after I sent this one.

Bart

> >               }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
