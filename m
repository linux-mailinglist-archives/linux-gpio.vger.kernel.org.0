Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6B52D0956
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 04:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgLGDR7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 22:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24147 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728053AbgLGDR7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 22:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607310992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dx8xPNc5txqLgoNoWkhDZGnh8dCYke8VCzl6Bvht8Zw=;
        b=VFnbc2tvktM6uJWqC+g6fY0fD4tygEehDzE+wRZfokjlUgkdN6ATCBkoOyQC8lxq6sue0d
        R0NFCVB/e7kYYpMqWJoFgkJPV971Y3jVvWWPL0i4H3LcGG9/hLNSgLkyEVG1qXVW0wLfI6
        UDfNazYMr1l0Q+CMqz+D9ePKD5bpU3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-rDyZVaG2P06EzToeAzWrug-1; Sun, 06 Dec 2020 22:16:29 -0500
X-MC-Unique: rDyZVaG2P06EzToeAzWrug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37EFB858180;
        Mon,  7 Dec 2020 03:16:28 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C32CC614ED;
        Mon,  7 Dec 2020 03:16:17 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
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
 <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <ea3ab147-c975-49dd-72ca-407f3bf86322@redhat.com>
Date:   Mon, 7 Dec 2020 11:16:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/6 上午4:05, Enrico Weigelt, metux IT consult wrote:
> On 05.12.20 20:32, Michael S. Tsirkin wrote:
>
> Hi,
>
>> It seems a bit of a mess, at this point I'm not entirely sure when
>> should drivers select VIRTIO and when depend on it.
> if VIRTIO just enables something that could be seen as library
> functions, then select should be right, IMHO.
>
>> The text near it says:
>>
>> # SPDX-License-Identifier: GPL-2.0-only
>> config VIRTIO
>>          tristate
> oh, wait, doesn't have an menu text, so we can't even explicitly enable
> it (not shown in menu) - only implicitly. Which means that some other
> option must select it, in order to become availe at all, and in order
> to make others depending on it becoming available.
>
> IMHO, therefore select is the correct approach.
>
>
>>          help
>>            This option is selected by any driver which implements the virtio
>>            bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
>>            or CONFIG_S390_GUEST.
>>
>> Which seems clear enough and would indicate drivers for devices *behind*
>> the bus should not select VIRTIO and thus presumably should "depend on" it.
>> This is violated in virtio console and virtio fs drivers.
> See above: NAK. because it can't even be enabled directly (by the user).
> If it wasn't meant otherwise, we'd have to add an menu text.
>
>> For console it says:
>>
>> commit 9f30eb29c514589e16f2999ea070598583d1f6ec
>> Author: Michal Suchanek <msuchanek@suse.de>
>> Date:   Mon Aug 31 18:58:50 2020 +0200
>>
>>      char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
>>      
>>      Make it possible to have virtio console built-in when
>>      other virtio drivers are modular.
>>      
>>      Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>>      Reviewed-by: Amit Shah <amit@kernel.org>
>>      Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
>>      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> which seems kind of bogus - why do we care about allowing a builtin
>> virtio console driver if the pci virtio bus driver is a module?
>> There won't be any devices on the bus to attach to ...
> When using other transports ?
> In my current project, eg. I'm using mmio - my kernel has pci completely
> disabled.
>
>> I am inclined to fix console and virtio fs to depend on VIRTIO:
>> select is harder to use correctly ...
> I don't thinkt that would be good - instead everybody should just select
> VIRTIO, never depend on it (maybe depend on VIRTIO_MENU instead)


I'm fine with either. Though I prefer to use select but it looks to me 
adding a prompt and use enable would be easier.

Thanks


>
>
> --mtx
>

