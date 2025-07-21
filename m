Return-Path: <linux-gpio+bounces-23578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8605B0BFCC
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 11:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83E4A189E32A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAF3286891;
	Mon, 21 Jul 2025 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FkqW9KPQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5C21B19D
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089443; cv=none; b=hZszHeYlg1rrjxOGh/pQJZvrEwe6cZpAjswaYRbzis0HDYjzeEHKMw/cGlCnKMsbpxdjoVZS4MCQZ2UwwZsWDlwou7aTJLsIub/aTVHBa8BGYo0LwvHd1CdS3iPlja6GAMET/MQmjF8JW3259gidBl8Iurx7YQ/Yj0RUlTnhq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089443; c=relaxed/simple;
	bh=kj29subgrE/eDkxVaS3sAeDGcWMe/EOQ6QopPsIdDK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olMbz0Jan+XCxswBscueWpJoI1FdFvuBDaHvjTF3drdE1+T5ctFn8z3zrQdcBJU5ffhHNm69SsRHeaYHTXYXiOeKWKXCNaUd/CcSjpQyXt4V6iRZwLYZaVgmVjN/NEe5ow//ezAqa6l6f/yWiknJY7s8+LfPuc1RDYu+TymjHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FkqW9KPQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b43846e8cso29953711fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753089439; x=1753694239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzO5P3P0FJijMBbxPLzt3Ej11oxHKuZJ0djP07BY1sA=;
        b=FkqW9KPQi5uv0J70k1yZMExnIkJbRQIcTtGHp6JBJwGk3UGvHieL+PsgYlr2VVTiP4
         gtVO+t1p5MaPF3Ko3df8eGkZbb4xf2KfT1BuCh+s1KIGJOx2zfySjSfXImlU7LdmMA/X
         r5dDbXsVwMHxi9hEXo3vqKh3gMemr2aQsWUss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089439; x=1753694239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzO5P3P0FJijMBbxPLzt3Ej11oxHKuZJ0djP07BY1sA=;
        b=Ta+Jb/xNzsE6zJFj/9KhMm3x08fiFzXeD4Hwi8YBD701vY1lbuTav8Z46WH+CXxwNQ
         RRZu+WHqMV1RbvkpDxeRoQDxv4G4+qjFSdSSfyB03vGoAIhjji6amVW5XKVINkeq0q6l
         WvauKDJYt/wmuS9HAOR+ew0iYU75wzxJF2+mRZWWtrSlKaBesfEanWhRUmBCoAMmBoGa
         sWUUtfU1YXf4fHYg1V+eg+tvrd++YkidiVWeDdpusWyPZ1UUv30S5jElvtkmDfk3dAcq
         G19rCfu3LCvWiiadJzJ3C+g9gdKTPgygySyUiVXKGG3BtLp1zeiQGWoJjYyQTZNEXJUe
         9lSA==
X-Forwarded-Encrypted: i=1; AJvYcCXbTlmlc/qZ7nVDvZhIq9sbT8V/fvBCuEDhgadTo8Fuh1SIDp5SxuSr8YDlF+e7fdNmLlM7J2qMgASG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo2WdaiXkKURLUrG2/KVN8IdtzhbnHsBRcCcYkk0m4pV7yIFn6
	7H0seGjCyfXRjcO4JIVqnxIfXERmz8gX6ONC3BmJ4694rGOk8ZUyw8V8fv3cRYyuxocptrLSKLM
	yFvOfO7defZ/liulYF+8TYCPlfAIMIZ39Jy8GQPHX64jOB3lFUbY=
X-Gm-Gg: ASbGnctBIuZYKnRiree5FN7LqbPtK1Uen9B+rVCYhJesZqYqy54utd/8L0qO49p/Bmw
	Cmm02Etuc+inbwLujHDf+cqsALn+9lxnEyPSlHnrW5nMDr9wDj7Y+jXCa4pYDKF5Y7S9bscVij+
	WTdrYH8ImqM1vcjc4hDc15meIfpNn4bdBI6soAzjelOZjIYsfUVGdbbX7XYzCwhk2UF5gcGN8sU
	2T/fHlSHse2QJ3toBW8XZzYhCEQTqdxyxQ=
X-Google-Smtp-Source: AGHT+IGsTM4OZon7DAn21K+VOTkANCYpUhk6AdXBSwKBuRY92Lz2AQqBi0+KAt5b4wzJCvI/4APHAfCqNcgrazzwXHU=
X-Received: by 2002:a05:651c:b0e:b0:32c:bc69:e921 with SMTP id
 38308e7fff4ca-330a7b12523mr35293861fa.9.1753089439395; Mon, 21 Jul 2025
 02:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-10-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-10-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jul 2025 17:17:06 +0800
X-Gm-Features: Ac12FXyXAg_vtqZYAclMGVQ9H6ITi5IQnXn8iXFc86cirJi3aOdALAQn-Ge1VQw
Message-ID: <CAGXv+5FcW2ds9zS_n0SG8BDXV8pz=Hg2R-9sznV_TqsX0KdnuQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
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

Hi,

On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add support for mt8196 board with nau8825.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/Kconfig                 |  20 +
>  sound/soc/mediatek/mt8196/Makefile         |   2 +
>  sound/soc/mediatek/mt8196/mt8196-nau8825.c | 869 +++++++++++++++++++++

[...]

> +static const struct snd_soc_dapm_widget mt8196_nau8825_card_widgets[] =
=3D {
> +       /* dynamic pinctrl */
> +       SND_SOC_DAPM_PINCTRL("ETDMIN_SPK_PIN", "aud-gpio-i2sin4-on", "aud=
-gpio-i2sin4-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMOUT_SPK_PIN", "aud-gpio-i2sout4-on", "a=
ud-gpio-i2sout4-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMIN_HP_PIN", "aud-gpio-i2sin6-on", "aud-=
gpio-i2sin6-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMOUT_HP_PIN", "aud-gpio-i2sout6-on", "au=
d-gpio-i2sout6-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMIN_HDMI_PIN", "aud-gpio-i2sin3-on", "au=
d-gpio-i2sin3-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMOUT_HDMI_PIN", "aud-gpio-i2sout3-on", "=
aud-gpio-i2sout3-off"),
> +       SND_SOC_DAPM_PINCTRL("AP_DMIC0_PIN", "aud-gpio-ap-dmic-on", "aud-=
gpio-ap-dmic-off"),
> +       SND_SOC_DAPM_PINCTRL("AP_DMIC1_PIN", "aud-gpio-ap-dmic1-on", "aud=
-gpio-ap-dmic1-off"),

These are pins for the AFE block, not specific to any machine, so:

1. They should be moved to the AFE driver.
2. Their names should match the underlying interface (I2SOUT4), instead
   of the intended use case (ETDMOUT_SPK).
3. Their related routes should be set statically in the AFE driver.

Also, for the I2S interfaces, since there are input and output pins, but
also common clock pins, you should either split out the common clock pins
as a separate pinctrl entry, or just combine them so that you have one
entry for each interface.

Last, you need to document the pinctrl names as required in the binding.

ChenYu

