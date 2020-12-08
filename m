Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C61F2D2124
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 03:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgLHCus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 21:50:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50203 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725877AbgLHCus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 21:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607395761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HntMT6HlcO+PPg+xL5NcseaQ7qpjGnU814ibQC6Ox/I=;
        b=XEcJWlPz4DEl2Brt81ECAvqcUqsQuMgIpGRlRBk1TPUgQuiM020DKXu1xt3jBPwj4voFjV
        0NptdDWdVdPsUiWD8JCRTZTsjEhLrfr7MCyk4UuNTSZty7BwxYAgk71jQ5AeGJYpMEvWS3
        ik/Ly1IuHrW9L2P4H6s4RxFl1a0xlIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-EToiXG03Mv2XEkNJtBUdtg-1; Mon, 07 Dec 2020 21:49:14 -0500
X-MC-Unique: EToiXG03Mv2XEkNJtBUdtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0CC2800D62;
        Tue,  8 Dec 2020 02:49:12 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ABB0C10023AD;
        Tue,  8 Dec 2020 02:49:04 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
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
 <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
 <37a9fbc6-d75f-f6cd-f052-0dd416594a84@redhat.com>
 <635faeb7-950e-e594-3217-69032ed9cbd1@metux.net>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <2882f118-3555-614c-33a0-30865673deb3@redhat.com>
Date:   Tue, 8 Dec 2020 10:49:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <635faeb7-950e-e594-3217-69032ed9cbd1@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/7 下午5:33, Enrico Weigelt, metux IT consult wrote:
> On 07.12.20 04:48, Jason Wang wrote:
>
> Hi,
>
>>>> Not a native speaker but event sounds like something driver read from
>>>> device. Looking at the below lists, most of them except for
>>>> VIRTIO_GPIO_EV_HOST_LEVEL looks more like a command.
>>> okay, shall I name it "message" ?
>>
>> It might be better.
> Okay, renamed to messages in v3.
>
>>>> #define VIRTIO_NET_OK     0
>>>> #define VIRTIO_NET_ERR    1
>>> hmm, so I'd need to define all the error codes that possibly could
>>> happen ?
>>
>> Yes, I think you need.
> Okay, going to do it in the next version.
>
>>>> If I read the code correctly, this expects there will be at most a
>>>> single type of event that can be processed at the same time. E.g can
>>>> upper layer want to read from different lines in parallel? If yes, we
>>>> need to deal with that.
>>> @Linus @Bartosz: can that happen or does gpio subsys already serialize
>>> requests ?
>>>
>>> Initially, I tried to protect it by spinlock (so, only one request may
>>> run at a time, other calls just wait until the first is finished), but
>>> it crashed when gpio cdev registration calls into the driver (fetches
>>> the status) while still in bootup.
>>>
>>> Don't recall the exact error anymore, but something like an
>>> inconsistency in the spinlock calls.
>>>
>>> Did I just use the wrong type of lock ?
>> I'm not sure since I am not familiar with GPIO. But a question is, if at
>> most one request is allowed, I'm not sure virtio is the best choice here
>> since we don't even need a queue(virtqueue) here.
> I guess, I should add locks to the gpio callback functions (where gpio
> subsys calls in). That way, requests are requests are strictly ordered.
> The locks didn't work in my previous attempts, but probably because I've
> missed to set the can_sleep flag (now fixed in v3).
>
> The gpio ops are already waiting for reply of the corresponding type, so
> the only bad thing that could happen is the same operation being called
> twice (when coming from different threads) and replies mixed up between
> first and second one. OTOH I don't see much problem w/ that. This can be
> fixed by adding a global lock.
>
>> I think it's still about whether or not we need allow a batch of
>> requests via a queue. Consider you've submitted two request A and B, and
>> if B is done first, current code won't work. This is because, the reply
>> is transported via rxq buffers not just reuse the txq buffer if I read
>> the code correctly.
> Meanwhile I've changed it to allocate a new rx buffer for the reply
> (done right before the request is sent), so everything should be
> processed in the order it had been sent. Assuming virtio keeps the
> order of the buffers in the queues.


Unfortunately, there's no guarantee that virtio will keep the order or 
it needs to advertise VIRTIO_F_IN_ORDER. (see 2.6.9 in the virtio spec).

Btw, if possible, it's better to add a link to the userspace code here.


>
>>> Could you please give an example how bi-directional transmission within
>>> the same queue could look like ?
>> You can check how virtio-blk did this in:
>>
>> https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-2500006
> hmm, still don't see how the code would actually look like. (in qemu as
> well as kernel). Just add the fetched inbuf as an outbuf (within the
> same queue) ?


Yes, virtio allows adding IN buffers after OUT buffer through descriptor 
chaining.

Thanks


>
>>> Maybe add one new buffer per request and one new per received async
>>> signal ?
>> It would be safe to fill the whole rxq and do the refill e.g when half
>> of the queue is used.
> Okay, doing that now in v3: there's always at least one rx buffer,
> and requests as well as the intr receiver always add a new one.
> (they get removed on fetching, IMHO).
>
>
> --mtx
>

