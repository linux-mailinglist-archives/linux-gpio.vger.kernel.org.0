Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BFA7B0486
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 14:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbjI0Mmq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 08:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjI0Mmn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 08:42:43 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB643193
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 05:42:40 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4527ba546d2so4185868137.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695818560; x=1696423360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvHdxEwsucmy96ETfuIzQ5eJCnM+fye6vNp8d8H69Nc=;
        b=KDaZcaGXy/4GQpNkkSH40XW9xzd8sune4LwzkwQiaBOdtgUSjm73zj4tSy4V9hNjv6
         KhPVleGo2Bg5KIDJs5NFWYqzckjd2S8j0PAjO8ENSspdkIrPTI5SKiDfDXRRPQdIPKxQ
         y38ikiWWEkaScOtILe6GJycOj8Hyen+PtZtLl/qx05ePoBz8BDmS3134E3x9EQvMNeC/
         BV11gfKCGOOBatwslig0Kt06ma+fU21plYyXD/x5EdHHzPZX+cVc0qhgeiT81DLyYz6k
         KQESmqYeu3FqL4llv9fUGkqh8O+GvYm+NYrfEIBn1EeOJJfO3c13H4CyBlampbyPtEai
         7ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818560; x=1696423360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvHdxEwsucmy96ETfuIzQ5eJCnM+fye6vNp8d8H69Nc=;
        b=hhw2JZf3x9jPv1gJfB/iIW5WxIfujYpQjHjMabjPik8YNF2QgN6nQm3/p/46TUgb/S
         YA+TuuvCH6DC1xUp2T7Q1nl1hqef8sxbi7Mhs4kX2Iq5HngwlA++QXEUP2yu/aFfFkbC
         eqJbSPf/EHyD4Gp/AwnmXdLEsTY7+qbIzczNQNc5BBLfmFaLrPGIo6vN69zIDY6sCRtc
         lwPG4Wp+JJWpbY3FKZvpYOxgx7XLjoXDz4c/8gVY4Ft8qdgEqFt0ViyHqkrBe1rSigyl
         XSvc/tyJuDs3RnhGhcGS+H6pP/gAhdKXxjVA2NYMUTfZay7m4U2F9hG2BVLEF9kkHEPS
         bhIw==
X-Gm-Message-State: AOJu0YwAai1LuEsj1uHbs8RhgFZJDkfOsXzREQiDg7Xg6CldrX3MceLP
        NMNYQx/4ZnwDBa2+jqk8qnxbVSbQlFQoo/07hy8MGQ==
X-Google-Smtp-Source: AGHT+IG8YgVkCOcVoASdJ8m5ynxyqPmsoDNwOwH7mhNL7+IBZ4f8tY6sNa/uwJi2At9mOZr2+SXY4HpEte2Akwsk+8A=
X-Received: by 2002:a67:ff02:0:b0:44e:9219:136c with SMTP id
 v2-20020a67ff02000000b0044e9219136cmr1341472vsp.15.1695818559788; Wed, 27 Sep
 2023 05:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230915150327.81918-1-brgl@bgdev.pl> <20230915150327.81918-5-brgl@bgdev.pl>
 <ZQf6E+itll3dmCnU@smile.fi.intel.com> <CAMRc=Mcq-0yWcYp6ksDF5RP-B+7b+r2KYh5onEMKx1tpS9O4hQ@mail.gmail.com>
 <ZRQhIqpb6Ho9ifgz@smile.fi.intel.com>
In-Reply-To: <ZRQhIqpb6Ho9ifgz@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 14:42:28 +0200
Message-ID: <CAMRc=Mck9R8LB6_g9O54ZhRDewx99aOs9g-bExR3yC+GJ-8gYQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] gpiolib: provide gpio_device_find_by_label()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
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

On Wed, Sep 27, 2023 at 2:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 27, 2023 at 01:22:36PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 18, 2023 at 9:19=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Sep 15, 2023 at 05:03:19PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > By far the most common way of looking up GPIO devices is using thei=
r
> > > > label. Provide a helpers for that to avoid every user implementing =
their
> > > > own matching function.
>
> ...
>
> > > > +static int gpio_chip_match_by_label(struct gpio_chip *gc, void *la=
bel)
> > > > +{
> > > > +     return gc->label && !strcmp(gc->label, label);
> > > > +}
> > >
> > > I am still wondering if we can oblige providers to have label to be n=
on-empty.
> >
> > Of course we can. Just bail out of gpiochip_add_data_with_key() if it
> > is. But that's material for a different patch.
>
> Yes, but my point here is that
> 1) the current users are already following this requirement;
> 2) the enforcement can be done explicitly somewhere (in the register func=
tion).
>
> Is the 1) incorrect assumption?
>

I remember doing a quick glance over GPIO providers and it looks like
ALL of them set the label. But I may have missed something. I would
start with a warning.

Bart
