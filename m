Return-Path: <linux-gpio+bounces-34204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM9MBZ0RxWkI6AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:59:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC6333E80
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 858AF307CE09
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E314B3E5581;
	Thu, 26 Mar 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEVn+NTH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2999637475B;
	Thu, 26 Mar 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522364; cv=none; b=DNgJXz5MSEe4B+PSJaw/2v7DRK5lli3XsWuYxEbTaPDjFVTAGCOyG2QtzZDQSj/psxBmT5BEJyo9aApVGg7s++vVLwypfoFMmjOxaFNo8H45KBJAjLk1tnGG+M6y/wQ56O+ihGGWfFczATgf1alQx8np5NzGCykFElapg85YnxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522364; c=relaxed/simple;
	bh=rLyqGmYuSi+wMxn1b0ali+yvckUPD8noIrII0Ryamk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl9tpW0oEIlfSfV3fbKYt/qUDEK87vUHWFUkAdkd4D8FGN1vZABBoPxKORyReTAikOFc/w560Nk5PYReFvoyrftsFz9bW+XukOosy7z6/Y8c8mPrjFT5RbEPuS9xl2GChRZfEmqZq9mcMS5gyqRctgixhcy110apZrOdY4S7Omc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEVn+NTH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19623C116C6;
	Thu, 26 Mar 2026 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522363;
	bh=rLyqGmYuSi+wMxn1b0ali+yvckUPD8noIrII0Ryamk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEVn+NTHkt/TYIm1ZVU1Pu5Y/sU0sOUYvQXsKJNYnFIUuG606Aew9IcqJSiCm2NVY
	 SsfRJKZ+l9T4kR8/V8ZNHEX64oW/lQIux599qEH1x+b4T8a8WnawOi5Yz+2dmW/+Ai
	 sEn47pdiDI3HS5Ms5d/aPD4PUIHZXie2ueJdoLvdiel22tq7699I5W3/21ObIICGD9
	 qdnCPzttn2wULk7UmBLVU/FCfgCifzjlU9BTaNsA5SS5kjT9N7SV0926xX1dTFSN7O
	 2p+OvjGak8gU+63IrX40qqGErng673HXZjST0xGPd2R2lHjBBF6F3au3IZlJcNsI3F
	 kTGfn8p+t5GWA==
Date: Thu, 26 Mar 2026 10:52:39 +0000
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mfd: timberdale: set up a software node for the
 GPIO cell
Message-ID: <20260326105239.GJ1141718@google.com>
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
 <20260316-gpio-timberdale-swnode-v2-1-ea0078066871@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-1-ea0078066871@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34204-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFBC6333E80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026, Bartosz Golaszewski wrote:

> Create a software node with device properties for the GPIO cell and
> attach it to all the GPIO cells.

Could you elaborate a little on the motivation for this change, please?
I assume this is the first step in a larger plan to convert the GPIO
child driver to use device properties and remove the legacy 'platform_data'.
If so, it would be good to state that in the commit message or a cover
letter for the series.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/mfd/timberdale.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
> index a4d9c070d481a182890a58e4b8c850c4c29f7f17..8d7dfeaa76258d02e50528e39c4f7125d9201388 100644
> --- a/drivers/mfd/timberdale.c
> +++ b/drivers/mfd/timberdale.c
> @@ -181,6 +181,18 @@ static struct timbgpio_platform_data
>  	.irq_base = 200,
>  };
>  
> +static const struct property_entry timberdale_gpio_properties[] = {
> +	PROPERTY_ENTRY_U32("ngpios", GPIO_NR_PINS),
> +	PROPERTY_ENTRY_U32("gpio-base", 0),

This appears to introduce a functional change. The existing 'platform_data'
sets 'gpio_base' to -1, which results in dynamic allocation. Hard-coding
a base of 0 here is very likely to cause conflicts.

Should this property be removed to retain the dynamic allocation behaviour?

> +	PROPERTY_ENTRY_U32("irq-base", 200),

This magic number should be defined.

> +	{ }
> +};
> +
> +static const struct software_node timberdale_gpio_swnode = {
> +	.name = "timb-gpio",
> +	.properties = timberdale_gpio_properties,
> +};
> +
>  static const struct resource timberdale_gpio_resources[] = {
>  	{
>  		.start	= GPIOOFFSET,
> @@ -392,6 +404,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg0[] = {
>  		.resources = timberdale_gpio_resources,
>  		.platform_data = &timberdale_gpio_platform_data,
>  		.pdata_size = sizeof(timberdale_gpio_platform_data),
> +		.swnode = &timberdale_gpio_swnode,
>  	},
>  	{
>  		.name = "timb-video",
> @@ -454,6 +467,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg1[] = {
>  		.resources = timberdale_gpio_resources,
>  		.platform_data = &timberdale_gpio_platform_data,
>  		.pdata_size = sizeof(timberdale_gpio_platform_data),
> +		.swnode = &timberdale_gpio_swnode,
>  	},
>  	{
>  		.name = "timb-mlogicore",
> @@ -516,6 +530,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg2[] = {
>  		.resources = timberdale_gpio_resources,
>  		.platform_data = &timberdale_gpio_platform_data,
>  		.pdata_size = sizeof(timberdale_gpio_platform_data),
> +		.swnode = &timberdale_gpio_swnode,
>  	},
>  	{
>  		.name = "timb-video",
> @@ -566,6 +581,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg3[] = {
>  		.resources = timberdale_gpio_resources,
>  		.platform_data = &timberdale_gpio_platform_data,
>  		.pdata_size = sizeof(timberdale_gpio_platform_data),
> +		.swnode = &timberdale_gpio_swnode,
>  	},
>  	{
>  		.name = "timb-video",
> 
> -- 
> 2.47.3
> 

-- 
Lee Jones [李琼斯]

