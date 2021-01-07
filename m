Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DF92ECE00
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbhAGKhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbhAGKhe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:37:34 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C5DC0612F5
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 02:36:53 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o17so13496525lfg.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 02:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nFfGlH5hXwbuaYUBsZBOfb6uPO2NVxjByxMtfTjhGZ4=;
        b=OvqgYG5GfLnUWMDVt7fwGeXDObUORXSH+iOnzildwroxSkzsO/YzNGjGRmbA7SYLPV
         x8nxD4BNfcPV6O2VQ+H2sXHcBagqd3oT5/cSajzlk/tGpxe5DIt7+J21on5fSDkjwPBE
         je997Wma6HpOQpxEn74aFuJskTFroRdqupPPP1RoadoStwgVfKrRXLnEMJg0nXKpjFb+
         thRNzVOAUQJk/fJDOvb08chmTAZOJx1FawgClXTTJ56ubJsL96r4ruCXLe076I2FlDey
         l3Uyye8Vb8lv6IQvas953SreICCTijWTJEp7H8IMUn+A6U4qpQbflPXJ5xuWSeugoT+N
         nk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nFfGlH5hXwbuaYUBsZBOfb6uPO2NVxjByxMtfTjhGZ4=;
        b=KkeWZWB9hS0JZM6l3/BmIT099ETGPdwdrv2D+6EZ7kt+aKr6HLqE792MWSvP9lJISe
         JhT/APg0tOWWUQYUnnRfci0di2Jh5KHqz8Pnnu9Vt1ChLtP/jataoNfYtD1P2JyzZhJR
         mOmfnVKRarRvTJq1isA7+E/Srq88FWnDII9dUMYAVUINPoJvjHqOCkbyMJ5uBEd9D6l7
         mYk8qnByRFaEeGaIrgdaFUiOi1VRiR0Aom0GpnHPUmFzwuvD3xIzhaOpcUnnlU8L8mic
         vziHyDahQl/rXYcjBASFFnvQafcLUmc2OtPOBNzZsgORUsNO1ilwYi8QLVhYbl59QcIh
         kclg==
X-Gm-Message-State: AOAM533OfScnBAVxQdGCp+6FuipNxVq6DJUnNu9z3eJxG20BaafVP8lu
        Io3upst9OZ+E1ATceQ/++1wV6LrUqCwe/HxnpfcsFQ==
X-Google-Smtp-Source: ABdhPJyfAnEcXOXLY4xTmk1dpmDhjGS0UtzXooi8t4a+PiMBAIP9rKiFMYgT/OAB+huqAHSbFRl1FEjWiqnjm8x/c0g=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr4116363lfs.529.1610015811936;
 Thu, 07 Jan 2021 02:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com>
 <20201004162908.3216898-4-martin.blumenstingl@googlemail.com>
 <CACRpkdZo-U_cAhbKb4E+d+p+5FenXkGYW0RXxyk4M5uyEPCpzw@mail.gmail.com>
 <CAFBinCCLubmDvxfabQHx2-ucgAsm1NArMUrtPx-UA2nX5xoFFA@mail.gmail.com>
 <CAFBinCAZXJ2=fTQuAUyW1hNeJDHY3_pxo4UhxUaOZC=i1bpFxw@mail.gmail.com>
 <CACRpkdbKQaT61w6r9Hx40Qvy+7qyLNm-fx-BpL_wdGcB=tmcqQ@mail.gmail.com> <CAFBinCBCYZ3bzvvn==CFZyVh8E7TiGvW9PnqmK-Qd=y4X2HgNw@mail.gmail.com>
In-Reply-To: <CAFBinCBCYZ3bzvvn==CFZyVh8E7TiGvW9PnqmK-Qd=y4X2HgNw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 11:36:40 +0100
Message-ID: <CACRpkdbs_ddxrGWeDrj9MOZXuuTT-DPYibaiTcCKjfFyL9tDww@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] gpio: ej1x8: Add GPIO driver for Etron Tech Inc. EJ168/EJ188/EJ198
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 4:17 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> > > unfortunately this means that xhci-pci now depends on xhci-pci-etron.
> > > for xhci-pci-renesas this is fine (I think) because that part of the
> > > code is needed to get the xHCI controller going
> > > but for xhci-pci-etron this is a different story: the GPIO controller
> > > is entirely optional and only used on few devices
> >
> > I might be naive but should it not be the other way around?
> > That xhci-pci-etron is dependent on xhci-pci? I imagine
> > it would be an optional add-on.
>
> the only way to achieve this that I can think of is to basically have
> xhci-pci-etron implement it's own pci_driver and then call
> xhci_pci_probe, xhci_pci_remove, etc.
> but then it depends on the driver load order if the GPIO controller is exposed
>
> what structure did you have in mind to achieve this?

Something that is compiled and called conditionally with
stubs in the local .h file.


Kconfig:

config FOO
   tristate "Main matter"

config FOO_ADD_ON
    tristate "Optional on"
    depends on FOO


Makefile:

obj-$(CONFIG_FOO) += foo.o
obj-$(CONFIG_FOO_ADD_ON) += foo-add-on.o


foo.h:

struct foo {
...
};

#if IS_ENABLED(CONFIG_FOO_ADD_ON)
int foo_add_on_init(struct foo *);
#else /* No CONFIG_FOO_ADD_ON */
static int foo_add_on_init(struct foo *)
{
    return 0;
}
#endif


foo.c:

#include "foo.h"

ret = foo_add_on_init(foo);
(...)


foo-add-on.c:

int foo_add_on_init(struct foo *)
{
(...)
}
EXPORT_SYMBOL_GPL(foo_add_on_init);

> > Make sure the etron part is an additional module that can be
> > loaded after xhci-pci.
>
> my approach from above unfortunately would not achieve this
> so if you have an idea how to achieve this (or have any other driver
> in mind that I can use as reference, even if not related to
> GPIO/USB/PCI then please let me know)

See per above. I don't see any problem with this, it will be an additional
module that does not feature a probe() call and device driver bind.

I think it is also possible to link both files into the same object if
the optional add on is enabled, so it is part of the main module
when modprobing. The foo.h stubs are still needed, then the
binary will just be smaller if the add-on is not enabled. There are
solutions like this in the kernel, I just don't remember one right
now so grep around.

Yours,
Linus Walleij
