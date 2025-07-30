Return-Path: <linux-gpio+bounces-23890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2503B15A80
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 10:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3B594E2327
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 08:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88201256C9E;
	Wed, 30 Jul 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iAHVEGI5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5B3255E4E
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753863824; cv=none; b=Qr6Waii9b5dRlrgqIMuAhQxwhwef7nVhy9T1jT2dLOrZG3scsqmfViI5bpS/powf9KtI6LrOhXX/7hPZ+qUte6iDn+sDsBL8gY1y1pr2P2ygyNfvWV2y5IurqmJRA+Bqh5FrN8oYPr6edDd8rKKra1ApKgWHyyeHvFwCJcJjQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753863824; c=relaxed/simple;
	bh=k0n3laGySUj8A81/FGX/9rlSYF4U3v2+KxowMb3vRYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qErbDfe+R/DJwsfnKQixD9f++tRYKvAhCZgShQAY++h5QCQ2q4rfIrdu0sFxkTep5yg1EtQ27KVdHbLwzOC3MlP0RSrNMAA33Q25nDkSI8emRl+fD5NWN49nFVOj171GVfcf7c4eHKm0+qk9Z5yd5/Hgt7RRprrr9IrpYDX4hW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iAHVEGI5; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55b733911b3so2322932e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753863821; x=1754468621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1r2R6OONrqy2phTDjM24jkvudNKHdg6QD1pSz1RSbE=;
        b=iAHVEGI5T+Vg4X9WePWAFyZNJudEsM/U61+3V2HQE4on3oUfPNjXqtP6MGs6lA7Y9S
         bdaAricCtJ5f7iPXDPNZycAS4SgvaNvSjjgdgVITTBwDjaN6E6xD6myvazovIKFqC9C9
         h7bq/Kkez3MGYV7GsjOP/Ra/MSyIQXAuFRJG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753863821; x=1754468621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1r2R6OONrqy2phTDjM24jkvudNKHdg6QD1pSz1RSbE=;
        b=UR/dx24yEU/7wTtgBPJu4MbZnhbFqlYAAnFM5VZcD6La+uLp/f26gnUQQN3Y9xcF9u
         lQHFqk5LnkDpnbVfo1djkMD1rUEk8R2B3ISV68kuJkFzVGvjbCPK8uSEFgdnadt3TP07
         uzyPq8nm6JD8mdRq/x9XTJLwb9BowrfwFaUPJy8p1xuHzBYsPswu0la9fv7AWICkVJwo
         jWXOz5Nrt4v44hCkYoWD6Cut60/sZz/1UYUQHqpVLkeY+A2amUVBVhpVEwQezoNifC6N
         7HlSmRZO983WMcXmqjSm526mMwJEJPyzW5Z7nL35TemztLeDHxA83AUbRGjizP5gNMGY
         TRjg==
X-Forwarded-Encrypted: i=1; AJvYcCXdIBKZQLdG/WxrU7gfDH5gKEXXcLbrkMuPL/l9VUnDr4m/4qST56z91de1JS1FpF2ox8tGXSbfjhs0@vger.kernel.org
X-Gm-Message-State: AOJu0YzgwqRMG0anOaeCccBMwuvz0D/iTupbvM4okqHUubFcAbalMaIt
	iK8+kmZVBR0WvQ5SLfJ9z9x7vlEy1Lep+dlxWHwsG6nrPueMpcdZowq5lCqEwa4BRbFyOSVUFdL
	DDGBT1YMlooKgG/+aq3QqtXIj2Ny6Li/Bz9IRgfU8
X-Gm-Gg: ASbGncvME181bPeYmLsjxLtUbIgxAnTPPBlPXF0/7gBAzE/r36BgFbHSlaAoZPvcOjO
	Rh4VQN5Ery1CPtQMx9asND2yr6fK8ve66DxeP6X2kwgTZm0iSOUvNzhp0zUdvQTm8xlrYgXRMVv
	sMxkE5+Knz6W9jpZ0QjGrawHi90IvPaSF8XZ0VcHNqx4r6BQEzVEoUjQlZTF0mDCV8xhRgNMbyH
	6m/Xm6z8mN0mQ+u7S7fqBaEHXKMYbFOisI=
X-Google-Smtp-Source: AGHT+IFNNgGe2N+Najma2XgK1xBeO1Tq5z4VdOwxsWj1JkHm5nTTq++sDH5npr//Xe7MrxeLpTLuyirVohv+SG9hXog=
X-Received: by 2002:a05:6512:3a81:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-55b7c06cb83mr858483e87.31.1753863820791; Wed, 30 Jul 2025
 01:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-3-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-3-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jul 2025 16:23:29 +0800
X-Gm-Features: Ac12FXziz9m63a9IuaHiHsS0x7hGxpkPqvcMpJ0GxNVtaytZnTnRhyBsZaU2UF8
Message-ID: <CAGXv+5FiZJqymDfvGO05SNgzSUYAdOwtFCqE0WPGwC5Dwg7OEA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] ASoC: mediatek: mt8196: add common header
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

On Tue, Jul 8, 2025 at 7:34=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add header files for register definitions and structures.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-afe-common.h |   213 +
>  .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
>  sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
>  3 files changed, 12402 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/me=
diatek/mt8196/mt8196-afe-common.h
> new file mode 100644
> index 000000000000..574003a8a2e4
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt8196-afe-common.h  --  Mediatek 8196 audio driver definitions
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#ifndef _MT_8196_AFE_COMMON_H_
> +#define _MT_8196_AFE_COMMON_H_

Add an empty line here for separation.

> +#include <sound/soc.h>
> +#include <sound/pcm.h>
> +#include <linux/clk.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>
> +#include "mt8196-reg.h"
> +#include "mtk-base-afe.h"

Please add empty lines between each group of headers. Headers are grouped
by path prefix.

Moreover, the contents of these header files are not required in this
header file. Please push these include statements to the files that
actually need them.

For the pointer to struct types, you can just forward declare the struct
types instead of including the whole header file:

    struct clk;
    struct mtk_base_afe;

[...]

> +struct mt8196_afe_private {
> +       struct clk **clk;

> +       struct clk_lookup **lookup;

This doesn't seem to be used.

> +       struct regmap *vlp_ck;

IIRC this will get removed since the tuner values will be moved to the
clk driver.

> +       int irq_cnt[MT8196_MEMIF_NUM];

> +       int dram_resource_counter;

This seems unused. Please remove.

> +
> +       /* xrun assert */
> +       int xrun_assert[MT8196_MEMIF_NUM];

This doesn't seem to do anything. It is initialized to zero and then
never used.

> +
> +       /* dai */
> +       void *dai_priv[MT8196_DAI_NUM];
> +
> +       /* mck */
> +       int mck_rate[MT8196_MCK_NUM];
> +
> +       /* channel merge */
> +       unsigned int cm_rate[CM_NUM];
> +       unsigned int cm_channels;
> +};
> +
> +int mt8196_dai_adda_register(struct mtk_base_afe *afe);
> +int mt8196_dai_i2s_register(struct mtk_base_afe *afe);
> +int mt8196_dai_tdm_register(struct mtk_base_afe *afe);
> +int mt8196_dai_set_priv(struct mtk_base_afe *afe, int id,
> +                       int priv_size, const void *priv_data);

Please add an empty line here.

> +#endif

[...]


ChenYu

