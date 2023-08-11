Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB97B7784B5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 03:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjHKBAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 21:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbjHKBAO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 21:00:14 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCFF273E
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 17:59:51 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso1145298b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 17:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691715582; x=1692320382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6buGMfL5I8X3x08qKhP9Cbi0gG2J57e1HsrCIMwmtY=;
        b=EdPXuo3uES62386nmfyDO4J54f1xA0vku2S8Bwj6eDEgNbGshpgJOVZseXVrljlitb
         3xbr//xn0vuT+mimwjvcOQNdyT3jjkBKc9ommNcWuVCJmm3OMNubyfeAKOq7O02uvi16
         oP/lalpgjzrcY2SL3cbkaDO8q4Si49j0lH4K/M08ph9hHSk1bWA5V+TD+iuptT8T1GJ6
         u4KZqmB1F3CcZzTTUpedLFdGJ9Sxe35nAPVmXj9SXQv/97Q0eUNr+d0xlMAGcIDQyYRg
         2Pt7CUiPn0qo28/cetjb9oIAC0x5VlZ/iScn2KxP4C+an3zpqInYEuU6TKKEGeerBrtJ
         lmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691715582; x=1692320382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6buGMfL5I8X3x08qKhP9Cbi0gG2J57e1HsrCIMwmtY=;
        b=KVJ1fg54GLCFnThOKgv17u85AaaDVPYTSMk+0+roEYGCQ5KaYMBgOmTFsEJwKy622U
         4mg3OGNGpgyXj5Mmh/ezqDDkd+ukkrrZHi+eKE/bm8wMl+sxIoGg1zQRZH0RUuYtnv/E
         5TfvZgthEiiPrWUJjfGgKIuEbyuTINKsbESyrXItj2oYsad+yyDUmmto8O3pWWTkkDRE
         2I+mmID8HCVU3LOLmoLadX/e8Dn1gQVp/GnH1YswF0BU5P8v7mhXTzIo7PvPhdmUnf2B
         gllh/8UolhDEyFp8OvwdGfHAItX6hDniBCtZjeelnKYrJO6pzfopX5kAa5KRVPd8cLeH
         SHSQ==
X-Gm-Message-State: AOJu0YzSDfFgJ6pPZ6OSIrnxySw4N6DD94BEJQL47PYdtjO8p3se6d9Q
        WSrcAnS1ALATZvXxeczBtQc=
X-Google-Smtp-Source: AGHT+IHGexZNIEec0manW45yUfauVEheU/YLliOSFHMSrTPOiyI6E3ZO6qdnxMoCLuJ8ftg5AoQzAw==
X-Received: by 2002:a05:6a20:1606:b0:13e:14f9:294d with SMTP id l6-20020a056a20160600b0013e14f9294dmr724215pzj.58.1691715581726;
        Thu, 10 Aug 2023 17:59:41 -0700 (PDT)
Received: from sol ([220.235.36.234])
        by smtp.gmail.com with ESMTPSA id k17-20020aa792d1000000b006879493aca0sm2120472pfa.26.2023.08.10.17.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 17:59:41 -0700 (PDT)
Date:   Fri, 11 Aug 2023 08:59:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZNWH+L9o5gp6PWyq@sol>
References: <ZMNYsOXrOOZgxLeC@sol>
 <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol>
 <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol>
 <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol>
 <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol>
 <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 11:07:44PM +0100, andy pugh wrote:
> On Thu, 10 Aug 2023 at 01:46, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > Check the sizes of the memory you are allocating.
> > e.g. this:
> >
> >             arr[c].chip = (struct gpiod_chip *)rtapi_kmalloc(sizeof(arr[c].chip), RTAPI_GFP_KERNEL);
> >
> > allocates the space for a pointer to a struct, not the struct itself.
> 
> Oh, that's embarrassing.
> 

Been there, done that.

> >             arr[c].chip = (struct gpiod_chip *)rtapi_kmalloc(sizeof(*arr[c].chip), RTAPI_GFP_KERNEL);
> 
> But that doesn't actually work:
> 
> "hal/drivers/hal_gpio.c: In function ‘build_chips_collection’:
> hal/drivers/hal_gpio.c:119:41: error: dereferencing pointer to
> incomplete type ‘struct gpiod_chip’
>       arr[c].chip = rtapi_kmalloc(sizeof(*arr[c].chip), RTAPI_GFP_KERNEL);
> "
> 
> The exact same structure compiles without error for the
> gpiod_line_bulk a few lines lower. I think that the difference is that
> gpiod.h includes the definition of struct gpiod_line_bulk, but only
> the prototype of struct gpiod_chip.
> (This is mainly based on googling Stack Overflow, so might be wrong)
> 

You need the full definition of gpiod_chip to determine its size, and it
seems gpiod_chip is opaque, even in v1.  Yay?
So you don't need to alloc for it at all - gpiod_line_find() already did
that. As per that function's comment, you still need to close the chip
eventually to prevent memory leaks.

Btw, you don't need to keep the chip open once you have the line requests.

> > There is no code movement at all, this is just telling the linker to
> > link libgpiod.a directly into your executable, rather than dynamically
> > linking against libgpiod.so.
> >
> > The specifics of how to do that depend on your build.
> 
> But surely the compiler and linker need either the V2 code, or the
> library object? How does it access these if we don't have them in our
> repository?

Your build needs libgpiod v2, and the linker will include the relevant
bits from that in your execuatable that you then package.
The dependency on libgpiod then is only build-time, not run-time.

> Even if we add it as a build-time dependency, it isn't currently
> available in the usual places?

If necessary, you install it from source for your build.

> I must be missing something? Or are you assuming that I am the only
> one compiling LinuxCNC?
> 

I am assuming you are building an execuable to package as a binary.
If you are building a dev package then you can't hide the libgpiod
dependency from the end user, so you have the choice of either using
what is readily available or forcing the end user to install libgpiod
from source themselves.

Cheers,
Kent.
