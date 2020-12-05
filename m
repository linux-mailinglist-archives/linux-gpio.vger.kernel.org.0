Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474F02CFA68
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 09:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgLEICl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 03:02:41 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55291 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgLEICl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 03:02:41 -0500
Received: from [192.168.1.155] ([95.117.6.188]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MplHR-1kO9jt45Nt-00qBo5; Sat, 05 Dec 2020 08:59:57 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
Date:   Sat, 5 Dec 2020 08:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fmf8zmU7UovplPda5nl+RpiFSt1qDxdLkQdEMe1Op9Sb2CoIBur
 LcsUsmJr84nPI4UGjlYMmGl0YroG1FRq6PZdswvQrQOSOIv8wPOvnyhMMqajWosPYS+bA4B
 h+k6UFHJqdyg2fvtt2m+HSsZHV6msqa+8gzWkJ1pjGypWmiFAqSoZTVa4yHg5Fupd0KnZOn
 W4HS2cW1UncG4c/YnFTJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xnKf40qLm5c=:ql0OiQ6eBB/iTqDKHMTrMY
 NWqR5M+A8owYBTjmYsl4qqMniudtWHA9Zx9NH86N+h5RERCXItrOE32hLUs6NDOSn1H6AuvQv
 g0028vq6yGuOCTDYG4y/LGr2wHjUhgB29HGjuTsAt93WCaj7fhroZzPqjWhRsL6gpzKwaDkKE
 L+twFPGuHHOo6XD+FuNvhcT3fvKUjpMfcRsOPOFreXlW7HMECoayGA+02/xEvPNi7h2UuNVI/
 DIra58ZTGv+knDmojnLsEsBMznTERhW9yfsLWPZuv6/qERyZG6XeDZwhuRq0y3Hi57bDm7RLJ
 uzVEJnDKRhfoKuKuUEXQDmtDDXVljNBbrDueniX7ldFVy+ym31eppFJDsu9T53MH0230JWcU8
 3SYOZ83+s2H2Em6LUrHFmb1av5VpYEipmf2eB28AfjUrbzwfn8oMiXbYB9cMI
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04.12.20 04:35, Jason Wang wrote:

>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
>>         tools/testing/selftests/gpio/gpio-mockup.sh. Reference the
>> usage in
>>         it.
>>   +config GPIO_VIRTIO
>> +    tristate "VirtIO GPIO support"
>> +    depends on VIRTIO
> 
> 
> Let's use select, since there's no prompt for VIRTIO and it doesn't have
> any dependencies.

whoops, it's not that simple:

make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
make[1]: Entering directory
'/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-build'
  GEN     Makefile
drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
DRM_VIRTIO_GPU
drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
DRM_KMS_HELPER

Seems that we can only depend on or select some symbol - we run into
huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
VIRIO instead of depending on it, and now it works.

I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
to use 'select' instead of 'depends on'.

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
