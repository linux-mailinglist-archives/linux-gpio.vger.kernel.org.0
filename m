Return-Path: <linux-gpio+bounces-14684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF0A0A2F8
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 11:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B245188C2AC
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 10:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5B9191F6C;
	Sat, 11 Jan 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiUpg3f4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299414E2C2;
	Sat, 11 Jan 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736592811; cv=none; b=Kp24ra8BxkZEICO5gdKuQHEKVX21zK/6fTO69OE9dndd2GifpsIfnF5cCKXNheeTnhxuJ8D+C5YFcMU8CS4uJOmR1me42Jl4AA4ZsIRGqYTX1on3xayLnErB2tg6knx3qHUJ9IUXL/G7lzaXO3GjQsrj1CAX9GwPUGnLT5EjLrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736592811; c=relaxed/simple;
	bh=XRW8n9/i20RJ8UbX3iSoNay0X3kUsnGdSZdQI40PbnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1V27nazzU5qD1Fk+4SZF9CN4kNjPm6sE09wTBnNA6b1mRkz/xSmBthIv2+Y4Sqexwy0IjYJiQb6Mc2AKyHmBUFeDuBVx3cm2T8Hii3++eH45Y0J5Sim+hhPqSr1gxqKBCLvyheiqXKMKncWvKIWs59OU2Iv6juMHfqOQbj9o8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiUpg3f4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCE7C4CED2;
	Sat, 11 Jan 2025 10:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736592810;
	bh=XRW8n9/i20RJ8UbX3iSoNay0X3kUsnGdSZdQI40PbnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GiUpg3f4f+oc12FCMCo94Ex5QDHkwiaNPpLLfxI2lYubntCTbFJ1+31DAkFwTGhYg
	 DrzJD8LqL+kD8tEKVSThaM/9ihVBgmFELTl/98HTFovikgvhPlyjdw/w3znSnbvdco
	 2qk0Ya7iWrY5KEzJz++SIMCBfU/oPI/iFumMl8JYT2WrlEXIdwya9FspdeJqf5TwK8
	 twfQflgi7DBwSNU5xM93pEZQgmM1XJBIZ3QDWrjMgviJz9TCjV25FSn4IUzqpNCttK
	 o5bTq1Qxa3qX/0fL+doi3j/oMyzDEddQv/jYZ7ChfeivjurBboOAAeXlHqImzjXylW
	 SjGCknAiTemZw==
Date: Sat, 11 Jan 2025 11:53:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, 
	"Geert Uytterhoeven via gmail . com" <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] Revert "gpio: 74x164: Add On Semi MC74HC595A compat"
Message-ID: <6iczc6fjqlkgpuegnzh6eo66s3olurjibvb7sbgn2xlmghsi76@5r5yu6n3zfyu>
References: <20250110130025.55004-1-brgl@bgdev.pl>
 <20250110130025.55004-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110130025.55004-2-brgl@bgdev.pl>

On Fri, Jan 10, 2025 at 02:00:24PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This reverts commit b1468db9d865deb5271c9a20d05201b1c0636895.
> 
> There's no need to add a new compatible to the driver code, we can
> handle it with a DT fallback.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I assume this was not released anywhere, judging by dates, but would be
nice to see confirmation in commit msg or changelog.

>  drivers/gpio/gpio-74x164.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
> index 2ce00e90ea56..fca6cd2eb1dd 100644
> --- a/drivers/gpio/gpio-74x164.c
> +++ b/drivers/gpio/gpio-74x164.c
> @@ -165,7 +165,6 @@ static void gen_74x164_remove(struct spi_device *spi)
>  
>  static const struct spi_device_id gen_74x164_spi_ids[] = {
>  	{ .name = "74hc595" },
> -	{ .name = "74hc595a" },

Hm, strictly speaking this is not related. What if some
spi-driver-matching uses 74hc595a? There is no compatibility for
such matches.

Best regards,
Krzysztof


