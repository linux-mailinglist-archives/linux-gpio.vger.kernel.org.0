Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB7F7BBF8B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 21:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbjJFTID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 15:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbjJFTID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 15:08:03 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371E79E
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 12:08:02 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-49d45964fcaso2347236e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 12:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696619281; x=1697224081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r1PEvN0Zc1sSEhTcDnAnqbtYBFlOuEiAfTjeDdat8E=;
        b=NRX/+Y6sYNw53y3eqUM/6v/Eui1yaIzt9Wzydg+nsX35hTt5zMmw6be6LHZ1GvXC2H
         7VK3tYxKI4cVfesTB69OlgG29qJLyS3Ab6VDD6Q/coinsphnUvLE6Lwq4/IRwtO/Yzws
         ztXrv/BhGVefmMpTumruOXp68TfrhhiAdT7TGXopwEAZDsalbkhSX82q7o/7JrVPsfkY
         LDdli+WcPVnrpLCnyk8B5ttqiviUmZpIZmnkMMnUDOxf8AOPBw1iHH35dhHeCv76d6/L
         f/9/WQCsLdyongnBEtclFrZoYw8t1tMzQaiKLrQvwQlIVgiV3agCvtIGCIQBzboNogIB
         4Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619281; x=1697224081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7r1PEvN0Zc1sSEhTcDnAnqbtYBFlOuEiAfTjeDdat8E=;
        b=pt67T+rjJSje4zc9ZO5o59COdzl6jZ2JaOfEC0DZLzSaKIKJ0Q1YcQmcDLBuqrkxG9
         UvXboq4ygDKA65+0cgiSq5lNjRJlvHOVPLZGKMJ5dGqUD8c3jVxivw24QuxhA7Vb8UYy
         WFxYb/pJFENjGohCbhqsbGE1w5tvOLLPNvbgOv9dPFo9eVuSDDdZTYKbk3LmwO5JqftX
         szfrbiQlSGd3VM2B3OYzifCzPPvlqUSgsnMN3+3DQclC7hqDWIJNXDlV4U9B4wxoMQy4
         NdwWb0n3Y9H7baBoUErEHOB/0DLgdvO9K2pRf7fWtSa0AAy1Z2uJfJVitApms2DkrYSA
         H/oQ==
X-Gm-Message-State: AOJu0YxcdsOdD6WbT5yjdwFpHWWeXgTTIKlX7vi3IVxbTR+Wef4HnNzq
        jNf5qDoPMZqGVy6luMW2cpH65s+WGBlBWqh55B9BjA==
X-Google-Smtp-Source: AGHT+IHJIlOoYKPPmacIOMs5XSsifwMP29jR+K5QaYIYQh7g1mnafIxpy2gs/JWBP4o2HkKCVVV0LLYeU0vmrmvXqPA=
X-Received: by 2002:a1f:62c1:0:b0:496:187e:b33f with SMTP id
 w184-20020a1f62c1000000b00496187eb33fmr4117122vkb.3.1696619281083; Fri, 06
 Oct 2023 12:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231006115147.18559-1-brgl@bgdev.pl> <ZSAKdOXpo+xOI3sJ@smile.fi.intel.com>
In-Reply-To: <ZSAKdOXpo+xOI3sJ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Oct 2023 21:07:49 +0200
Message-ID: <CAMRc=MeYiiWaaqRtSjRBfaWGFtZCPWCjYk+ZrX5TwicNq9MQeA@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] gpiolib: reverse-assign the fwnode to struct gpio_chip
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dipen Patel <dipenp@nvidia.com>,
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

On Fri, Oct 6, 2023 at 3:24=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Fri, Oct 06, 2023 at 01:51:47PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip is not only used to carry the information needed to
> > set-up a GPIO device but is also used in all GPIOLIB callbacks and is
> > passed to the matching functions of lookup helpers.
> >
> > In that last case, it is currently impossible to match a GPIO device by
> > fwnode unless it was explicitly assigned to the chip in the provider
> > code. If the fwnode is taken from the parent device, the pointer in
> > struct gpio_chip will remain NULL.
> >
> > If we have a parent device but gc->fwnode was not assigned by the
> > provider, let's assign it ourselves so that lookup by fwnode can work i=
n
> > all cases.
>
> ...
>
> > +             gc->fwnode =3D parent_fwnode;
>
> Ah, this is basically reverts my commit, the whole idea of which was to g=
o
> towards constant struct gpio_chip object that is supplied by a provider.
>

Then this idea was wrong in the first place and that goal will never
be achieved. Whether that's a correct approach is questionable but
struct gpio_chip has become so much more than a simple config
structure and - given how ubiquitous GPIO providers are throughout the
different subsystems of the kernel - it'll stay that way unless we're
ready to rebuild every GPIO provider in linux.

The best we can do now is at least make its usage safe. Meaning: it's
a structure with which providers will interact using GPIOLIB callbacks
which will in turn assure that during the execution of any function
taking struct gpio_chip as argument, it will remain alive and
protected from concurrent access.

The providers however will continue to use gpio_chip for many
purposes. One of such purposes is matching the GPIO device BY its
backing gpio_chip structure. It not having the same fwnode in this
particular case is an inconsistency rather than design IMO.

I don't see any good reason for it not having the fwnode assigned.
User calling gpio_device_find() will have to jump through hoops in
order to match the device by fwnode (include gpiolib.h and dereference
gpiodev?) but it could be very easily facilitated by just assigning it
at registration-time - just like we assign a whole bunch of other
pointers and data structures.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
