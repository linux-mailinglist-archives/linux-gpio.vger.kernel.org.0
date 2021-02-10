Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D879E3163E8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhBJKdm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhBJKbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:31:37 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91ECDC06174A;
        Wed, 10 Feb 2021 02:30:57 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id t26so953477pgv.3;
        Wed, 10 Feb 2021 02:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bi4sQc1W0haZULZiCGbFCEA8dMHiZn6QmzMFchXnTYQ=;
        b=O6BimNAuXjNLj/yIoizM4uAt2GF/5uu64K1ztnL3yk7SXNLm63PvYs+X6csIxGHjvP
         6OPVzLD+S84m7bvln8dTdCJmIqWOyC18oH1HRiIVGxCuwDU40KdZZTaMearXJBkjWvv8
         NnbpAdx65RIdyGZGq8+R4u37Bc1hPk9tB0EfvU8NdLQUB98C6WGzqZw+2+2gM07t/lb3
         q6V0UEaTgjMYbPbRINW9lKUILnngSPNhz4ol82BmG4BOTq7TsIvUA5RI868pym1NeLJT
         YOusVxVaHPjP11txFj94L08FInBXB2lz0SalNdDSe9vcm9Svltym1l4ZKGPlqCQjhmjD
         zlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bi4sQc1W0haZULZiCGbFCEA8dMHiZn6QmzMFchXnTYQ=;
        b=V475XtikCogFGTirqj9KDAZBD4hzRzWvtO08e5zqw4GbH49JBasuys0I6sJGYzqqGI
         cguusqxlakzoMGUNx/C7pVB5UejiXX2lhnn6tQdA4yVJBDZ9wN6vCD0R5YXxkSyh3OyD
         tICeElIDaEAxQHjHqcDifUofiayZzh9JiSnru+JzU7P39xHCQjNlXki8habE5AeX9r3D
         F4y+zBqbBp4QW9L4anvm75mCI9uA69+zULBlamw786w9iPIAjakyMcD/27GJpWowjXv9
         qYitijmSJufJ81tDLGEQTawQ0RLB7RnlUGepuNTSY5sdSrH9WgKFJnB5Uzp9NHmd6u3S
         XkMQ==
X-Gm-Message-State: AOAM5304zXvasZHAwk2FYFN/pbPajQ19d0SqU3r0aw/cX+WCrgnxDuN2
        uS4b7D6TADGkY/UtZCSmxZeT4SNfdL7xM7OdV2c=
X-Google-Smtp-Source: ABdhPJyP0sXFD40X5SO/TEyI/QwQnKtk4YunVmUZ8GB/ony+EeZZbqIf1O+uj1Qqqb2trtjlVfyvr80nzDIMMQAGIYg=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr2401710pfk.73.1612953057053; Wed, 10
 Feb 2021 02:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net>
In-Reply-To: <20210208222203.22335-1-info@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:30:40 +0200
Message-ID: <CAHp75VdNTenoE0AOmGfndqQ7SrxbuK+SvfFYn3W2GmqhkCSByQ@mail.gmail.com>
Subject: Re: RFC: oftree based setup of composite board devices
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Tue, Feb 9, 2021 at 12:25 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Hello folks,
>
> here's an RFC for using compiled-in dtb's for initializing board devices
> that can't be probed via bus'es or firmware.
>
> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
> platform devices can't be directly enumerated via firmware. Traditionally
> we had to write board specific drivers that check for board identification
> (DMI strings, etc), then initialize the actual devices and their links
> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.

In ACPI we support DT compatible strings, and we support overlays for
a long time. Would it work for you?

> This patch queue does a bunch of preparations in oftree code, so we can
> support multiple fully independent DT's (not using DT overlays). And then
> adds a generic driver parses compiled-in fdt blobs, checks for mathing
> DMI strings and initializes the devices. As an example, the last patch
> adds an alternative implementation for the PC engines APU2/3/4 board
> family based on device tree.

Sounds weird, but let's see...

> The approach can be easily be extended to other kinds of composite devices,
> eg. PCI cards or USB dongles.

What do you mean? PCI and USB are self-enumerated. What's wrong with them?

> Yet some drawbacks of the current implementation:
>
>  * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
>    modprobing anyways)

What?! https://lwn.net/Articles/233385/
`git grep -n 'MODULE_DEVICE_TABLE(dmi'`

>  * can't reconfigure or attach to devices outside the individual DT's
>    (eg. probed by PCI, etc)


-- 
With Best Regards,
Andy Shevchenko
