Return-Path: <linux-gpio+bounces-29409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E14CAFF43
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 13:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95512301F276
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD5932E15D;
	Tue,  9 Dec 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0evnc+2c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885A2C3278;
	Tue,  9 Dec 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765284082; cv=none; b=nOe0cvr10e2l6WLVRYPIbSTVFJF7ZONGM/J45YHGGWgtTeQK/bgaJVAY0s+pdj1a/4op4cyUBT/waA11IQfJf1TU5VGIKC0Nui7d/djWpZgi+kiq6m5RD1uR4fm3d+qI3GGjM8TmYqwhE/V1ox2Uf2GZko16Upe7G1rpiWb06kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765284082; c=relaxed/simple;
	bh=l1ZyaZt4xLlh4EMI1zsBFrhIlp/rcsTE3GU53iPqrCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYWXX9NZgCx/Tv2g2pikeIVBW0LpRfbjSZX0fxjzJ8XwL563fycNze9HkLCawxMn82izbcnvDZhuOw2JTCE0KkATmG8Qyc3r9lRUOQ/mmErG9jLv3L5BpqrzoQ5baOMeUEt/XSKfAmlZUUT1qaqK3TwCRUJRmN4m9VO5Xmn+df4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0evnc+2c; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CPm9gAaFXAi+e7aAc0FyOo5De8ElmI7LLS0rEFiGjhw=; b=0evnc+2cA/JEnnSMdm4qnHw217
	4svvawuDBRuwuswE/N/nvat4cSQVtqY908D6Op7DC884YX2jI5g3HdN0Nfdzz2iAtNJT3JMHFEQEA
	dD5lUMCJnpyoK/RvJWNxXjS50ZqcMfMTKvVFbYvUXUDIcyqfP+7BeOId5C+ikrIDdKFt020Yh2iVc
	+bZ1MAOKFeinIlPFfiWz+0JHDPdQJwnb7togGppY5We7FfDs2VnFf1kPKb7qSFkCfYsJj2L5K6/oR
	lRyCk/s8tTHXg3D2yLoGJHlDkgt5fAQqNl/U0DSX9tHqLlL1p1jiBtUAF1vwRgz+tjNrpf17h6PDe
	CDyePE9g==;
Received: from i53875a42.versanet.de ([83.135.90.66] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vSx1m-0007kS-UM; Tue, 09 Dec 2025 13:41:14 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, tao.huang@rock-chips.com
Subject:
 Re: [PATCH v2 6/8] dt-bindings: pinctrl: Add header for Rockchip RK3506 RMIO
Date: Tue, 09 Dec 2025 13:41:14 +0100
Message-ID: <2681672.Lt9SDvczpP@diego>
In-Reply-To: <20251206050844.402958-7-ye.zhang@rock-chips.com>
References:
 <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-7-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Ye Zhang,

Am Samstag, 6. Dezember 2025, 06:08:42 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Ye Zhang:
> Add header file with constants for RMIO pin and function IDs for the
> Rockchip RK3506 SoC.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../pinctrl/rockchip,rk3506-rmio.h            | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
>=20
> diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include=
/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> new file mode 100644
> index 000000000000..5d39690a0b28
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> @@ -0,0 +1,143 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
> +#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
> +
> +/* RMIO pins definetion */
> +#define RMIO_PIN0				0
> +#define RMIO_PIN1				1
> +#define RMIO_PIN2				2
> +#define RMIO_PIN3				3
> +#define RMIO_PIN4				4

[...]

> +#define RMIO_PIN29				29
> +#define RMIO_PIN30				30
> +#define RMIO_PIN31				31

additionally to Krzysztof's comments, please also don't introduce
unhelpful mappings. Having constants mapping pin31 to 31 is not
helpful at all, as there is no value added.

We'll already know that it's pin31 by reading the 31 when used.


In contrast, the constants below add a lot of value, because you can't
infer the that the function "14" means the  CLK_32K function without
consulting the TRM, so _those_ are helpful.

> +/* RMIO function definetion */

typeo "definition"

> +#define RMIO_UART1_TX			1
> +#define RMIO_UART1_RX			2
> +#define RMIO_UART2_TX			3
> +#define RMIO_UART2_RX			4
> +#define RMIO_UART3_TX			5


Thanks a lot
Heiko



