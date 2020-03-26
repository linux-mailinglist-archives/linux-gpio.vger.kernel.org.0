Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABC619498D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 21:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCZUu6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Mar 2020 16:50:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33078 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCZUu6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2020 16:50:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id f20so7994075ljm.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2020 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7rAItXMRvBZm31ysm2z8WUbF9TsTJLp451lXgVpORtI=;
        b=jSpc3zgtOsuGZiH4Vx5+f4B1qjsyI9zsctUsWSP69CzTAJxMCxojEJdHl61huawuZT
         7z16LNUHLvoN0FK3avAUgWI5PRQafFJXvfOXbnfDeTTBt7YxG9nDBsLZ0Je97PwUzZFe
         q+UUd4mACIn/XJ88T4iqtJwWmwjg/T5/gjhk1Lp52aD0BUtRA5rlgNbU9JhhjjVwGsgR
         uTZDlwx1b5GTRDOXGcGvvqYISqZkALfdd5C0FVARQQ2mUksAQjgvQqLLNwemVXt5S5Jp
         9JAjY/XpcPOKVllugYZ1I+t/N02KizInAewdW4zyZ92DhuaO/5fYhGjJsPUTJYIGtg0n
         UxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7rAItXMRvBZm31ysm2z8WUbF9TsTJLp451lXgVpORtI=;
        b=reaeje40FEx88y5hHu+ae1QAK0VBhQMuFpFmH/3MPmTw1kGlA1zM9zpplT3esth4DD
         CVF8zK2cZHmHl0L/AM5b8IOYzNTJ9fduFkAdSI4xdlJkL/G9nPO7d9BzgVNBNH8v4i0x
         R//wlCKSfLeKYa+XHZ96hMiwH5G3fvbWjly3fA3NJw0FzflhAcWY4qxHn4XKKxMR2JD+
         YU+PfSqNLlKY6AbnGf5Oa5GH67mXmRRGX8qbs4gERFofHhKxE9fIRu1VeSaN06DDkAMi
         MmbM/+iGb5kJh1NyFWWGZ9Bq5Nuq1OGz1tXqSFLD4ASfdsjeuABWU+w9qz0vVPAdoDes
         QJ5w==
X-Gm-Message-State: AGi0PuZ8lC3wRDvxS6GdEZSfAoMfSXikaBpEsF8IqDBW+LImOEZiYH4e
        KaRUyJ96LVtlHvZjq+oqzGOj65dZzlXn0JmUXUDfMg==
X-Google-Smtp-Source: APiQypJH7u6LrRAz5mVgf+hvQ1hGv7QlLR1Yc0jVBD8iyZzbx/yS97MV+WHcuRdT4e1rYMJHdWvPTPjYzmoRtZWIu3E=
X-Received: by 2002:a2e:9c48:: with SMTP id t8mr496874ljj.168.1585255856054;
 Thu, 26 Mar 2020 13:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com> <CAMRc=Mf2Mx+rB7du8D66WP=Js0wuK8x44aT9H2q6JhLJvrOcVQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mf2Mx+rB7du8D66WP=Js0wuK8x44aT9H2q6JhLJvrOcVQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 21:50:44 +0100
Message-ID: <CACRpkdaPwfpfDJ2CjGCVFbMvXaSnCXaisvb2N-edeZO0Tbkssw@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 3:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> czw., 12 mar 2020 o 11:35 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> In this case I was thinking about a situation where we pass a
> requested descriptor to some other framework (nvmem in this case)
> which internally doesn't know anything about who manages this resource
> externally. Now we can of course simply not do anything about it and
> expect the user (who passed us the descriptor) to handle the resources
> correctly. But what happens if the user releases the descriptor not on
> driver detach but somewhere else for whatever reason while nvmem
> doesn't know about it? It may try to use the descriptor which will now
> be invalid. Reference counting in this case would help IMHO.

I'm so confused because I keep believing it is reference counted
elsewhere.

struct gpio_desc *d always comes from the corresponding
struct gpio_device *descs array. This:

struct gpio_device {
        int                     id;
        struct device           dev;
(...)
        struct gpio_desc        *descs;
(...)

This array is allocated in gpiochip_add_data_with_key() like this:

        gdev->descs =3D kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GFP_KE=
RNEL);

Then it gets free:d in gpiodevice_release():

static void gpiodevice_release(struct device *dev)
{
        struct gpio_device *gdev =3D dev_get_drvdata(dev);
(...)
        kfree(gdev->descs);
        kfree(gdev);
}

This is the .release function for the gdev->dev, the device inside
struct gpio_device,
i.e. the same device that contains the descs in the first place. So it
is just living
and dying with the struct gpio_device.

struct gpio_device does *NOT* die in the devm_* destructor that gets called
when someone has e.g. added a gpiochip using devm_gpiochip_add_data().

I think the above observation is crucial: the lifetime of struct gpio_chip =
and
struct gpio_device are decoupled. When the struct gpio_chip dies, that
just "numbs" all gpio descriptors but they stay around along with the
struct gpio_device that contain them until the last
user is gone.

The struct gpio_device reference counted with the call to get_device(&gdev-=
>dev)
in gpiod_request() which is on the path of gpiod_get_[index]().

If a consumer gets a gpio_desc using any gpiod_get* API this gets
increased and it gets decreased at every gpiod_put() or by the
managed resources.

So should you not rather exploit this fact and just add something
like:

void gpiod_reference(struct gpio_desc *desc)
{
    struct gpio_device *gdev;

    VALIDATE_DESC(desc);
    gdev =3D desc->gdev;
    get_device(&gdev->dev);
}

void gpiod_unreference(struct gpio_desc *desc)
{
    struct gpio_device *gdev;

    VALIDATE_DESC(desc);
    gdev =3D desc->gdev;
    put_device(&gdev->dev);
}

This should make sure the desc and the backing gpio_device
stays around until all references are gone.

NB: We also issue try_module_get() on the module that drives the
GPIO, which will make it impossible to unload that module while it
has active GPIOs. I think maybe the whole logic inside gpiod_request()
is needed to properly add an extra reference to a gpiod else someone
can (theoretically) pull out the module from below.

Yours,
Linus Walleij
