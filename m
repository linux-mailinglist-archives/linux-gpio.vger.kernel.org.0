Return-Path: <linux-gpio+bounces-21371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E88AAD5369
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC543AB0D0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36C821C19C;
	Wed, 11 Jun 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="bfUeNl7I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A82E6107;
	Wed, 11 Jun 2025 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640360; cv=pass; b=qX3V8hypHbB6ZoezQGaHzg9sHuon96VzyG2tqKwRs3B8YYz15Y7lcJtYIXsQh9eQqGPOfhOHnK71TZFUDKuRWKNAqrphBGkysajduRhf/A+2gRYVJ7jGHBmt0yqmEkiCKCa6GINAryVG1TctM6PwNKHbCrb9aq/8zIDZGT5RJXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640360; c=relaxed/simple;
	bh=EefSXwOg6EnlDbaCsRdSPLkeXbRTPj72FblAFX989Pg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=krv01QXHZV0RgnCFYzOW1fIxo33kBb5HvYzPZ9qfUj/+iPZlqnpRu7c+9Eaups7N+ZslJwyjpAMItDP1gNTOFNfkalkwVeKtykzSeInoWTvOicbfGlo6fnae9z+mvbLnkgokZUxmOZytfpkYcxjJsH69LwCKhmiTfsNndPnIzXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=bfUeNl7I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1749640329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QG5faVQFbIILrQTW0ZBXfFI76UtWGMdYguxmkoNxLeYGZxz5CYct0Yx9iNLeae3/tCHH2I4N5a6bsxQ4mRDVLOBAlg/IZNk4PeTxILhhlr/u2hG/nICo8JhnfZa73EWj3mgeWLCpQLOQfNBv142DEpwNxQBscR6Rpe0r8P8wW4Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749640329; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YGZIHHTdUio4mkdGxDuE5j03JDM6UM0QavShcW0kz4s=; 
	b=OJ4Q9V8NQwUR04DQtcMguwUsuXp0JconZeDK71kK+3VwSMwd78fbknjfvi5uSAH0v8UO8FZuG5s1UZhNPzRWtQW0erifIJEhOcYwZWf8q730GpGYjQmRQzJqSDy9nd7rmdw78CBZ0dJLkJpJbdwoeXBm4lY6rEYw6XENBFPJ09Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749640329;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YGZIHHTdUio4mkdGxDuE5j03JDM6UM0QavShcW0kz4s=;
	b=bfUeNl7IIh2Pr0yrDjsQ+LpveA1vvUP5D3xOghqP6cidbjLzkL8vOt0OtQHTLlqM
	pFooA2LJg3iteB8yqobdy0VEnFFKR130gk7YxuCBNZpKqLUMOFYjvhPax9hnDm73bJv
	6OAMhPUge9VeaEgSM/kl1OC4xsXVfwjRAVNFLxSg=
Received: by mx.zohomail.com with SMTPS id 1749640327308121.2139749325595;
	Wed, 11 Jun 2025 04:12:07 -0700 (PDT)
Message-ID: <8e551fad9bd1627b9ed6f20be7d88bdc3438d482.camel@collabora.com>
Subject: Re: [PATCH v4 01/10] ASoC: mediatek: common: modify mtk afe
 platform driver for mt8196
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Date: Wed, 11 Jun 2025 13:12:01 +0200
In-Reply-To: <20250610092852.21986-2-darren.ye@mediatek.com>
References: <20250610092852.21986-1-darren.ye@mediatek.com>
	 <20250610092852.21986-2-darren.ye@mediatek.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Tue, 2025-06-10 at 17:27 +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
>=20
> Mofify the pcm pointer interface to support 64-bit address access.
>=20
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
> =C2=A0.../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++----=
-
> --
> =C2=A0.../mediatek/common/mtk-afe-platform-driver.h |=C2=A0 2 +
> =C2=A02 files changed, 33 insertions(+), 16 deletions(-)
>=20
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 6b6330583941..a86594dca2b7 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct
> snd_soc_component *component,
> =C2=A0	const struct mtk_base_memif_data *memif_data =3D memif->data;
> =C2=A0	struct regmap *regmap =3D afe->regmap;
> =C2=A0	struct device *dev =3D afe->dev;
> -	int reg_ofs_base =3D memif_data->reg_ofs_base;
> -	int reg_ofs_cur =3D memif_data->reg_ofs_cur;
> -	unsigned int hw_ptr =3D 0, hw_base =3D 0;
> -	int ret, pcm_ptr_bytes;
> -
> -	ret =3D regmap_read(regmap, reg_ofs_cur, &hw_ptr);
> -	if (ret || hw_ptr =3D=3D 0) {
> -		dev_err(dev, "%s hw_ptr err\n", __func__);
> -		pcm_ptr_bytes =3D 0;
> +	unsigned int hw_ptr_lower32 =3D 0, hw_ptr_upper32 =3D 0;
> +	unsigned int hw_base_lower32 =3D 0, hw_base_upper32 =3D 0;
> +	unsigned long long hw_ptr =3D 0, hw_base =3D 0;
> +	int ret;
> +	unsigned long long pcm_ptr_bytes =3D 0;
> +
> +	ret =3D regmap_read(regmap, memif_data->reg_ofs_cur,
> &hw_ptr_lower32);
> +	if (ret || hw_ptr_lower32 =3D=3D 0) {
> +		dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
> =C2=A0		goto POINTER_RETURN_FRAMES;
> =C2=A0	}
> =C2=A0
> -	ret =3D regmap_read(regmap, reg_ofs_base, &hw_base);
> -	if (ret || hw_base =3D=3D 0) {
> -		dev_err(dev, "%s hw_ptr err\n", __func__);
> -		pcm_ptr_bytes =3D 0;
> -		goto POINTER_RETURN_FRAMES;
> +	if (memif_data->reg_ofs_cur_msb) {
> +		ret =3D regmap_read(regmap, memif_data-
> >reg_ofs_cur_msb, &hw_ptr_upper32);
> +		if (ret) {
> +			dev_err(dev, "%s hw_ptr_upper32 err\n",
> __func__);
> +			goto POINTER_RETURN_FRAMES;
> +		}
> =C2=A0	}
> =C2=A0
> -	pcm_ptr_bytes =3D hw_ptr - hw_base;
> +	ret =3D regmap_read(regmap, memif_data->reg_ofs_base,
> &hw_base_lower32);
> +	if (ret || hw_base_lower32 =3D=3D 0) {
> +		dev_err(dev, "%s hw_base_lower32 err\n", __func__);
> +		goto POINTER_RETURN_FRAMES;
> +	}
> +	if (memif_data->reg_ofs_base_msb) {
> +		ret =3D regmap_read(regmap, memif_data-
> >reg_ofs_base_msb, &hw_base_upper32);
> +		if (ret) {
> +			dev_err(dev, "%s hw_base_upper32 err\n",
> __func__);
> +			goto POINTER_RETURN_FRAMES;
> +		}
> +	}
> +	hw_ptr =3D ((unsigned long long)hw_ptr_upper32 << 32) +
> hw_ptr_lower32;
> +	hw_base =3D ((unsigned long long)hw_base_upper32 << 32) +
> hw_base_lower32;
> =C2=A0
> =C2=A0POINTER_RETURN_FRAMES:
> -	return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
> +	pcm_ptr_bytes =3D MTK_WORD_SIZE_ALIGN(hw_ptr - hw_base);
> +	return bytes_to_frames(substream->runtime,
> (ssize_t)pcm_ptr_bytes);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
> =C2=A0
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..9809e60db511 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
> =C2=A0#define AFE_PCM_NAME "mtk-afe-pcm"
> =C2=A0extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
> =C2=A0
> +#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))
> +
> =C2=A0struct mtk_base_afe;
> =C2=A0struct snd_pcm;
> =C2=A0struct snd_soc_component;

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> # on
Mediatek Genio 510 EVK and Genio 1200 EVK

