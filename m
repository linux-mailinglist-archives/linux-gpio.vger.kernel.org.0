Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784DE2D20E5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 03:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgLHCho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 21:37:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56705 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727412AbgLHCho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 21:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607394977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RYRh0BrbEydzQN0gbRsV8YUEFZZ1GUb2egfShjaZmZc=;
        b=P0aV9UjLpsiKVrKWplZlCq4hLpTpQ0QmwSQ6xVdgfLB/Neldxq7+LVGzyfAQ/mi9kDIjfU
        KIXrLyDSqJubUN3lixhn1WhF8syvtVboya/HCZTaqhMtwXqbg19nYsv28gU/DxS4FIUG+C
        TD26sugKJaFmjVfNVSsFmpHc6Q75I1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-GP2LMSA8PV6LunypxUpYSg-1; Mon, 07 Dec 2020 21:36:15 -0500
X-MC-Unique: GP2LMSA8PV6LunypxUpYSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAC931005513;
        Tue,  8 Dec 2020 02:36:13 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4108060BE2;
        Tue,  8 Dec 2020 02:36:01 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
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
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
 <20201207085247-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
Date:   Tue, 8 Dec 2020 10:36:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207085247-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/7 下午9:53, Michael S. Tsirkin wrote:
> On Mon, Dec 07, 2020 at 11:12:50AM +0800, Jason Wang wrote:
>> On 2020/12/6 上午3:32, Michael S. Tsirkin wrote:
>>> On Sat, Dec 05, 2020 at 08:59:55AM +0100, Enrico Weigelt, metux IT consult wrote:
>>>> On 04.12.20 04:35, Jason Wang wrote:
>>>>
>>>>>> --- a/drivers/gpio/Kconfig
>>>>>> +++ b/drivers/gpio/Kconfig
>>>>>> @@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
>>>>>> Â Â Â Â Â Â Â  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the
>>>>>> usage in
>>>>>> Â Â Â Â Â Â Â  it.
>>>>>> Â  +config GPIO_VIRTIO
>>>>>> +Â Â Â  tristate "VirtIO GPIO support"
>>>>>> +Â Â Â  depends on VIRTIO
>>>>> Let's use select, since there's no prompt for VIRTIO and it doesn't have
>>>>> any dependencies.
>>>> whoops, it's not that simple:
>>>>
>>>> make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
>>>> make[1]: Entering directory
>>>> '/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-build'
>>>>     GEN     Makefile
>>>> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>>>> drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
>>>> DRM_VIRTIO_GPU
>>>> drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
>>>> drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
>>>> drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
>>>> drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
>>>> drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
>>>> drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
>>>> drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
>>>> drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
>>>> drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
>>>> DRM_KMS_HELPER
>>>>
>>>> Seems that we can only depend on or select some symbol - we run into
>>>> huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
>>>> VIRIO instead of depending on it, and now it works.
>>>>
>>>> I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
>>>> to use 'select' instead of 'depends on'.
>>> It seems a bit of a mess, at this point I'm not entirely sure when
>>> should drivers select VIRTIO and when depend on it.
>>>
>>> The text near it says:
>>>
>>> # SPDX-License-Identifier: GPL-2.0-only
>>> config VIRTIO
>>>           tristate
>>>           help
>>>             This option is selected by any driver which implements the virtio
>>>             bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
>>>             or CONFIG_S390_GUEST.
>>>
>>> Which seems clear enough and would indicate drivers for devices *behind*
>>> the bus should not select VIRTIO and thus presumably should "depend on" it.
>>> This is violated in virtio console and virtio fs drivers.
>>>
>>> For console it says:
>>>
>>> commit 9f30eb29c514589e16f2999ea070598583d1f6ec
>>> Author: Michal Suchanek <msuchanek@suse.de>
>>> Date:   Mon Aug 31 18:58:50 2020 +0200
>>>
>>>       char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
>>>       Make it possible to have virtio console built-in when
>>>       other virtio drivers are modular.
>>>       Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>>>       Reviewed-by: Amit Shah <amit@kernel.org>
>>>       Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
>>>       Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>> which seems kind of bogus - why do we care about allowing a builtin
>>> virtio console driver if the pci virtio bus driver is a module?
>>> There won't be any devices on the bus to attach to ...
>>
>> For testing like switching bus from pci to MMIO?
>
> Not sure I understand ... can you give an example?


E.g testing

modprobe -r virtio_mmio
modprobe virtio_pci

?


>
>>> And for virtio fs it was like this from the beginning.
>>>
>>> I am inclined to fix console and virtio fs to depend on VIRTIO:
>>> select is harder to use correctly ...
>>>
>>> Jason?
>>
>> I think it works, but we need a prompt for VIRTIO otherwise there's no way
>> to enable it.
>>
>> Thanks
> That's even messier. No one needs VIRTIO core by itself - it's only used
> by transports and drivers.


So we endup with two solutions (without a prompt):

1) using select, user may end up with driver without transport
2) using depends, user need to enable at least one transport

2) looks a little bit better I admit.

Thanks


>
>>>
>>>> -- 
>>>> ---
>>>> Hinweis: unverschlÃ¼sselte E-Mails kÃ¶nnen leicht abgehÃ¶rt und manipuliert
>>>> werden ! FÃ¼r eine vertrauliche Kommunikation senden Sie bitte ihren
>>>> GPG/PGP-SchlÃ¼ssel zu.
>>>> ---
>>>> Enrico Weigelt, metux IT consult
>>>> Free software and Linux embedded engineering
>>>> info@metux.net -- +49-151-27565287

