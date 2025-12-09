Return-Path: <linux-gpio+bounces-29410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3ACCAFF64
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 13:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90E20307DA5D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 12:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1BB327C09;
	Tue,  9 Dec 2025 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ugvX8vPq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C991327797;
	Tue,  9 Dec 2025 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765284207; cv=none; b=Kt2Ha8vjlp/70xVvcAYBp5Nqag7cODwgacHzLohPApWwvtqB9LRna1/4Q4OIcyjtXfJghhWt+dbRbxhg95rt5yrfMHFgXT9SOgNUgsfeW/M2UD9cQLuhygludBbUDjg1+7yJmf8YqlD7aDPXUozxX+N87WeoHF0YbY4gNTP3db4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765284207; c=relaxed/simple;
	bh=kBW8iwqeHaOYpplsrPYbzDMphnXFeLTqFdyMNTqSt9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o78iGSAvLY1Bgfx6En5daoLyvmHghyY9dJbwkfNBBQJ7qCuoAOMLjRysZHb0pGMItR9WY3iNly/FOBBd95k0bGQ/MP/TaVIneBQ5GmH2IV1YS0YCI+xvIG1p/1ZdjTVTLaR3GFRQQV8Llf12ItTMBpNldH5xtZZiqjBcH4sqnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ugvX8vPq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xxEyI/m4jP3NK+9omDGjHNBVqFAKxQf4F7O6U4IQKoo=; b=ugvX8vPqK2eKIzZ7gi70O05f+8
	ZDyNYpVEFR7VcjhO3cf27DGj4LVp9Sb+i5t7rfRjlJfndIIx//YDPv2LHAbqo6/8D64Lvi0/iEOht
	qsTiHsfUSKrsJXrBgLPI4zEXXnVWRrP3pkTJWIbaFoarY7Hlf/c6/pwX9Mg3qdqXzFn6uvv+WvRsK
	+ii4FiSIyVlI3vrgu8+d2GkUth8y0jKb2UFVN31dw0o0BNWIUNQhst/zyoCL51fLhfFqdrIt30S8x
	Fi2o3yV1YlhB/JYqIR+B7bkIP3WNPbWha1qKWa/Ne/HIimVe6ibInJKXlUE1OWbEIHEJpEazRV85k
	RM0LMB0g==;
Received: from i53875a42.versanet.de ([83.135.90.66] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vSwwA-0007hg-Fr; Tue, 09 Dec 2025 13:35:26 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, tao.huang@rock-chips.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Tue, 09 Dec 2025 13:35:25 +0100
Message-ID: <2043731.usQuhbGJ8B@diego>
In-Reply-To: <20251206050844.402958-2-ye.zhang@rock-chips.com>
References:
 <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Ye Zhang,

Am Samstag, 6. Dezember 2025, 06:08:37 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Ye Zhang:
> Add the compatible string for the rk3506 SoC.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This patch was already merged into the pinctrl tree in v1 and entered
the mainline kernel during the 6.19 merge-window [0]

Same for the actual rk3506 driver change. So please base future versions
of your work on top of that.

Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D13064950339ffc73a0e55e9b4898df861b04848e

> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 125af766b992..76e607281716 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -44,6 +44,7 @@ properties:
>        - rockchip,rk3328-pinctrl
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
> +      - rockchip,rk3506-pinctrl
>        - rockchip,rk3528-pinctrl
>        - rockchip,rk3562-pinctrl
>        - rockchip,rk3568-pinctrl
>=20





