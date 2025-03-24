Return-Path: <linux-gpio+bounces-17890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D3A6D35C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 04:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9CE11890185
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 03:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33940186287;
	Mon, 24 Mar 2025 03:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="RXVTcCwB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8E35961
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742787667; cv=none; b=leE/Qt4rYs9cEuwmUxyw8SpmVq5sinWJbGYB7/6Liki8qjmz2g6/Mk+NqxQeONkFD7JRkZoGjp64lDRrlhbuHcgo+fswoFJx8M3X6kz+lgSW0LeU5C02K+8S2hczl7iyGCWOgtASc5ZMp8P5WTZbzsyP+VQZAsNpONJehi4H8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742787667; c=relaxed/simple;
	bh=YTOyujB6HV49uiuieNmfjMnZV25DYjCLt8LZ3xZbu44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6CFXb/ZXyyMlftNQZ/NSqS3L3I6nkSj1wlGazzTdo4GoI4af9hMFtRBG0q5Di7xJLE7QGNbwYHbW5PqXyeHUKASipTR1NoEZaWE5C7JVnFnkIq2KZhuRi3df2ij0NtrtHNRSTJA0du2jDJoL62giMzXuBw53fQfhm3U1xJ5/AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=RXVTcCwB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso5755094a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Mar 2025 20:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1742787663; x=1743392463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqAdn5drDLdHVQt7mXUZCWV+B5j9LdmitoQylJry1D4=;
        b=RXVTcCwBTGC7PGGBMPuP8GDVhCGVAqVuRgz5hpEqRVQZVIY7nxxcd6xjXjhqsKlUy/
         BRFwW/KZqkDsHKszDi7QdXGXNGWRDqUUCMmvtGtT3ANAKjcp9nsva2mBo2j4CbSkjOZs
         mR7bmwX+hkapREK2a8G+AUW8G47rxeJuHMEvSGrZqjdCHVY4eBUWNoyiPTBbrfX6Hnwk
         NnflVn6e03a3BtrYU2cKFt+YRGsBIQDH13rpkPx5OwZGxyKd2EmGhNUVdkgL+Odz6Hag
         Quon4Kwc0uBToN8H8STp0HKPM9lNnaLseQ91POCoqrx4wjtXHrr1Q4q0RUYYuBozMdyt
         v/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742787663; x=1743392463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqAdn5drDLdHVQt7mXUZCWV+B5j9LdmitoQylJry1D4=;
        b=VhYyiDjYBzCsMcC3EQao+7W+w6Wba+FiV1fLlVi8CnvsPY7JdAF0hKOtvrjHNeUFGq
         +EsKLob7MKHy66KIodf3hmzb4OQ+bS/ntNNK7zTpBww9v1cnMDAL0I9zZmHIR0tUAgWI
         uFv76b5S8ZkBITMU7d1rf3i+ULZ7qf+DMF4IqrixLiSIzzpoip38jkWMHx6IHSbKGMOR
         0qRO7REngz52kRHFRYusew7PlaZu05CO9uS/CWPPFpKc7p9oBK0srVk5MW6AZGCPjx3F
         JH213G92mTIthFUxhq4WgtAqpifYLFyxaIYGCu2u14ddtNZZAPhwUStrU3LGjJsvBXSI
         72kw==
X-Forwarded-Encrypted: i=1; AJvYcCVysq1NcdCuO3PAhr9F1WLcdI4h/EDv5nZg2Yl7mC+KVPmeEO8jlbMc3SCxIWvSlbX4cDIAha4CLHi0@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+Q8ejELzJEEYXYZwmRdOtuIJ4eJCb0rZolMTtWfIJBRJFOa5
	tFt7l5SAlkt1CM+j4Fx1wjz6reDtpnUs22ZSj9yoZSTkcjm2IWtwVZK6bTOOACWHj1KRp6KEDCz
	szCXQicb56eelvzjVpkm5Hs1FoUK8o2vaxIdXUzIbA12vWzfd4noJZQ==
X-Gm-Gg: ASbGncuQh14gm5b3DzQ9gH9EqPH14/2qgSbQBDbAZ9sDudDE9TBAQGHxllWZuMJdup5
	4iskEXkyf+qIlQn0NiQ9uLur6kSEa3I6dRJAjT38rxu5GMncxe0n/c9/1E2tRh/ooTfxE/7IjbS
	v2CwMwQHauMIFHpfPYq1fRyhkLbnw=
X-Google-Smtp-Source: AGHT+IEf4WGbQ3qxvrIMk05GS8LR6ITHlULcjaOKtIwGgAmn7Z7RZxqOJXmb4UVfsxdcask06dK+SKmvNHb4sJYQXxw=
X-Received: by 2002:a05:6402:90c:b0:5e7:9d01:109d with SMTP id
 4fb4d7f45d1cf-5ebcd528857mr8535251a12.32.1742787662737; Sun, 23 Mar 2025
 20:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 23 Mar 2025 22:40:51 -0500
X-Gm-Features: AQ5f1Jrs3YNxuyzEK2PKwShWt84XVzo4wlyPswgCV-soNnQk2eSI4Vg06XK4Sdo
Message-ID: <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng Fan,

On Sun, Mar 23, 2025 at 9:28=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/codecs/wcd938x.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 1ae498c323912ed799dcc033e7777936d90c9284..c70da29406f36883e4926eca4=
0ab5ba5df02c383 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -11,7 +11,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/component.h>
>  #include <sound/tlv.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of.h>
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
> @@ -171,7 +170,7 @@ struct wcd938x_priv {
>         int flyback_cur_det_disable;
>         int ear_rx_path;
>         int variant;
> -       int reset_gpio;
> +       struct gpio_desc *reset_gpio;
>         struct gpio_desc *us_euro_gpio;
>         u32 micb1_mv;
>         u32 micb2_mv;
> @@ -3251,9 +3250,9 @@ static int wcd938x_populate_dt_data(struct wcd938x_=
priv *wcd938x, struct device
>         struct wcd_mbhc_config *cfg =3D &wcd938x->mbhc_cfg;
>         int ret;
>
> -       wcd938x->reset_gpio =3D of_get_named_gpio(dev->of_node, "reset-gp=
ios", 0);
> -       if (wcd938x->reset_gpio < 0)
> -               return dev_err_probe(dev, wcd938x->reset_gpio,
> +       wcd938x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_ASIS);
> +       if (IS_ERR(wcd938x->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(wcd938x->reset_gpio),
>                                      "Failed to get reset gpio\n");
>
>         wcd938x->us_euro_gpio =3D devm_gpiod_get_optional(dev, "us-euro",
> @@ -3297,10 +3296,10 @@ static int wcd938x_populate_dt_data(struct wcd938=
x_priv *wcd938x, struct device
>
>  static int wcd938x_reset(struct wcd938x_priv *wcd938x)
>  {
> -       gpio_direction_output(wcd938x->reset_gpio, 0);
> +       gpiod_set_value(wcd938x->reset_gpio, 1);
>         /* 20us sleep required after pulling the reset gpio to LOW */
>         usleep_range(20, 30);
> -       gpio_set_value(wcd938x->reset_gpio, 1);
> +       gpiod_set_value(wcd938x->reset_gpio, 0);
>         /* 20us sleep required after pulling the reset gpio to HIGH */
>         usleep_range(20, 30);
>
>
> --
> 2.37.1
>
>

With this patchset applied, the wcd938x codec used in the Thinkpad
X13s stops working:

wcd938x_codec audio-codec: soundwire device init timeout
wcd938x_codec audio-codec: ASoC: error at snd_soc_component_probe on
audio-codec: -110
snd-sc8280xp sound: ASoC: failed to instantiate card -110
snd-sc8280xp sound: probe with driver snd-sc8280xp failed with error -110

-- steev

