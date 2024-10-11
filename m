Return-Path: <linux-gpio+bounces-11166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E034999BCA
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 06:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A9A3B2338F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 04:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307241F471F;
	Fri, 11 Oct 2024 04:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="swBhvHwt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF111392;
	Fri, 11 Oct 2024 04:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621970; cv=none; b=hUYh0DIdtW3NbI+9bdntHPMuSEMAPTTmKr/2aiKtP1q4OilPrz02dPNeB/lQeEhbTSFKgwrj4GrFAaUS+X5W9uUWIeNi0UbNa5e4luXNgsJ4KbNOqpf9f2ApJ1tvY2KP6BuQ3qmOE/pobJIkk5lMFyRidJEpz6Lqc85c5si2XrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621970; c=relaxed/simple;
	bh=V9ZExzkaPjw7sLS5aK7k8w5fJSCH/Aqbe7bVDfChCqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBOlwQ9fLDC5ssSSv5JxQNCeCDVt+m5aCK0igf58p+mlFiXDQxJBKQ/SkK09VXDq+Ev1akFst1uw/MNEUZ85naPigzvVdqBfgD8OIv5x6v0fkPrutzS1K/4LbOHH5N0Mq/KtwfOxAVpfUlY/avp9pcS34qfaMapfZN8vCPoxUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=swBhvHwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056A9C4CEC3;
	Fri, 11 Oct 2024 04:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728621969;
	bh=V9ZExzkaPjw7sLS5aK7k8w5fJSCH/Aqbe7bVDfChCqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swBhvHwtDB4ctG7VsCgkyNray4VQXs34QgP0CAXSHAkbeGPn57MborrgMF588/pYQ
	 WPu3Vp5Qkh7mE6GiRm2n+Jf6mMR6irAFpKe7TS1WYROC+azqE8Kj9xoJ6Ep9LASVC2
	 LNyuVAQO0VoAJUNycbeYRUo+nJSTAzjwi93REW0I=
Date: Fri, 11 Oct 2024 06:46:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Judith Mendez <jm@ti.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 2/2] serial: 8250: omap: Move pm_runtime_get_sync
Message-ID: <2024101154-vest-freeing-dd4f@gregkh>
References: <20241010184802.203441-1-jm@ti.com>
 <20241010184802.203441-3-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010184802.203441-3-jm@ti.com>

On Thu, Oct 10, 2024 at 01:48:02PM -0500, Judith Mendez wrote:
> Currently in omap_8250_shutdown, the dma->rx_running
> flag is set to zero in omap_8250_rx_dma_flush. Next
> pm_runtime_get_sync is called, which is a runtime
> resume call stack which can re-set the flag. When the
> call omap_8250_shutdown returns, the flag is expected
> to be UN-SET, but this is not the case. This is causing
> issues the next time UART is re-opened and omap_8250_rx_dma
> is called. Fix by moving pm_runtime_get_sync before the
> omap_8250_rx_dma_flush.
> 
> Fixes: 0e31c8d173ab ("tty: serial: 8250_omap: add custom DMA-RX callback")
> Signed-off-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  drivers/tty/serial/8250/8250_omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index 88b58f44e4e9..0dd68bdbfbcf 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -776,12 +776,12 @@ static void omap_8250_shutdown(struct uart_port *port)
>  	struct uart_8250_port *up = up_to_u8250p(port);
>  	struct omap8250_priv *priv = port->private_data;
>  
> +	pm_runtime_get_sync(port->dev);
> +
>  	flush_work(&priv->qos_work);
>  	if (up->dma)
>  		omap_8250_rx_dma_flush(up);
>  
> -	pm_runtime_get_sync(port->dev);
> -
>  	serial_out(up, UART_OMAP_WER, 0);
>  	if (priv->habit & UART_HAS_EFR2)
>  		serial_out(up, UART_OMAP_EFR2, 0x0);
> -- 
> 2.46.2
> 
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

