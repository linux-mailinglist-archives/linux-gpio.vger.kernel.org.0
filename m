Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B74D126088
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 12:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfLSLKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 06:10:41 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37480 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfLSLKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 06:10:40 -0500
Received: by mail-qt1-f193.google.com with SMTP id w47so4716234qtk.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 03:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SJiLbsEyOxS8sGorfLAOU4xJKF3nGQf0Amv/oVqLTpM=;
        b=dm+K4tCbb0SMvVMAS0DtrlIoPpBOu2T6hGIWa5e7atlrpaJCuIes0zfCXr3T5q7nLs
         kCwvc1d1itkC2VjSGzn3qrkyXgtOkoW08YOAl0CKzd/ah4172kFKW0LPoSUpbNkC2RGH
         0P1kMf7/C/K9ig+o3VoEDpj/Q6kZT6fARM7OvSkMLaGKMQCDctwCGNw0G5H/PhVzOrT9
         rCj0biTH7OWie/kAr3zTxePDI0/x1GwlbSYqrOXqbTzt8WRXgp4EniJHAr8AS/WK2mbX
         SvOY2W2dEstfqvrnKwKZg0hg5YNAa4d+UqyBTP0C2ybhrvg78unmXrWyrRHP9DhjDsGx
         teUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SJiLbsEyOxS8sGorfLAOU4xJKF3nGQf0Amv/oVqLTpM=;
        b=uV4FS+20RoX4GeSMiuPPdPn7ZyflXqslzNGr/u0UCe5U8vQZnMhcKUWDmjfPxmguhm
         is1DZRHliGevz3v0e388xbxhHKF8XI0zJisH3DfI1KFAYWzeyBgHEpQMME1OLutA4wWL
         tHiJwcTYT6R9BEEkjl+CeahnGJclTCaEXHbpqAeFoSdchfdbrWqR7eZ0e1bNVyG5x9T8
         kxNXxfYYRxtsuo30XbAmxYUl2USJ7UDZphlIa3k1fAIU/ZxUGLG32/Pzwm9sx6V2S+Vj
         6MeO1SKrCX0aXhC3NUvJuXwbvhDkpB84Q1PJ+7GT39h5DDtbTxPBiPlqq49+Carot770
         nI1Q==
X-Gm-Message-State: APjAAAVtxg5BLXDHx5lfyqsqo6xhszaCpmwpY8kM8g6sTD7yNcGw3gZh
        SkzV3U2VYBRYMD9iULiYvGvGzxJ7yKTslDAmXr3Clg==
X-Google-Smtp-Source: APXvYqz2qAh5BXMI++n+PMlkR+N2stu371MGABqkdfpkG3bOIyTOMjLKw7m81VpyLOpj10ZoKe2TibEs4vNq/2Jzheo=
X-Received: by 2002:aed:3b6e:: with SMTP id q43mr6255037qte.57.1576753839903;
 Thu, 19 Dec 2019 03:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20191218132551.10537-1-baijiaju1990@gmail.com>
In-Reply-To: <20191218132551.10537-1-baijiaju1990@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Dec 2019 12:10:29 +0100
Message-ID: <CAMpxmJXZKZYg_B_EpGbnoCEfdKw756KF5gurC4ck6RwjNd7A-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: gpio-grgpio: fix possible sleep-in-atomic-context
 bugs in grgpio_remove()
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 18 gru 2019 o 14:26 Jia-Ju Bai <baijiaju1990@gmail.com> napisa=C5=
=82(a):
>
> The driver may sleep while holding a spinlock.
> The function call path (from bottom to top) in Linux 4.19 is:
>
> drivers/gpio/gpiolib-sysfs.c, 796:
>         mutex_lock in gpiochip_sysfs_unregister
> drivers/gpio/gpiolib.c, 1455:
>         gpiochip_sysfs_unregister in gpiochip_remove
> drivers/gpio/gpio-grgpio.c, 460:
>         gpiochip_remove in grgpio_remove
> drivers/gpio/gpio-grgpio.c, 449:
>         _raw_spin_lock_irqsave in grgpio_remove
>
> kernel/irq/irqdomain.c, 243:
>         mutex_lock in irq_domain_remove
> drivers/gpio/gpio-grgpio.c, 463:
>         irq_domain_remove in grgpio_remove
> drivers/gpio/gpio-grgpio.c, 449:
>         _raw_spin_lock_irqsave in grgpio_remove
>
> mutex_lock() can sleep at runtime.
>
> To fix these bugs, gpiochip_remove() and irq_domain_remove() are called
> without holding the spinlock.
>
> These bugs are found by a static analysis tool STCheck written by myself.
>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/gpio/gpio-grgpio.c      | 5 ++++-
>  sound/soc/sti/uniperif_player.c | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 08234e64993a..60a2871c5ba7 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -448,13 +448,16 @@ static int grgpio_remove(struct platform_device *of=
dev)
>                 }
>         }
>
> +       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +
>         gpiochip_remove(&priv->gc);
>
>         if (priv->domain)
>                 irq_domain_remove(priv->domain);
>
>  out:
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       if (ret)
> +               spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);

In general there is no need for locking in remove() callbacks. I guess
you can safely remove the spinlock here all together.

>
>         return ret;
>  }
> diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_pla=
yer.c
> index 48ea915b24ba..62244e207679 100644
> --- a/sound/soc/sti/uniperif_player.c
> +++ b/sound/soc/sti/uniperif_player.c
> @@ -601,13 +601,14 @@ static int uni_player_ctl_iec958_put(struct snd_kco=
ntrol *kcontrol,
>         mutex_unlock(&player->ctrl_lock);
>
>         spin_lock_irqsave(&player->irq_lock, flags);
> +       spin_unlock_irqrestore(&player->irq_lock, flags);

Yeah I can tell this was generated automatically - what does this line
is expected to achieve?

Bart

> +
>         if (player->substream && player->substream->runtime)
>                 uni_player_set_channel_status(player,
>                                               player->substream->runtime)=
;
>         else
>                 uni_player_set_channel_status(player, NULL);
>
> -       spin_unlock_irqrestore(&player->irq_lock, flags);
>         return 0;
>  }
>
> --
> 2.17.1
>
