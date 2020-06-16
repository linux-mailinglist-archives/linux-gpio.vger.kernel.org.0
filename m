Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2781FC118
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 23:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgFPVkw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 17:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgFPVkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 17:40:52 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAF4C061573;
        Tue, 16 Jun 2020 14:40:52 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x11so3608890plo.7;
        Tue, 16 Jun 2020 14:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+dajMWjezIJ0QoGB+YVGjkIeaVfvA1ZzMYeFQHxUYCY=;
        b=G+eaAvVoxKV4s+UrluTAMDCCoQ3u5InSeKWKwrY/m8A9W8k7DbebILXdxDP2iEvG1w
         Dx3ueS+WBJFUS4KqcBlzHZK3g0OyHhdNB90HprruUOF44s4YF56endRnFxcQsLBCcHIT
         25htvqS0mTSn9m6xpqwBwWgRbYSVJ7wIySdiWdaujhZ0T1+LNg0b/xJK+YT/Qd3ROMpK
         ZTpIBogDLhUbbSe9q+6du5LZXYw5mnxPvt4lJphHKaLVTars0IwQE8mAaHXJaopaqezc
         7nwKWyF9iiyY38FAnSyh0P0C4T34AUOb6NU7rTa2cGsAw/dkW+qCjaKSt0wz+bK9Jy/r
         CBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+dajMWjezIJ0QoGB+YVGjkIeaVfvA1ZzMYeFQHxUYCY=;
        b=VJp9w/Hz2Bp0tTtWgyzsNuzvtSHt2ZEHg2ZLAlhLwNW2JwLAoiXq9qblKm6OvOrB/n
         7h6gKbn3M1/KO/VJtedzm48EU2srsTZSPP87oRQWyG6yWapojDZiMEBSpSJnE3if882n
         HNQJCd6nLD23cQFpooPIMJt7XxglLsdWUFcVG4oKIrQtRAmyOPo7839vyr/YP0fKtTMk
         EKCwX8NBIeq9LlByVDuHMpSNe+HXVdKJFe4mnvuKZapjZzwT75C6UdRcwFemn5gxFfuB
         ZhS15H6kivLPJpUjtGg+49hIJ3yE8D+mHpWLSXUf/ueuxxi4qQDcFj9/7OYtjk3uLbLX
         4s4w==
X-Gm-Message-State: AOAM531c3G0pFGgzQyCpkmLpKTUEIh7vHybQViFh7/SR90FGkZq1/Rzo
        pw1px3TSbvGzpRJplbyMRePshsI/XvN4obBkfkSQAfoW
X-Google-Smtp-Source: ABdhPJw+5RcNqV+etOo/4A14LjCKQKf1PiP/HW80zQ3wk0qQ/kI//YDPYeANKr3EqL380La+nt7/YUkbRD/WEM4OPWM=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr4582038pjr.181.1592343651550;
 Tue, 16 Jun 2020 14:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com> <20200616200225.32mwzew3zw3nuiwh@mobilestation>
In-Reply-To: <20200616200225.32mwzew3zw3nuiwh@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Jun 2020 00:40:35 +0300
Message-ID: <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:
> > Some devices would need to have a hierarchy of properties and
> > child nodes passed to the child or children of MFD. For such case
> > we may utilize software nodes, which is superior on device properties.
> >
> > Add support of software nodes to MFD core and convert one driver
> > to show how it looks like. This allows to get rid of legacy platform
> > data.
> >
> > The change has been tested on Intel Galileo Gen 2.
>
> I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
> part into the gpio-dwapb.c driver and use either the ACPI-based or
> platform_device_id-based matching to get the device-specific resources
> info through the driver_data field. By doing so you wouldn't need to
> introduce a new "snps,gpio-base"-like property and propagate
> software_node-based properties, but still you could get rid of the
> dwapb_platform_data structure since all the info would be locally
> available.

The idea is to get rid of the driver being dependent on some quirks
when we may do it clearly and nicely.
We, by applying this series, make (keep) layers independent: board
code vs. driver code. Mixing them more is the opposite to what I
propose.

WRT property.
snps,gpio-base can be easily changed to *already in use* gpio-base or
being both converted to linux,gpio-base to explicitly show people that
this is internal stuff that must not be present in firmware nodes.

> If ACPI-based matching doesn't uniquely address the Quark GPIO node,
> then you could just replace the intel_quark_mfd_cells[0].name with
> something like "gpio-dwapb-quark", which then by the MFD core will be
> copied to the corresponding platform_device->name due to calling
> platform_device_alloc() with cell-name passed. That name will be used
> to match a platform_driver with id_table having that new name added.

Oh, that doesn't sound right. It makes things ugly.

-- 
With Best Regards,
Andy Shevchenko
