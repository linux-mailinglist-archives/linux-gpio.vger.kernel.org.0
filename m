Return-Path: <linux-gpio+bounces-10678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A09B98CF5A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 10:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B51B1C2171B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 08:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F38198A35;
	Wed,  2 Oct 2024 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Or+AOWoa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336AF567D;
	Wed,  2 Oct 2024 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859474; cv=none; b=ZZay3dGAnXqUHk68XwY7upIcPDfyade/l7hcxZHHo/5VCFa0NvpY4IM3MVzBWJgvGZvOxwNudb3HmGr7EK8dU4wGuo8GutjGUPfhGt5743oRuFMAbPTa3zxIYRk+pri8q/pRpG4ATLkTsFUj2luKBXyZK8YgG0qHoHyloyWVFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859474; c=relaxed/simple;
	bh=pa3tBzNVpPNAV3A/XU1TCgu0SVPEXHItdUJ6/mWBpJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kH4WuTLzBjeLV1cs4Dra+ek0LlE/4p1NqjaaPBMU53YzcsEjHqO4guEa3QjzBGussXWccfsIHrppOl/5AcFBMFF1xDEbbLzZWHXVGPzcgZZnFNWl+kvPKlKfIJqD9frYzqAjB9ff9xFOcyXOfKlLJIhu+aMe/VV4ZmjpPQYNYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Or+AOWoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACB9C4CEC5;
	Wed,  2 Oct 2024 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727859473;
	bh=pa3tBzNVpPNAV3A/XU1TCgu0SVPEXHItdUJ6/mWBpJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Or+AOWoaHk8aPkH9jIFveSYu5LCycMk3fLCAx5UhGyNy/9iy1MTBzrxioro+ECehh
	 hkcCjlOMy5YQM30s4rYL8JKMaFj5b4Y+ZVNyvBypWftomk33oaO10a/IYZ7QqSCzfa
	 Jd9aqYASjJHzKEvpv0cKk212oeB2EAPJPIl7xbgc=
Date: Wed, 2 Oct 2024 10:57:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/2] misc: microchip: pci1xxxx: add support for
 NVMEM_DEVID_AUTO for OTP device
Message-ID: <2024100242-subsonic-foe-efab@gregkh>
References: <20241002085440.742863-1-heiko.thiery@gmail.com>
 <20241002085440.742863-2-heiko.thiery@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002085440.742863-2-heiko.thiery@gmail.com>

On Wed, Oct 02, 2024 at 10:54:42AM +0200, Heiko Thiery wrote:
> By using NVMEM_DEVID_AUTO we support more than 1 device and
> automatically enumerate.
> 
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> index d1cd4544c83c..a2ed477e0370 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> @@ -384,6 +384,7 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
>  
>  	priv->nvmem_config_otp.type = NVMEM_TYPE_OTP;
>  	priv->nvmem_config_otp.name = OTP_NAME;
> +	priv->nvmem_config_otp.id = NVMEM_DEVID_AUTO;
>  	priv->nvmem_config_otp.dev = &aux_dev->dev;
>  	priv->nvmem_config_otp.owner = THIS_MODULE;
>  	priv->nvmem_config_otp.reg_read = pci1xxxx_otp_read;
> -- 
> 2.39.2
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

