Return-Path: <linux-gpio+bounces-16850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42514A4A572
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 22:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527881748B7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 21:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415D61DE2BD;
	Fri, 28 Feb 2025 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAxao5J2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C01D9A50;
	Fri, 28 Feb 2025 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779761; cv=none; b=Pl3ZysuBb8aziAdl9L5eg2fuLrwbC4anVJG2bUK0qUzAZzyv8lKhkGEO/M3dVXokQ5m4UPV8bXsBNy52lDjguzZ84+W0uD5S6MfdK4rM0brJfTMR1yzdMX9W4P4LU8uwwFRFjxlVw4CATbYIef8JHv8RPPI2L/WU6IkKTxfK43Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779761; c=relaxed/simple;
	bh=WzG/KNySzTFxJVLImnFPJc4V3svrWDbTCG0HQL5y8dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avd5d4EoA2G+ht/ro8aJEFlon8Zge8lnnuiHZtZZlwNKLrBzxrx5zCqLvdJIYU5Bwk6+TSgBDDRBk7MndkSZM97++NVMt4RC1nhtLuX5XoBxTI11QmMMHoFPQAamPGeSuSzGbczFHzACMpeXePAHMSGem0MOMW9BgE6EvZi7LS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAxao5J2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B204C4CEE2;
	Fri, 28 Feb 2025 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779760;
	bh=WzG/KNySzTFxJVLImnFPJc4V3svrWDbTCG0HQL5y8dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAxao5J2J1HHb/UgaH5L4Az1eD1k0lkbp6bQgKG1x6hJDg87aaXApSu2GTUVtuxwz
	 7SAvVZqC5Y5YVCmr2KYgJDF9n2+kGizrfKn6LTJzaKNLYHHS2brMeVi1UdiVJRsvak
	 BPKx56n0RU0fgUaHsJJ7vKxA15Ub7WqM/m9xaPeqUA3Xf3Jd+XkVsO7kr2/OnoC6xs
	 1Wqi6ry5Y7+g31liiCmNLOsOdo/QOPC7wNXC9a6PmHB8df2HDhb4TNqEeFu65gSaeJ
	 4MdXG1qinZKwsaA4icCV2DfIfq04nrjIocKnS04WiOv1c1jC7egmJ18bi03GTGG0BN
	 vFMlgUHFw3hOw==
Date: Fri, 28 Feb 2025 15:55:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org, Will McVicker <willmcvicker@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: add max77759 binding
Message-ID: <174077970526.3762322.8276687312075496853.robh@kernel.org>
References: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org>
 <20250228-max77759-mfd-v3-3-0c3627d42526@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-max77759-mfd-v3-3-0c3627d42526@linaro.org>


On Fri, 28 Feb 2025 14:25:17 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes the top-level device.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v3:
> * drop gpio-controller and gpio-cells, GPIO is provided by the child
>   (Rob)
> 
> v2:
> * rename expected nvmem subdev nodename to 'nvmem-0'
>   I'd have preferred just 'nvmem', but that matches nvmem-consumer.yaml
>   and fails validation.
> 
> Note: MAINTAINERS doesn't need updating, the binding update for the
> first leaf device (gpio) adds a wildcard matching all max77759 bindings
> ---
>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


