Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDCA4778372
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 00:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbjHJWIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 18:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjHJWIX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 18:08:23 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A33128
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 15:08:22 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso1685614a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691705300; x=1692310100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDW6V4YCgLGKhp/AheaEpquVZOz7qd834C1xXJh9oFo=;
        b=PC0inTo6TdstKASOj0YuNTsriUuf4LKpKZCPNbVJY5tfURaMkEjJNQeOCbpwsUHw9K
         o2nktcqjNBK9jMYYoc1ulmYGgpFD+5nDxy/Sr/ev9BilqbAGkcOcR4sy5KMZKODe39XF
         1Wky2ND9zvsGPTucb3jGB/rjjjFQGA1xOFnHPB+Pt6smKpiBlo2PZYFjfkWZROL38X/N
         ikcM1V2lXMh9DR1IuObasXz9Vq/ncPDRrdHld2a86sNGgVkYilBQeIj/SnsTJC9DG5sO
         9wRMytZHfyVpIUvqaeYmtT2tyzIuba867wxX//l7L/5nkZITUfZBEEp8FDqlV2VWeXlC
         PV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691705300; x=1692310100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDW6V4YCgLGKhp/AheaEpquVZOz7qd834C1xXJh9oFo=;
        b=WIThO/q69pzBc+QiogDH7IklWQWBEeQGIjiJCq6jj/gs8zPT6P44eDQGltcFtvMjuX
         FEV5+fxZZD3JarXs8beqmGASXTyXpH7VK+vh4KhVj4XEL26p4l6IBXLcz6eTs+LxUhqS
         5V5yFOZd/K3Zw/43iCSfk+Umo2NUN1/TQrKtbQJgEvamNCHEqGOd1J4g3nMqvavYF9Z5
         JffBvu6STamcOBWop05CIAjlwCJMfmjIOEHOi7rbZnki1sdc3Sh3PsKnqihIfQ3pQWe9
         YXWtxU6PhvFfM+nbYPWgZ5AOhK+cAsSKyk5DrBoyOwuypjGajCEw2SbPCSbF+PK+e6kY
         XYgQ==
X-Gm-Message-State: AOJu0YznNSxk7Jqu7WzRJdM57TB5puSDvbRsnRrpmx4+6QPrqgbqpn5e
        uGijfupjMAskC5r/+Q9si7gIbhV9TzIgvP7gZ/s=
X-Google-Smtp-Source: AGHT+IEX8w1+47RHSg5m5LXJyfnXV+1AeciJIWq2zKeshaMj6XqcQPjlkrXGxKzMx3dRwIbsm/r8ENH9eFGhAq4VVSY=
X-Received: by 2002:a05:6402:50d:b0:522:2b76:1985 with SMTP id
 m13-20020a056402050d00b005222b761985mr210954edv.2.1691705300362; Thu, 10 Aug
 2023 15:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol> <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol> <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol> <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol> <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol>
In-Reply-To: <ZNQzT2MtskTTZTiI@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Thu, 10 Aug 2023 23:07:44 +0100
Message-ID: <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Aug 2023 at 01:46, Kent Gibson <warthog618@gmail.com> wrote:

> Check the sizes of the memory you are allocating.
> e.g. this:
>
>             arr[c].chip =3D (struct gpiod_chip *)rtapi_kmalloc(sizeof(arr=
[c].chip), RTAPI_GFP_KERNEL);
>
> allocates the space for a pointer to a struct, not the struct itself.

Oh, that's embarrassing.

>             arr[c].chip =3D (struct gpiod_chip *)rtapi_kmalloc(sizeof(*ar=
r[c].chip), RTAPI_GFP_KERNEL);

But that doesn't actually work:

"hal/drivers/hal_gpio.c: In function =E2=80=98build_chips_collection=E2=80=
=99:
hal/drivers/hal_gpio.c:119:41: error: dereferencing pointer to
incomplete type =E2=80=98struct gpiod_chip=E2=80=99
      arr[c].chip =3D rtapi_kmalloc(sizeof(*arr[c].chip), RTAPI_GFP_KERNEL)=
;
"

The exact same structure compiles without error for the
gpiod_line_bulk a few lines lower. I think that the difference is that
gpiod.h includes the definition of struct gpiod_line_bulk, but only
the prototype of struct gpiod_chip.
(This is mainly based on googling Stack Overflow, so might be wrong)

> There is no code movement at all, this is just telling the linker to
> link libgpiod.a directly into your executable, rather than dynamically
> linking against libgpiod.so.
>
> The specifics of how to do that depend on your build.

But surely the compiler and linker need either the V2 code, or the
library object? How does it access these if we don't have them in our
repository?
Even if we add it as a build-time dependency, it isn't currently
available in the usual places?
I must be missing something? Or are you assuming that I am the only
one compiling LinuxCNC?

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
