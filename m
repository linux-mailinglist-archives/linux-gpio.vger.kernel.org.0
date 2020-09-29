Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AD927D7D3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 22:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgI2UP6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 16:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI2UP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 16:15:58 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F199C061755;
        Tue, 29 Sep 2020 13:15:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id q13so17014932ejo.9;
        Tue, 29 Sep 2020 13:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bj06u3268YV4rMONZW+9cQQsZIYizw/MGioYKlxwrFQ=;
        b=RlvS/p8yRVGkTkxeCitothk9LQOb77u3VmQulmDJlfqDKCFiSwOSZDkaBPByP9iyjc
         7t5Z1ctkXF6PY9vs66Z/5+pHMWVS1QM5fMRL1gv6m9qrqtrhXKTzNfKEdsAuSuNlJcBO
         3AFPIObNyfasK+81wanl+EZyGcRsIp4H+nLe/ngfQL2A9+1KY5bcFxj806F0AbAcqB5c
         0MnmFzcUIT5cdvJtHDXSws2yyXCUWkKdjk5qx9MqwpyG7VTXUnMGP+P04hmylI8jje6B
         a9y9FL5+sVveTL/nMHzaI2RGG2s3njJC/tV2fklO9UOJwOJFAmdf99iXeTW2hK5IC4Jd
         dlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bj06u3268YV4rMONZW+9cQQsZIYizw/MGioYKlxwrFQ=;
        b=bjnQIyKMxzuBiUKou3mhYTR3XZlwHNVx+J3LuLAfK+1BToYlBgAD7a3cicMFiVuTPt
         WYtQQbRnQDn9jSLy//bj4DiFLA/AToZz5roA2EJhmNC/3XTynFxrjFVUw/Y/QWLQ1t8O
         97Rm6x8YFGhuMlwTJeBdEYuXURzy7Z0iqg0YxguDGfcclxIb8QjuAOgY3/H+l8I1IHQF
         od7DdsvDzvE5Ssmz8AbOZe+LtqSFvRFA/7OJcUYvNVH6j2fuFyJrQSdnpGSRA1h+BYCY
         5bTqgVplIlm5/eREii873s9DNP5FVU7bMw390+qr1OXXVAkHfrPVjUNedfkZuDTRUFY0
         5ZxQ==
X-Gm-Message-State: AOAM533KdJhrQPIhyXkkayoEjB0AQp04oWUhZw37iiKdk6WGZdNq8rfb
        lJU4qbHJE2EN0LJMtlkPa/KQFrNgS9vzgxgMkOA=
X-Google-Smtp-Source: ABdhPJyBpW0MlR3+4EP9zT79hfB16NmXJ05S8RXHE/OphML/hIwnmiWgXwZjYwpaEmDRwPibZh4jriZNEXAZw/+V9hk=
X-Received: by 2002:a17:906:c1d4:: with SMTP id bw20mr5611928ejb.91.1601410556905;
 Tue, 29 Sep 2020 13:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1> <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1> <20200923065755.GR7101@atomide.com>
 <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
 <20200924054324.GB9471@atomide.com> <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com> <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com>
In-Reply-To: <20200924070443.GF9471@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Tue, 29 Sep 2020 13:15:45 -0700
Message-ID: <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 12:04 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Trent Piepho <tpiepho@gmail.com> [200924 06:31]:
> > > >
> > > > The pinctrl-single driver?  How will that work with boards that are
> > > > not am335x and don't use conf and mux fields in the same manner as
> > > > am335x?
> > >
> > > For those cases we still have #pinctrl-cells = <1>.
> >
> > If pincntrl-single is going to be am335x specific, then shouldn't it
> > be a different compatible string?
>
> Certainly different compatible strings can be used as needed.
> But pinctrl-single is not going to be am335x specific though :)
> We have quite a few SoCs using it:

So what doesn't make sense to me, is to put something am335x specific
like two cells for conf and mux, into a generic driver like pinctrl
single.

This series adds two cells ORed into one.  Ok, that's generic, other
platforms could use it.  But it also accomplishes nothing, so what's
the point?  You've hinted there is more to come, which will accomplish
something, but what is it?  That can be:
Used by platforms other than am335x
Can't already be done with the pinctrl single pinconf features
Needs more than one data cell per pin

> > Are the driver changes something that can be not be done with the
> > pinconf-single properties?  They all include a mask.
>
> Sure but in the long term we're better off with using #pinctrl-cells
> along the lines what we have for example for #interrupt-cells and
> #gpio-cells.

So if you look at gpio-cells, virtually every driver uses 2, where one
cell is the gpio index and the other is a common set of flags.  It's
the standard layout of a gpio handle that almost all bindings use.
Only a handful of platform specific gpio drivers have another cell to
indicate bank (probably better to have made each bank its own device
node).

Interrupt controllers have different numbers of cells, but they are
all platform specific, and the cells have defined platform specific
meanings.  pci-host-cam-generic is a somewhat generic interrupt
controller and it uses 1 cell, since it lacks device specific fields
to put into additional cells.

So I don't see an example of multiple cells which do not have a
defined meaning that applies to all devices using the bindings.

Consider also that any future changes to the pinctrl-single bindings
would need to be backward compatible with a device tree binary where
two cells get combined.  So if the bindings being added here aren't
done, then adding them now creates an unnecessary additional version
to deal with for backward compatibility.
