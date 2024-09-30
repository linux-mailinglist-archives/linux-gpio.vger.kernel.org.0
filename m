Return-Path: <linux-gpio+bounces-10541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E09899A8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 06:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466161C209E4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 04:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A8E39FF3;
	Mon, 30 Sep 2024 04:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LJATheIe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABE224DC;
	Mon, 30 Sep 2024 04:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727668834; cv=none; b=UnxQjpEidw4tCHRvgEoX1aAjK6Wf8fyia1TOVA8KRaAvJMMs5Ewb2fXeLuQlffqBIBVGPHHVN4sGLXQyvX5dWlBsYUmAg0SpQlSW+XWN1q19cYzHtV0hb3XPiOFjfI7dkTu15XuR0Cu/GXB3/0N1ye8PYlnq+GLFzOs9PuZI7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727668834; c=relaxed/simple;
	bh=ZBd+kJ6avV4R6OiMc0ua20WnotT9z+UmMt29VwuQpeA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Avucv/wxqle4BSIIN9X7T5gUGzaMDhY7p0G1QuhVxelH4EGUmiYbJxp3xe22bi7zQJ1V4B0eYMdxy+p0Nxu+CGeNXY3Samr8S41IRLWtAAtlIc41qU+89Q+0GFQda0YNZSTBKu/vr/JFy3kABHZBRhtbVnxYRAiOwC2o9XzmiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=LJATheIe; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727668830;
	bh=x1MVByC9IZmGZ5pP4eLbpu0Q6zUMxyr6LSy+i01ws1M=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LJATheIezZWFVcv0H7jqy6XdHb6EQP8mqcS6854GkA7Uqr3uzBDzna/qPZZq/PRsp
	 h0CjV4Gu1Zc0RXlnm9NbKz1zBkeL+9qbZONBZxfFx/GANzRP3/VapsBo3YQ85FIxZG
	 ZuXXlpvE6NLPKsSPGiYJLZ28a+RM/QDu3tBjGgclGO7Qv4tn7Rx7mSrm1y496+PctR
	 NFJIq7LjbZQfthFeFiRiq4tEWG6MR/TTwFbJ9mUDOed1mosFMhMHktDSnmu+ynudOn
	 WCLF2t7X0YC4m+K+KAclzPwrC37wbt2IBepfwQUcqfWcwCFF5wfFYMGshxzLth9VIM
	 9dnSzP0SGKIqw==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BD0FB6511E;
	Mon, 30 Sep 2024 12:00:26 +0800 (AWST)
Message-ID: <ff05349166eac044a05d74d969749c5d144cd5b0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 3/7] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 13:30:25 +0930
In-Reply-To: <20240927111744.3511373-4-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
>=20
> +
> +static const struct aspeed_gpio_llops aspeed_g4_llops =3D {
> +	.copro_request =3D aspeed_g4_copro_request,
> +	.copro_release =3D aspeed_g4_copro_release,
> +	.reg_bit_set =3D aspeed_g4_reg_bit_set,
> +	.reg_bit_get =3D aspeed_g4_reg_bit_get,
> +	.reg_bank_get =3D aspeed_g4_reg_bank_get,
> +	.privilege_ctrl =3D aspeed_g4_privilege_ctrl,
> +	.privilege_init =3D aspeed_g4_privilege_init,
> +};

A brief nitpick as I have another comment below - can you order these
assignments in the same order as the member declarations in the struct
(you re-ordered that in v6)?

> @@ -1191,6 +1214,10 @@ static int __init aspeed_gpio_probe(struct platfor=
m_device *pdev)
> =20
>  	gpio->config =3D gpio_id->data;
> =20
> +	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_=
get ||
> +	    !gpio->config->llops->reg_bank_get)
> +		return -EINVAL;
> +

I think the patch is largely in good shape. I've given it some light
testing. The only concern I have is this is introducing another
resource cleanup bug right now, but that's only because you've ordered
the devm_clk_get_enabled() patch as the last in the series. If you
order it before this patch then the direct return above should no-
longer be a concern.

Andrew

