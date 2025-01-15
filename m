Return-Path: <linux-gpio+bounces-14835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FFA11E91
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 10:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C5216A418
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 09:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2761EEA3E;
	Wed, 15 Jan 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DImkJAVv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5C248171;
	Wed, 15 Jan 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934613; cv=none; b=jHt79AyTM+Hczd9LdNBlpcV1wsmeXrmeF1hiSdveGMXaIodQR1WiVhYMPqRjxhCS/MMOBT8ej5UU1MUYnsR/kx0quT9tyd0+mp6xiNbJjS2B/ZypQ1CytNCJ91Z5I3qqMzYgPTu/zVhyobyIRDn/ZPHH4HC1jm6FIXUM+2nZ7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934613; c=relaxed/simple;
	bh=FAroUXyBDLBEfp+R9giXYoiTywuzUZWagD49ZuybGCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACmRF2WuJEwYc3y8SFZjAGzS4XGfGyt5clPvfX5bRUtASALL7V1d3NE+qm5LotUFsYxqHbi53VZzIvEIn1jU89DlkZCZiY4cQvbGRWiMQNJZZIcgfo0cJPdlsoypa9xuqo3HJrMak3Gs5OqnEq3++hSp9QTp3vl0HLABAgCMLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DImkJAVv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A693C4CEE1;
	Wed, 15 Jan 2025 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736934613;
	bh=FAroUXyBDLBEfp+R9giXYoiTywuzUZWagD49ZuybGCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DImkJAVvNmB4HstzP6QyZuwro7ZkhI2z7+UN/VI+l4a53L1EiD7SlRf2B5GDtl0c7
	 28gPdouUlyGvnv2eVpRRjaD8ImWpK0C8W5Cxw47OM7yjjOWfZ4lhDlZ5jkUt71a55j
	 LD+ONvpoPXR5ZYd/GYr1/3TqSVKll2Mq9SJKuoFzubYGHhlBjZThjYrYD3QVCbVIf2
	 MFOIVbBpBxUaAqqL0Chf3SxqbMQA0aKgmhFZ95iVyVFadd+g1hYBq5eemjSR1Xktwt
	 hQ0U3rvJUG0FcPoi3L1CLsHB1I9pzk0PfTL15FKgqik8v6xJsp44WjTJLEKyrcURQW
	 jiouujojobUUQ==
Date: Wed, 15 Jan 2025 10:50:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	wenbin.mei@mediatek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Message-ID: <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115063555.32492-2-ot_cathy.xu@mediatek.com>

On Wed, Jan 15, 2025 at 02:35:38PM +0800, Cathy Xu wrote:
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/mt8196-pinfunc.h
> +              directly, for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull down PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8196 pull down RSEL type define value.

Not much improved.


> +            description: |
> +              For pull down type is normal, it doesn't need add RSEL & R1R0.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> +              For pull down type is PD/RSEL, it can add RSEL define to set
> +              different resistance. It can support
> +              "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001" &
> +              "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +              "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" &
> +              "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111" define in
> +              mt8196.

> diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> new file mode 100644
> index 000000000000..bf0c8374407c
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> @@ -0,0 +1,1572 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2025 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + */
> +
> +#ifndef __MT8196_PINFUNC_H
> +#define __MT8196_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)

I do not see how you resolved my comment from v1. In v2 I reminded about
it, so you responded that yopu will change something, but I do not see
any changes.

So explain: how did you resolve my comment?

These two examples where you claim you will change something, but send
the same. I skipped the rest of the patch.

Best regards,
Krzysztof


