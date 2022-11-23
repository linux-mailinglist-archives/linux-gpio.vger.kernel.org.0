Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E2D636CBB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 23:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbiKWWFr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 17:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiKWWFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 17:05:45 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B450D6587C
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 14:05:43 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3b1ef5dac4fso20773717b3.5
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS/IgqjTF1tmvQxzdv5yarn8h8llKtnDhKBpoO1W7gw=;
        b=H3OfneAQdVLL8lSwU/0mnFsoxLSLxCgfHi/87G5l/gHv+mdyOgH/D9L75dZF4Rx5s2
         ug5cpP6uukXLswroGQ5JbdlnljpOKXpxM7YKbnh+1wZb1Va/GjWGkzHkoKN7f2/5zmsu
         XELF7pGg9Tw3NnC/8sieKyPD1ef8c0McVYnZTTjbbWFgoTz2YmGLmOQ1qPC2/2bdoFBv
         Twy4OxkoUcuNb5nQ7aby8YyaKpTB+7BVb+2qcTmnX8B+aa8a40PdxyYRjEiXgSk1+clD
         5QC2AfBcwZx+kRvk7Ew7IB5nerw2zAq+K2HkSkja0wen5iJUsbh9qXrF39oJUaMFlkFy
         pMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sS/IgqjTF1tmvQxzdv5yarn8h8llKtnDhKBpoO1W7gw=;
        b=Sy7wnPvWFEfVS6nG15WCptZDd3NVFEXbxjfXJF0fYt9MJWfYIFezJLZXJ4qn/lVeJw
         lxStG9+ArUsSLQYsmjuMw0h0O1demX6w4xD430d4qkcsvS/+0gRzpHiOnm/nwuIlM8eQ
         Y8dsH7e7XmUgE/2HBt0cmRmW065KMCG6QBcvX3SNYkhnHf/OVclXD6i3KuiGYNhDWlra
         IqmtdqsJouUE/Bjfyp+ugea6aYR0RHdA5zaJgYzt0dPSvvVNuCuQOT9a/qjWF6R99SFa
         VXUR1+relBk20tjwifBlpGwia1skT3WA+3etGS/G0s3WjF7sTC0rqntwPC7DZr+8qiI4
         QdPA==
X-Gm-Message-State: ANoB5pk8Jrc1O9xWRhN/9zeiJW3X8nROKLBDHeN72ELOSqGhrn/uYwci
        YzCcPQVCcro//8AFCBEyVNRDxxxYQNip6jsIYbaw+g==
X-Google-Smtp-Source: AA0mqf4RP+UuaAyu4KmEHW5zVct6l2qm89R2f7yd/Dqrj/Tw40uxMrmXQ6A3yUE04g5OYl92I5TjytR1SlKBvbAWhTo=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr13216107ywc.380.1669241142870; Wed, 23
 Nov 2022 14:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20221121123803.3786-1-zhuyinbo@loongson.cn> <20221121123803.3786-2-zhuyinbo@loongson.cn>
 <CACRpkda1adiNwbTZHdAyHKny3r5FFMP_XXVGbo1vnCdw9U1gNg@mail.gmail.com> <8a7abd77-9540-efa8-6f67-908530e85399@loongson.cn>
In-Reply-To: <8a7abd77-9540-efa8-6f67-908530e85399@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Nov 2022 23:05:31 +0100
Message-ID: <CACRpkdb=wdydOYCcrpjLSyvfVO--_ezXsFQ46qwfVCiiTd5fNw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: loongson: add gpio driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 23, 2022 at 9:02 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> =E5=9C=A8 2022/11/21 =E4=B8=8B=E5=8D=889:24, Linus Walleij =E5=86=99=E9=
=81=93:

> >> +static int loongson_gpio_request(
> >> +                       struct gpio_chip *chip, unsigned int pin)
> >> +{
> >> +       if (pin >=3D chip->ngpio)
> >> +               return -EINVAL;
> >
> > This is not needed, the gpiolib core already checks this. Drop it.
> I check gpio_request in gpilib, I notice gpio_is_valid is not equal to
> this condition, so I still kept it for byte mode.

This is because descriptors can only be obtained from gpiod_get() and
similar and gpiod_get() falls to gpiod_get_index() which will not
return a valid descriptor from either HW backend. gpiod_get()
will call gpiod_request() for if and only if the descriptor is valid.

The only reason to implement something like this is because of
using the legacy GPIO numberspace which we are getting rid
of so it is irrelevant, the consumers of your driver will only be
using gpio descriptors, will only come in through gpiod_get_index()
and will have desc validity check done before calling gpiod_request().

So drop this.

> > I am bit suspicious that your IRQchip implementation expects consumers
> > to call gpiod_to_irq() first and this is not legal.
>
> okay, I got it, and other driver use gpio interrupt doesn't rely on
> gpiod_to_irq, but can use gpiod_to_irq.

Yes it can be used to look up the irq corresponding to a GPIO
but it is not mandatory to do that.

> The reason is that gpio interrupt wasn't an independent module,  The
> loongson interrupt controller liointc include lots of interrupt was
> route to perpherial, such as i2c/spi .. gpio, so gpio interrupt as
> normal perpherial interrupt, It is unnecessary and redundant to
> implement a gpio irq chip. The liointc controller driver had cover all
> interrupt.

This is fine, and it is common for GPIO drivers to implement
their own IRQchips.

But these drivers can not rely on the .gpio_to_irq() callback
to be called before an IRQ is requested and used.

> in addition,  I don't like to use the dynamically allocated gpio base,
> so I set the gpio base after call bgpio_init.

Don't do that because the GPIO maintainers love the
dynamic base and hate hardcoded bases. Set the base to -1
If you wonder why, read drivers/gpio/TODO.

Yours,
Linus Walleij
