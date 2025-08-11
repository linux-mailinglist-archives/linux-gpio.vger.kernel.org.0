Return-Path: <linux-gpio+bounces-24161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD87B20789
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B9B2A3086
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE4F2D12F7;
	Mon, 11 Aug 2025 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ku4G02qJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77B2D12ED
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911457; cv=none; b=BUui+QIxTcnqQGRCvK4X6gKaKifmvvtDQVs3/iLCJSljijIYstAfndTHc4vl8smeiS7bYG7ryJmlBPT4Jv+2Na39i7/tSrantzTfG86e8YSbtgOORziVxFLmI2/nTspnLetJP6Ec4dzhoa2Hpv7CGJjj4go5GaHUy0w4H1hhgjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911457; c=relaxed/simple;
	bh=PHwsYqPMe5lmjxOn4zXFfhjopKhCTRNe5UyB8PxQlJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axSvyA6Paz8tch3m0Eayv69yedW/CYD0lZrQeU4gM2GaH+n2L25/v3DuMSng7OsxMg+zrVBWRiPqAQoNuxd6VFaJV/LLY3iJ7Ecs4jR0D9uNEsCfFLI7lSrNfdH9GHCYQq5qWEs0CeFpKohPaC2pN2G4t+hCnNJMDiS5VaQTXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ku4G02qJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55b85d01b79so4398993e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754911453; x=1755516253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5GmgDRwLzjGy8dLnCeLiuAfeTbFgGKNWM+nzJ45dpA=;
        b=Ku4G02qJvE0Yng5xsA1avFYKHXf/CtLhSrKSNXm7sbF+SmM9oFUhrNGkkV8kT+8nKR
         zJ8IKy2Hsl35Zuq1Jw9uDF/sjuowewFqtVQ7gd5JJoobTA8NhN3btBHlZb2rMWYB8AFw
         HErTyGmkmv61xrx/ufVqYkXhA5UwiVN2LbKzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911453; x=1755516253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5GmgDRwLzjGy8dLnCeLiuAfeTbFgGKNWM+nzJ45dpA=;
        b=An+ccYypMI9PMxECJod8GQmIyctJ+V020yy09TtEg2R2SSzaT38RxwYNhj7ANP7tIV
         FmpL4Yra34YD5of23EZ1f76L2iVa+UMrST123JdvNykqkrtgX52v4pM9efOYeT875zuJ
         PBtLtkz3YnZIP4RuG83MgnQ3UDv4Pz3eKKAeh2/sTzxevNjSJWVbFbsFt5j3SO4R6LU4
         iW1gb2aSt0xVk+qS2gOvE5ZkATpJ6aNx3Y6ghYNZj8mPRaxqL8k/rizYh59AxUwiqKOn
         Qp87XRfVfVzPdLZppbP89f5SdN5FF6pwDFXu8uLEsw+Z3IvrRQErw4N0rN7BxD2k5k+J
         lVCA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Yrgm8wyqwIukz1m31QMJzuc3+EIN4IU3kqlnWmmgd5T0YiOHQqqPXeXlBYGBbzNMB6MI1VhF9B18@vger.kernel.org
X-Gm-Message-State: AOJu0YzrcKPUmy36Vf3OanZE1rv9w4WM5XhvdwstmvaUWjmYO759i0iS
	9WNzgkWa1rTFK+S0LT5mUdw8iPgB911XLFOrilChrzfXi4ZwPCwfUiLcyhueCCw1SNHPETUPJFN
	9C/1uMKSEcKEDhNDWw2s0mGATz6FuuVd0vJdQv3Qc
X-Gm-Gg: ASbGnct+kpAv4tDYKTAp7AD3p39RjJ8veZk8mIyaRyVyzUPj7wnJ+6X4HomBi1arrv5
	mNX6lXsnPFSCgnMGpjVFZB/SQMxfWh34ef2SoQKsMlPgHMgalEHQjsAdJP3gKOBQKDvmpMOmsHS
	lUL5VJA5d1aEgwzEba6wnctuH7WPPUrt/VgoaikpBALtjbGFE+tBr4b49KztsNhiu2CMwkktS+S
	H0iuSwqcz3xvOd2Ir8gAVYCilpc4JUFUCU=
X-Google-Smtp-Source: AGHT+IFH1xwZU4h8r7iEY3jgrVBtJGh2oYXazOzDlq78D9uq3Av2ACb1cuu5hjNFbP0gck6r2pgb1pAL9b77iA9N8VY=
X-Received: by 2002:a05:6512:3b27:b0:55b:7cc9:41ee with SMTP id
 2adb3069b0e04-55cc0102717mr3789564e87.38.1754911452958; Mon, 11 Aug 2025
 04:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-6-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-6-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Aug 2025 19:24:02 +0800
X-Gm-Features: Ac12FXxeNaT3MP9n4wih87uuXFKen5GCnd1-R8Ou24yHeRKyjqsVqSE_BwKFLpA
Message-ID: <CAGXv+5HW1-GByx6BEd46J_n50FxcHNukUWwREpoDne=CdAnSVQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] ASoC: mediatek: mt8196: support I2S in platform driver
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for another reply, but I lost some of the context I wanted to reply t=
o.

On Tue, Jul 8, 2025 at 7:34=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 I2S DAI driver support.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 3944 ++++++++++++++++++++
>  1 file changed, 3944 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/media=
tek/mt8196/mt8196-dai-i2s.c
> new file mode 100644
> index 000000000000..59f66ab8fa9f
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
> @@ -0,0 +1,3944 @@

[...]

> +static int mtk_afe_i2s_share_connect(struct snd_soc_dapm_widget *source,
> +                                    struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int ret =3D 0;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, sink->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       if (i2s_priv->share_i2s_id < 0)
> +               return 0;
> +
> +       ret =3D (i2s_priv->share_i2s_id =3D=3D get_i2s_id_by_name(afe, so=
urce->name)) ? 1 : 0;
> +
> +       return ret;

          return i2s_priv->share_i2s_id =3D=3D get_i2s_id_by_name(afe,
source->name);

bool casts to int implicitly in the same way you wrote explicitly.

> +}
> +
> +static int mtk_afe_i2s_hd_connect(struct snd_soc_dapm_widget *source,
> +                                 struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int i2s_num;

Rename to "src_i2s_num" to be explicit.

> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, sink->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       i2s_num =3D get_i2s_id_by_name(afe, source->name);
> +       if (get_i2s_id_by_name(afe, sink->name) =3D=3D i2s_num)

Use i2s_priv->id?

> +               return !mtk_is_i2s_low_power(i2s_num) ||
> +                      i2s_priv->low_jitter_en;
> +
> +       /* check if share i2s need hd en */
> +       if (i2s_priv->share_i2s_id < 0)
> +               return 0;
> +
> +       if (i2s_priv->share_i2s_id =3D=3D i2s_num)
> +               return !mtk_is_i2s_low_power(i2s_num) ||
> +                      i2s_priv->low_jitter_en;
> +
> +       return 0;
> +}
> +
> +static int mtk_afe_i2s_apll_connect(struct snd_soc_dapm_widget *source,
> +                                   struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int cur_apll;
> +       int i2s_need_apll;

Rename to needed_apll or desired_apll.

> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, w->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       /* which apll */
> +       cur_apll =3D mt8196_get_apll_by_name(afe, source->name);
> +
> +       /* choose APLL from i2s rate */
> +       i2s_need_apll =3D mt8196_get_apll_by_rate(afe, i2s_priv->rate);
> +
> +       return (i2s_need_apll =3D=3D cur_apll) ? 1 : 0;

          return i2s_need_apll =3D=3D cur_apll;

> +}
> +
> +static int mtk_afe_i2s_mclk_connect(struct snd_soc_dapm_widget *source,
> +                                   struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, sink->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       if (get_i2s_id_by_name(afe, sink->name) =3D=3D

              i2s_priv->id =3D=3D ...

> +           get_i2s_id_by_name(afe, source->name))

Keep a copy of the result ...

> +               return (i2s_priv->mclk_rate > 0) ? 1 : 0;

                  return i2s_priv->mclk_rate > 0;

> +
> +       /* check if share i2s need mclk */
> +       if (i2s_priv->share_i2s_id < 0)
> +               return 0;
> +
> +       if (i2s_priv->share_i2s_id =3D=3D get_i2s_id_by_name(afe, source-=
>name))

and use it here, like in mtk_afe_i2s_hd_connect().

> +               return (i2s_priv->mclk_rate > 0) ? 1 : 0;

                  return i2s_priv->mclk_rate > 0;

> +       return 0;
> +}
> +
> +static int mtk_afe_mclk_apll_connect(struct snd_soc_dapm_widget *source,
> +                                    struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int cur_apll;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, w->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       /* which apll */
> +       cur_apll =3D mt8196_get_apll_by_name(afe, source->name);
> +
> +       return (i2s_priv->mclk_apll =3D=3D cur_apll) ? 1 : 0;

          return i2s_priv->mclk_apll =3D=3D cur_apll;

> +}

[...]

ChenYu

