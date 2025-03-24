Return-Path: <linux-gpio+bounces-17920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A094A6DEE4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 16:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4A7C3AB8DA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 15:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B061D261563;
	Mon, 24 Mar 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="oWMYQB7E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3F2E3392
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830748; cv=none; b=rICw5T0Z/1CMu+U+6V8wSTexMjESMRagG2w6kmBclGDY870dbLwycGYAfZ6kZhTZiB79M31S8YxUCv9ZefG8LMJUwgOex+czsDsr+hEaZudh4msxL78e8wW9F29uE39uRK6vVp5cZ8MykEtw8NsQ8njuQPeLmJkYZ3J3EIOBKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830748; c=relaxed/simple;
	bh=lW8q0MENHUug9UrAhpJH+j6S0fM0oUPQWPy/B+Q20ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOKB8JCJjioRNIT8Dww3i3hrU7g9R3cnkSUEI0ChAKyQuDXbq1SD96BMaIK5aNJbbLvGo+aDDdxGCblivSfD1hVyFIa0D2zzjJ4e5N3V9lNN+MJegVcKGnYO71TaelBWB2qtYPC+JgAXwFhFnXt0yXi2wGFfyC936a4cB/1j/OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=oWMYQB7E; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2340764a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1742830745; x=1743435545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okATwyvKKlKUGnAkA78cBa2tOjkMCo1pGnnMETcH4DU=;
        b=oWMYQB7EWSCH3sTurW2bsHzlm4+S6bqBC1X7K70ybpm8Cmw0fvEQdGJThTdn0rnliD
         LQ9IDoLW2KAAXzyf5MxuIXt/eCuXhGEBRNsdBnbO54AHhkz1j7H0cEIz1hz5OjmRxQgS
         8GQh6Dbisa7NzSdjQkFQ2SPabHmD4v4CBasiCcYgXlDGbdRjZMqe26A3PfLzbfRjLwn5
         9meDEjXmRlA2tEB6suaeTVbGQpCiPwAjLrCnC0FZw4WtPE+Wvstaw5KUP8vBBe30ekV4
         YLXI43MFbWChaWc9S/t+j3heogH8zKKUS0X18Jmf6hI/fMYAyucbVZfOKQkpvNYuclOS
         dSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830745; x=1743435545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okATwyvKKlKUGnAkA78cBa2tOjkMCo1pGnnMETcH4DU=;
        b=oQYHN9bZkM6JClbVN/j/eOHK4maMd+cF/+HIvvI93akyqGlCH7l6gmvtYiy8A8kmGz
         HHEBde08jMF9s7wYeIZXhFCTBgQuWHypqsMlbxbNc7ZYjMUGMHlqaCIuTSyS7lM0hR1V
         NRbv2bRmD/6Yg2JxcRAB8Rlje3qTfalE7I1PX/Xzj8e51cg6s/lqxEjXiU9pLFGrAndO
         K/ZmTTVm3znmvXvYWbXYbwuqkBmmMcj945Ouus1FISn1KmudkGuqS2E/vqzmHynv5H4M
         g3t+RbQSmOaY0/CbG1UoiJWKDWqtBxQbIw9SDb4hTpfCNAkpT3HZZeX1igx7VXON6e9v
         lAbw==
X-Forwarded-Encrypted: i=1; AJvYcCWHJ2lGW860H4uFvJEahkP5LWIMezkX+b9MA35Mkrjp6AouwA+Ejdef23DKampQkUkgk6bUQRfoklAF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKoYdZpIok2VohDqqSs+LPCtX/XYn22YM0GGlc+V//Yreo5Nj
	9ZcheJ3ZafnH8mPM8LB1/c6dpcG74NKDhcOM+8kD5J/DhgnQSjyYVyuvXS3WtzyHD3t5dC2P8bt
	0SzEwHQnipsbANS1z2tOJd4R64iX4pAcCQBP29A==
X-Gm-Gg: ASbGncuFPlJltbT32n/xmyczjmZVgyg5NdjACmk1j1LnLZ19zYOC/L5C1YT47iogHRK
	vwhUuO6PmNpwBiOjIRHIa3VUsVXgNgzhCRllSTM1Z8kZafUmvbabmAQDRjoZF1gTOR+pYzthB2C
	c1/HQsKeqFyftY90N964LpTUPB0Qs=
X-Google-Smtp-Source: AGHT+IF5kUm8YAwl4UJ6X1UrmVjPAu9Rc6SplysTW4SUfxt8w5mDzh/ofYQBCrdqW12xHDRFpOPk9M2fvNYvBePGH40=
X-Received: by 2002:a05:6402:1ece:b0:5e5:4807:545f with SMTP id
 4fb4d7f45d1cf-5ebccde28efmr12756943a12.12.1742830744616; Mon, 24 Mar 2025
 08:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 24 Mar 2025 10:38:53 -0500
X-Gm-Features: AQ5f1JpkDFG5SyOkw6uUhO3oUv_QewWJKaHPmeTo9CbeqBhrMZL3HS1FVGfM5mA
Message-ID: <CAKXuJqiwWzC9Zhnnujq+EugJw75EqYL=AmDUUMs8LHOnbBNsyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Mon, Mar 24, 2025 at 6:52=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
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
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we
> can expect this to "just work".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/codecs/wcd938x.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 1ae498c323912ed799dcc033e7777936d90c9284..955a0d3a77d7cb45932faa0c7=
a6f5060232d33b4 100644
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
> +       wcd938x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LO=
W);
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
I can verify that with v2 applied, I do still have working audio on
the Thinkpad X13s.  Apologies for not replying earlier, it was
unfortunately my night time.  For the record though, I do not use the
firmware dtb files, but explicitly list the kernel that I am using
and/or testing to be used on each boot.

Tested-by: Steev Klimaszewski <steev@kali.org>

Thanks!
-- steev

