Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26410223BDB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgGQNDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:03:15 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43175 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgGQNDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 09:03:15 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MTiLj-1kPt8u0C9F-00U51X; Fri, 17 Jul 2020 15:03:13 +0200
Received: by mail-qk1-f173.google.com with SMTP id l6so8600047qkc.6;
        Fri, 17 Jul 2020 06:03:12 -0700 (PDT)
X-Gm-Message-State: AOAM530mCiCYf9tTIJWUd/6WM6kGqzkyWI6uR6i3/wyO9zPppOQcz3b2
        vlRhhqzZQ3lvUCFli22IOBSqeoWWsN/Rn3KkU1Y=
X-Google-Smtp-Source: ABdhPJyuO3LBCBkI4UHoemjYpeb6qR3u+uWtsrdd2uoqpmSfLP4xlUiKZiLFZ4iPFUZK+KoMfzD0cl9SuOcz2YgadL4=
X-Received: by 2002:a37:9004:: with SMTP id s4mr345881qkd.286.1594990990628;
 Fri, 17 Jul 2020 06:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com> <20200717121436.GA2953399@kroah.com>
In-Reply-To: <20200717121436.GA2953399@kroah.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 15:02:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Ds4O5yRtGSMbNN8R5dPcdb1HJTY=W5eyToFQ-UhzkBw@mail.gmail.com>
Message-ID: <CAK8P3a3Ds4O5yRtGSMbNN8R5dPcdb1HJTY=W5eyToFQ-UhzkBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Fabio Estevam <festevam@gmail.com>,
        Anson Huang <anson.huang@nxp.com>, Jon Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Adam Ford <aford173@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PnQgfgYwfYuuBJpj1xktjWOKhKrYJMPulmrPaQn13yympd5z086
 fFNKoxjp399F/B0P/4xk4EeGefedP7JmZ8flmq6GwPByEKWy6VleOI/Q2UBESg7z0hq3FHA
 MebFneHpbr8IwlCDLrpvtRXEKweddZpXhS2WPgnpcb1Ar7lfqVXUZHTlsZj3CcM1/rQKw5i
 hAhvJ+QCfY0KNFmSgbHDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uuxEPBDLxAo=:ZBHYdUNSQHm+QtoJnY+ioX
 hohXKN6vTf1tWwYkMveqTS4QC6l6N1Ytq/2WVNTkzu3QQZP70LjkwD8JrRv1A+x49q3su6oVm
 d7hQNiTJ50b9bpSQQ2CPQR1adHflwe1f9nGe8bbbP9hVeRENlJ+Ogf4XqDJRmXZV+2lIPx34v
 b98Zujh7DXaV9S3ce/lhErC4tUngUsesrmwqnftOTx4RccGwVNLUrAQgJp2WxhX5CiPF+oK3n
 YQwL9ku7FruvORB/GFv+BdMCrfALHUKn+waeQSGjktmDcsaCzQQTuWk4ni7rW+5jazKniCf4V
 hLXg6vyuB3OwxFMEl7zhsQYiU9vx17oJKh/03NpF+FmrbBrulp6EyciHqAtmMpc6w6kG+i+aD
 JT4nbDc2ZxUlwQaOXzTvoY5T5a/Uc6JLPjtsJDqqGkxGL0+o6+4DAZhiAFnUOJsOTzkVttR+F
 q+vJxrsDpVD1hdHO9u9pmvWZywq3aTDHzlmpDSe6NpUqfGXdW/ollh46Ai80DJGXXawrYWuJ7
 ciatQsAfLwL1wsDDSYkzyv1WvNO7DMpLgLAIz6jhscLDiJ1O8Cwg5EG/TqOMWVE6YzO0v9WVr
 yRr+36ZQ41H7iwJCerFnhpLuUY+FD9o2x4sdMF/OuwI7nBNdG7eESphX7S9jCne+qQwthtQpK
 WO5lhUrCEPQ1KpKeXVqGuRn7RkFvHIGrGBGilMi/sWy8I7UHY3qV/Ut/3ukwyFrYRptchvIL7
 DpqUwx9CpSzblDKDv2OVsnB/Kt9saeRpNxro26kC513QwvWUiTOLEAWmbCzYQ4J9dG8ZQCbGf
 Vcadvn6WC/l5TfLDoZVfLyKM5KMO2zoKLKJjs9zCtFDg/6vAHZ9HaXqjQabbgqPzQM1BIEuJD
 xx3wEtvydBAje4ONy21hE+5LNAcPXK3k4BiLaUpqESs0709kZpAmBlb4wp6eZz2/H7n9HhdMM
 hqxBCKTdYNABvk4FdLZs+apHThFjRmPaCyP7w/LG5jZllZBdgayRs
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 2:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Jul 17, 2020 at 02:01:16PM +0200, Linus Walleij wrote:
> > While I am a big fan of the Android GKI initiative this needs to be aligned
> > with the Linux core maintainers, so let's ask Greg. I am also paging
> > John Stultz on this: he is close to this action.
> >
> > They both know the Android people very well.
> >
> > So there is a rationale like this going on: in order to achieve GKI goals
> > and have as much as possible of the Linux kernel stashed into loadable
> > kernel modules, it has been elevated to modus operandi amongst
> > the developers pushing this change that it is OK to pile up a load of
> > modules that cannot ever be unloaded.
>
> Why can't the module be unloaded?  Is it just because they never
> implement the proper "remove all resources allocated" logic in a remove
> function, or something else?

For the core kernel parts, it's usually for the lack of tracking of who
is using the resource provided by the driver, as the subsystems tend
to be written around x86's "everything is built-in" model.

For instance, a PCIe host bridge might rely on the IOMMU, a
clock controller, an interrupt controller, a pin controller and a reset
controller. The host bridge can still be probed at reduced functionality
if some of these are missing, or it can use deferred probing when
some others are missing at probe time.

If we want all of drivers to be unloaded again, we need to do one
of two things:

a) track dependencies, so that removing one of the devices
    underneath leads to everything depending on it to get removed
    as well or will be notified about it going away and can stop using
    it. This is the model used in the network subsystem, where
    any ethernet driver can be unloaded and everything using the
    device gets torn down.

b) use reference counting on the device or (at the minimum)
    try_module_get()/module_put() calls for all such resources
    so as long as the pci host bridge is there, so none of the devices
    it uses will go away when they are still used.

Traditionally, we would have considered the PCIe host bridge to
be a fundamental part of the system, implying that everything it
uses is also fundamental, and there was no need to track
usage at all, just to ensure the probing is done in the right order.

> > As a minimum requirement I would expect this to be marked by
> >
> > struct device_driver {
> >    (...)
> >     /* This module absolutely cannot be unbound */
> >    .suppress_bind_attrs = true;
> > };
>
> No, that's not what bind/unbind is really for.  That's a per-subsystem
> choice as to if you want to allow devices to be added/removed from
> drivers at runtime.  It has nothing to do with module load/unload.

It's a one-way dependency: If we can't allow the device to be
unbound, then we also should not allow module unloading because
that forces an unbind.

      Arnd
