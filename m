Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B0D78685F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 09:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjHXHct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 03:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235253AbjHXHcV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 03:32:21 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA69010E4
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 00:32:18 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-79aa1f24ba2so2272834241.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692862338; x=1693467138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1Bn0cxBjqE0pyyXB8ARHyqe7vQgtksdTcou31X/fVg=;
        b=A2UQn1XvE+b0VLoufkJ4SOpM90cBclcRkdWclgMfG6V4fQmKUd3KyrefrFzDOUNuyj
         3eAxnCY62ocFUNQDAVIpzpVZkpLNjn2ZMz95tgqIArhAUa03aWNt5hxH0IFN0WjI7TLz
         pBYnWoKDgryUOKo//SWo2ER80mlj9+d2+qRKuijbeAaP+tBALesUJCrbi2Uu9zS1Wou0
         ZkHwDzrzwTWz4+Ru9W/KoNaNRuHkrzehC+177OBuo5m9EVCY9s+9WbOtoSJxsFWtGQaz
         weaZZIZJFSRO3fTR9Kqddz3exdN3/XFeYdgqcPhG9A9nbbMk/2fA9E6cT00tshKo2kEI
         YTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692862338; x=1693467138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1Bn0cxBjqE0pyyXB8ARHyqe7vQgtksdTcou31X/fVg=;
        b=Tr/8vU0iDtCfjgk9ZI1bg7Td54zOtKa2ThHIi56RwaK0oM7nqLNqKUc1Hc90kbqI9I
         rdliOXE0FnC+FN6cPrYf0y4uMHz7GNIQnpjnO6UkjIaYS5FqHl3OVGrGR6WfddT7SyH3
         k8qc8QoJLGOe2GeZx8yufMMFLzhzDnyfKJM7HRVC//Gri3lDYGjyI27mtHz9iNaCQb7h
         nyKZwc5ZYMw56tCA3hWGp4DhWwD7PwJHsNsCR3a+0KuxfjWQddQpkMZkO1yIV9cc2qlx
         /azBOJprxeYa/kSXSI8LRRC5WNYcRhpLTY2RUJJNmolWfeTbG5DCuQovfl+u96cNbPio
         P/Tw==
X-Gm-Message-State: AOJu0YwkuxJF+rMfrw02vV/48h3OyN4M9zDgU+Oto1JC+r5aNXq3Zsnj
        NV5YeBxF69s05Twd9vnBoxe60L4lxCAIdijDXiCzzg==
X-Google-Smtp-Source: AGHT+IE53E71htBVBrG7OV8KFBWPW7KoS2vOtaEWJyNGG42BNh/5Ao8R0hUiCjlfTKuRKw49gWDAHzyHOZXzrvPSbS0=
X-Received: by 2002:a05:6102:3564:b0:44d:5e09:e392 with SMTP id
 bh4-20020a056102356400b0044d5e09e392mr7699062vsb.6.1692862337826; Thu, 24 Aug
 2023 00:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230821153339.26305-1-brgl@bgdev.pl> <ZOP/n30hYR/8zN60@sol> <CAMRc=Mep_AZPht6cQFQ-Pz8UJC-q1r4F29SJ=+_WgJX1cz5wtw@mail.gmail.com>
In-Reply-To: <CAMRc=Mep_AZPht6cQFQ-Pz8UJC-q1r4F29SJ=+_WgJX1cz5wtw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Aug 2023 09:32:06 +0200
Message-ID: <CAMRc=MdoZJbiNUbdO6VOzS7NJTJtbmD1uoywa7+iWjeoy+RecQ@mail.gmail.com>
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 22, 2023 at 9:08=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Aug 22, 2023 at 2:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > On Mon, Aug 21, 2023 at 05:33:39PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > gpio-mockup relies on the GPIO devices being registered in module's _=
_init
> > > function and them being unregistered in __exit. This works with the G=
PIO
> > > subsystem as it only takes a reference to the underlying owner module=
 when
> > > a GPIO descriptor is requested and not when the GPIO device is
> > > instantiated.
> > >
> > > This behavior may change in the future in the kernel so make the beha=
vior
> > > of libgpiomockup more correct and have it unbind all mockup devices o=
ver
> > > sysfs before unloading the module.
> > >
> >
> > Never knew that unbinding was even an option.
> > Maybe update gpio-mockup's documentation?
> >
>
> Yeah, I might once we agree on that reference counting patch.
>
> > Just clarifying what the potential impact of the existing libgpiomockup
> > behaviour and future kernel behaviour is - the kernel may log errors bu=
t
> > otherwise correctly handle userspace unloading behaving badly?
> > So this patch is pre-emptory noise reduction?
> >
>
> No, it's a bug-fix-in-advance. gpio-mockup will fail to unload (until
> we unbind all devices anyway) if we couple the module's reference with
> struct gpio_device. So will every driver that registers devices from
> its module_init() function and tears them down in module_exit(). But
> these drivers are wrong to do so in the first place and unloading them
> sound like a rare thing to do anyway, so I'm willing to give it a try.
>
> Bartosz

So what do you think Kent? Does it make sense to have it in v1.6? I
would need to make a new bugfix release but I have something else
queued anyway.

Bart
