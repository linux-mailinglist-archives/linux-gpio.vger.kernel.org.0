Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6A8B2C65
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 19:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfINR0F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Sep 2019 13:26:05 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38419 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbfINR0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Sep 2019 13:26:05 -0400
Received: by mail-oi1-f194.google.com with SMTP id 7so5203521oip.5
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2019 10:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEU3Vq66btO8h2McFVIKj0tMUw48c9orqQSFYLNd9xs=;
        b=uyP7JgLJbfgbS/le3OMX+P7UhfZu8a1VCacW8LH8gP3q3S1NGpnfPARIFu718sIU6b
         wfQ1iOdUr0UA339aEZxtoFXKdFMMlO8hp9cbKgA45ID5I1QLTbuFsM5BEgZ6LKKRNFee
         ZYJvFULQ/LpVMj0EKjYBluGsCUMSq80yx9gZDXHCV1WUyHwFU0bVyiYU6t0+2p5jrYLZ
         Jw5hYZUhl/DNyHn+nu06L46uROmyQnd/lCTemND9ZZcNdXq8U21Q0IUjwzmn0hKriuVQ
         /6zQQzE9m4vYips0OnN/6celpDSKa8mB6mnOgTVlLIqNKFTKTTsmgiYekS1MR0B/cbXO
         2ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEU3Vq66btO8h2McFVIKj0tMUw48c9orqQSFYLNd9xs=;
        b=dpfmKxLMsTHFoygcT6hrYM68igwAj9yRsSINGlqwu9BJKFRtjrc2XSEfuAuURJU/XU
         botEpqCMI0q//iAlK5gS9DinPo3jTqtErmh43xN7AtrXqn6Up6iMEFNvW1n1MlaHK2Pv
         vBK810QJNJx4RXXln5tQtZpGgnYgE4W2x31AaRxhHGIOmglsfRMK4kZ0bhhFJ2ibMKqV
         4hoqTSm2OCwgT4DyXAF5bhhJh0i1cXYuJNQ73xJYq0QB7sQwI6tVtsD18Ef9TRQEVhi3
         iXAKZrURboY1XoZbcE9VajZi73NiHQFssNEUNct2uJKs4GdtyahuQkNv0HhWHON+AP0G
         ZCtg==
X-Gm-Message-State: APjAAAUTSNY+dY27dFzISbOrmKHSEqeCKVl4zQ8Vg4+XzevBmwktS8Wf
        /u/kkJKFWfolLNYQPCcj7G98UJUmhkkJwG71lY8=
X-Google-Smtp-Source: APXvYqzK0H5zUEdOzFIVK0V/x5t+2bTHmhGy3LA9aWyubA2MqZwc0kNEBhr/iQI79VOk1dnfCQ/Ksfi3qexx6c788bc=
X-Received: by 2002:aca:3ad6:: with SMTP id h205mr6489381oia.129.1568481963863;
 Sat, 14 Sep 2019 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net> <CACRpkdY=Jema8LmeF_k47gQsdxTHPi5sVCYM3ihe47=bw6K4cQ@mail.gmail.com>
In-Reply-To: <CACRpkdY=Jema8LmeF_k47gQsdxTHPi5sVCYM3ihe47=bw6K4cQ@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 14 Sep 2019 19:25:52 +0200
Message-ID: <CAFBinCDom6OHuUxVxQxLNX+ykgSaNEEZnqw03-NUvvxAVvUN9A@mail.gmail.com>
Subject: Re: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Otto Meier <gf435@gmx.net>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Sep 12, 2019 at 11:21 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 10, 2019 at 5:01 PM Otto Meier <gf435@gmx.net> wrote:
>
> > Hi i tried to use the uart_C of the the odroid-c2.
> >
> > I enabled it in the dts file. During boot it crashed when the
> > the sdcard slot is addressed.
> >
> > After long search in the net i found this:
> >
> > https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856
> >
> > After changing the pin definitions accordingly erverything works.
> > Uart_c is functioning and sdcard ist working.
> >
> >
> > Fixes: 6db0f3a8a04e46 ("pinctrl: amlogic: gxbb: add more UART pins")
> > Signed-off-by: Otto Meiergf435@gmx.net
>
> Looks like a simple fix to me, Martin could you take a look?
this looks fine to me based on the description on the Odroid forums so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin
