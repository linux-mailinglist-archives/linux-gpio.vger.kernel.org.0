Return-Path: <linux-gpio+bounces-23886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E19B153F3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 21:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186CA56289F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 19:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A47255E4E;
	Tue, 29 Jul 2025 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnPcwBOQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A732517A5;
	Tue, 29 Jul 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753818713; cv=none; b=KEFm3Mt73Voo2so25F33JRnUvY2lJX9VE1FVqTxtt2yLm4+URS1TpHCB9yYpilFL3KAuFO7idI6z2FJMAYBnioO2orfb0lCL0T/wFH0l6ieA+1hwqAeVFYBwy+mbTQxz3ZxnmkFklFQDjAXV6vXhvsWI5nyfVXvP9B584JVYZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753818713; c=relaxed/simple;
	bh=LvLZjqXdLZ/C3FmulEyHLqTLcLW07oR0bKRYVP6DKqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuVp7SKFt5bIDlDAvKIYjso8JIyNmGszN6ot/DfeqIR+0a1qF7RoxtpIH6lmsxC5huLWpgwame0St1ojHLRQGn+9n95rXMchZ/UbCB9RDzyFK8NDRRgmYDaydyqpb9GafaETWFmshAu9sZNma/f6eiGkbsHOk1m/WSjdYCYSSCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnPcwBOQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3721EC4CEEF;
	Tue, 29 Jul 2025 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753818712;
	bh=LvLZjqXdLZ/C3FmulEyHLqTLcLW07oR0bKRYVP6DKqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnPcwBOQzBn4+S4EBwpCLTmaq6UTs8adnZNlj7tFpjfxC4mGyMdjnewASKXa1VElY
	 bXq87b2+AhSznUbs0RN6cBlClgefmVLgz7bc1boIXWo2eYoN6ON5NlWmiEZI499PJC
	 DfDLIDxq4q7mfB4aMVq6qT0xYuqFd2fQBVqWN0whf0jYkARh9uGNriMZAHHSRQRDR6
	 P7UcM3YLkabTQwXdCmMh7G/XKZfS9NgGwhqof1XH3uzBsG++BG/EMe7yOS+PT7oEE3
	 2boAI9A1Z7BCDz4lJ0I5ihRCpXvg/vkZAJTOcMBx81NH4Bb0lAUoEveW0T25gvZ20A
	 6+5XznQqp9ufQ==
Date: Tue, 29 Jul 2025 14:51:51 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/6] of/irq: Introduce of_irq_foreach_imap
Message-ID: <20250729195151.GB658914-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
 <20250725152618.32886-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725152618.32886-5-herve.codina@bootlin.com>

On Fri, Jul 25, 2025 at 05:26:13PM +0200, Herve Codina wrote:
> of_irq_foreach_imap is an iterator designed to help a driver to parse
> an interrupt-map property.
> 
> Indeed some drivers need to know details about the interrupt mapping
> described in the device-tree in order to set internal registers
> accordingly.

I would like to see some existing user converted to make sure it works 
for other cases.

> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_irq.h | 11 +++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index f8ad79b9b1c9..863b31eb3c1a 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -157,6 +157,76 @@ const __be32 *of_irq_parse_imap_parent(const __be32 *imap, int len, struct of_ph
>  	return imap;
>  }
>  
> +/**
> + * of_irq_foreach_imap - Iterate through interrupt-map items
> + * @np: device node where interrupt-map is available
> + * @func: function called on each interrupt-map items
> + * @data: data passe to @func
> + *
> + * This function iterates through interrupt-map items and calls @func on each
> + * item. The parent interrupt described in the interrupt-map item is parsed
> + * and passed to @func using a pointer to a struct of_phandle_args.
> + * Also the imap raw value is passed in order to allow @func to look at other
> + * values of the interrupt-map (child unit address and child interrupt
> + * specificer)
> + *
> + * If @func returns an error, the iteration stops and this error is returned.
> + */
> +int of_irq_foreach_imap(struct device_node *np,
> +			int (*func)(void *data,
> +				    const __be32 *imap,
> +				    const struct of_phandle_args *parent_args),
> +			void *data)

The func callback is a departure from other DT iterators. Look at the 
'ranges' iterator which keeps the state on each iteration.

Rob

