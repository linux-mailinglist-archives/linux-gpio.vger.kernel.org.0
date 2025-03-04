Return-Path: <linux-gpio+bounces-17019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A956A4DB58
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81ECA3B5AFB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F811FF1AF;
	Tue,  4 Mar 2025 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rue9pNts"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99CE1FE463
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085111; cv=none; b=KA97YvqMkewb+woJq7yUzA5MOz1lz/bUNrspihMzOrlRokhzgJ5KuNjlfCMQaqj/tjL8lOWNQEf0pjt1PXHl4mQ4jzgHrohPzhadUFsSGD1W8CvaTOCRpt1N1eW/Ui+hS5YYLCWoI9GZG8i2UoWC7latSNuy1+D3X4buwm9JXpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085111; c=relaxed/simple;
	bh=XM5JeWqS5nhWTnNbciVOppTc6ysWbEoqIcMDy88IEko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq3m9WFOVX3p9PX2NSMRYyBPWJXHh/GseJxbaAcbneLZxP9vGBGBzZxoEBkfUaKHn2VzJyPbgVvqOlN3UuRfj2SVzihQx+2SxoxmC4EgpOt6QywuHjrZwXKv+LUhU3QVCOc6w+oBGAa9Hv1TNan94Fmvr11WYVNU31PZ0DBSm1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rue9pNts; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54964606482so2160308e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085108; x=1741689908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vi0p/lSlr77GGvcvyCiPXso/onreQjLMG5o3KFIfYA=;
        b=Rue9pNtsAchX68tOQ5P1FgmNdhKhsIWTpUm925si3on4gxDwqmKascJvIgDdZcJrmM
         W2CzqGQpjRupL2JC/TGWSJaV+k07EOwomNbJSyVs8sCaCvyxvnWHCl6/9vFnL2e+MACA
         /dmdormY5pI2zPHJ9sZ2HfyzBcItYSfONJm3JFVXOm3vqmEKqamUwupcUE6YepISKmOr
         fFMRDVhO4M3DWqgiGue5SKKLRmvO0oTyh/yxzS4Ubw4VY4KyIQgSVln/txGQMzW5vMB4
         iLDTAViY0fFWXU5+NjcCJUgb6SET7/9hWnmq/YCDKytguJy2dS9gX6RoFqj4CaCMEefm
         WkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085108; x=1741689908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vi0p/lSlr77GGvcvyCiPXso/onreQjLMG5o3KFIfYA=;
        b=DEFOYYbuD8iWumHuec/rPM/io+D30FtdpegrkgeS3tC4hzsNd/2hiLf4SKztNiQNs8
         QlVUZ+dULqeVv89Bhd5Z5viiresxVvOfBtK/8AoAfGK90jXG71wrQlQUqAy78+ei3Z22
         ODXdWtBXQ2EJb5l/LT8pitMXgXVsi5CErJYkmagrCrzTmlqVsDWg0KnD4Mh6GHpRi1Ux
         MQFfTvvd5dbL65ixD5MCnAwkDFV5wragXolnGxKBY6hhrBiSQ+qW+Mrb89GKhD9cFw5E
         O0LRmXgNJWVSR05GvOSivKeMIoJB/ixx5jImG/SFGtxdoR0C4CNteIVilXa0pZJRbnqN
         DBDg==
X-Forwarded-Encrypted: i=1; AJvYcCXKpwDah0DXeEYBXraL4SZh87BqN+jtL6q2inTiX2nkfHBEwTzxI0FfPnBZst+vrvOy0DypT+/mJVGa@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7gDxc2rhHqNfZu7DnHrxkCDnt65wFUhGOayaF4J+nMCjv9CL
	qnNro25eMY9/RstGq27IPNLoOcQXB5WiXLGtFZy+FmXonchIPLgVzeR5HuZc77zsuXB2ejl6j3N
	O+g6l/IST6gm1DIJxLwZnXvydJ5DXXYlotreocQ==
X-Gm-Gg: ASbGncv+7y/q8mUMThTw/YMt+59pj3VsvHOuGqI6GeWE31hRnKrrJIFru73Q51Yhxqd
	P6WCTgNyK8qAxE+mIFNf45odD7bkyqi0yztNRn9E19NhxYnSm7+3tux1hyca/DVzHyLQldhiDIF
	oDCk745spJ933fgV+1jJ3vLkezrocf8LKQcBdktMSGQQwa2ceK3gJc9hXzJw==
X-Google-Smtp-Source: AGHT+IH4X+TpSlMA4OP1Ri68DCSx1TmLB0cOv2GgNnPst8yTPeOn4g8rSBM21Ook7Y/aVoCTILVcp/FsWwJbq4fqHgw=
X-Received: by 2002:a05:6512:3b99:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-5494c31b22cmr5968515e87.13.1741085108012; Tue, 04 Mar 2025
 02:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-4-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-4-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:44:57 +0100
X-Gm-Features: AQ5f1JoodYhnRZ12dEFSOR0LjSnLM_w4iJYBs7Z8uhMPMXJfplIc7w2hgDO3Mlo
Message-ID: <CAMRc=Mc3GkM1aoDnNgGLBH7rzOxyCZcu23MspdCC0gMm9f=_=w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The Speyside ASoC uses a single GPIO from the WM8996
> that we can provide from the local offset on that chip
> rather than from the global GPIO numberspace as is being
> done currently.
>
> The offset 2 was done by calculating the base offset
> for the CODEC (i.e. wm8996) GPIOs to 212, by reading
> arch/arm/mach-s3c/gpio-samsung-s3c64xx.h and
> arch/arm/mach-s3c/crag6410.h and adding up all the
> offsets that were occasionally adding a +1 blank GPIO
> between each GPIO provider.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  sound/soc/samsung/speyside.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
> index 79476e8eb680984434a1198ff691ddd4b9fe07c1..947b85ff83f036a0814fd477f=
5f6f69253a2a2d8 100644
> --- a/sound/soc/samsung/speyside.c
> +++ b/sound/soc/samsung/speyside.c
> @@ -7,13 +7,13 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8996.h"
>  #include "../codecs/wm9081.h"
>
> -#define WM8996_HPSEL_GPIO 214
>  #define MCLK_AUDIO_RATE (512 * 48000)
>
>  static int speyside_set_bias_level(struct snd_soc_card *card,
> @@ -105,6 +105,7 @@ static struct snd_soc_jack_pin speyside_headset_pins[=
] =3D {
>         },
>  };
>
> +static struct gpio_desc *speyside_hpsel_gpio;
>  /* Default the headphone selection to active high */
>  static int speyside_jack_polarity;
>
> @@ -123,7 +124,7 @@ static void speyside_set_polarity(struct snd_soc_comp=
onent *component,
>                                   int polarity)
>  {
>         speyside_jack_polarity =3D !polarity;
> -       gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
> +       gpiod_direction_output(speyside_hpsel_gpio, speyside_jack_polarit=
y);
>
>         /* Re-run DAPM to make sure we're using the correct mic bias */
>         snd_soc_dapm_sync(snd_soc_component_get_dapm(component));
> @@ -145,16 +146,22 @@ static int speyside_wm8996_init(struct snd_soc_pcm_=
runtime *rtd)
>  {
>         struct snd_soc_dai *dai =3D snd_soc_rtd_to_codec(rtd, 0);
>         struct snd_soc_component *component =3D dai->component;
> +       enum gpiod_flags flags;
>         int ret;
>
>         ret =3D snd_soc_dai_set_sysclk(dai, WM8996_SYSCLK_MCLK2, 32768, 0=
);
>         if (ret < 0)
>                 return ret;
>
> -       ret =3D gpio_request(WM8996_HPSEL_GPIO, "HP_SEL");
> -       if (ret !=3D 0)
> -               pr_err("Failed to request HP_SEL GPIO: %d\n", ret);
> -       gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
> +       if (speyside_jack_polarity)
> +               flags =3D GPIOD_OUT_HIGH;
> +       else
> +               flags =3D GPIOD_OUT_LOW;
> +       speyside_hpsel_gpio =3D devm_gpiod_get(rtd->card->dev,
> +                                            "hp-sel",
> +                                            flags);
> +       if (IS_ERR(speyside_hpsel_gpio))
> +               return PTR_ERR(speyside_hpsel_gpio);
>
>         ret =3D snd_soc_card_jack_new_pins(rtd->card, "Headset",
>                                          SND_JACK_LINEOUT | SND_JACK_HEAD=
SET |
> @@ -325,6 +332,21 @@ static struct snd_soc_card speyside =3D {
>         .late_probe =3D speyside_late_probe,
>  };
>
> +static struct gpiod_lookup_table wm8996_gpiod_table =3D {
> +       /* Hardcoded device name in board file mach-crag6410.c */
> +       .dev_id =3D "speyside",
> +       .table =3D {
> +               /*
> +                * This line was hardcoded to 214 in the global GPIO
> +                * number space, S3C GPIO macros seems top set the
> +                * wm8996 codec GPIO start offset to 212, so this will
> +                * be GPIO 214 - 212 =3D 2 on the wm8996.
> +                */
> +               GPIO_LOOKUP("wm8996", 2, "hp-sel", GPIO_ACTIVE_HIGH),
> +               { },
> +       },
> +};
> +
>  static int speyside_probe(struct platform_device *pdev)
>  {
>         struct snd_soc_card *card =3D &speyside;
> @@ -332,6 +354,7 @@ static int speyside_probe(struct platform_device *pde=
v)
>
>         card->dev =3D &pdev->dev;
>
> +       gpiod_add_lookup_table(&wm8996_gpiod_table);

This looks good but you never remove the lookup table. We should
typically undo everything on driver detach, that we did in probe().
I'd suggest either scheduling a devm action to remove the lookup table
or adding it statically in module's init.

Bart

>         ret =3D devm_snd_soc_register_card(&pdev->dev, card);
>         if (ret)
>                 dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() f=
ailed\n");
>
> --
> 2.48.1
>

