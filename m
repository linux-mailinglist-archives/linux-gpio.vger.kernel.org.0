Return-Path: <linux-gpio+bounces-39721-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YsUFA7JcT2rZfAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39721-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:32:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189372E535
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:32:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=b1f2dl+d;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39721-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39721-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 799E7307182F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EA83F1AA8;
	Thu,  9 Jul 2026 08:24:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753BE3EDE6A
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:24:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585451; cv=pass; b=Q80GzB/5mPNc1G60x/X563irDakOhGIN3lALWF3Jq9bucWHMZIXBwd2C15lB2QU6XRjGXE/sPN0+/FrQTwO+dCBxySmQGFunY/TeNT4DExnKT5H90WeuNPEVMO7Cz5lJQ2w8mk/scbdiC733NFGYqbsk6IEzHR7jaAEfVima8OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585451; c=relaxed/simple;
	bh=83fAZedUpfbS9hlW9CcFENxBjXZWgkMLstGCLjnB9kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSu3gAPMO3vdtCRa0HUgx2HRkefDMBMalk4yZ6n8/FmxPn0OBvuwx7ZkuJZlGFVErufpjP4yHYHyOfNoKe5Ld8hEh4ufZ8YJQPXTbDuRD9xmTIZGdsrumCvgnuirNPf47Zohcs7EJ/yMkxdoNGhjx3ze7GsWV0uK8R+1UQq8tM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b1f2dl+d; arc=pass smtp.client-ip=74.125.224.44
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664c6304683so1530930d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783585448; cv=none;
        d=google.com; s=arc-20260327;
        b=eD1RWcmNCJDAo9n3K5ah93UWCfJQ17HXsA84VlMFOXhQIIwDr+p9zwUgtJVce6z2sQ
         bOjAo30UUYxgTuixrQm3VTbhFplzwgb05wrIOSgegsVy9x1d0eCjEqxXNERbAhEJbuLh
         9uwMw/DFSCuFx2bw75abaaH3zsX2kB8CDRQ+04SRM7d+ng4FvOcghJKCEACrsnQxXsf8
         4x/snhbQejc8/4iSfwtfrRF1aw8VoDVkA5eOUCYuJVnIsu29PXpIrJIuKcrnuIfKn5mr
         bvzpUJKIVuPBNMqSYrgEytyQEXLGApeg8hRbBNstwIUVdMainU/1/RiZNClhzskAjqU+
         KR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=;
        fh=+ECux3MgzzMqlZttbM9ucXclfO+jBiGLmEF0Pa/087M=;
        b=GI8A9cK1pv4lnVNVV391Hfv9loOP+701RUkNSzt15jQ5kmaLdbyzBD7s7aGO1mU9cl
         qraHyl82FKfc2P5THr3L7klHoVN2QyuzfV5FXJuVpo45mZ0OR2VYM6Ft0TtZEE1i5yyT
         D3NTdkz+2umQE8Mgx0T10jcjMhXWlNCCPkFjd7f665hxXGnUYQMWx4Z6CIWYfL9iNrrB
         1ZC4nKnMM2sS0+8YDrFR5z61u8eTKprj7DZi+8SKQkFBeuKDoe0iIRs+7sMNucAB1cHk
         d3ojiaRZxPmIuKRxIB51QgLz81IZGBf+CVJuQ/mCAR8fdeoUh1w0Llsh13qw/ly3a+n9
         qWMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585448; x=1784190248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=;
        b=b1f2dl+dJJ6zxOf7a54V4z+FyZZT0QokzwRzgihi6CNp+UACjV5qfou86ody7q0kbh
         AcCm+PuzSV9NZWEWU7DJR31ea/wOoYsK8NNTCOoGmWqXLe+N3TsB/JWJHXYWUiaixP+r
         c7owgp48uVpWNe+UCe4m2LDjfRoaAeeKvPc1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585448; x=1784190248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=;
        b=gxzPPeyUB/nn6kPADloHn8/qBqL4PKanHh4IPKGGWQeb99HBq3SEfPl6kOrk6s3qfh
         59sascquThhnFFKgpVPqVlsT2OxvRoIfdItxybZe61mAmLH6Bz+/wwYdq7S/AJ6beFhn
         WE9zgxlIvUKCCfhvCkOu18Pd0K2YMG5bsq42E7xPP5h1doAT1DBnyEn5/RVpj6LDHe0Q
         FUGkIVciCKnRDR1tNvoHNNab6lqLYlK716Jt+C7Y+bHPgB+YXsTxQy/TxrffeUktKwJm
         llU8qtgkHVEPx+i7nTVi5PYR5zFrCpOlg+T/LEUbX2JLOg1PkGDV96gNLA57rgBUbRwd
         aRYA==
X-Forwarded-Encrypted: i=1; AHgh+RpuUB4bcXWsmElqOFM8UEkX5Ldcq/8tB/rXh2/9xx9qVTodomw4hpmG1Wu1NPgdJCm51+qkiUra976A@vger.kernel.org
X-Gm-Message-State: AOJu0YwtkCo7p0Oez9C8TIa64FBRyiPH1gFKiUWEOWBhM9uQtl613qhE
	UuQYFZN6c+WsSygqEU2RkZoezX167HqsO7yFtgoBoqD4zwsoS6K1NnxU6Rv6xZqCHGnFPV27vm5
	zKLa35L79y0xj2z3sEGximlbeBmz/4XklqECoNsNy
X-Gm-Gg: AfdE7clJ+dCffl0WUfb92GuMUY6KmN9eUgAAGYb5fE2VJjB7WYbjXCjGSGWt52QtLo8
	F0/xLUC8kB6DgscppUiDLfCGMLq7tSliEjxnXwBVO7kC+2HcVPPxnLyEzqHL0X+/lCT/QG4M8Z6
	D7oS8VJ9Qbrg5NncfgGq2ujFlrC3f/qTavawRH9Us/lVqhcvILnHAt6XjlXqFUod49MNjV+gtWJ
	a8E2WXXzTwCI0vCliycNXt0iQcReskEauT4Komuq+UxHGA84zZi1Ozz96bAzoEV/lv2ffs1z5FE
	alTrlSJmt7dPWAjTbwymtzPH8dM=
X-Received: by 2002:a05:690e:1488:b0:667:b0e0:8291 with SMTP id
 956f58d0204a3-667b0e08d1cmr3225605d50.76.1783585448536; Thu, 09 Jul 2026
 01:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-3-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-3-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 16:23:57 +0800
X-Gm-Features: AVVi8CeFISWopYSxs7SQ18PIDav4QpRQGIlGdzLDlOUjsSH_QaMt2NFEbeix8RQ
Message-ID: <CAGXv+5GOgtOGrnpZkJTeLPwW1t3hop6tXirGmV6thqP1q9REUA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] pinctrl: mediatek: allow common drivers to be
 built as modules
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39721-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,mediatek.com:email,chromium.org:from_mime,chromium.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1189372E535

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The MediaTek SoC pinctrl drivers link against the shared implementations
> in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
> were built-in only: their Kconfig symbols were bool, they did not export
> their entry points and they carried no MODULE_LICENSE().
>
> To let the individual SoC drivers be built as loadable modules (required
> for Android GKI + vendor_dlkm, where vendor drivers must live outside the
> GKI vmlinux), the shared code they depend on has to be modular too.
> Otherwise selecting a SoC driver as =3Dm forces the common symbol to =3Dy=
 and
> the resulting module fails to link against the unexported common entry
> points.
>
> Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
> tristate, export the entry points used by the SoC drivers, and add
> MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.
>
> The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
> never exported. It is called directly by SoC drivers such as mt7623, so
> export it as well to keep those drivers linking once they are modular.
>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig                 | 6 +++---
>  drivers/pinctrl/mediatek/pinctrl-moore.c         | 5 +++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 1 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 8 ++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtmips.c        | 4 ++++
>  5 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/=
Kconfig
> index 97980cc28b9c..864e7ffc6044 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -11,7 +11,7 @@ config EINT_MTK
>         default PINCTRL_MTK_PARIS
>
>  config PINCTRL_MTK
> -       bool
> +       tristate
>         depends on OF
>         select PINMUX
>         select GENERIC_PINCONF
> @@ -22,13 +22,13 @@ config PINCTRL_MTK_V2
>         tristate
>
>  config PINCTRL_MTK_MTMIPS
> -       bool
> +       tristate
>         depends on RALINK
>         select PINMUX
>         select GENERIC_PINCONF
>
>  config PINCTRL_MTK_MOORE
> -       bool
> +       tristate
>         depends on OF
>         select GENERIC_PINCONF
>         select GENERIC_PINCTRL_GROUPS
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/m=
ediatek/pinctrl-moore.c
> index 38f15dbe9a28..3247622911cd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/module.h>
>
>  #include <linux/pinctrl/consumer.h>
>
> @@ -743,3 +744,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *p=
dev,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_moore_pinctrl_probe);

Maybe use a separate namespace, like "MTK_PINCTRL"? (Use EXPORT_SYMBOL_NS()=
)

Otherwise seems correct.

> +
> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Moore");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/p=
inctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4918d38abfc2..3813dfb0fa7d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -69,6 +69,7 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u=
32 mask, u32 set)
>
>         spin_unlock_irqrestore(&pctl->lock, flags);
>  }
> +EXPORT_SYMBOL_GPL(mtk_rmw);
>
>  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>                                    const struct mtk_pin_desc *desc,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index 791eddd7a2c6..a58015b508af 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -190,6 +191,7 @@ int mtk_pconf_spec_set_ies_smt_range(struct regmap *r=
egmap,
>         regmap_write(regmap, reg_addr, bit);
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pconf_spec_set_ies_smt_range);
>
>  static const struct mtk_pin_drv_grp *mtk_find_pin_drv_grp_by_pin(
>                 struct mtk_pinctrl *pctl,  unsigned long pin) {
> @@ -297,6 +299,7 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *re=
gmap,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_spec_pull_set_samereg);
>
>  static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>                 unsigned int pin, bool enable, bool isup, unsigned int ar=
g)
> @@ -1149,6 +1152,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_init);
>
>  int mtk_pctrl_common_probe(struct platform_device *pdev)
>  {
> @@ -1160,3 +1164,7 @@ int mtk_pctrl_common_probe(struct platform_device *=
pdev)
>
>         return mtk_pctrl_init(pdev, data, NULL);
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_common_probe);
> +
> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/=
mediatek/pinctrl-mtmips.c
> index efd77b6c56a1..c9d9de68e282 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> @@ -349,3 +349,7 @@ int mtmips_pinctrl_init(struct platform_device *pdev,
>
>         return PTR_ERR_OR_ZERO(dev);
>  }
> +EXPORT_SYMBOL_GPL(mtmips_pinctrl_init);
> +
> +MODULE_DESCRIPTION("MediaTek MIPS Pinctrl Common Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.45.2
>
>

