Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D25164460E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 15:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235071AbiLFOtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 09:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiLFOs6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 09:48:58 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B73C26574
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 06:48:05 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3e45d25de97so97899397b3.6
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2022 06:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qAOa1VhlRWQEWutYVn7vsc8dfFCMbpsWAMAMKpfYJbc=;
        b=iAQthZPcPJ5luFrqpYx+Hvc4oHP8Ccb4UYtmP0xE+RPeft+3SA0p4DC6T0FzLpemL2
         OErbcqBm3jSUWcVaV4ng/cZcErre30SLODycpD4+V6p/uE1/8bCA7174JQn8PQ+2TANI
         98JRA9Ehie8pPmpahFZJtVMjzXb5X7KZcB59LEHTMZSFfNaMSJWDdJuhWIglmtfMEZ6x
         z+YUx6VImUd0rHWlYQdkTxlfSmk/Xewjbm/IXYYXjGBtO5XLew7NXCcF/icLxcDMjkG6
         ggtLh71tcx1qsoVTK3d/SGdsz2jVRir0hRxiu2PZDDTBcAolekBuLf11tjjUx6AJn2nx
         i8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAOa1VhlRWQEWutYVn7vsc8dfFCMbpsWAMAMKpfYJbc=;
        b=kKrwJ9hbeG/6/PDc4nTb6vOkhScSJJi7XvfRDxSm6OMMmnsSxvhmlH5S/ZDwD1Wwi9
         1H2TU89Y3oHSd69GgxjpnFJHaXiMjAf1/r5ffac1hQH8/hZb+JNd5Jiv8plbpI0kU9en
         mInwbE4cRiYZerNbvlY3vvlFl5p4WD+XUAYL+u+X3igxYKE/3n7DcsBHaQNl9auAwEZs
         0gM2nndTZ+0Rdut6V2wBkrLosrJAfx71x8lNtdjLwZoS7FNAS7psGHgMKXZDxX6Ef+Up
         UUhxbBQPC+4REZJNJYFzeMyOLHrUzwHo+0yqugH+97G+frOmaQ5n+KAbVzGxcZYSgRCL
         WmIA==
X-Gm-Message-State: ANoB5pkmDnKD4zabZVLtOrrfLBG2Ho0JS5dLPyTnpKvgVukVC6dnC+FW
        0s9EbpCJkwsIBeIIK+zjD7BsHUcKDazleDw6uQIuJNpFQXrqcA==
X-Google-Smtp-Source: AA0mqf4b9tOLZLYYojLjivmAujfjzfHVMh/sYYeoG+Kpfejl5KHbHnNiGiv5U2z1dPMfEMZ2g09GHiB1kUUyrfb4Ln8=
X-Received: by 2002:a0d:e645:0:b0:3bb:6406:3df1 with SMTP id
 p66-20020a0de645000000b003bb64063df1mr47726538ywe.319.1670338084259; Tue, 06
 Dec 2022 06:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20211015164809.22009-1-asmaa@nvidia.com> <20211015164809.22009-2-asmaa@nvidia.com>
 <CACRpkdbvR0+5gKUH7eE2tZ1H9DR-WiYyh9KSnUTesYiZ=AezNw@mail.gmail.com> <CAHp75VfaoS4yu0UOJj4V2N+4tWdD0JF47TFgfKCGt7SC-Uhfaw@mail.gmail.com>
In-Reply-To: <CAHp75VfaoS4yu0UOJj4V2N+4tWdD0JF47TFgfKCGt7SC-Uhfaw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Dec 2022 15:47:52 +0100
Message-ID: <CACRpkdYqrdT4K8wZGkjo=+zbtQ9R7GvdOLzEeHQUx=Xr54en6Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: mlxbf2: Introduce IRQ support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, andrew@lunn.ch, kuba@kernel.org,
        bgolaszewski@baylibre.com, davem@davemloft.net, rjw@rjwysocki.net,
        davthompson@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 3, 2022 at 1:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Dec 3, 2022 at 12:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, Oct 15, 2021 at 6:48 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:
> >
> > > Introduce standard IRQ handling in the gpio-mlxbf2.c
> > > driver.
> > >
> > > Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> >
> > Looks good to me!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> It was more than a year ago :-)

:D

Searched my inbox in some weird way.


Yours,
Linus Walleij
