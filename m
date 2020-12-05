Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A712CFEA6
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 21:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgLEUIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 15:08:10 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:54631 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgLEUIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 15:08:09 -0500
Received: from [192.168.1.155] ([95.117.6.188]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKbPg-1kSsSo2JCe-00KvFk; Sat, 05 Dec 2020 21:05:18 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
Date:   Sat, 5 Dec 2020 21:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201205142218-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QugltoubQsv7+6FipOEchA2SlXCGRjERRAI/iuCtMDvu9KDBRRq
 saQTyePYS/E5loL/IxLrDFxgvPJ5JGmBzjTKIcVIrHGc/f9AGEkatuhoHw3jThMUeX5Ck8N
 ZMgEGXkxFB7huSU0tSGiu9ycGb4dQB+6+3LD3fCzBbfr+/KPagDfjvKGE3ZWg5Rkw2ZXhVY
 ZWUytYSOdq9CBmccEdCYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2it/pa0pkAM=:oFJFH+K8FRt4xExK6On0dO
 IFQ4fpnbkvP9d1krIcL/bcTDB2bAF0+lBGVmZa9S1za8Jrc/uZtc8/+jHtAgwrYp+v5g33ZaR
 m+A6CYjJC2IGU3h400s3xfPZKdRDKK4XCZqd4PFQOU/x5g2EjxnlDfteF6Ao/JBNWIdC7qDbT
 RUp+t3icVWxWEDISAetAMkDqbwY4bd9ygxbehmHiFzeY6Xf5F1O6LzWtu4VhYKvnchqhqPfdG
 FYNj0m7RzUP+szC8fWKQeVfmfCQluY/ppzurcFmlMkIZEbZq48JZv1wEmurUS4qNDiOWMJUyG
 UoqkrpJG/4p4FSrepw7H+NefIpsJqm8cPwM58vwmyxWULjoNJKwtGRQU3A2r18InX7oyUlXFM
 H0Ei0ybi98Tuggk8+zRcKWbh8Ji1tUBVGCNE36E1Hf/7X0kBrLhGGHsaWlnk9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05.12.20 20:32, Michael S. Tsirkin wrote:

Hi,

> It seems a bit of a mess, at this point I'm not entirely sure when
> should drivers select VIRTIO and when depend on it.

if VIRTIO just enables something that could be seen as library
functions, then select should be right, IMHO.

> The text near it says:
> 
> # SPDX-License-Identifier: GPL-2.0-only
> config VIRTIO
>         tristate

oh, wait, doesn't have an menu text, so we can't even explicitly enable
it (not shown in menu) - only implicitly. Which means that some other
option must select it, in order to become availe at all, and in order
to make others depending on it becoming available.

IMHO, therefore select is the correct approach.


>         help
>           This option is selected by any driver which implements the virtio
>           bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
>           or CONFIG_S390_GUEST.
> 
> Which seems clear enough and would indicate drivers for devices *behind*
> the bus should not select VIRTIO and thus presumably should "depend on" it.
> This is violated in virtio console and virtio fs drivers.

See above: NAK. because it can't even be enabled directly (by the user).
If it wasn't meant otherwise, we'd have to add an menu text.

> For console it says:
> 
> commit 9f30eb29c514589e16f2999ea070598583d1f6ec
> Author: Michal Suchanek <msuchanek@suse.de>
> Date:   Mon Aug 31 18:58:50 2020 +0200
> 
>     char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
>     
>     Make it possible to have virtio console built-in when
>     other virtio drivers are modular.
>     
>     Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>     Reviewed-by: Amit Shah <amit@kernel.org>
>     Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> which seems kind of bogus - why do we care about allowing a builtin
> virtio console driver if the pci virtio bus driver is a module?
> There won't be any devices on the bus to attach to ...

When using other transports ?
In my current project, eg. I'm using mmio - my kernel has pci completely
disabled.

> I am inclined to fix console and virtio fs to depend on VIRTIO:
> select is harder to use correctly ...

I don't thinkt that would be good - instead everybody should just select
VIRTIO, never depend on it (maybe depend on VIRTIO_MENU instead)


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
