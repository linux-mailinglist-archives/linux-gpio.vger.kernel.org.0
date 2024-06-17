Return-Path: <linux-gpio+bounces-7477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2590A747
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C55C289E17
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4265D190675;
	Mon, 17 Jun 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="EdcpG68a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36818FDB7;
	Mon, 17 Jun 2024 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609597; cv=none; b=S6HLex/bMsuD+r+ZhAnY+I+QnIjHAdckTneNO7MhMcG0nKTIM7SXdiQm40KzjVitmFhAxULg0QVPrCOc4jH+EJ0y3XOFmh1ZzFKlkeCNqykfkpZy5nnJfJ2LNWUvuRx4WgfuSxnJ1Pn2EHeoeUNQ+9Xbc/o/COMnW68BtJYtDwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609597; c=relaxed/simple;
	bh=pKbpEC1ML8/UOtd8JAYcFpqFhJAXPEPxVelSqBYZ5LM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bo1z1EFSWxs6yW1T+2IHhCQWMMebKFIwZgW73qKn+hvvBDMT2RAG0u5MLVFgwyNx2lWm8eYIPLBWxbrglBSj+mKUsWGlzuCXawXq6qIifHh3FXr0IpaCjyJ/i5QpsliGTUpRjND8eulnBGjPlvUuuOWaJ2Tea6VjfZvHpnUYl4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=EdcpG68a; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED8492014A;
	Mon, 17 Jun 2024 15:33:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718609593;
	bh=jkSFmq+QIQxRLTqnlNiAfSbUBGRyyeuuOZTApiqXJqc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EdcpG68asKfnCXSZa0TL+Pz/gdPTcrOZB/FtOK/Gn90lLys2gXSwb5movxxiDGJWK
	 5PsoNoMQTYyPQlIWwrJH6OKy/Qscz5huoNcSp/EQgHKio1fyUwPTibZuswPQWfQoB2
	 p2LtdxCikIBvRO6DGbZLlarl+XaRVgAXglbfQbuleQ8Z5weadT63R41slT1vomX6R6
	 0Ooknl61y7WVDnhVkETZ7FuUY++DCxrNPNj81eo4n4IcSpcV9S4/krnq49ia/P4C0v
	 KF8cPqTOZFzU6BZmr0sCrVGX2IYxknsDuK6xrbxuHxIDDXh9rTdde6vQ5KljDEqfet
	 CEPxpgWlt7Z4g==
Message-ID: <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Cosmo
 Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Date: Mon, 17 Jun 2024 17:03:11 +0930
In-Reply-To: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
References: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-06-13 at 16:07 +0800, Potin Lai wrote:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.
>=20
> To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,
> reducing the number of required pins.

Hmm, I'm not convinced this is specific to NCSI (and it's an
unfortunate mistake on my part), but we do need to call the groups
something different than RMII[34]. Did you have any other suggestions?

>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index 7938741136a2c..31e4e0b342a00 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
> =20
>  FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26=
, F25,
>  		E26);
> -FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
> +FUNC_DECL_2(RMII3, RMII3, NCSI3);
> =20
>  #define F24 28
>  SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
> @@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
> =20
>  FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26=
, B25,
>  		B24);
> -FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
> +FUNC_DECL_2(RMII4, RMII4, NCSI4);
> =20
>  #define D22 40
>  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> @@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_grou=
ps[] =3D {
>  	ASPEED_PINCTRL_GROUP(MDIO2),
>  	ASPEED_PINCTRL_GROUP(MDIO3),
>  	ASPEED_PINCTRL_GROUP(MDIO4),
> +	ASPEED_PINCTRL_GROUP(NCSI3),
> +	ASPEED_PINCTRL_GROUP(NCSI4),

You will need to update the binding document as well. I've poked Linus
W about a series I sent that re-formats the binding function and group
lists - it would be nice if you rework the patch on top of that:

https://lore.kernel.org/lkml/5bf8e1dddd2b958a102e7b1b9f9c080a34f9deff.camel=
@codeconstruct.com.au/

Cheers,

Andrew

