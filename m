Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074FB2D2890
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 11:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgLHKLe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 05:11:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:60810 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727992AbgLHKLe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 05:11:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A2735AD12;
        Tue,  8 Dec 2020 10:10:52 +0000 (UTC)
Date:   Tue, 8 Dec 2020 11:10:51 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201208101051.GC6564@kitsune.suse.cz>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205142218-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello

On Sat, Dec 05, 2020 at 02:32:04PM -0500, Michael S. Tsirkin wrote:
> On Sat, Dec 05, 2020 at 08:59:55AM +0100, Enrico Weigelt, metux IT consult wrote:
> > On 04.12.20 04:35, Jason Wang wrote:
> > 
> > > 
> > > Let's use select, since there's no prompt for VIRTIO and it doesn't have
> > > any dependencies.
> > 
> > whoops, it's not that simple:
> > 
> > make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
> > make[1]: Entering directory
> > '/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-build'
> >   GEN     Makefile
> > drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> > drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
> > DRM_VIRTIO_GPU
> > drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
> > drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
> > drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
> > drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
> > drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
> > drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
> > drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
> > drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
> > drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
> > DRM_KMS_HELPER
> > 
> > Seems that we can only depend on or select some symbol - we run into
> > huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
> > VIRIO instead of depending on it, and now it works.
> > 
> > I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
> > to use 'select' instead of 'depends on'.
> 
> It seems a bit of a mess, at this point I'm not entirely sure when
> should drivers select VIRTIO and when depend on it.
> 
> The text near it says:
> 
> # SPDX-License-Identifier: GPL-2.0-only
> config VIRTIO
>         tristate
>         help
>           This option is selected by any driver which implements the virtio
>           bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
>           or CONFIG_S390_GUEST.
> 
> Which seems clear enough and would indicate drivers for devices *behind*
> the bus should not select VIRTIO and thus presumably should "depend on" it.
> This is violated in virtio console and virtio fs drivers.
> 
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
The console driver provides early console which should initialize
without any transport. I have not tested it actually works but the code
seems to be there to support this use case.

Thanks

Michal
