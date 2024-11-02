Return-Path: <linux-gpio+bounces-12485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C776D9B9E02
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 09:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F041C20F90
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 08:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11209158DD0;
	Sat,  2 Nov 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5PffNWV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D23136351;
	Sat,  2 Nov 2024 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730537563; cv=none; b=Br3KXSBL1AlAPdVrc7q6UNv2xjgI6y36cotCuEoYJRVg9B2ddOVA/NUw9rTVUUccL3NwMo/D1qz6KYLs4rXkxuQ09GTbnyxMpDOrX/zH7MZXSzTKAceSk1I/DhNhgg1RxOsXKYdpgRbprAJkx+RWmbFxkPAHOBIYSj79wAqwGb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730537563; c=relaxed/simple;
	bh=5Ur0AthEvPTHPmN0Q6ms1UsYHOsLFRg2PHT8QzlnmVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1hg5ZNaoVZPpkeiXdh6t8+oY4TYt6dsiLMdGuFnjYOYDT8lCY/CWXN1tw3sULG35a9p/1/w5CAkboXCXM4y43MdVjWnXDlBdwBCnNv6X9eeEmxmWzKCVm1/oDjmltOfm7+cUxmTjBtKYpEU5pmycU19wwU+NS4IclYb796Z1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5PffNWV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611A4C4CED1;
	Sat,  2 Nov 2024 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537563;
	bh=5Ur0AthEvPTHPmN0Q6ms1UsYHOsLFRg2PHT8QzlnmVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5PffNWV0hSAaroMTOUeypERpBd4QK69Q5mCJy20GVfB1i4BTGzIY5xkubYuO8/ig
	 2ykIOrkevbctwbUhZRKb9klfeZwbvh07Ru+mfX5zZ+kTyd5cLGxYhEpsq9uKUDsXb/
	 zdNJAiSlas1Bks9qIE8qHsB8fC1ZSKbB5nCBzhGJO22iH9Fz+61kSuSaB6ne4vmGt0
	 2xoXvoEzCsMky5PJwSfmTD63KgI7hDio+UsWj47/ANX/QQRGRbofytywy8K1wt143b
	 vMMHD5BAonRv0WzwAy9XN7ZM5EAwHRgcQUpe0yWTQ9Tcm14L12+C7WWv+MZXhT5eEe
	 zqGNBh926zsUA==
Date: Sat, 2 Nov 2024 09:52:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <z5ky5g46tsdmrabplgjbt3ahlnkn7gljkwsxjshwpkdqqnirwr@wavvhc2wudlh>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>

On Fri, Nov 01, 2024 at 10:06:08AM +0200, Andrei Stefanescu wrote:
> +static int nxp_siul2_probe(struct platform_device *pdev)
> +{
> +	struct nxp_siul2_mfd *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num_siul2 = S32G_NUM_SIUL2;
> +	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
> +				   sizeof(*priv->siul2), GFP_KERNEL);
> +	if (!priv->siul2)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	ret = nxp_siul2_parse_dtb(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id nxp_siul2_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2" },
> +	{ .compatible = "nxp,s32g3-siul2" },

So devices are comaptible? Why doesn't your binding express it?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
> +
> +static struct platform_driver nxp_siul2_mfd_driver = {
> +	.driver = {
> +		.name		= "nxp-siul2-mfd",
> +		.of_match_table	= nxp_siul2_dt_ids,
> +	},
> +	.probe = nxp_siul2_probe,
> +};

Best regards,
Krzysztof


