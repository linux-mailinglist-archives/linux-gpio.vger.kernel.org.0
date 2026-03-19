Return-Path: <linux-gpio+bounces-33788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBScKt+Du2nhlAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:04:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5492C6160
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28A8D3034544
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376C228CF77;
	Thu, 19 Mar 2026 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mFvVwijW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD911F92E
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 05:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773896667; cv=pass; b=uZzAGdOQTh1nuIBnyLAqkN8D5vGjZwl1mgdC7Wp6isq6MSPOqATOrjGxK8yuFm1WrSSVtlEzZxXfTdMUPaiQOoj0cnColdXfQKgKHSagfSiIgKuKmlYtG6YXQlKNt1MvnNMCoip51Cweg2cdrpAS8wTQEAi1QsjDwf74SOdt7Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773896667; c=relaxed/simple;
	bh=j4LwOfreD5riTsVaD7Gb/OCJFXpoD19garNTTqeXcII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klsxK1QN9/zfuHOowl+f3h/wQUC7xM5O9WS7KxQfokCPnATOKPx2rHuLWmJGaA4tMck29caWPhzV2AX/Hyumqhc4AHJ2Dmc7WY3owJk92fEOyfsl1oYNuP+TSHM+sLMtYLhUkQbOFjxkzfkIMlvpeMz26Ynjbo9J/GWdzZCZv0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mFvVwijW; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-827270d50d4so573901b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 22:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896665; cv=none;
        d=google.com; s=arc-20240605;
        b=Ie252ijKQJcji04ghpWoYqpNazhwWxzM2FW90C8OmpRyQ1FRvcs1grncPQL7+kcWzl
         iGY348wQaxF9jyz7ih8jQLNkUwb2NNdw/rSKK760v4rluvFkpsbxntMySLSlrsCxhgyb
         elbSSjCT+YwcJOYoid8s+PJRBIIN7CNY5zrl3/OWsSvACw5h+sFds7v8V332wXWQFMHH
         Eg3Vomy/+XFSxgV2IS5HWsdajjo9fQ4m+BmGsd2rf00SoqAyEFl141kAZjPvhUSunl2f
         DJyk82lGPa0wIE7dmTU4cFnGj5oVU49rxVzp8xX8OFNU4IIr6pm98exaZfR+WrTchmML
         EsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=;
        fh=hdfG2fGDHCmcix0Ws5p4CdwtyKBbFjRRHnqAS30YVDQ=;
        b=RygJViUlRfY7TVuVg2VNFdUzV3Rt6FKchRjlOZQBcXoqEryDynwXGTHUgkknk3PhK7
         EwezQBSSpJmG6hBOlqwVO1Q5yfLifyedLbcB/zC33reugZsqLmFbSlIwjk62LNLs2unO
         u7CdizbU/4mYpXAef6MqFsFjLDE6RWs/OPYo9F53PlA3jYl8H3gi3NZ1szv/ZRTpILzx
         6eCmRQBn8ckIBsDtUyIRjum/51dZ6V+1l79yMKo1Un9AD5ppiwQbxFW/VPUGajN3nc6K
         jiKU9FG3S+1LMZWHJ40RaC3QHFdNI7v587VTwGsyzYAfdYeEdZyFLIVX5AKSWYgraqRK
         0duA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896665; x=1774501465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=;
        b=mFvVwijWgEAUmOmrN9GTO2KGz6TN+4kkBF1VI6E8AHNsXxZmM+7ATzk2ztv1BYallv
         uEhw4T741OsHWwirqwkgsU8q4ukcueAMpTgP/z9a3BoTezfUw3NrXARVyT4i1X0kpdWE
         aCm42G/roXxS4ZMvbQkpxFLQXaedbgTebHKV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896665; x=1774501465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=;
        b=PCSijw7I5NAcizKOmYHUgUzkbGaRsZD1PDgxr0ZRmniL4KH2uSNxGTEpepkb6SIFja
         t48Zs3uAANuf3i39mqOzjL+Ock8szhXHHAZPYVOVFAnkmRJor9eHqluiUvVO6kpt8JPM
         agurpThPWi3MMdpI2Y6K8QCK2RP3GUvNzTG1ULFMXpEAeuGUWAlz8cDP3gNTxJMbCMEG
         QxYdWx/yxDLTCqm5ucoLtnnqLdfL0LTNW9lHjz01H0nGyLkTqanKM2qk1IGpqh7SPlPM
         IgOkowhAZNSv2xe45hgqud7fZzlBOA4Py34tq+z95AVj/X1cpGLgXiwHOIUY5AGEvgYS
         4PHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0CP6v3HHc48FzHHADM33pMvLfhKVd+jFLiM/UI1ylOZHyJtYNF8NnuAjRYTpafQmP7gUit932hUfT@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTU6bx4TzausLbJvzfcSkKwKpVZnTahuJXXMTatKqSQ5UvC7G
	4pnfaI0F9hCPb0mA3rq4mevtyt67b5woSuQtDAzyvZ0+iWtpgDzgSvn4yUMqC0NuxoodA7S8q9L
	GkKy9rSzZyp4YRDs86yzt6jNP+ABUCoLq/YvO+q7o
X-Gm-Gg: ATEYQzyqEpbq9GpBbg24xrsh14nyJ5HfZJVnuq5o9/xWUxsN2Ty0aV+T8v08QncIZzQ
	AIDLuQzvaikGKgm88czXfXtLGAelmPAOJs27SQWtHMrWjeO8RyycZgjlcgwUzcvOEvJAuRkRDTc
	yZkWQ4vUm7ZYJBS2L0UvqhP0MvyGP4J3Y0SwDpjHQlO//OVEe3W0OyDSwKc4hCE/U/hhqzmB4VM
	WYWsoAutKIXuytl7bBQdQ972FugdyYbAfQlT+UVpdMfS8r4DNTZZefcaEhk3OW8sjJTWPt4qOIO
	V4kazph0t8VjnOCmveiJwUo4PoccifC9VnnyKXqjyYI9OU7r
X-Received: by 2002:a05:6a00:71cd:b0:82a:7046:86a0 with SMTP id
 d2e1a72fcca58-82a70468ac5mr3493177b3a.20.1773896664943; Wed, 18 Mar 2026
 22:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
In-Reply-To: <20260317184507.523060-8-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 13:04:12 +0800
X-Gm-Features: AaiRm53-k1XiPsX8YHUI34_UU2ePBdJ9HT3Aqm47Bm64kJThrD_lG_tt8e77KjA
Message-ID: <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33788-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.960];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,mediatek.com:email,mail.gmail.com:mid,packett.cool:email]
X-Rspamd-Queue-Id: DC5492C6160
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:46=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> From: Fabien Parent <parent.f@gmail.com>
>
> The MT6392 is a regulator found on boards based on the MediaTek
> MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
> connects as a slave to a SoC using SPI, wrapped inside PWRAP.
>
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/regulator/Kconfig                  |   9 +
>  drivers/regulator/Makefile                 |   1 +
>  drivers/regulator/mt6392-regulator.c       | 487 +++++++++++++++++++++
>  include/linux/regulator/mt6392-regulator.h |  40 ++
>  4 files changed, 537 insertions(+)
>  create mode 100644 drivers/regulator/mt6392-regulator.c
>  create mode 100644 include/linux/regulator/mt6392-regulator.h
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d2335276cce5..66876d730807 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -991,6 +991,15 @@ config REGULATOR_MT6380
>           This driver supports the control of different power rails of de=
vice
>           through regulator interface.
>
> +config REGULATOR_MT6392
> +       tristate "MediaTek MT6392 PMIC"
> +       depends on MFD_MT6397
> +       help
> +         Say y here to select this option to enable the power regulator =
of
> +         MediaTek MT6392 PMIC.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6397
>         tristate "MediaTek MT6397 PMIC"
>         depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 1beba1493241..db5145cfcf36 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -117,6 +117,7 @@ obj-$(CONFIG_REGULATOR_MT6360) +=3D mt6360-regulator.=
o
>  obj-$(CONFIG_REGULATOR_MT6363) +=3D mt6363-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6370) +=3D mt6370-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380) +=3D mt6380-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6392) +=3D mt6392-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397) +=3D mt6397-regulator.o
>  obj-$(CONFIG_REGULATOR_MTK_DVFSRC) +=3D mtk-dvfsrc-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_LABIBB) +=3D qcom-labibb-regulator.o
> diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6=
392-regulator.c
> new file mode 100644
> index 000000000000..50cc0019f48a
> --- /dev/null
> +++ b/drivers/regulator/mt6392-regulator.c
> @@ -0,0 +1,487 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +// Copyright (c) 2020 BayLibre, SAS.
> +// Author: Chen Zhong <chen.zhong@mediatek.com>
> +// Author: Fabien Parent <fparent@baylibre.com>
> +//
> +// Based on mt6397-regulator.c
> +
> +#include <linux/module.h>
> +#include <linux/linear_range.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/mfd/mt6392/registers.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6392-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
> +
> +/*
> + * MT6392 regulators' information
> + *
> + * @desc: standard fields of regulator description.
> + * @qi: Mask for query enable signal status of regulators
> + * @vselon_reg: Register sections for hardware control mode of bucks
> + * @vselctrl_reg: Register for controlling the buck control mode.
> + * @vselctrl_mask: Mask for query buck's voltage control mode.
> + */
> +struct mt6392_regulator_info {
> +       struct regulator_desc desc;
> +       u32 qi;
> +       u32 vselon_reg;
> +       u32 vselctrl_reg;
> +       u32 vselctrl_mask;
> +       u32 modeset_reg;
> +       u32 modeset_mask;
> +};
> +
> +#define MT6392_BUCK(match, vreg, min, max, step, volt_ranges, enreg,   \
> +               vosel, vosel_mask, voselon, vosel_ctrl,                 \
> +               _modeset_reg, _modeset_mask, rampdelay)         \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_range_ops,                         =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D ((max) - (min)) / (step) + 1,            =
 \
> +               .linear_ranges =3D volt_ranges,                          =
 \
> +               .n_linear_ranges =3D ARRAY_SIZE(volt_ranges),            =
 \
> +               .vsel_reg =3D vosel,                                     =
 \
> +               .vsel_mask =3D vosel_mask,                               =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(0),                                 =
 \
> +               .ramp_delay =3D rampdelay,                               =
 \

Please add the supply names.

> +       },                                                              \
> +       .qi =3D BIT(13),                                                 =
 \
> +       .vselon_reg =3D voselon,                                         =
 \
> +       .vselctrl_reg =3D vosel_ctrl,                                    =
 \
> +       .vselctrl_mask =3D BIT(1),                                       =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_LDO(match, vreg, ldo_volt_table, enreg, enbit, vosel,   \
> +               vosel_mask, _modeset_reg, _modeset_mask, entime)        \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_table_ops,                         =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D ARRAY_SIZE(ldo_volt_table),              =
 \
> +               .volt_table =3D ldo_volt_table,                          =
 \
> +               .vsel_reg =3D vosel,                                     =
 \
> +               .vsel_mask =3D vosel_mask,                               =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_LDO_LINEAR(match, vreg, min, max, step, volt_ranges,    \
> +               enreg, enbit, vosel, vosel_mask, _modeset_reg,          \
> +               _modeset_mask, entime)                                  \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_ldo_range_ops,                     =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D ((max) - (min)) / (step) + 1,            =
 \
> +               .linear_ranges =3D volt_ranges,                          =
 \
> +               .n_linear_ranges =3D ARRAY_SIZE(volt_ranges),            =
 \
> +               .vsel_reg =3D vosel,                                     =
 \
> +               .vsel_mask =3D vosel_mask,                               =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_REG_FIXED(match, vreg, enreg, enbit, volt,              \
> +               _modeset_reg, _modeset_mask, entime)                    \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_fixed_ops,                         =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D 1,                                       =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +               .min_uV =3D volt,                                        =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_REG_FIXED_NO_MODE(match, vreg, enreg, enbit, volt,      \
> +       entime)                                                         \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_fixed_no_mode_ops,                 =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D 1,                                       =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +               .min_uV =3D volt,                                        =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +}
> +
> +static const struct linear_range buck_volt_range1[] =3D {
> +       REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
> +};
> +
> +static const struct linear_range buck_volt_range2[] =3D {
> +       REGULATOR_LINEAR_RANGE(1400000, 0, 0x7f, 12500),
> +};
> +
> +static const u32 ldo_volt_table1[] =3D {
> +       1800000, 1900000, 2000000, 2200000,
> +};
> +
> +static const struct linear_range ldo_volt_range2[] =3D {
> +       REGULATOR_LINEAR_RANGE(3300000, 0, 3, 100000),
> +};
> +
> +static const u32 ldo_volt_table3[] =3D {
> +       1800000, 3300000,
> +};
> +
> +static const u32 ldo_volt_table4[] =3D {
> +       3000000, 3300000,
> +};
> +
> +static const u32 ldo_volt_table5[] =3D {
> +       1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 33=
00000,
> +};
> +
> +static const u32 ldo_volt_table6[] =3D {
> +       1240000, 1390000,
> +};
> +
> +static const u32 ldo_volt_table7[] =3D {
> +       1200000, 1300000, 1500000, 1800000,
> +};
> +
> +static const u32 ldo_volt_table8[] =3D {
> +       1800000, 2000000,
> +};

If this PMIC is anything like the MT6358, then it has 0.01V fine
tuning for most if not all the LDOs. It is sometimes needed as
a rail may have a 0.04V boost that would otherwise be invisible
to the system. And then if you have something like 3.04V set in
the DT constraints, you end up with something the regulator driver
doesn't support, but the hardware does.

Please see how it's done in the MT6358 driver. I spent a lot of
time on that driver to make it actually support the full range
of voltages, and describing the supplies.


ChenYu

