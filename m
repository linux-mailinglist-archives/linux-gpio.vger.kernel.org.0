Return-Path: <linux-gpio+bounces-39722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7YGUGllbT2psfAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:27:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FB72E41F
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=QobMdU3m;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39722-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39722-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E454C3028838
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70BA3EBF3D;
	Thu,  9 Jul 2026 08:26:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05525B663
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:26:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585611; cv=pass; b=NUKy9GlnegRIwYgy2mkfa83gGJetSdd1S218xMgJzaPb84DryoHINjba8h+uEAL34Ia0IGzYAXj5DJkMaOrSH809W+BMG+TAwPi4hHgtU5P416G/RFRyDQx064XOVadO5wNiAjJdPbfqkX/NiTXGdJpQdPrGblNMNj4kwRGOmMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585611; c=relaxed/simple;
	bh=rEc4tMgWwupqZCVKA26slP5/lbskBRKuTcsUa9vM/OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Is/+QDJ2Hfk4q0gPpqyiBrHFNZAlf3+IsRdloW0r20mCQ+zRdryM1i1+NmvvEnKDORfLILXyf3uSOLoyh2UYuqV2vKUSfC473xgXsCPTomhjo2yaD6gCPLqMsyN5JgpRvgRtbYmhK9X2huclwmjcHdOJdquWYp0obcJS3zP2usg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QobMdU3m; arc=pass smtp.client-ip=74.125.224.44
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-667a0f55a59so1929594d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783585608; cv=none;
        d=google.com; s=arc-20260327;
        b=PzI/NpGMU30x9d4rIlxgk5LZNYz7KnWV1bqNWdc3U0r2GhdcvYuJEO4fi7qAoMpWyr
         oDrfjKNasxqGmgHiJH6uuCW3zsR/MMRlwTxYeMDCQWPHGLIrADgh6V8luBmTj6o11kYu
         h7/xZ4KKAydoA+BITfE2vy+jcWK8uT5esgHt4h2Du4iEBMmOpq3GVz/L3ZIK+errwXcF
         vCVhZijw0Osj1FW9Bb+E72LTplRMseo+10SKmv9KAu4q9hwNd3qCOsbbmt9d6Sv0AhAc
         McBDfjxLfU8ITg9gpyH79fdmHnWKwBPZKhtIAHNJkk6cw8dsLwg+7TppkWd5d22GU3bt
         ZFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        fh=/q4p1oVYtOF4sKFSs+nsx1sZuQSWaNZw72HYWh+dkSQ=;
        b=kQi4Rgrn0cylpzI3fDvBV1uaiZvCG5iUGGlCS0pKB2u6YOOAwZ03YxDr8JJH+Mc8bK
         psfj5dQYDGWbb5xPLr02mECex37Q7vDVzTjru+qLC8XBpLOSKUPOY7oEYQSe+dHLAd2h
         eOsee4lYSMwpAVFjaWkU9lrJ7AzPPOYr2xUGE1fDC4QS7M2k5n5kBNk5vZ7mrZd0M0QV
         we02XO5mgFhHEmdKYd4dM2z44ALRCrZ1zsCEosAFLlICFDU6qkxdG1+NlGKcB3fLiXX3
         uoFmAha/V6ijs9CKUClitzNFigAl2MSrhWQSZLusf4eNt402iI9jaUp/uQC0+SUkWY3J
         RzRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585608; x=1784190408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        b=QobMdU3mM2p8rZSDsTLSZpkgtak5Mw9eyEBAesn04vVoa4dKGC1pgWX+hwwU4fHqpY
         ss8yUpLOBRbA7oNkUr6rMA+isEisn4rImXcEG8jZf1Ab5+eke7yZ8Fd46XWt4T0cPZtr
         PhUPo+SREnPZNAJIokryy40wna3MQ7G8YbVAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585608; x=1784190408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        b=kze7WKeqSsi2xOf7sRiGWORlRkEoyU+ExnfdLGePSUECE5uLvi1HYc+QoBCEIciE95
         WkInATzeIn1VyY+KTnVPvoaL1dFs/QpeLNaeCyLAbKa05l5Rw7JOEY91zonDFc1WAJPT
         XYleIauRDLqY6lcbwV45Aqb0JUFCpqu2ec6gA2E1RqkXKVjJzMmJq0akLy7JfDxUpWTY
         yVkPG/c1hhD71LD6f2mZc5MKy6c8YBCwAvw3SQ1Ut3CZ9AiREiAQo5vFNni3mZNnWKef
         PKFyWpb9bWm3sbfIdbl5ewVSNHv1K55tMiSUKVj0NjuJRQuXK5vUnLQX0n7454U+a7QV
         72cA==
X-Forwarded-Encrypted: i=1; AHgh+RoF08WBfWA8Drr2aE1o13rpJF8w4/SKTI+lx1ozWLDqeEsHOcVJBzZQQ9CbJyF96ivBMaNBgHoi2clP@vger.kernel.org
X-Gm-Message-State: AOJu0YxJbuaG+Tvnfph1ziZDbeETgR8xZMIZ4QNAoDut92i/Gv9N6vGu
	n6fz/1hElFDScE+HE28ESkrIpwznEZAdcc9YZxuL1DV8zXvnjPzid0L2q7LVQc1H7dHATfKqP0V
	MEke3mvDONB6pDfNtr5EuV5mMWo6GYNJCVoJmGmvo
X-Gm-Gg: AfdE7clBicGrDzf4j7dFTvapNscIy5nYonTQFhm2EghSVKRDwCWNEk2DjjYW71B14H9
	VuIses2qEx4SSl6Cy3eAbkXRRFOHH+hoM6W/Fk6yGJN7fIhnRwMrgRPWCec71940aI3GHuVK+uq
	txQIFwL6LgRhQwtanVaRobQgVV1+PUTVujeNYp7LpwLEO0hE9WnvusMugJAM8txcWFiRhREO+4j
	ILWPRh+XlSYwzURKcOdQFwQvgEKMLWm2YEC1xEYQS+INjKFF6MH2VWGIn1IGcNe311MbWLu13fz
	Du1adznyOZLetofydxHgz8FUbnY=
X-Received: by 2002:a05:690e:4382:b0:667:8b91:240f with SMTP id
 956f58d0204a3-6679f1f6a3cmr3478844d50.86.1783585607965; Thu, 09 Jul 2026
 01:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-2-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-2-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 16:26:36 +0800
X-Gm-Features: AUfX_mz-SC1jbPIc5jRR2EosAZtRTmwf_K_gSweOzyKAAmx00VXSsHTmWBxIzq0
Message-ID: <CAGXv+5HQLzZeoHue=uziuijpu6OiLHXnW8NiwY8j7aggGKt2Yw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39722-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:justin.yeh@mediatek.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,lists.infradead.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:from_mime,chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC4FB72E41F

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
>
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt81=
35.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implement=
s the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implement=
s the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But see below.

> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c      |  6 ++----
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++----------
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
>  3 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/m=
ediatek/pinctrl-moore.c
> index 17e30f83dc19..38f15dbe9a28 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -594,7 +594,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>         chip->base              =3D -1;
>         chip->ngpio             =3D hw->soc->npins;
>
> -       ret =3D gpiochip_add_data(chip, hw);
> +       ret =3D devm_gpiochip_add_data(hw->dev, chip, hw);
>         if (ret < 0)
>                 return ret;
>
> @@ -608,10 +608,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw=
)
>         if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
>                 ret =3D gpiochip_add_pin_range(chip, dev_name(hw->dev), 0=
, 0,
>                                              chip->ngpio);
> -               if (ret < 0) {
> -                       gpiochip_remove(chip);
> +               if (ret < 0)
>                         return ret;
> -               }
>         }
>
>         return 0;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index dd2c8aa03938..791eddd7a2c6 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1130,30 +1130,24 @@ int mtk_pctrl_init(struct platform_device *pdev,
>         pctl->chip->parent =3D &pdev->dev;
>         pctl->chip->base =3D -1;
>
> -       ret =3D gpiochip_add_data(pctl->chip, pctl);
> +       ret =3D devm_gpiochip_add_data(&pdev->dev, pctl->chip, pctl);
>         if (ret)
>                 return -EINVAL;
>
>         /* Register the GPIO to pin mappings. */
>         ret =3D gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
>                         0, 0, pctl->devdata->npins);
> -       if (ret) {
> -               ret =3D -EINVAL;
> -               goto chip_error;
> -       }
> +       if (ret)
> +               return -EINVAL;
>
>         /* Only initialize EINT if we have EINT pins */
>         if (data->eint_hw.ap_num > 0) {
>                 ret =3D mtk_eint_init(pctl, pdev);

I think you would also need some matching cleanup function for mtk_eint_ini=
t()
or you end up with a dangling IRQ domain and mappings that are active but
have invalid chain handlers.

This would probably be a separate patch.

>                 if (ret)
> -                       goto chip_error;
> +                       return ret;
>         }
>
>         return 0;
> -
> -chip_error:
> -       gpiochip_remove(pctl->chip);
> -       return ret;
>  }
>
>  int mtk_pctrl_common_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 23f04b24fd65..09098b68f725 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -957,7 +957,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>         chip->base              =3D -1;
>         chip->ngpio             =3D hw->soc->npins;
>
> -       ret =3D gpiochip_add_data(chip, hw);
> +       ret =3D devm_gpiochip_add_data(hw->dev, chip, hw);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.45.2
>
>

