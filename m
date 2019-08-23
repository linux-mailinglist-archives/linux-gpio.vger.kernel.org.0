Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59FF69AB17
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfHWJGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 05:06:45 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40716 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfHWJGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 05:06:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id e27so8166738ljb.7
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RirVGeAmWshc20k+aIdxbjy96L/LAKQpdGUqdy8H3M8=;
        b=dzy6kEVpoFRPBZEgmHX9YDKPQMy3xLNtgmnYLIPD7nVoQlAdCbdFCMX+Q0ThaflF5n
         IjQ7pVwNUj7gg5Ev0yrWBS7tvDyzn8MuRpRCAT9nas1MWZaG8TxoBVfFI0LaWpwWqGfu
         uk/kyfH3sY83gX1HdMblVFi/7K1qUT/HBtJ1FBPHZtCUbwtnwMJAr0PqzH5DQWK7wIx/
         amTRO8BwGcyti/IwNdl4E53p2VQi1DlP3Fe3QQ6ewoUtaYtaHGFR/A5dBmPcgDPqqxtp
         xOwaZ98MUREv4Yy3zq6QGsNg6ntXrs5qPixgZcuBIsGiGhF5aqPzfJMx9EBi2GFlH8MC
         IYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RirVGeAmWshc20k+aIdxbjy96L/LAKQpdGUqdy8H3M8=;
        b=pOkRJLxdOJHgV/4T+4I7wc6SlJcxS5zIWxYbWHHtELRkbP2QEu/xTctKvGmhxXfVon
         T+M3HKpHbT+MUmOHYDhJyrKLtpegUtzyxbYDQ8loDH9yuyw04k0tQelj2/U2IzcGOLbR
         QZFfIp82uvALgrFDLiRM6JRqTNA5Pj8QRChkIfg28It5PNZs628W8uX9GtpwzbnEqbGe
         XVEr1wbfOKVrHQI+kaP0YfKpRHzQVW44FPayGbBEgzaIKZzdylvKD/mOIiYfH489wLG1
         52iC8Vaud5YOng/e/nbA9mB+sUHDVm+z30oU/3Vv1SGOlApUUHGJwTxPt5kAS7GVjUVu
         deGw==
X-Gm-Message-State: APjAAAWVVNOZvrVgQgBVOt5PRU13GkYPmcqmvfdMPydH5RGI27Vs9kUs
        aHxFo7qCMpzadrS5AJRf35VPtpH/b8gNxng6OGmtnQ==
X-Google-Smtp-Source: APXvYqwq3m5s5I9I3qUitPTreCouA9PeMTiUwOQGJNgCbDFhAhEv4O48r1GYAO4Rw517Luxi1mZrXPi4AxdX2fo+Hio=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr2316413lja.180.1566551203719;
 Fri, 23 Aug 2019 02:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190812062729.1892-1-linus.walleij@linaro.org>
 <CACRpkdbBaiVQ+BUNZEYNv6dGZjAbS=eA54dLTQ99Ngvbk7YQ9Q@mail.gmail.com> <a82230ae-4f3a-2600-0bea-85c432c56d05@i2se.com>
In-Reply-To: <a82230ae-4f3a-2600-0bea-85c432c56d05@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 11:06:32 +0200
Message-ID: <CACRpkdY7oHKYg0_8jRaDZJmTgE8oAUyFCCEB9Qq5G5syn6+A6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23, 2019 at 10:07 AM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> On 23.08.19 09:46, Linus Walleij wrote:
> > On Mon, Aug 12, 2019 at 8:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> >> We need to convert all old gpio irqchips to pass the irqchip
> >> setup along when adding the gpio_chip. For more info see
> >> drivers/gpio/TODO.
> >>
> >> For chained irqchips this is a pretty straight-forward
> >> conversion. The BCM2835 has multiple parents so let's
> >> exploit the new facility in the GPIO_IRQCHIP to actually
> >> deal with multiple parents.
> >>
> >> Cc: Simon Arlott <simon@arlott.org>
> >> Cc: Eric Anholt <eric@anholt.net>
> >> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> >> Cc: Thierry Reding <treding@nvidia.com>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > This patch is a bit scary because I haven't tried converting multiple
> > parents before. Any chance one of you RPi people could give it
> > a test run, so you don't have to experience testing it in linux-next?
>
> it's on my TODO list, but i didn't had the time to test it yet.

OK sorry for stressing :(

> Can you give me some test ideas?

Anything that fires IRQ on the pin controller is a good test,
I sometimes just use tools/gpio/gpio-event-mon.c (the
more elaborate version is inside libgpiod) and have some
pushbutton or wire to ground the GPIO line under test.

Yours,
Linus Walleij
