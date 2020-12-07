Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85E52D0D22
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 10:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgLGJgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 04:36:45 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:33651 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLGJgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 04:36:45 -0500
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MnFps-1kKX8C3xeW-00jMNg; Mon, 07 Dec 2020 10:33:57 +0100
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
 <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
 <37a9fbc6-d75f-f6cd-f052-0dd416594a84@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <635faeb7-950e-e594-3217-69032ed9cbd1@metux.net>
Date:   Mon, 7 Dec 2020 10:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <37a9fbc6-d75f-f6cd-f052-0dd416594a84@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uyhQiyLYIW2+ht8ujHR3ocz5i10aYyRMp5NddJBt91W9n5CxJwR
 er36oazoeWX6Z4GoxbZ4xMlWA2hLnzmUFiqcqQ27WHsxdfoIKkY80aa0wg3rp35pxb4fsHa
 qq31FRXicF33+I6GzajXHH8RM8IxzkBTzHN10gwSpdWEp8HTG7lSlVp8TeRIQ6zeqbeuI4H
 nanv24HHaY/Fs3hmOKHhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPbMj2CC5EU=:LIkWLnAHT3uJ58igbF8Wwa
 mOWcFo1umrUdXT3rFzQZssgyXE7NjwxsmPUDVQfcMDQXkMc0RnUbhBaup+JcQ4asNXwq6Iu7M
 /KCeGfavK6h7OmGFrz7pTaa2kbrJiBrV9RVgRjzqfKC8CB0/usK43jBYxF3HiduIcT88wRn+M
 bxVgXNZ+ezdB9t9YeHY0L77yLRS8u3BP48hzVmEGTvON1SuPutR7yHGKpOLQNQyqCx/2wvQ7O
 dVle384Glr4IDdg/+TCbJ0aJLYxL6J6aBJo8x1XfGBXeTqYLEnbdBLCOk4oruOKoP0mVQQdC1
 DDOQx4myVQBUBng2gLmV2XE2TCQMMf/bUEQrRXVYfSUJ6wfbL5vBq69poFRc8vNxgv6eI4Y4L
 a0k0aLt0+PCj0RmiqZ53Gtnunn+BCBsPI/D7XwSFDzl0mkE2QIXweKnQ/Z65N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07.12.20 04:48, Jason Wang wrote:

Hi,

>>> Not a native speaker but event sounds like something driver read from
>>> device. Looking at the below lists, most of them except for
>>> VIRTIO_GPIO_EV_HOST_LEVEL looks more like a command.
>> okay, shall I name it "message" ?
> 
> 
> It might be better.

Okay, renamed to messages in v3.

>>> #define VIRTIO_NET_OK     0
>>> #define VIRTIO_NET_ERR    1
>> hmm, so I'd need to define all the error codes that possibly could
>> happen ?
> 
> 
> Yes, I think you need.

Okay, going to do it in the next version.

>>> If I read the code correctly, this expects there will be at most a
>>> single type of event that can be processed at the same time. E.g can
>>> upper layer want to read from different lines in parallel? If yes, we
>>> need to deal with that.
>> @Linus @Bartosz: can that happen or does gpio subsys already serialize
>> requests ?
>>
>> Initially, I tried to protect it by spinlock (so, only one request may
>> run at a time, other calls just wait until the first is finished), but
>> it crashed when gpio cdev registration calls into the driver (fetches
>> the status) while still in bootup.
>>
>> Don't recall the exact error anymore, but something like an
>> inconsistency in the spinlock calls.
>>
>> Did I just use the wrong type of lock ?
> 
> I'm not sure since I am not familiar with GPIO. But a question is, if at
> most one request is allowed, I'm not sure virtio is the best choice here
> since we don't even need a queue(virtqueue) here.

I guess, I should add locks to the gpio callback functions (where gpio
subsys calls in). That way, requests are requests are strictly ordered.
The locks didn't work in my previous attempts, but probably because I've
missed to set the can_sleep flag (now fixed in v3).

The gpio ops are already waiting for reply of the corresponding type, so
the only bad thing that could happen is the same operation being called
twice (when coming from different threads) and replies mixed up between
first and second one. OTOH I don't see much problem w/ that. This can be
fixed by adding a global lock.

> I think it's still about whether or not we need allow a batch of
> requests via a queue. Consider you've submitted two request A and B, and
> if B is done first, current code won't work. This is because, the reply
> is transported via rxq buffers not just reuse the txq buffer if I read
> the code correctly.

Meanwhile I've changed it to allocate a new rx buffer for the reply
(done right before the request is sent), so everything should be
processed in the order it had been sent. Assuming virtio keeps the
order of the buffers in the queues.

>> Could you please give an example how bi-directional transmission within
>> the same queue could look like ?
> 
> You can check how virtio-blk did this in:
> 
> https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-2500006

hmm, still don't see how the code would actually look like. (in qemu as
well as kernel). Just add the fetched inbuf as an outbuf (within the
same queue) ?

>> Maybe add one new buffer per request and one new per received async
>> signal ?
> 
> It would be safe to fill the whole rxq and do the refill e.g when half
> of the queue is used.

Okay, doing that now in v3: there's always at least one rx buffer,
and requests as well as the intr receiver always add a new one.
(they get removed on fetching, IMHO).


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
