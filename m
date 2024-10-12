Return-Path: <linux-gpio+bounces-11230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761299B1F2
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 10:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47A561C217EF
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 08:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BB91422C7;
	Sat, 12 Oct 2024 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G9KxV7aR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50760142E76;
	Sat, 12 Oct 2024 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728720209; cv=none; b=T5IMS1mhG3F2BeCsLSpaWrHrhKjRHNLbRXNoJLGAU53WxhrC4M/GJeNN810a7rFnxIhXxalrD7yJDU/16fbJoOWI8BJHsPVOJ3eoQ/45ptfQ18xPW71bOA+q1hMzmfMiHHU7zodWQftPYvsLLPAGJiqvTEPP9Y2sjWcSLXtAe4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728720209; c=relaxed/simple;
	bh=b6IVsTguK76MKOhGdPkEKxOJo0NdGyK1T4S5ZzxyIV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbPAXDVGGjx2m4zJM2lX0QoKXlaTQhJBUHPm7EkhAWh2pD30jvbmmgpBOCOsXtu7hdFKm5LLi0i+oXt4v5OsV6ZM0Dt+NdIvbWPJdHAt1q3NkilVW12yDpqzd/7ETo79MQFXmCi5UJ3ECO3x4BJrIxNSv3wD4h8LPC3SrgB70/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G9KxV7aR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EA6C4CECE;
	Sat, 12 Oct 2024 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728720208;
	bh=b6IVsTguK76MKOhGdPkEKxOJo0NdGyK1T4S5ZzxyIV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9KxV7aRgNqAd/9onm7n72tWPcdeXZ+tMpIB4jndkP9CEFm7ROH2pi8lJCNEfTZoI
	 X8/+48mgWNo8Y6QR6nfV0CCL/+vKnuNqz6o6hwqbyAjY8OyOj1EppX95F6IeaOLvWp
	 8F4o5NX3CZt4jSPmkMsX1PlNuTgRDJTJj9uuTyrc=
Date: Sat, 12 Oct 2024 10:03:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Judith Mendez <jm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bin Liu <b-liu@ti.com>, linux-serial@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] serial: 8250: omap: Move pm_runtime_get_sync
Message-ID: <2024101218-overpay-yoga-7423@gregkh>
References: <20241011173356.870883-1-jm@ti.com>
 <20241011173356.870883-3-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011173356.870883-3-jm@ti.com>

On Fri, Oct 11, 2024 at 12:33:56PM -0500, Judith Mendez wrote:
> Currently in omap_8250_shutdown, the dma->rx_running
> flag is set to zero in omap_8250_rx_dma_flush. Next
> pm_runtime_get_sync is called, which is a runtime
> resume call stack which can re-set the flag. When the
> call omap_8250_shutdown returns, the flag is expected
> to be UN-SET, but this is not the case. This is causing
> issues the next time UART is re-opened and omap_8250_rx_dma
> is called. Fix by moving pm_runtime_get_sync before the
> omap_8250_rx_dma_flush.

You can go to 72 columns :)

> Signed-off-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>

Wait, who wrote this, Bin?  If so, there needs to be a "From:" line
saying so.

What commit id does this fix?  Do you want it backported to older
kernels?  Why mix two different subsystems in the same patch series, who
is supposed to take it?

thanks,

greg k-h

