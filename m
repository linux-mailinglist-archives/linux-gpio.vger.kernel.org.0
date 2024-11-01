Return-Path: <linux-gpio+bounces-12425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0589B8C28
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06BD51C21F59
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 07:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C263A1547FF;
	Fri,  1 Nov 2024 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l4u9d3QB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD31547C9
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730446930; cv=none; b=n5mHVe1Y4cH0us74sYpB0PhS2kCFLym/M2WGjFqSeaNyLbcQXI4+gRYMMPngPMN5pwcwKqdt00VXrW+jD2iejPfOq5dfKZnFKdEaeXSw00XV957JhD+oR8yAJxkxzfzPrF1e8OeQyhbSbO3vGyRKDCb9VaGj+bdXF4h9syq5p9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730446930; c=relaxed/simple;
	bh=g+B7AVhh8UjWeq4IJJekLF0zC8V8tvpQXB0el9dq2a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrzZssKR5uzg4cp+O5P+jx81PYjSmsH+auwp1AbkSupZ2GwQmrNF+g3YZ/5Ej7dzV7XFebENQJJzSTt6eY8pgybTcpkqCC6tmAz9sprAPwGMoEK3Mqc7PkvETF8OTqz73AG+4QCk9bvJ1Dckcea/Ydei6biYWl9fNdFfj/OOWDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l4u9d3QB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53a0c160b94so1951630e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730446926; x=1731051726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=;
        b=l4u9d3QBVURpqfp3dzAm6yDH7Rnekt6MU04gx/A9sikrOWUaMnBVb2Ij7zzBqmPo0X
         XxfIhfbCQRSolidmaE9AUVpYobsvxUuWVICBWB+gnD9fPL04Abv0YBGYnxS/XPMZpIiF
         jZ6Fr//iwczbO9Ubcf2xd7P0SYJUuq0lilWro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730446926; x=1731051726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=;
        b=Jf2c18rbedx4cvRTtaF6Fb8OsVxpJ9oLRWGIxizbwbD7fEbHtomvGLERbXQMST2Sem
         4vV11BQ1WcxR+81rUw7Fmqh1KcLMW/9Dqy/jjAZG+drsh6inP6goY1oLS3tUqJ62s43D
         1jwKVcybZVS/5b6KugMLqDwjqUxwYVWfFjxPmYBI4VEMhhmNTSE6n0T3KbEcg4Gi2F5+
         XX/TxYBjfKYcJorGXNtbLj47lbXw+UKtoxFGBxH7L6h4A4fZgeAuISKCbIGBkdXEUXd+
         Ed7lFV/wI4Tx3HdR7RJ5eFOZKoNXYaQCvxZJT9p7CW+miJ/L4BxkrNf4hkjEeleK6IyI
         P14A==
X-Forwarded-Encrypted: i=1; AJvYcCU9pXfgSKo0GSe2+9vcPusDJXskImcFGdvQJoXiKyYnGyzKDIlvnPZxvjadNBcUazH6oXeGHcuqePT0@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2NxcWoUiPu52D4j/GXo/8YDIfhyfOTkoIM73FGeQ4ur73M7e
	6YYh+eu5wwuKA4CJ+/dk7qayYBKW2XNogI6qPwJjFKnURuELRjJgEcpVMVkm7AuTMHlfojcP/Uw
	s8/3/801ExQ080mfomKRp26KnfiyV9DLfAv3y
X-Google-Smtp-Source: AGHT+IEH94/fyCantPWg+JSDsdCT1KoXU+c1gdEceLGqvlXMPVHqZ/SsqaDoW07J3kRkVsMcqqlDVlzNv5mQm5MpnK0=
X-Received: by 2002:a05:6512:3e22:b0:536:54df:bff2 with SMTP id
 2adb3069b0e04-53d65e265e8mr1216351e87.54.1730446926248; Fri, 01 Nov 2024
 00:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 15:41:55 +0800
Message-ID: <CAGXv+5HNwk2B_01_o90nZ1smDcZoFf3O-4-+n+E7vKtLTS9-rQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/5] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 4:06=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the set_config callback in the gpio_chip registered by the
> pinctrl_paris driver only supports configuring a single parameter on
> specific pins (the input debounce of the EINT controller, on pins that
> support it), even though many other configurations are already
> implemented and available through the pinctrl API for configuration of
> pins by the Devicetree and other drivers.
>
> Expose all configurations currently implemented through the GPIO API so
> they can also be set from userspace, which is particularly useful to
> allow testing them from userspace.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 87e958d827bf939aa6006794287698be4936f25e..c9455de266a447ab7f5446c15=
11bef0ef9c9128e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -255,10 +255,9 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctld=
ev,
>         return err;
>  }
>
> -static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin=
,
> -                          enum pin_config_param param, u32 arg)
> +static int mtk_paris_pin_config_set(struct mtk_pinctrl *hw, unsigned int=
 pin,
> +                                   enum pin_config_param param, u32 arg)
>  {
> -       struct mtk_pinctrl *hw =3D pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
>         int err =3D -ENOTSUPP;
>         u32 reg;
> @@ -795,9 +794,9 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pc=
tldev, unsigned group,
>         int i, ret;
>
>         for (i =3D 0; i < num_configs; i++) {
> -               ret =3D mtk_pinconf_set(pctldev, grp->pin,
> -                                     pinconf_to_config_param(configs[i])=
,
> -                                     pinconf_to_config_argument(configs[=
i]));
> +               ret =3D mtk_paris_pin_config_set(hw, grp->pin,
> +                                              pinconf_to_config_param(co=
nfigs[i]),
> +                                              pinconf_to_config_argument=
(configs[i]));
>                 if (ret < 0)
>                         return ret;
>
> @@ -937,18 +936,19 @@ static int mtk_gpio_set_config(struct gpio_chip *ch=
ip, unsigned int offset,
>  {
>         struct mtk_pinctrl *hw =3D gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
> -       u32 debounce;
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       u32 arg =3D pinconf_to_config_argument(config);
>
>         desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>
> -       if (!hw->eint ||
> -           pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNC=
E ||
> -           desc->eint.eint_n =3D=3D EINT_NA)
> -               return -ENOTSUPP;
> +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE) {
> +               if (!hw->eint || desc->eint.eint_n =3D=3D EINT_NA)
> +                       return -ENOTSUPP;
>
> -       debounce =3D pinconf_to_config_argument(config);
> +               return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n,=
 arg);
> +       }
>
> -       return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounc=
e);
> +       return mtk_paris_pin_config_set(hw, offset, param, arg);
>  }
>
>  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>
> --
> 2.47.0
>
>

