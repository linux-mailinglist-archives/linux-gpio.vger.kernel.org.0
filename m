Return-Path: <linux-gpio+bounces-23615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01828B0D3CB
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 09:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A323A709A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 07:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973342DA751;
	Tue, 22 Jul 2025 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B79FXuzW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C22E611B
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169901; cv=none; b=HOYz3VuAoFqVGQrb1ol8TdW5tTlc/k4i0ZJKoQcFrzFc4MPHZciIPnvxWqDiXWqatGOB1txQVg8FAwIit9lYw5MDC05Hlo/Aqs5HU8FYQT4ocFh5YGbNDgwDKtObcXO74k8jFMB2nav1QVFbhLPO2+PHYedPPM4As2PhxZW9h2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169901; c=relaxed/simple;
	bh=GCED/hlCsBSaeWbx6CONP03k4BitQzfwd38u+tep5bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/+/TC0WePQty/99AMMWZOKZS/rI1LmY9C2ztfMN491RER7e5ViryEQT9jTYdRs0iN9626sQaFXHluZxraz4HkyayDYi+4xjbM3zZoNec8IHYuE4JWw00sp5YXHTnP9C6T5jCRia655XZH+Mv4gcWL1rh9tOZqkMH2BEROl7cHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B79FXuzW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b4876dfecso54682781fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753169897; x=1753774697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=;
        b=B79FXuzWRFyukO7ROF0wuBa1bIfITECa+33OFDXA8OdaAlIDbHvLn1mhnWGIzRBOni
         FDx3gqAa5fQtiUd8gi3blCz+PECxLQd4dxIOQ3CSMQoj1jo5GUsAnd8kcUOBvY6bzvA6
         ePEE6EJMm6orGKU4XXVGMkmcQIHZmGWRN8yro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169897; x=1753774697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=;
        b=hXg83JB5GTsgiikkFO3cjM1ZoX5lEIpAGXJV9hYjRoHEd6kRsDkWu4fdb9mxvm8EkU
         eEzyqe66hpKACQFXu4dnS0stPqQ6jyvVmK7XhwRNR0Jx5kl8ES99jTkJgacASvfDb3QO
         /NsxPOLFQK/istCtfIoYhPzAVhll84vr1bl5m7p2WS40Kb90mu8HwM2df7NMcHc3rqRd
         ZdoyogEX7YlZJ9/VsvQEnC77hu+klR7Pnn95WYbgpcIbn3Zh6HeQJzjrR4jjX0HmPTkk
         nK0DIPjWUWPDIKQqxXTl1KA18LAPCRddlqrMW4FDpr1hphD4P/bgw934Rasg4sDTMTfy
         LcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2aRaFxxZZiYIeodFzAdJLnBQ6QILBZUeDi66T8cOe2r27boXFZd3d6ydoUdHLqbo685cMD+YG1hkL@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAD6MNRji2zo+BA8fgC09XLYUQnyatwYvu/3Dl/w1nVguC5VV
	ju/x9EqEBr0hG9FMhc9nBMKxVjLEYueF0sHp7Y0iUbbFfgQMtcE8GJA/srWiiBHLxPFstryW3Qm
	WDlotUO+KRTLMnc6m0u5dFYLlFJKonOp3uPL08hyB
X-Gm-Gg: ASbGncsLjEK1/XrKxhyTNS6RChUHHiPXMf+KzXYSTGgzg7/0bqj0On7lIbIcRBU6Gpy
	3NeKG84ewTTPe9e/bK6oFyODBlXHOpm83AuGFDtSsvzrWJf/6Xzv61wCQnYBsO1tLMscPBjw6B/
	mT+oZBSRd26eaAUBwi3knd4UekMOny1UNjVSPnt4IpT94ljDzNl68v2wCu2ABJDACTuDp6MvFwq
	E/O81YPOIXyIndHdho6vSGdTzvsDaNF42w=
X-Google-Smtp-Source: AGHT+IHIEXGhSQKNLTR3joj0qjwcB1T77Dp8iSOMV7/+3N11OuF7i8eFvD4xY1tQQW+z6w+ni2WlHZTcDNTAtH00llM=
X-Received: by 2002:a2e:b8d1:0:b0:32a:e7b9:1dc9 with SMTP id
 38308e7fff4ca-330d24f7ef4mr6438751fa.3.1753169896490; Tue, 22 Jul 2025
 00:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-2-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-2-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 15:38:05 +0800
X-Gm-Features: Ac12FXx-ybyxFVMO-dZm2uMvhIKao-9eybKP9nlbQtMW_02h967WNikXB-wqqjk
Message-ID: <CAGXv+5HQcGiUnsaOxHz86Y8JxUHh6e0ypusFEBLKchNx3fqKBA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 7:33=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Mofify the pcm pointer interface to support 64-bit address access.

  ^ Modify

And the subject should say the same, or shorter:

    Support 64-bit addresses in PCM pointer callback

> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
>  .../mediatek/common/mtk-afe-platform-driver.h |  2 +
>  2 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/=
soc/mediatek/common/mtk-afe-platform-driver.c
> index 70fd05d5ff48..cab4ef035199 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_=
component *component,
>         const struct mtk_base_memif_data *memif_data =3D memif->data;
>         struct regmap *regmap =3D afe->regmap;
>         struct device *dev =3D afe->dev;
> -       int reg_ofs_base =3D memif_data->reg_ofs_base;
> -       int reg_ofs_cur =3D memif_data->reg_ofs_cur;
> -       unsigned int hw_ptr =3D 0, hw_base =3D 0;
> -       int ret, pcm_ptr_bytes;
> -
> -       ret =3D regmap_read(regmap, reg_ofs_cur, &hw_ptr);
> -       if (ret || hw_ptr =3D=3D 0) {
> -               dev_err(dev, "%s hw_ptr err\n", __func__);
> -               pcm_ptr_bytes =3D 0;
> +       unsigned int hw_ptr_lower32 =3D 0, hw_ptr_upper32 =3D 0;
> +       unsigned int hw_base_lower32 =3D 0, hw_base_upper32 =3D 0;
> +       unsigned long long hw_ptr =3D 0, hw_base =3D 0;
> +       int ret;
> +       unsigned long long pcm_ptr_bytes =3D 0;
> +
> +       ret =3D regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lowe=
r32);
> +       if (ret || hw_ptr_lower32 =3D=3D 0) {

I'm not sure how the hardware is, but I think hw_ptr_lower32 =3D=3D 0
should no longer be a failure, since it could be 0x100000000 or
some other address with the lower 32-bits all zero. Instead the
check should be done once the addresses are put together.

> +               dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
>                 goto POINTER_RETURN_FRAMES;

This is out of scope, but maybe this should just return zero directly
to simplify reading.

>         }
>
> -       ret =3D regmap_read(regmap, reg_ofs_base, &hw_base);
> -       if (ret || hw_base =3D=3D 0) {
> -               dev_err(dev, "%s hw_ptr err\n", __func__);
> -               pcm_ptr_bytes =3D 0;
> -               goto POINTER_RETURN_FRAMES;
> +       if (memif_data->reg_ofs_cur_msb) {
> +               ret =3D regmap_read(regmap, memif_data->reg_ofs_cur_msb, =
&hw_ptr_upper32);
> +               if (ret) {
> +                       dev_err(dev, "%s hw_ptr_upper32 err\n", __func__)=
;
> +                       goto POINTER_RETURN_FRAMES;
> +               }
>         }
>
> -       pcm_ptr_bytes =3D hw_ptr - hw_base;
> +       ret =3D regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lo=
wer32);
> +       if (ret || hw_base_lower32 =3D=3D 0) {

Same here.

> +               dev_err(dev, "%s hw_base_lower32 err\n", __func__);
> +               goto POINTER_RETURN_FRAMES;
> +       }
> +       if (memif_data->reg_ofs_base_msb) {
> +               ret =3D regmap_read(regmap, memif_data->reg_ofs_base_msb,=
 &hw_base_upper32);
> +               if (ret) {
> +                       dev_err(dev, "%s hw_base_upper32 err\n", __func__=
);
> +                       goto POINTER_RETURN_FRAMES;
> +               }
> +       }
> +       hw_ptr =3D ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lo=
wer32;
> +       hw_base =3D ((unsigned long long)hw_base_upper32 << 32) + hw_base=
_lower32;

Instead the check should be here. And to follow the original logic,
if either pointer value is zero, the function should return zero here
directly.


ChenYu

>  POINTER_RETURN_FRAMES:
> -       return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
> +       pcm_ptr_bytes =3D MTK_ALIGN_16BYTES(hw_ptr - hw_base);
> +       return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes=
);
>  }
>  EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
>
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/=
soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..71070b26f8f8 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
>  #define AFE_PCM_NAME "mtk-afe-pcm"
>  extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
>
> +#define MTK_ALIGN_16BYTES(x) ((x) & GENMASK_ULL(39, 4))
> +
>  struct mtk_base_afe;
>  struct snd_pcm;
>  struct snd_soc_component;
> --
> 2.45.2
>
>

