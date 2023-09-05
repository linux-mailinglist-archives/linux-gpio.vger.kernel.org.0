Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5385D7927FF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 18:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjIEQTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 12:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354516AbjIEMK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 08:10:56 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BA512A
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 05:10:50 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-44e8ddf1f1aso2036381137.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693915849; x=1694520649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByQYrlg6Hr1sWKjfl7KMv/Ov1X/DbHEMOLisUi7M1Ps=;
        b=fxq/tCupmv/nOG039/9BvceDZmOdl3BFA0L1HvnPKARgYgLupl6F2FSp+/9lIcL8Hn
         dBpNlSpgXV4nkMFXZsTNOwbJaS6FDAUr4bw5UEt5ST2yYX1eVKqeMfs5sw7Yp1vVt3E9
         lYQmBdSQRTHL4S0Gm3pFCX/uIhV5/Hc50MzjBm9NYzDcUeHai8Kqorgd8y+ucqzZ0U50
         VxQz7tzG6/9HYTu88FkKsr0ju20OBzcftL5LtIfzQbsq2brqTvAqKA2eAmNDu4PexoYq
         xH/K9cwAc9RAaU7t7r5jsBm88LtRNbWcfltz0CEhzaOcKJHaXN/srgYmSxeZiGM7yTiC
         sWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693915849; x=1694520649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByQYrlg6Hr1sWKjfl7KMv/Ov1X/DbHEMOLisUi7M1Ps=;
        b=lN0ol2ppO/MnPRyQMn4iVLUJCG0J2kPpjdwMiUbdgBTRHpM8XEHZaj15vdB0oIK2Um
         GwkRpqguBW6hlzSUu9H2cxwruI3q510S8j7OcB+XiGJo7jNF1+pVtlDYErzEscWv+j/k
         w8hDFDngr+yF6B7nb5UjC7NucjJCKGnt4gQHQM9qg8buqqXQtLPEEyEgLYR6FM0LqKRu
         u5v6pJQ2ZW1Dlh6/SUUEm118Hnxffw34XFZ8Szeb3xOfQ4tLSXhs+RooaJUVNZtIeSdF
         3aIIepfzgr96y80Gcl3dVe/HIq0gguisHokCydDktZwXarz7AZ1L8jcn7f/BviWsfmAr
         YaXA==
X-Gm-Message-State: AOJu0YwI6vZxO+GdRr1HTltNTcXdu4T5gBdwGoYmIhwun9Hmf633lz93
        lt2w4qKthGfgagz6olfqihUGiqbslzlQI9V+5A7OPw==
X-Google-Smtp-Source: AGHT+IEIDe8QcwF4NCVvAh4n2QHR7c6zc20jFgCDper8N68SO8cyxneqQqWx+EiQVQWMnfeTiEiFMG1aT5aP6qIC0QQ=
X-Received: by 2002:a05:6102:1481:b0:44d:6281:4fc2 with SMTP id
 d1-20020a056102148100b0044d62814fc2mr9197302vsv.3.1693915849457; Tue, 05 Sep
 2023 05:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230905082413.21954-1-brgl@bgdev.pl> <ZPcZfd5UtzMmIUvm@smile.fi.intel.com>
 <ZPcaVjOudGeLd5EP@smile.fi.intel.com>
In-Reply-To: <ZPcaVjOudGeLd5EP@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Sep 2023 14:10:38 +0200
Message-ID: <CAMRc=McjfYqkX5jL=kwWnceHopebbgDr2XV_h5fjkG=7n7kD-Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sim: don't fiddle with GPIOLIB private members
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 2:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 05, 2023 at 03:05:17PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 05, 2023 at 10:24:13AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > +   chip->swnode =3D swnode;
> > > +   ret =3D device_for_each_child(dev, chip, gpio_sim_chip_set_device=
);
> > > +   if (!ret)
> > > +           return -ENODEV;
> >
> > Can bus_find_device_by_fwnode() be used here?
>
> Answering to myself: you already mentioned that this should cover any bus=
,
> so the answer is "no".
>

I think I mentioned it under the gpio-consumer where it's true. Here
we are sure it's on the platform bus.

> But also we have device_find_child() if I understood the purpose of the a=
bove
> it should suit better, no?
>

Right, it's a better match.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
