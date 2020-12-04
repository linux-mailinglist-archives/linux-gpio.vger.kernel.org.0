Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2792CEB17
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 10:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgLDJjo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 04:39:44 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:41131 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbgLDJjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 04:39:44 -0500
Received: from [192.168.1.155] ([95.114.158.118]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MTigN-1kbbwT2HDJ-00U5aG; Fri, 04 Dec 2020 10:36:56 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
Date:   Fri, 4 Dec 2020 10:36:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mOFd+JW7LQb94sy2J5a6Zrm6GQyrCzOe1foidRfS2Sdq5ZJFDNr
 c9yXWiDh78oST49XU5yOT2hkWmi+sHBEeoCthMcDLadIjN7f33OyR95JbbbWC81VZvkKsJ2
 CyEL1bcP6HGIcQKMdx+26NZtYVdXg7Tmeoc3QjBu3oN58zjc3+CyfltBuq0Ay50wvkv6a5l
 qfTjbCjDluCwMRQUxcNqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qtpKIGiM1QU=:9HXPFi4Z0pQrtpSEQjPRtZ
 JtGyl92IC0eeKKCWknd9gvTWDpN+lXZQKRBaJ+lBRKjFApBrEvqRmswQ1aAhRYb2w+eejfugo
 eC7B3VI6W6sRYKGQQMrDDzkH6ZXjoirbr+q28PGbRyY+bzodAnvWs1EGx2M/aqG69gdvjLTRX
 6IMYsUTKWhk4usvsgW11YbdKH1e/y31rqbdHNMpVFr4Ti4gWYsVgEegiUoLuYuKdqdU+TkU5n
 x5yzzR3+5yAODcNZy9zjHJBRGxLg8AxpAcX69/elxA+GjkIbMvPMeytzQDiMEocj2QpfQVGMq
 86j47f6GvwRDPf/me9+9BhZfqUTplqzJ5Sc4MFXJirhwcP2QgerCKlvMiwJgq9yetG/xUIeIW
 u8O9OjFfy3L6ZFMNe2TJMvNljme/73qPxwpWAKQ9DrqGX7uqhJ/PC2MDHpPGO
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04.12.20 04:35, Jason Wang wrote:

Hi,

> Is the plan to keep this doc synced with the one in the virtio
> specification?

Yes, of course. I'm still in progress of doing the beaurocratic stuff w/
virtio-tc folks (ID registration, ...) - yet have to see whether they
wanna add it to their spec documents ...

BTW: if you feel, sometings not good w/ the current spec, please raise
your voice now.

> I think it's better to use u8 ot uint8_t here.Git grep told me the
> former is more popular under Documentation/.

thx, I'll fix that

>> +- for version field currently only value 1 supported.
>> +- the line names block holds a stream of zero-terminated strings,
>> +  holding the individual line names.
> 
> I'm not sure but does this mean we don't have a fixed length of config
> space? Need to check whether it can bring any trouble to
> migration(compatibility).

Yes, it depends on how many gpio lines are present and how much space
their names take up.

A fixed size would either put unpleasent limits on the max number of
lines or waste a lot space when only few lines present.

Not that virtio-gpio is also meant for small embedded workloads running
under some hypervisor.

>> +- unspecified fields are reserved for future use and should be zero.
>> +
>> +------------------------
>> +Virtqueues and messages:
>> +------------------------
>> +
>> +- Queue #0: transmission from host to guest
>> +- Queue #1: transmission from guest to host
> 
> 
> Virtio became more a popular in the area without virtualization. So I
> think it's better to use "device/driver" instead of "host/guest" here.

Good point. But I'd prefer "cpu" instead of "driver" in that case.

> Not a native speaker but event sounds like something driver read from
> device. Looking at the below lists, most of them except for
> VIRTIO_GPIO_EV_HOST_LEVEL looks more like a command.

okay, shall I name it "message" ?

> Another question is, what's the benefit of unifying the message format
> of the two queues. E.g VIRTIO_GPIO_EV_HOST_LEVEL can only works fro rxq.

Simplicity. Those fields that aren't really relevant (eg. replies also
carry the line id), can just be ignored.

> Not familiar with GPIO but I wonder the value of a standalone
> VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT/OUTPUT. Can we simply imply them in
> SET/GET_VALUE?

Would introduce more complexity. Somewhere I'd have to fit in some extra
bit for differenciating between line state and line direction. The
direction tells whether the line currently acts as input or output. The
"value" (hmm, maybe I should rethink terminology here) is the current
line level (high/low or active/inactive).

>> +----------------------
>> +Data flow:
>> +----------------------
>> +
>> +- all operations, except ``VIRTIO_GPIO_EV_HOST_LEVEL``, are
>> guest-initiated
>> +- host replies ``VIRTIO_GPIO_EV_HOST_LEVEL`` OR'ed to the ``type`` field
>> +- ``VIRTIO_GPIO_EV_HOST_LEVEL`` is only sent asynchronically from
>> host to guest
>> +- in replies, a negative ``value`` field denotes an unix-style errno
>> code
> 
> 
> Virtio is in a different scope, so we need to define the error code on
> our own.
> 
> E.g for virtio-net we define:
> 
> 
> #define VIRTIO_NET_OK     0
> #define VIRTIO_NET_ERR    1

hmm, so I'd need to define all the error codes that possibly could happen ?

>>   +config GPIO_VIRTIO
>> +    tristate "VirtIO GPIO support"
>> +    depends on VIRTIO
> 
> 
> Let's use select, since there's no prompt for VIRTIO and it doesn't have
> any dependencies.

Ok. I just was under the impression that subsystems and busses should
not be select'ed, but depends on (eg. some time ago tried that w/ gpio
subsys and failed).

>> +    help
>> +      Say Y here to enable guest support for virtio-based GPIOs.
>> +
>> +      These virtual GPIOs can be routed to real GPIOs or attached to
>> +      simulators on the host (qemu).
> 
> 
> It's better to avoid talking host and qemu here for new virtio devices.

Ok, dropped that line.

>> +static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
>> +                int pin, int value, struct virtio_gpio_event *ev)
>> +{
>> +    struct scatterlist sg[1];
>> +    int ret;
>> +    unsigned long flags;
>> +
>> +    WARN_ON(!ev);
>> +
>> +    ev->type = type;
>> +    ev->pin = pin;
>> +    ev->value = value;
>> +
>> +    sg_init_table(sg, 1);
>> +    sg_set_buf(&sg[0], ev, sizeof(struct virtio_gpio_event));
>> +
>> +    spin_lock_irqsave(&priv->vq_lock, flags);
>> +    ret = virtqueue_add_outbuf(priv->vq_tx, sg, ARRAY_SIZE(sg),
>> +                   priv, GFP_KERNEL);
>> +    if (ret < 0) {
>> +        dev_err(&priv->vdev->dev,
>> +            "virtqueue_add_outbuf() failed: %d\n", ret);
>> +        goto out;
> 
> 
> So except for the error log, the failure is silently ignored by the
> caller. Is this intended?

ups, I've forgotten the error handling in the caller. fixed in v3.

>> +static int virtio_gpio_req(struct virtio_gpio_priv *priv, int type,
>> +               int pin, int value)
>> +{
>> +    struct virtio_gpio_event *ev
>> +        = kzalloc(&priv->vdev->dev, sizeof(struct virtio_gpio_event),
>> +              GFP_KERNEL);
>> +
>> +    if (!ev)
>> +        return -ENOMEM;
>> +
>> +    clear_event(priv, type);
>> +    virtio_gpio_xmit(priv, type, pin, value, ev);
>> +    wait_event_interruptible(priv->waitq, check_event(priv, type));
> 
> 
> If I read the code correctly, this expects there will be at most a
> single type of event that can be processed at the same time. E.g can
> upper layer want to read from different lines in parallel? If yes, we
> need to deal with that.

@Linus @Bartosz: can that happen or does gpio subsys already serialize
requests ?

Initially, I tried to protect it by spinlock (so, only one request may
run at a time, other calls just wait until the first is finished), but
it crashed when gpio cdev registration calls into the driver (fetches
the status) while still in bootup.

Don't recall the exact error anymore, but something like an
inconsistency in the spinlock calls.

Did I just use the wrong type of lock ?

>> +static void virtio_gpio_data_rx(struct virtqueue *vq)
>> +{
>> +    struct virtio_gpio_priv *priv = vq->vdev->priv;
>> +    void *data;
>> +    unsigned int len;
>> +    struct virtio_gpio_event *ev;
>> +
>> +    data = virtqueue_get_buf(priv->vq_rx, &len);
>> +    if (!data || !len) {
>> +        dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
>> +        return;
>> +    }
>> +
>> +    ev = data;
>> +    WARN_ON(data != &priv->rcv_buf);
>> +
>> +    memcpy(&priv->last, &priv->rcv_buf, sizeof(struct
>> virtio_gpio_event));
>> +
>> +    switch (ev->type) {
>> +    case VIRTIO_GPIO_EV_HOST_LEVEL:
>> +        virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
>> +        break;
>> +    default:
>> +        wakeup_event(priv, ev->type & ~VIRTIO_GPIO_EV_REPLY);
> 
> 
> This looks suspicious, it looks to me what is done here is, consider we
> want to do VIRTIO_GPIO_EV_GUEST_SET_VALUE
> 
> 1) put the event in txq, wait
> 2) the result is returned from rxq, wakeup
> 
> It looks to me this is racy since the device should be able to process a
> batch of descriptors and there's no guarantee that the descriptor is
> processed in order from the virtio level.

Not sure whether we're on the same page, but:

VIRTIO_GPIO_EV_HOST_LEVEL is kinda interrupt - it tells cpu when the
input has changed level. We can receive this async event, it shouldn't
matter whether somebody else (another thread) is doing a regular call,
thus waiting for reply at the same time. The reply will be next in
queue.

What could go wrong here ?


> I wonder why not introduce two virtqueues:
> 
> 1) command vq
> 2) event vq
> 
> All commands were sent via command vq and then device can write back to
> the command buffer as other virtio device did. Then there's no worries
> of batching or out of order completion.

I've been under the impression that queues only work in only one
direction. (at least that's what my web research was telling).

Could you please give an example how bi-directional transmission within
the same queue could look like ?

>> +        break;
>> +    }
>> +    virtio_gpio_prepare_inbuf(priv);
> 
> 
> This assumes at most one event could be generated, is this how GPIO
> device expect to behave? I think level could change several times.

Should I add more buffers ?

Maybe add one new buffer per request and one new per received async
signal ?

>> +static int virtio_gpio_probe(struct virtio_device *vdev)
>> +{
>> +    struct virtio_gpio_priv *priv;
>> +    struct virtio_gpio_config cf = {};
>> +    char *name_buffer;
>> +    const char **gpio_names = NULL;
>> +    struct device *dev = &vdev->dev;
>> +
>> +    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
> 
> 
> Is devres guaranteed to be enabled here?

How should it not ? Could virtio probing so early that even devm
isn't working yet ?


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
