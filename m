Return-Path: <linux-gpio+bounces-10677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FF98CF56
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 10:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CBF91F21D41
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C2A19754A;
	Wed,  2 Oct 2024 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nqvz1R9J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9E196D80;
	Wed,  2 Oct 2024 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859458; cv=none; b=fYUBNIX75VaJ3f61UB5/O44a+kuYj1dlXMJMt6tJaND4FYKlPfOhXIkFdA7tM68Hha4j/C4V3pN6ekCo3R30y0+T4okLKTC98Oazf0AizdLCr1zWqt7wscyQdnlKeOwoixp0+hmSVE2jpOMi7tDrFEnzIPQBFrdNGaEsQa1rLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859458; c=relaxed/simple;
	bh=QNyF9XtlNehK+guEBczkgXNbZy3BotIc6FlJ7vuzJSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LokPbo1NK0N0V+SRU9SXpqU7grKYQTE8hzC7bswVFJydmuLk1z5a4vBXfvdvATQAvL9+vCiSEJKXOUXZzMZuOJ3UIiQUAOJlae2e9WNX3m9rEvj0+VQdusrhLuI+sftYiUBpZTUIT858tImTOKMA9APyygp0UVRfmrHpC4K4OQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nqvz1R9J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC06C4CEC5;
	Wed,  2 Oct 2024 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727859458;
	bh=QNyF9XtlNehK+guEBczkgXNbZy3BotIc6FlJ7vuzJSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqvz1R9JdaB11sGh4U0h/XMhfraG+/FwOOLbqZ8erws0UUJyQsDYc8cYoyalZm4ln
	 N7KVnRRqDxOa01GRLZedOFwCbz3vbm3yon+58JtWd/IOb5wioJk0XOoP6D3tTYFTxx
	 Bc1KoKLZHoF6IaYU7W8su11UCinfu6IAsJAyxP0c=
Date: Wed, 2 Oct 2024 10:57:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] misc: microchip: pci1xxxx: add support for
 NVMEM_DEVID_AUTO for EEPROM device
Message-ID: <2024100223-germless-stretch-9c48@gregkh>
References: <20241002085440.742863-1-heiko.thiery@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002085440.742863-1-heiko.thiery@gmail.com>

On Wed, Oct 02, 2024 at 10:54:40AM +0200, Heiko Thiery wrote:
> By using NVMEM_DEVID_AUTO we support more than 1 device and
> automatically enumerate.
> 
> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX EEPROM via NVMEM sysfs")
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> index 7c3d8bedf90b..d1cd4544c83c 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> @@ -364,6 +364,7 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
>  	if (is_eeprom_responsive(priv)) {
>  		priv->nvmem_config_eeprom.type = NVMEM_TYPE_EEPROM;
>  		priv->nvmem_config_eeprom.name = EEPROM_NAME;
> +		priv->nvmem_config_eeprom.id = NVMEM_DEVID_AUTO;
>  		priv->nvmem_config_eeprom.dev = &aux_dev->dev;
>  		priv->nvmem_config_eeprom.owner = THIS_MODULE;
>  		priv->nvmem_config_eeprom.reg_read = pci1xxxx_eeprom_read;
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

