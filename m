Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86F54DF20E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 17:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfJUPxR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 21 Oct 2019 11:53:17 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50813 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbfJUPxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 11:53:17 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MVNJ3-1iUWBo31xn-00SOsf; Mon, 21 Oct 2019 17:53:15 +0200
Received: by mail-qt1-f180.google.com with SMTP id t8so4184343qtc.6;
        Mon, 21 Oct 2019 08:53:15 -0700 (PDT)
X-Gm-Message-State: APjAAAVP2VoDFzlJAZhxdAqTL4ra99XvNpLc+t3B5+LJmb26yDba0sPc
        oEUGePLe4/xO6AYHDQh8bX3PxNIr2iRrR3vShrA=
X-Google-Smtp-Source: APXvYqxW/Wo5Bc84asv5c2V8xml6VFZ/dYpuW0qFfpij3rPpITkcG/R1Y8CZKUX4MG/FmCrTnqrwGTcR/1dluA38Qi0=
X-Received: by 2002:ac8:33d4:: with SMTP id d20mr24825177qtb.204.1571673194349;
 Mon, 21 Oct 2019 08:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl> <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 21 Oct 2019 17:52:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
Message-ID: <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:O+1xiKkIhVGA3v4iWA9n7wtHr31rWwdwVnZlKGiOY3ggLieb24n
 B4RAssGZjx2dLjQpgkfixrW1EbC/pnFrihfBbPqQEstVBe/PfylXH1SdfW8lxyme/vLM+ev
 BThHzJN6FvGA92k5gAsWRQSFbFQNYvNPslgD+B+M/aHoPnKy9aPEhguXqgFn1109WJat16z
 UHk83qwdHoFbvxfDsz/nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p3V1hzsLbe4=:fKCoXHiSOWiQa4O4byfOem
 Py7Vzwx/DB/7l3kFqtBbBMjGHOHg6OKikfCx6Delt9aA6oIpSqwqLAbN91dffBEJoUojYcxNy
 +KdTrcWxAh4W33TGZiieWN8ZgPxLPnsf+M5kkXAaqhH/YlFyRtQMRcaCYMwNO6a7NQWm0o34H
 PZ8Y52450vDDUfNl76d/7nxNxpT+mvWpNoMJYTKSKIduhVwv2RcnfheGoy8aAk3ibbYl/+s6X
 JA6VSbjXqPX7sOrm3+s4gPk0hlYUSxEaoxlWPb/ZIFcZjJ0p+YV5e1n40wlK8YXLAztkyFAw+
 c/nZLjUYj5BIxeJ4gqZkywx7cjJwqwFCJFbQ/VdIj5zIav+4hZcF7tHmnx1r2d3z/pVNx6Ufv
 L0P/GrrfIZjieaKeECgcVyJ9o4k6TTCZYtzTAYMxr+xIoFzfpAgENONCnD2Ym8mtH0FQLe5MB
 Roqr8CSPTB9GsnulD8y2jXuZYkkfnB5N9FTLs/T5V5kfSQeWeLgqfP/RLS6i0FrmerniqO8Gn
 aLFgk3J7/RrmoqHuJoT/KgulyCV38qV/rKeS/h4DsvASIit1NkP+t5CB9ZIZ+OeeDAJVaaiJH
 eR97e2WmMHaXe/0tTgf9ZFm9oKbwB4eYW0y+o7SNL/GHC0HYO18aUBFxUqVWWqXu4ytru3Zk9
 iwUzIFaU1tWwsSpGejNme30U4u4DKEQj5u3ilQrUXeniNtSD9JTIP4ah4X2VFfKkb00w9uODj
 MGnKKG5bnb7Ior7q6o8KGDUn+FPYzOny7T2lcrtOEXI0L4QZOnk4kKsXhNhziDCaFCnuXxpgk
 oqAgVYaIhQ0T9wwrzgnKnEkf+uoHCPldGoj+bt2eKdDIvp5uy1Ko0V3mYmawcYySi3SD4d2lY
 P0gcnqoEk3TWq9HWeSDA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 5:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> niedz., 6 paź 2019 o 07:39 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Bartosz Golaszewski (8):
> >   Documentation: devres: add missing entry for
> >     devm_platform_ioremap_resource()
> >   lib: devres: prepare devm_ioremap_resource() for more variants
> >   lib: devres: provide devm_ioremap_resource_wc()
> >   drivers: platform: provide devm_platform_ioremap_resource_wc()
> >   misc: sram: use devm_platform_ioremap_resource_wc()
> >   drivers: provide devm_platform_ioremap_resource_byname()
> >   gpio: mvebu: use devm_platform_ioremap_resource_byname()
> >   gpio: tegra186: use devm_platform_ioremap_resource_byname()
> >
> >  .../driver-api/driver-model/devres.rst        |  4 ++
> >  drivers/base/platform.c                       | 39 +++++++++++-
> >  drivers/gpio/gpio-mvebu.c                     | 19 +++---
> >  drivers/gpio/gpio-tegra186.c                  |  4 +-
> >  drivers/misc/sram.c                           | 28 +++------
> >  include/linux/device.h                        |  2 +
> >  include/linux/platform_device.h               |  6 ++
> >  lib/devres.c                                  | 62 +++++++++++++------
> >  8 files changed, 108 insertions(+), 56 deletions(-)
>
> Greg, Arnd,
>
> gentle ping for this. I noticed that some maintainers are complaining
> about being spammed with patches converting old drivers to using
> devm_platform_ioremap_resource() and there's even a patch removing the
> relevant coccinelle script on the list, but I think for new drivers
> these are still useful. Do you want to pick them up for v5.5 (or at
> all)?

I think this series is useful and we should merge it. Are there any
remaining dependencies or conflicts with Christoph Hellwig's recent
__ioremap rework? If there are, I would prioritize his work and maybe
delay this one by another merge window, otherwise please add
my Reviewed-by to all patches and resend them for Greg to pick
up (provided he has no objections).

        Arnd
