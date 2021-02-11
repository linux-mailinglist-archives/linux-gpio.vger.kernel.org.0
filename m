Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69633189B9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 12:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhBKLo0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 06:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhBKLmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 06:42:20 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9156DC0613D6;
        Thu, 11 Feb 2021 03:41:40 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o38so3666750pgm.9;
        Thu, 11 Feb 2021 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZKnpBYO+jJqLR8mObCZWV6snnWw00w1z5Mlo7cxi4x4=;
        b=ShyJFr7Ao+baj5q7zWX0omKGr97CLs+LxaY1OfkIsk2wGdRvLB8XVrcvsA/J78lRod
         RfrJZCnkZtLq0lCv5tFj+kZ+Uu5m3ntn8W24vsWYAWd5rOR10X4Ci46/3JM90GCg4meo
         2ho8Fp2j/mtVuGWeASQu1JZ+StH28utRNOHAp3X/THN4SLJWLU66rh94THHfrIgOMjvu
         ez0TgOiNhHnJqAdRgU6AgsW7jJAHgQwgIQsTCYxZEs098S/hIrYmnlbVD7ymdpHFZ81M
         ThiSIgKVJfoKKGyLtwyvIbQhwNvpFneHevK+9EwPXTJcenHVCT1wvJ/LcUJShC7gMFvb
         qqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZKnpBYO+jJqLR8mObCZWV6snnWw00w1z5Mlo7cxi4x4=;
        b=EJlIW5jmQy/ZxZTf/sZvWj+tMgcaRb16cfgsr+RGPkc7f7TG+KutJ0lgQdGpk37uCO
         ZC7nFvlRSkroUnMnaR0JO/a0NCxpgtmyNrHlE4mlakuTFd16bjmc0Rj5Q66W5yNVuO60
         c8+096qQC+/OnHLppWnHWBw9IIyjMQbZG9CB0stogwP0+JFXqgT1CD/zesiNTrG2dxs6
         TgfLTHnqGyLLwinIZEBHmTsvUUegue1biIQNDa8X4QKx/sxA2sHlyl3Mgbz1ET5MFak7
         Meo30JNg4P4vXmsJ0nrUgZtjDKkrCJh9OGApS2C0QJSP5o7o4sQrg0/U3H04wvSEzHjO
         FPcg==
X-Gm-Message-State: AOAM530ZupXPkVP8NOXGvYlXw1S+L31Dru49kHClsAaYK/+GgqL8+tTh
        AYn1uP5LbwqEh5My4DrWbNx5gcv8W4eGhPgR5LfZVFLI0Crp3dHS
X-Google-Smtp-Source: ABdhPJzoOE6nv0mkkRBPdVzBxR1Run8+t57h/QVHmmlZ07T/TASS22YevmGHC+TZZMAyKNZnk5oaNkMLCbqI7gl4OHQ=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr7562483pfk.73.1613043700020; Thu, 11
 Feb 2021 03:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <CAHp75VdNTenoE0AOmGfndqQ7SrxbuK+SvfFYn3W2GmqhkCSByQ@mail.gmail.com>
 <1b92deea-cf6d-7eca-197f-b12456279890@metux.net>
In-Reply-To: <1b92deea-cf6d-7eca-197f-b12456279890@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Feb 2021 13:41:23 +0200
Message-ID: <CAHp75Vd39OaGkgi5mSH+o39Js8gDW77fP8LUBx73EAH_mZ-scg@mail.gmail.com>
Subject: Re: RFC: oftree based setup of composite board devices
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 1:15 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 10.02.21 11:30, Andy Shevchenko wrote:

> >> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
> >> platform devices can't be directly enumerated via firmware. Traditionally
> >> we had to write board specific drivers that check for board identification
> >> (DMI strings, etc), then initialize the actual devices and their links
> >> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.
> >
> > In ACPI we support DT compatible strings, and we support overlays for
> > a long time. Would it work for you?
>
> please tell me more, how ACPI and DT can already work together ?

It's all in documentation.

https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id
https://www.kernel.org/doc/html/latest/admin-guide/acpi/ssdt-overlays.html

Please, please, read documentation beforehand!

> You already know my apu board driver - that's my first example usecase.

Sorry, but I forgot about it. Can you summarize what is your use case
that really needs so intrusive and hard work?

> There're few things I don't know how to solve w/ overlays:
>
> * match rules shall be inside the DTS
> * future match rules shall also check for bios versions etc
> * adding new boards shall be possible by just adding another DTS to
>    the tree (not a whole module)
> * supporting several board variants (w/ small differences) by one DTS
> * sometimes existing devices (eg. enumerated by acpi) need to be kicked
>    out (buggy firmware, ...)
> * can't rely on any special userland tweaks

Show an example why either of the above is needed in your case and
tell what is the exact issue.

> >> The approach can be easily be extended to other kinds of composite devices,
> >> eg. PCI cards or USB dongles.
> >
> > What do you mean? PCI and USB are self-enumerated. What's wrong with them?
>
> In general yes, but of course you need drivers for them. Sometimes those
> devices are composites of other devices, wired up in some special way.
> Traditionally, we'd need to write a special driver that just don't do
> much more than instantiating other drivers.

Yes, that driver represents hardware. MFD already has some support for
composite devices. We have the auxiliary bus for some other
interesting cases, etc. Depending on the hardware in question you have
to choose a proper bus and locking (access synchronisation) schema.

> Those things could be expressed via DTS, so we don't need to write
> individual drivers anymore.

It seems you are trying to create something like "universal quirk".
Brave idea, but from my experience a fiasco is what will be out of it.
The hardware has a lot of different issues and levels of issues and it
is close to impossible to describe everything possible and predict the
future... Good luck!


...

> * need to split the information into several places (instead of having
>    all in one DTS)
> * need to have one separate module board, or merge the dmi tables.

Have no idea what you are talking about here, sorry.

> My goal is having everything that describes a board into one DTS
> (source) file.

I'm confused, you are talking about non-DT platforms in the
cover-letter and now you are talking about DTS. AFAIK DTS allows you
to put everything in one source.


-- 
With Best Regards,
Andy Shevchenko
