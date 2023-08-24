Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A7A7868C1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 09:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjHXHl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 03:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240405AbjHXHlq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 03:41:46 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131041705
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 00:41:14 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-44e86f3e4b6so566195137.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 00:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692862805; x=1693467605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDYLzx/XccmcbzSx4Xiywh1xQevuR9YjvtIphlX4yio=;
        b=lJztOmuqNIWCpdxWjfrXsFeVtDtth0P3zMd7GW5WKsYpMIzEHsWgSxtq3OQSSqO89b
         IwsU5G2dhfe5ihUcpw1WfcGUO3wjJRVeIayIb7Ih8ZrQvCjfGbJfpnYoAX7G5VGI0XvW
         dUoQNzFtwPlputVxessU9pXhXMSujOaFyb6eje+RdVZDHITqTGbyuEN393dzM7RRnNtd
         ngff+KO1f2e3tR30VxuIfu9IaXHfyquP7EKAVConQiHF8QmVMaBIxtzIQPplPioLhD/W
         rvs1QqY0s0LaJf6SBRBjYlxgisauYX7pw7nQCVnvPGvW9zErUdCEjy7qcEnDFLvOwm15
         ABcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692862805; x=1693467605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDYLzx/XccmcbzSx4Xiywh1xQevuR9YjvtIphlX4yio=;
        b=ftpnsIMvaQiIps3kUVpgAr6KD6Vzz0UlA+U1awEot4KntQxnsoJezP8J9wAjijV+W2
         +AF6+pBvicxT3juyNPirX10Lp8sFD/4WBnRWfG+3QDPoideQuSAqWhlhEeMSI2A3rpRi
         tpQVTvCIw8JKnD0k178kUQafjqk6BzVbtGlxPduH1PjRAO5cueJvM4RLKHqe3Rt0TAFs
         T63MTkYdThfKJczdQpVYlFeeQOAmPX/eqVQF21NLzdcA00SzmyUSzul99gMRXtAeEOR3
         Ui8RjhLRgstAJf/Tqf5Jjc87vk4+il2Nf0+TLAVXsLPB0+qQvdUC5ILHxvVujsnhEAaB
         v5LQ==
X-Gm-Message-State: AOJu0YwfcQH08K9Sg1cAkZqfl8FVxYob6a9yfMMXb7DGWUVXYF4Qx86Q
        PF72M3gEeKYawKI04u8hnq9V+WtasmyVZEyIw+0nXg==
X-Google-Smtp-Source: AGHT+IExg5f9E4pMOrsM+K52nfVTmuRWP6GgBV63yAcfNcflhqj/ZgoH+HsWq/GEov61nnRQfZpDBv8LhOBsrpAv3QI=
X-Received: by 2002:a67:f8d5:0:b0:44e:9a71:27a1 with SMTP id
 c21-20020a67f8d5000000b0044e9a7127a1mr496642vsp.17.1692862804862; Thu, 24 Aug
 2023 00:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230821153339.26305-1-brgl@bgdev.pl> <ZOP/n30hYR/8zN60@sol>
 <CAMRc=Mep_AZPht6cQFQ-Pz8UJC-q1r4F29SJ=+_WgJX1cz5wtw@mail.gmail.com>
 <CAMRc=MdoZJbiNUbdO6VOzS7NJTJtbmD1uoywa7+iWjeoy+RecQ@mail.gmail.com> <ZOcIdHVgK1ffzFMb@sol>
In-Reply-To: <ZOcIdHVgK1ffzFMb@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Aug 2023 09:39:54 +0200
Message-ID: <CAMRc=MfMu5kq8pM-Wcqz7uST5+etkuvYnTchyrP6NsHZJ32XRw@mail.gmail.com>
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
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 9:36=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Aug 24, 2023 at 09:32:06AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Aug 22, 2023 at 9:08=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > >
> > > On Tue, Aug 22, 2023 at 2:21=E2=80=AFAM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > >
> > > > On Mon, Aug 21, 2023 at 05:33:39PM +0200, Bartosz Golaszewski wrote=
:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > gpio-mockup relies on the GPIO devices being registered in module=
's __init
> > > > > function and them being unregistered in __exit. This works with t=
he GPIO
> > > > > subsystem as it only takes a reference to the underlying owner mo=
dule when
> > > > > a GPIO descriptor is requested and not when the GPIO device is
> > > > > instantiated.
> > > > >
> > > > > This behavior may change in the future in the kernel so make the =
behavior
> > > > > of libgpiomockup more correct and have it unbind all mockup devic=
es over
> > > > > sysfs before unloading the module.
> > > > >
> > > >
> > > > Never knew that unbinding was even an option.
> > > > Maybe update gpio-mockup's documentation?
> > > >
> > >
> > > Yeah, I might once we agree on that reference counting patch.
> > >
> > > > Just clarifying what the potential impact of the existing libgpiomo=
ckup
> > > > behaviour and future kernel behaviour is - the kernel may log error=
s but
> > > > otherwise correctly handle userspace unloading behaving badly?
> > > > So this patch is pre-emptory noise reduction?
> > > >
> > >
> > > No, it's a bug-fix-in-advance. gpio-mockup will fail to unload (until
> > > we unbind all devices anyway) if we couple the module's reference wit=
h
> > > struct gpio_device. So will every driver that registers devices from
> > > its module_init() function and tears them down in module_exit(). But
> > > these drivers are wrong to do so in the first place and unloading the=
m
> > > sound like a rare thing to do anyway, so I'm willing to give it a try=
.
> > >
> > > Bartosz
> >
> > So what do you think Kent? Does it make sense to have it in v1.6? I
> > would need to make a new bugfix release but I have something else
> > queued anyway.
> >
>
> If the plan is to change the kernel such that it will no longer unload
> modules with bound devices then the patch totally makes sense.
>
> Cheers,
> Kent.

Linus has not commented on that yet and there's a thing I need to
check first (hopefully today) but I think it will make more sense.
This patch on the other hand is not incorrect even if the behavior
doesn't change. I will queue it.

Bart
