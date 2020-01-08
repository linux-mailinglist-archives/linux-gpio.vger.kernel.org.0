Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB91133DA0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 09:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgAHIuf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 03:50:35 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35620 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgAHIue (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 03:50:34 -0500
Received: by mail-qt1-f195.google.com with SMTP id e12so2194619qto.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RuyvrtEpqEg3SZMC9iuRBrK4FOBTnkn6LgzSVELBZcc=;
        b=RFVTvV8PTXDqHPjd/pyYzeKq+wWHTNH+pwmVTXCihQbcqMny9FjG/q7rZWhIvzubYW
         9CCLmXcWchlsk9vgkYfPvY0VCxhj8DEw6chlak7h/rAGFPDjeRt4pUC0JKWAcAcFt023
         EvudTZ8Xr6fu8EtYU3i4eVcq4LXUPbCsqfVVsa7a/GGKUbJLxUDVeyoYn87k/2nrOmf2
         VGglWbHO2P3MbF/tSdjQ5x/OsYw4W29buSfPMo2hpF6Uk+RTguggyo4Oan5h01dNfYww
         6Ed4XmRAgS46FoJGiTR66t2qUhMmY4FevbYyUkA08f/R6y5e9UwzLplwFkVdy0qeg6XV
         eEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RuyvrtEpqEg3SZMC9iuRBrK4FOBTnkn6LgzSVELBZcc=;
        b=ofFexNYyrodZu9yOcYI9mIp+mO38dVw1ziqRfaAde/bbiJTQNzqR5vUStXnipud4+l
         bNKzqZqZepL0NZ8tm3tBaK6H5vKpCOJP2Ll2Zz0j6WLh2C5kVdZVJoblVEk+XYi3nP3K
         keC1yBXdQ7YKOXZzoxgtMHrW8Od+FD21t8KK9vLUjefPxTA0J/j+8Fml8RfCMlzss3hf
         mwqCeHXMJxxW/1bslEoTu2/zykaccjfgweqr5weXaC4Qvx9Ld0dgrDpWBNzEsCfzEnHE
         za3ncxPYPCmN3gYT7fOZ3yV0/ikTzS3Vq75jmWMqpcBcRB391OaV7Tt5X5cn3R6sraje
         yvJQ==
X-Gm-Message-State: APjAAAVjUfiushqbgAMSagyV9pkLPRScJ1/8LdsvnEHzjuwSXMSkfjUu
        XSJJ9ZE1AL1ueeNxtaArhBDynctd/5Z8AE6QZ4igxA==
X-Google-Smtp-Source: APXvYqwyDL7miZZlJPxdTBsjQx1X5s1fAX3vhLp2JvommGQoEgipIFfXZ632KO70Z529CcZ5JsheJFthnn33JyNul6Y=
X-Received: by 2002:aed:3b6e:: with SMTP id q43mr2524422qte.57.1578473433816;
 Wed, 08 Jan 2020 00:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20200107212432.27587-1-linus.walleij@linaro.org>
In-Reply-To: <20200107212432.27587-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 8 Jan 2020 09:50:23 +0100
Message-ID: <CAMpxmJVrJaXy3rraT2jydMyXbfUTRKXfAKtazkeuQcnxAg396A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Update TODO
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 7 sty 2020 o 22:26 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> Drop the completed item: hierarchical irqchip helpers. Add
> motivation for gpio descriptor refactoring. Extend the list of
> stuff to do. Minor fixups.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hi,

thanks for doing this, I'm seeing just a couple typos here and there.
They're probably not important anyway as it's a "temporary" (right...)
TODO item.

> ---
>  drivers/gpio/TODO | 46 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index 76f8c7ff18ff..342285ecdb08 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -10,6 +10,28 @@ approach. This means that GPIO consumers, drivers and =
machine descriptions
>  ideally have no use or idea of the global GPIO numberspace that has/was
>  used in the inception of the GPIO subsystem.
>
> +The number space issue is thesame as to why irq is moving away from irq

s/thesame/the same/

Also: should number space be two separate...

> +numbers to IRQ descriptors.
> +
> +The underlying motivation for this is that the GPIO number space has bec=
ome
> +unmanageable: machine board files tend to become full of macros trying t=
o
> +establish the numberspace at compile-time, making it hard to add any num=
bers
> +in the middle (such as if you missed a pin on a chip) without the number=
space

...or a single word anyway? I'm not a native speaker, so I honestly don't k=
now.

> +breaking.
> +
> +Machine descriptions such as device tree or ACPI does not have a concept=
 of the

I think it should be "machine descriptions (...) do not have" but
again: don't take my word for it.

> +Linux GPIO number as those descriptions are external to the Linux kernel
> +and treat GPIO lines as abstract entities.
> +
> +The runtime-assigned GPIO number space (what you get if you assign the G=
PIO
> +base as -1 in struct gpio_chip) has also became unpredictable due to fac=
tors
> +such as probe ordering and the introduction of -EPROBE_DEFER making prob=
e
> +ordering of independent GPIO chips essentially upredictable, as their ba=
se

s/upredictableunpredictable/

Bart
