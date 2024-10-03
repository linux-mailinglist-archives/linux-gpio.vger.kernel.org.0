Return-Path: <linux-gpio+bounces-10787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A098EEA5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3604F2838CC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 11:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071B1155A5D;
	Thu,  3 Oct 2024 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W6Qq55em"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F52153BE4;
	Thu,  3 Oct 2024 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956778; cv=none; b=oL/CbvQXnnVkA7FhYIM6NFwcFHuHL6wHIj9qi/szLKyb7WLBPe5U1ZVBq7ZGhXQrOADyS+fRuW+xMvWijdJ3PQL6mxI5rB/6siT/u2JZvEWZGsPflyjkZnL64z9boqSqtbiijn0MkRLQhuXc3mMtHRA/succK9eEYKLNAcgpMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956778; c=relaxed/simple;
	bh=SYpAIjch7sjAvwc6DfsD+Yb8KF7SVa1BfiHQzyrY9UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/XI6me3EyNUAZACHLgsT/WBXzS8zOjLorFpHrIawpf4i8xj7MDAOeNPgzxyHBeNril3L2Ed40Xd1l39MVNGmRwoLsb/qyTiOQY3VMLFXo/ZVuL3Q7/j1vCm571Oczg0L+UPvL93RUqAJqdcjfU7ZLhHh9eHccOULrdCfj2pV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W6Qq55em; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952ABC4CEC5;
	Thu,  3 Oct 2024 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727956778;
	bh=SYpAIjch7sjAvwc6DfsD+Yb8KF7SVa1BfiHQzyrY9UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6Qq55em9Y+v8h2QVMDM5rZoxnoCFKUtBwczjyBQJBHtBssruG7SlzZS/Udo1e9xC
	 wxzxV6FsDkZfOZM0Gcdy2b7pa+S2CFKavLcH3+H0qzVJDA3JUSEWAxU1VgIcwfCotj
	 Vr+IT2tYo5ZuW/s4Q8TEVcRig2Z1qshHf4mQRba8=
Date: Thu, 3 Oct 2024 13:59:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 1/4] drivers: provide
 devm_platform_get_and_ioremap_resource_byname()
Message-ID: <2024100348-mortally-diary-f718@gregkh>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-2-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926143122.1385658-2-andrei.stefanescu@oss.nxp.com>

On Thu, Sep 26, 2024 at 05:31:18PM +0300, Andrei Stefanescu wrote:
> Similar to commit 890cc39a879906b63912482dfc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()")
> add a wrapper for "platform_get_resource_byname" and
> "devm_ioremap_resource". This new wrapper also returns the resource, if
> any, via a pointer.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/base/platform.c         | 27 +++++++++++++++++++++++++++
>  include/linux/platform_device.h | 13 +++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 4c3ee6521ba5..da6827f9462a 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -108,6 +108,33 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
>  }
>  EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource);
>  
> +/**
> + * devm_platform_get_and_ioremap_resource_byname - call devm_ioremap_resource()
> + *					    for a platform device and get
> + *					    a resource by its name
> + *
> + * @pdev: platform device to use both for memory resource lookup as well as
> + *        resource management
> + * @name: resource name
> + * @res: optional output parameter to store a pointer to the obtained resource.
> + *
> + * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
> + * on failure.
> + */
> +void __iomem *
> +devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
> +					      const char *name,
> +					      struct resource **res)
> +{
> +	struct resource *r;
> +
> +	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (res)
> +		*res = r;
> +	return devm_ioremap_resource(&pdev->dev, r);

Does this really help out much?  Where will the end be if we keep
stacking these up like this, the function names are getting huge...

I'm not going to object, but I'm also not going to ack it :)

thanks,

greg k-h

