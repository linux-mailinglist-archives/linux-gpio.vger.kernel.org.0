Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D1D119FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 00:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfLJXzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 18:55:09 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46512 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfLJXzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 18:55:06 -0500
Received: by mail-lf1-f65.google.com with SMTP id f15so14366705lfl.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 15:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNrohwDsHeZAs+ReIm2Q7EwJ5Hy4Jj8HAR5cu/mtLgY=;
        b=hAbRMVrsm1W4JYpKwlAZvEdT933tVqy6w6wMCc7wU8/Lzg2mVB1osVcU1cB1VPIwef
         /CJ1Z+GY10xo0IaUThsb3JldrQHfnpRtZ+VnPK7s3az7eI6tLGGac3UF6CMi+x8B/A/1
         8+qpg93GpxCpp1pUX4fIrdIuGw4RKwqJ8QFN70tRaGYx3wAqVnCknrRCklxxZ39x2+Sf
         YDS5h08LVLC1Bz4+lYzG2wPIQ//3LBMqGB4aSpxRJxEGo7cfDj8zA4SPv6LQrdn4zTsA
         VHZQaf+j3+knILNMuVh6kZ5BZX6O6cnqzRPCFIPpaNnTzSJnNse3mOlmdzQONBiyngEE
         dC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNrohwDsHeZAs+ReIm2Q7EwJ5Hy4Jj8HAR5cu/mtLgY=;
        b=VSLrjbZ5PtDQFC6YA3uvB1ZmXeFtfW5eHBhIsz29kmWfEIeaoWTlDH7Vu1Xucw1ARD
         6aj7VYmtHD+IlcdKiX32D7c4EoPQhMMiOgHNNRUhcgoDJKVEqjlcpeWHaMGnM8e2dlZf
         rsf/OzD/tgl/HglgFWxqoql9Ldsn8z9we3TGBOh9EB5/z47Owa/6l3XdoUwuloVYScvV
         vJo85pONBj4hRkA/lIGwASIJEB19ldhZkD4OYpDitlim+8PzV7J6SQQHbTxszBUdTOwd
         GLTHi3Fzh/ehQSNfuQNp7jA/01XUjUKRHiXD6BCfDCwvXr+ccwOd1KxTq/NwVvSVLRpg
         aAGQ==
X-Gm-Message-State: APjAAAXcpWUVEutkJqthW9PTJ9ETTu/rP85ahbxBPj9lZslW6AIyRv90
        5wK74zg5+4h0/R4wYGUGfDaL0J5SWNtA3rt/H3cv+5RHhPI=
X-Google-Smtp-Source: APXvYqwx5LuKLDN3XiVpf1hl60Rh8HBmOKd1FntsXqq8U8VXeEmmPKwaFk+urFzUVIAbBMMQifWAms3QKp/FaSKlGkM=
X-Received: by 2002:a19:c648:: with SMTP id w69mr325542lff.44.1576022103954;
 Tue, 10 Dec 2019 15:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20191120133409.9217-1-peter.ujfalusi@ti.com> <20191120133409.9217-2-peter.ujfalusi@ti.com>
 <CACRpkdbXX3=1EGpGRf6NgwUfY2Q0AKbGM8gJvVpY+BRAo5MQvQ@mail.gmail.com>
 <d423bc53-31df-b1b4-37da-932b7208a29e@ti.com> <CACRpkdafEdsN6i16SA175wE4J_4+EhS5Uw4Qsg=cZ=EuDYHmgg@mail.gmail.com>
 <20191203235113.GA12929@bogus>
In-Reply-To: <20191203235113.GA12929@bogus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 00:54:52 +0100
Message-ID: <CACRpkdZOn8vGjxCUBd9c-SQSkmwxpS+bbRk7TiOWJcpTz9BsBQ@mail.gmail.com>
Subject: Re: [RFC 1/2] dt-bindings: gpio: Document shared GPIO line usage
To:     Rob Herring <robh@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 12:51 AM Rob Herring <robh@kernel.org> wrote:
> On Thu, Nov 28, 2019 at 11:06:35AM +0100, Linus Walleij wrote:

> > The ambition to use refcounted GPIOs to solve this
> > usecase is probably wrong, I would say try to go for a
> > GPIO-based reset controller instead.
>
> Yes, but I think we can have that AND use the existing binding.
>
> > The fact that some Linux drivers are already using explicit
> > GPIO's for their reset handling is maybe unfortunate,
> > they will simply have to grow code to deal with a reset
> > alternatively to GPIO, like first try to grab a reset
> > handle and if that doesn't fall back to use a GPIO.
>
> I think this could just be all handled within the reset subsystem given
> that we've been consistent in using 'reset-gpios' (GPIO regulators are
> similar, but we never had such consistency with GPIO names for
> regulators). We can implement a reset driver for the 'reset-gpios'
> property that deals with the sharing. Drivers to DT nodes doesn't have
> to be 1:1. It's convenient when they are, but that's encoding the OS's
> (current) driver structure into DT.

This seems like a good approach if it can be made to work.
reset-gpios should have the right polarity flags (else drivers
and/or device trees need to be fixed...) so the driver can simply
scan over them and try to build a consensus on how to assert
or deassert a shared reset-gpios line.

It is also a natural placeholder for the connection to device
core that will inevitably need to happen the day the device
hierarchy needs to be torn up/down for a reset on some
random device.

Peter, will you have a go at it?

Yours,
Linus Walleij
