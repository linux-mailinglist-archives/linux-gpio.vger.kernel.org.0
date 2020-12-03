Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FAA2CDE62
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 20:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgLCTCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 14:02:52 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:54639 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgLCTCv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 14:02:51 -0500
Received: from [192.168.1.155] ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MEFnP-1kuU4Y44DF-00ACDA; Thu, 03 Dec 2020 20:00:08 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
Date:   Thu, 3 Dec 2020 20:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p5LN3n+bAttBQwUtEyPqApfX3eqFc3HvKIiC9q0shuFj92psIHG
 uB2xlIOGJ48cWY+oLFweeF4VBn7qrnxXccMsvCheusJ8MG4wyjKDb9knNEJfYmC9d9tntu8
 zsrzPlagFHQZDJ3Wwxgtnz0HjY2Jj9FQG8WeiwU+oTsedrGlgGXo2CWjtsyUA4LdEX6OMVD
 ATFlIlkzgtH6hFOWHxrLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pMRUBlN/d0A=:UrFqkV9Rj8Ug6uAghSgKi4
 bW3MF54yliURM09+0k+ZtgoddowzQqwEwX6DmRX42wHDMAIvaAjkkha5jvMmC0J2LLsuf1W/T
 Y/A041uQLRvO0UcKQoHOSxSANx+c9O0PkaG8Fo3M5aWH7aGdGj/ZmWWcQpmHNPgMLLUdbExfu
 oPY8Jn6x4rI7NsIsFQBNMWZBiT5MvVYfBT6i++DkxLrR3je1TkjXHy+gVt0Xr+bDiOS5YR0F0
 1xSXyBKg/CHVzZAZ4t5J5F383kHSORic/lQEl4adKgb4jbKdOXUwADMKFxjrJmVgc2nB9nLX+
 +6BdKrc9GgvxWNUESLiIJhwYRK99sEDOL2Hv0L1lf0I+Mq3XTq4tDV3YT1pWdYkH6bCXre0t+
 mEoo9Zzvg6yFe36A3aLkMSf8qrM0AR+JGQZr9Y8Ku5pyU18hUXXg/m3Gd2Ocr
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02.12.20 15:15, Bartosz Golaszewski wrote:

Hi,

<snip>

> With a third entry (after gpio-mockup and gpio-aggregator) I think
> these deserve a separate submenu for "virtual GPIO drivers" or
> something like that.

just sent a separate patch.

> 
> Please keep headers ordered alphabetically.

fixed in v2.

> Don't use tabs here - not only doesn't it improve readability but
> you're not even consistent.

fixed in v2.

> 
>> +
>> +static void virtio_gpio_prepare_inbuf(struct virtio_gpio_priv *priv)
>> +{
>> +       struct scatterlist rcv_sg;
>> +
>> +       sg_init_one(&rcv_sg, &priv->rcv_buf, sizeof(priv->rcv_buf));
>> +       virtqueue_add_inbuf(priv->vq_rx, &rcv_sg, 1, &priv->rcv_buf,
>> +                           GFP_KERNEL);
>> +       virtqueue_kick(priv->vq_rx);
>> +}
>> +
>> +static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
>> +                           int pin, int value, struct virtio_gpio_event *ev)
>> +{
>> +       struct scatterlist sg[1];
>> +       int ret;
>> +       unsigned long flags;
>> +
>> +       WARN_ON(!ev);
>> +
>> +       ev->type = type;
>> +       ev->pin = pin;
>> +       ev->value = value;
>> +
>> +       sg_init_table(sg, 1);
>> +       sg_set_buf(&sg[0], ev, sizeof(struct virtio_gpio_event));
>> +
>> +       spin_lock_irqsave(&priv->vq_lock, flags);
>> +       ret = virtqueue_add_outbuf(priv->vq_tx, sg, ARRAY_SIZE(sg),
>> +                                  priv, GFP_KERNEL);
>> +       if (ret < 0) {
>> +               dev_err(&priv->vdev->dev,
>> +                       "virtqueue_add_outbuf() failed: %d\n", ret);
>> +               goto out;
>> +       }
>> +       virtqueue_kick(priv->vq_tx);
>> +
>> +out:
>> +       spin_unlock_irqrestore(&priv->vq_lock, flags);
>> +       return 0;
>> +}
>> +
>> +static inline void wakeup_event(struct virtio_gpio_priv *priv, int id)
>> +{
>> +       set_bit(id, &priv->reply_wait);
>> +}
>> +
>> +static inline int check_event(struct virtio_gpio_priv *priv, int id)
>> +{
>> +       return test_bit(id, &priv->reply_wait);
>> +}
>> +
>> +static inline void clear_event(struct virtio_gpio_priv *priv, int id)
>> +{
>> +       clear_bit(id, &priv->reply_wait);
>> +}
>> +
>> +static int virtio_gpio_req(struct virtio_gpio_priv *priv, int type,
>> +                          int pin, int value)
>> +{
>> +       struct virtio_gpio_event *ev
>> +               = devm_kzalloc(&priv->vdev->dev,
>> +                              sizeof(struct virtio_gpio_event), GFP_KERNEL);
> 
> Just move the allocation to a separate line because this is super ugly.

done.

> 
>> +
>> +       if (!ev)
>> +               return -ENOMEM;
>> +
>> +       clear_event(priv, type);
>> +       virtio_gpio_xmit(priv, type, pin, value, ev);
>> +       wait_event_interruptible(priv->waitq, check_event(priv, type));
>> +
>> +       devm_kfree(&priv->vdev->dev, ev);
> 
> In fact you don't need the managed variant if you're freeing it in the
> same function. Managed resources should live as long as a device is
> attached to a driver.

thx, this was a left from originally global buffer.

>> +static void virtio_gpio_data_rx(struct virtqueue *vq)
>> +{
>> +       struct virtio_gpio_priv *priv = vq->vdev->priv;
>> +       void *data;
>> +       unsigned int len;
>> +       struct virtio_gpio_event *ev;
>> +
>> +       data = virtqueue_get_buf(priv->vq_rx, &len);
>> +       if (!data || !len) {
>> +               dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
>> +               return;
>> +       }
>> +
>> +       ev = data;
>> +       WARN_ON(data != &priv->rcv_buf);
> 
> Is it fine to proceed if this is the case?

Good question :o

Actually, it should never happen - if it does, we might have a bug in
either this driver or even virtio subsystem. But still it *should*
return a valid buffer (unless virtio is broken)

>> +
>> +       memcpy(&priv->last, &priv->rcv_buf, sizeof(struct virtio_gpio_event));
>> +
>> +       switch (ev->type) {
>> +       case VIRTIO_GPIO_EV_HOST_LEVEL:
>> +               virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
>> +       break;
> 
> Break should be one tab farther.

fixed in v2

>> +       default:
>> +               wakeup_event(priv, ev->type & ~VIRTIO_GPIO_EV_REPLY);
>> +       break;
>> +       }
>> +       virtio_gpio_prepare_inbuf(priv);
>> +       wake_up_all(&priv->waitq);
>> +}
>> +
>> +static int virtio_gpio_alloc_vq(struct virtio_gpio_priv *priv)
>> +{
>> +       struct virtqueue *vqs[2];
>> +       vq_callback_t *cbs[] = {
>> +               NULL,
>> +               virtio_gpio_data_rx,
>> +       };
>> +       static const char * const names[] = { "in", "out", };
>> +       int ret;
>> +
>> +       ret = virtio_find_vqs(priv->vdev, 2, vqs, cbs, names, NULL);
>> +       if (ret) {
>> +               dev_err(&priv->vdev->dev, "failed to alloc vqs: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       priv->vq_rx = vqs[0];
>> +       priv->vq_tx = vqs[1];
>> +
>> +       virtio_gpio_prepare_inbuf(priv);
>> +
>> +       virtio_config_enable(priv->vdev);
>> +       virtqueue_enable_cb(priv->vq_rx);
>> +       virtio_device_ready(priv->vdev);
>> +
>> +       return 0;
>> +}
>> +
>> +static int virtio_gpio_probe(struct virtio_device *vdev)
>> +{
>> +       struct virtio_gpio_priv *priv;
>> +       struct virtio_gpio_config cf = {};
>> +       char *name_buffer;
>> +       const char **gpio_names = NULL;
>> +       struct device *dev = &vdev->dev;
>> +
>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       priv->name = devm_kzalloc(dev, sizeof(cf.name)+1, GFP_KERNEL);
> 
> This can fail.

ups!

>> +       spin_lock_init(&priv->vq_lock);
>> +       spin_lock_init(&priv->op_lock);
>> +
>> +       virtio_cread(vdev, struct virtio_gpio_config, version, &cf.version);
>> +       virtio_cread(vdev, struct virtio_gpio_config, num_gpios,
>> +                    &cf.num_gpios);
>> +       virtio_cread(vdev, struct virtio_gpio_config, names_size,
>> +                    &cf.names_size);
>> +       virtio_cread_bytes(vdev, offsetof(struct virtio_gpio_config, name),
>> +                          priv->name, sizeof(cf.name));
>> +
>> +       if (cf.version != 1) {
>> +               dev_err(dev, "unsupported interface version %d\n", cf.version);
>> +               return -EINVAL;
>> +       }
>> +
>> +       priv->num_gpios = cf.num_gpios;
>> +
>> +       if (cf.names_size) {
>> +               char *bufwalk;
>> +               int idx = 0;
>> +
>> +               name_buffer = devm_kzalloc(&vdev->dev, cf.names_size,
>> +                                          GFP_KERNEL)+1;
>> +               virtio_cread_bytes(vdev, sizeof(struct virtio_gpio_config),
>> +                                  name_buffer, cf.names_size);
>> +               name_buffer[cf.names_size] = 0;
>> +
>> +               gpio_names = devm_kzalloc(dev,
>> +                                         sizeof(char *) * priv->num_gpios,
>> +                                         GFP_KERNEL);
> 
> Use devm_kcalloc() for arrays.

ok.

> 
>> +               bufwalk = name_buffer;
>> +
>> +               while (idx < priv->num_gpios &&
>> +                      bufwalk < (name_buffer+cf.names_size)) {
>> +                       gpio_names[idx] = (strlen(bufwalk) ? bufwalk : NULL);
>> +                       bufwalk += strlen(bufwalk)+1;
>> +                       idx++;
> 
> 
> Something's wrong with indentation here.

i dont think so: the "bufwalk ..." line belongs to the while expression
and is right under the "idx", as it should be. I didn't want to break up
at the "<" operator. shall i do this instead ?

>> +               }
>> +       }
>> +
>> +       priv->gc.owner                  = THIS_MODULE;
>> +       priv->gc.parent                 = dev;
>> +       priv->gc.label                  = (priv->name[0] ? priv->name
>> +                                                        : dev_name(dev));
>> +       priv->gc.ngpio                  = priv->num_gpios;
>> +       priv->gc.names                  = gpio_names;
>> +       priv->gc.base                   = -1;
>> +       priv->gc.request                = virtio_gpio_request;
>> +       priv->gc.direction_input        = virtio_gpio_direction_input;
>> +       priv->gc.direction_output       = virtio_gpio_direction_output;
>> +       priv->gc.get_direction          = virtio_gpio_get_direction;
>> +       priv->gc.get                    = virtio_gpio_get;
>> +       priv->gc.set                    = virtio_gpio_set;
>> +
>> +       priv->vdev                      = vdev;
>> +       vdev->priv = priv;
>> +
>> +       priv->irq_base = devm_irq_alloc_descs(dev, -1, 0, priv->num_gpios,
>> +                                             NUMA_NO_NODE);
>> +       if (priv->irq_base < 0) {
>> +               dev_err(&vdev->dev, "failed to alloc irqs\n");
>> +               priv->irq_base = -1;
>> +               return -ENOMEM;
>> +       }
>> +
>> +       init_waitqueue_head(&priv->waitq);
>> +
>> +       priv->reply_wait = 0;
>> +
>> +       virtio_gpio_alloc_vq(priv);
>> +
>> +       return devm_gpiochip_add_data(dev, &priv->gc, priv);
>> +}
> 
> I don't know virtio at all - Michael: could you take a look at the
> code here and see if it looks good to you?
> 
>> +
>> +static void virtio_gpio_remove(struct virtio_device *vdev)
>> +{
>> +}
> 
> Just don't implement it. Or does virtio actually require the remove() callback?

yes, it does, unfortunately -- see: virtio_dev_remove()

I'll propose a patch for virtio for fixing that.


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
