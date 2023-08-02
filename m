Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838C476C58B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 08:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbjHBGr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 02:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjHBGr0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 02:47:26 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396721FF3
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 23:47:21 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4476a9e8812so2125480137.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2023 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690958840; x=1691563640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJvHQjKu6z8FmkxGVc6ZWP2ECLJmKX/NOuW6r8YK/ZY=;
        b=hmnH5vSiUAJ+W5vjK+o3mGftPoblFBk4JmznB923bZJ9Wv+fKdeFzaDFVjJjRbuCZw
         jN6jB1A98Nd9Z+YyYre4du24Q6JFzJvIOCbJL834POAY9PxMJOymdpIoYKOECjS9NaVy
         +NZnXnrLXqELYni+F4IC8I9MSt20BXOtnCk03ZaTLU0JAB2MF5os9CDIDhOSNZYS+sZ8
         Mn1xKpbJYlWyqYW0sXBq9lV3vEV+svxLcLVkSJbH6CpB+oDGbIe3yCohoKgos4G6CyUJ
         9BAZAQLBUwqAvdGeBnAPj3PCoE84d46XtimAR8PJN9IZrKjWXh4gZcWryTgiLi+J472/
         fHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690958840; x=1691563640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJvHQjKu6z8FmkxGVc6ZWP2ECLJmKX/NOuW6r8YK/ZY=;
        b=hf23LGYfW1vwKLe+Lanm7HM9GlO1q8Gpb6ObNiMBOrL//FVRGoIOwFdu1DvM1HWXZK
         MfBmYjXekdyzsi6whaiLH5tePxmg29sIksS9zs5FLyuUI4Ok0qgcJ7eQHb9692WwZUlF
         3wlnGLFHqtdGrQ6ykrdu/Q70h82rJIcR4IVUmm+tZDZaOfjYwTOWkAVavJB3rpH5syud
         AUGTof+q5T3m20fNRA/kbNBvIoPSbyJMMLS8XIIKO6iDbVf++/9OJynLwOU/uPRnmpoe
         Hd/yTwaMRIgpS3vn15kG83Qlbsmwpg2lWX8iqdmMgZcKhZgIjufRPTmd1aMro4p1cSP4
         fiPg==
X-Gm-Message-State: ABy/qLZv33dt4ex4SPyP9zgHeVLJ+xds9NoU86dWRtZpajMOZmQ6p4ST
        XMkpHpWoq1p+qbKQU/R8cU7Efox2II48eImtf/Um1Q==
X-Google-Smtp-Source: APBJJlEHRNMirg/Ob3AFzf5MNSsBaVkPAO0J8E7KRR5F6XkepT9GrYUIOrCYs9uQu6c2Ic2w1JXq7GtO7aG9IpEh2jk=
X-Received: by 2002:a67:f1c2:0:b0:443:8898:2a50 with SMTP id
 v2-20020a67f1c2000000b0044388982a50mr3163651vsm.35.1690958840254; Tue, 01 Aug
 2023 23:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230801190951.51818-1-brgl@bgdev.pl> <ZMlY+QU+yXIl4yab@smile.fi.intel.com>
In-Reply-To: <ZMlY+QU+yXIl4yab@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Aug 2023 08:47:09 +0200
Message-ID: <CAMRc=McLt23osfxcNA4-3eqVY_O-PD_BQzwWSthELGxd+=jVmw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: mark the GPIO chip as a one that can sleep
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 1, 2023 at 9:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Aug 01, 2023 at 09:09:51PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Simulated chips use a mutex for synchronization in driver callbacks so
> > they must not be called from interrupt context. Set the can_sleep field
> > of the GPIO chip to true to force users to only use threaded irqs.
>
> Ah, good catch! Doesn't it deserve a Fixes tag?

I will add it when applying.

Bart

>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-sim.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> > index cfbdade841e8..5f8723ad0048 100644
> > --- a/drivers/gpio/gpio-sim.c
> > +++ b/drivers/gpio/gpio-sim.c
> > @@ -429,6 +429,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *=
swnode, struct device *dev)
> >       gc->set_config =3D gpio_sim_set_config;
> >       gc->to_irq =3D gpio_sim_to_irq;
> >       gc->free =3D gpio_sim_free;
> > +     gc->can_sleep =3D true;
> >
> >       ret =3D devm_gpiochip_add_data(dev, gc, chip);
> >       if (ret)
> > --
> > 2.39.2
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
