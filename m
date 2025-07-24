Return-Path: <linux-gpio+bounces-23749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BD7B1057B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 727377A1E48
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1049F24DD13;
	Thu, 24 Jul 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSfngbi+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE861200BAE
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348596; cv=none; b=WyEGBIwq0o9K8h+wNETOvWnHOlKsCfiRMIwm0NUz1+dZh5wk1KnLM4slZjRczP8J+GDAqHzkJMAni5NQkAYe8hJi4AtJwpQUlgKnB/tRJAKBjgNfiTfjN8a1WuJKLHhG9eXAJK3wrsCR/VJtD5TcipzYvn67Wyuee0S/rXMv5rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348596; c=relaxed/simple;
	bh=+Z5k7cYpy/tb3WBWJYgYNu2N1HaIlkdbbuwQhmQGG2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYV1P7zbCfeysplCYa9eoXewt9t0wf6K/vgbvCP8AlNAkzty4vi+PZ6W3u8dkp44pHSv5YgS66sL4by1iT5a5NYQaB1X/H3HPOdJUckMdB3hl89h3il3nYHih6To0JUs19kqpUrGRVfWWiuT6LOFPosgXkadn58dWZBuQC+iOC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSfngbi+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55628eaec6cso720946e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753348593; x=1753953393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=;
        b=NSfngbi+EdP+b2lqHxlZKJqnzPS4zhclgoqqq+ra7+Hv99LcP+FSVIsZaJcs2FhecI
         nR9kLmfIuVJHiOS0S3vMmxv/gXOZWj5EG2VMZihq7UxEuaMt0s945yQ6sOKOTC7FRKfj
         e4/NLsRu8RpKVatV8x3jxfwUFT8MDZaybw1lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348593; x=1753953393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=;
        b=pZX0EIba6ujfr6YnkGK0+WSVzevGm5UH4+vgnetmPhmIAx7S37Oc6pnR1ZymfdXucE
         ffnL2yPse1NcmKJ+iwwjxUagbG9WNo2BL+LK/lo3hN3+QZK9r7MNtkAbJEX0m6Wm/iG4
         M1Nfg9z9dSZZijR5zfGhhwWwWa5CAwSjIDpM7OIDnD3Ikrpes/xsWIZy1h2XPBO+I6Xa
         9ADTCGnY3/DwzaCtjhk/dp60c8jKk6e5aixs6bNYf1fWqY5/ejqQJx/kgj3MToIQtMqQ
         JkHDx40Nf+7G4nWg0pgn2/03ykOqhLZDqxYfbOZu1NtUiHqfHOS733AZ/0BckbNNMqGF
         bshw==
X-Forwarded-Encrypted: i=1; AJvYcCV0nesTcIEJRVY6d3tCBhSlE5nifGrqokWTebtS5Vq6vELtg9sbUX5U/NM40mNXtsbW2QTbehlpDuSM@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRLH10zYMI+toxOA3qXkIIuglSwWJnsgFEIIY2aynMG28QugX
	0gKu+lMXo/3/qbqWxnJaLNusUPPDH2jmtJbp9D8luJSjRoTRUzLHo7sH0mFpCYC0kMcDcldX/g4
	6sBoLM7YriD0jAQn0KrKO0y99+hlP80oCnSxd7ssO
X-Gm-Gg: ASbGncu4treL8lUV3Hv3H+shtcd7DvRQKSMxMD8Yzt31hDZxhBHQiUfjn77xQ4A7AjG
	E8CfDO4Ttr8sRjJNYExvThniaop8xl2TAS3ymv1qfS22n/qmdEjfPhbQ3lXCgEdbRYKoKxpWjPs
	2gUxqIW85KKWD//OAb4tPY1of5rEWleCqNGgO5cI5NT8/rl3XqhCuwEMl3LHQtTU/bCD72d0so7
	+a+qgnQRaKsM2wumYJfpiQrbm3o4IZDlAU=
X-Google-Smtp-Source: AGHT+IFazo0IJsf/W4w5gkkS9NANKkfwPsnIOoIE7mqPwq0TufYlLOotKobMGK5+6Hu6w3hpGvP3VOsw43jDOtB0xs8=
X-Received: by 2002:a05:6512:3ba6:b0:553:6583:8e6 with SMTP id
 2adb3069b0e04-55a5136bd25mr1849929e87.15.1753348592903; Thu, 24 Jul 2025
 02:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:21 +0800
X-Gm-Features: Ac12FXzsHRsmJR2EJuPhkIesX-COS28ovNftNstiUszbMRhNBb7-HPz6xQpMdw4
Message-ID: <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
Subject: Re: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow
 specifying resets
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Even though the DPI IP has a reset bit on all MediaTek SoCs, it
> is optional, and has always been unused until MT8195; specifically:
> on older SoCs, like MT8173, the reset bit is located in MMSYS, and
> on newer SoCs, like MT8195, it is located in VDOSYS.
>
> For this reason, allow specifying the resets and reset-names on
> all MediaTek SoCs.
>
> Those properties are optional because there are multiple ways to
> reset this IP and the reset lines in MM/VDO are used only if the
> IP cannot perform warm-reset.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index b659d79393a8..eb4f276e8dc4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -102,6 +102,13 @@ properties:
>        - port@0
>        - port@1
>
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: dpi
> +

Do we really need the name if there is only one though?

>  required:
>    - compatible
>    - reg
> --
> 2.50.1
>

