Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35FE322C34
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 08:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730782AbfETGiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 02:38:25 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38536 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbfETGiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 02:38:25 -0400
Received: by mail-oi1-f194.google.com with SMTP id u199so9146833oie.5
        for <linux-gpio@vger.kernel.org>; Sun, 19 May 2019 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q1Q7NaE1SNVz9j7JkOrG6/jqppkGsz4XxAF112U1iNM=;
        b=rcxHOPQpxNRAqPa2wVMvCuoMIzeQx5YOyE98+xrFDZFRzqFh2OtU1P8nE9RQMEuPjS
         BlSSQgxSv142zLWXFYCHdLXqsl8O+smaaGoSwCY6Wv6tBcQbXUKFEP+tk8/4ZgFXAUTX
         1bq/ZY2Q/0xaPfu5gON7upqvDICI2g/YoutZ2zHpaWZ+zU1R9WMvVOsug3yacyUVClpe
         LQYk34DOWUYp05QrE5Q83j2mKfjP0oCQ1Ble5x4AwL4r4eGEduAZCj1IavUX/2Fae8PD
         xxCvoTMx11XLqZ3QoRtYbfraElmdZv9KwieHwV9oR0c9KOgVnFo7NFgDrAHudHbl1+UC
         dhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q1Q7NaE1SNVz9j7JkOrG6/jqppkGsz4XxAF112U1iNM=;
        b=G8S3A6CCY5+z91HW5Uni2CJzOuXA2ULNCx71+5JijpuRprzaU1YIyRoblZShjgppUU
         Iy4iwLG8YGsvkHEzDvAW4fWUnxEjWsNcMtCrVJqUaYRnpPRuGizGxRDaIjYeligrnsRF
         7Z+szE8B2PWIfs49LjLwPISrkkphT0VC86DVpfyVNcFtvg1b2MAvmBqPcmfR6B+ApYNt
         3rPztHUxT1T+ojQ96fYsqRL71h6oksaSWG802q6WYY7sCzWC68Eas4JjtFfoR6vT+f2K
         70hEVXxqp1qUCC/3QEaE0kqVXMAzpFydxm30sth0K3TytQVyOx+XZpjuRJHnqM5R5NuX
         1srA==
X-Gm-Message-State: APjAAAVR0zBdIdF4oP+ClKfY1e+rlhaoueuycxyzsA7QXsUPbpvzITBy
        Nvnu4R0+WmqycDLfJ+Al6dEbMkvE241LvvC2eF46qw==
X-Google-Smtp-Source: APXvYqyo2SoeB9LEfdB6cko7EuhDzVp18CnoBEkAQp4Bn0DYgXqZu+AKbKmNMTPi6kGu2m6hsSb/B5HOfvutTmjkIV4=
X-Received: by 2002:aca:aa48:: with SMTP id t69mr8780600oie.114.1558334304624;
 Sun, 19 May 2019 23:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190516182237.5315-1-jeff.dagenais@gmail.com>
 <CAMpxmJVUBgv5BXLwDnZt7Sr6ym1qB64KiAyipvArLsy5hEPEYA@mail.gmail.com> <B06C8F4B-DED0-4222-9260-80A2FC053132@gmail.com>
In-Reply-To: <B06C8F4B-DED0-4222-9260-80A2FC053132@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 20 May 2019 08:38:13 +0200
Message-ID: <CAMpxmJXhsxJzpw=RNUqaAMWLm-aUoV2wM4-zFW9urnM9fgU4Dw@mail.gmail.com>
Subject: Re: [PATCH] gpio: zynq: add a to_irq implementation
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 17 maj 2019 o 17:55 Jean-Francois Dagenais
<jeff.dagenais@gmail.com> napisa=C5=82(a):
>
> Hi Bart,
> Thanks for your answer. See below.
>
> > On May 17, 2019, at 03:36, Bartosz Golaszewski <bgolaszewski@baylibre.c=
om> wrote:
> >
> > the default implementation for this function is already assigned
> > inside the call to gpiochip_irqchip_add() and it does the same thing
> > internally (looks up the mapping from the domain). If there's a
> > problem with this driver then the culprit lies somewhere else.
>
> Indeed. I totally missed that. So yeah, disregard my patch.
>
> But then my problem still remains...
>
> The root cause of the "edge" attribute missing is that the exported pins =
have
> been exported through my own version of gpio-hog-auto-sysfs-exported from=
 DTS
> ("linux,gpio-export") patch :-/
> Inception came from: https://www.spinics.net/lists/devicetree/msg08604.ht=
ml
>
> So under my gpio controller node:
>         boardid_0 {
>                 gpio-hog;
>                 linux,gpio-export;
>                 gpios =3D <33 GPIO_ACTIVE_HIGH>;
>                 input;
>                 line-name =3D "boardid_0";
>         };
>
> makes /sys/class/gpio/boardid_0 appear automatically. The DTS is a natura=
l fit
> for such information in my opinion. No init script is required so it just=
 works
> in all images I make (initrd or real rootfs) without extra dependencies. =
The
> cost is about 15 lines of code in the kernel.
>
> I modified of_gpiochip_add to flag "FLAG_AUTO_EXPORT" each linux,gpio-exp=
ort
> marked hogged pins.
>
> Then in gpiochip_add_data, which runs after of_gpiochip_add, I call my
> gpiochip_auto_export to scan pins for "FLAG_AUTO_EXPORT" and export them.
>
> The problem is that when all this occurs from zynq_gpio_probe/gpiochip_ad=
d_data,
> gpiochip_irqchip_add has not been called yet, so to_irq is still NULL.
>
> Perhaps I should defer my auto-export operation to another point (like at=
 the
> end of zynq_gpio_probe? But then I have to do the same for another i2c
> io-expander chip we have that also exports pins. Or a tasklet...? (yikes.=
 no.)
>
> Any thoughts?
>

Yes! Don't use sysfs and especially don't add your own buggy
interfaces? Is there any reason you can't use libgpiod and the
character device? What does your own class provide that none of the
upstream interfaces do?

Bart

> If I can make it work correctly in gpiolib, any point in submitting a pat=
ch?
>
> Cheers!
>
> P.S. Here's my current workaround after your comeback:
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 694d6884e451..ec8ca101041f 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -364,8 +364,6 @@ static umode_t gpio_is_visible(struct kobject *kobj, =
struct attribute *attr,
>                 if (!show_direction)
>                         mode =3D 0;
>         } else if (attr =3D=3D &dev_attr_edge.attr) {
> -               if (gpiod_to_irq(desc) < 0)
> -                       mode =3D 0;
>                 if (!show_direction && test_bit(FLAG_IS_OUT, &desc->flags=
))
>                         mode =3D 0;
>         }
> --
> 2.11.0
>
