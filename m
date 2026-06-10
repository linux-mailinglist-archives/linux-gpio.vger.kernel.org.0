Return-Path: <linux-gpio+bounces-38279-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Kf5MQaYKWo5aQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38279-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:59:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FA66BC4A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:59:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GpHIoWhx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38279-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38279-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB2330377A9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31786331ECA;
	Wed, 10 Jun 2026 16:59:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BD12D7393;
	Wed, 10 Jun 2026 16:59:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110786; cv=none; b=tYu0975nOBACuF90G/sPuuk0PlVIzuNyqgU1BSRQqY5KoAjFfUrKw+c5AP009a+A3ajnaT+Ka41b122aHZ5tObR3Ph17mOLXsBe/FVEszXdrmWP1J5BLncHwj2XqjCPM2ko8Vnd7ryf2H72hmrgdNusHj7+qbrJoDEvtfF47QsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110786; c=relaxed/simple;
	bh=Sjl+/AckYq2nizXDXdQRHJzZf7ROurb2/g/1nNzJJbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHFawVLMh0qm2onmVrM5gcV2fWg5WJNoXl69PUPHuIW58G0a0cDU7O9l5hJ1qginZkaJkxggH2n0ajeMi3qMONXr3wgBw73qUPejaUiqv8Tkbax0jlfJC5cjTGHihmc+wWneExkqj7mI0qRIuewwRvrP1G1ERAmKsrth/Q17574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpHIoWhx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189241F00893;
	Wed, 10 Jun 2026 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781110784;
	bh=dMnGH76MkpAb4+BlIR4HwpHGmyY5SFXwi5vwdT2ctYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GpHIoWhxlQ6YbeayN6H5zyhaD/idTSrlgu9vP4CbATxPE6UdrKHRhQDsXgcWIu4tf
	 RSfm9DY3HoVadfVXJvOpbQZI0WMsfqvQnAe0CfdgWpCf6TQUGP2RYQiBIfsuRTK/RS
	 VRvMocwiYSoV3IN/WL1zz5ELh58WKECdggFEvmNpFNyecXJC8X2UC0EB1G58PVZXoG
	 aAKUt8kg9WnysBGnoXQsg3ai656hBOj05Tv8AFSi9Uig+MaVWoC5mSTOPBqRGY9RBV
	 YOrfwxonBmld/XPYlX/cfF/LCGHUbMhAURVq3kxDPipU47WEj2sJGUAQA3cdmD2nrq
	 bHZH616beEFtg==
Date: Wed, 10 Jun 2026 09:59:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	andriy.shevchenko@intel.com, mario.limonciello@amd.com,
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
Message-ID: <20260610165939.GA3440020@ax162>
References: <20260610083701.18663-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610083701.18663-1-hardikprakash.official@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38279-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C3FA66BC4A

On Wed, Jun 10, 2026 at 02:07:01PM +0530, Hardik Prakash wrote:
> This reverts commit ef76a3a28c79b628890431aa344af633e892035b.
> 
> The patch causes boot regressions on multiple machines. A NULL pointer
> dereference occurs when agpio->resource_source.string_ptr is NULL (i.e.
> when string_length is 0), and a probe deferral loop causes CPU starvation
> leading to kernel panic on Intel CI machines.
> 
> The patch needs a proper rewrite addressing these issues before resubmission.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>

Closes: https://lore.kernel.org/20260602185339.GA404948@ax162/
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 156 --------------------
>  1 file changed, 156 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 1c01b0460385..3351c4a9ef11 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -8,8 +8,6 @@
>   * Copyright (C) 2007 MontaVista Software Inc.
>   * Copyright (C) 2009 Provigent Ltd.
>   */
> -
> -#include <linux/acpi.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> @@ -132,152 +130,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_ACPI
> -struct gpio_dep_ctx {
> -	struct list_head gpio_controllers;
> -	int ret;
> -};
> -
> -struct gpio_controller_ref {
> -	struct list_head node;
> -	char *path;
> -};
> -
> -static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> -{
> -	struct gpio_dep_ctx *ctx = data;
> -	struct acpi_resource_gpio *agpio;
> -	struct gpio_controller_ref *ref, *tmp;
> -	bool found = false;
> -
> -	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
> -		return 1;
> -
> -	agpio = &ares->data.gpio;
> -	if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
> -		return 1;
> -
> -	/* Check if we've already tracked this GPIO controller */
> -	list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
> -		if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
> -			found = true;
> -			break;
> -		}
> -	}
> -
> -	if (!found) {
> -		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> -		if (!ref) {
> -			ctx->ret = -ENOMEM;
> -			return 0;
> -		}
> -
> -		ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> -		if (!ref->path) {
> -			kfree(ref);
> -			ctx->ret = -ENOMEM;
> -			return 0;
> -		}
> -
> -		list_add_tail(&ref->node, &ctx->gpio_controllers);
> -	}
> -
> -	return 1;
> -}
> -
> -static int check_child_gpioint(struct acpi_device *adev, void *data)
> -{
> -	struct gpio_dep_ctx *ctx = data;
> -	struct list_head res_list;
> -
> -	INIT_LIST_HEAD(&res_list);
> -
> -	acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
> -	acpi_dev_free_resource_list(&res_list);
> -
> -	if (ctx->ret < 0)
> -		return ctx->ret;
> -
> -	return 0;
> -}
> -
> -static int i2c_dw_check_gpio_dependencies(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -	struct gpio_dep_ctx ctx = { .ret = 0 };
> -	struct gpio_controller_ref *ref, *tmp;
> -	int ret = 0;
> -
> -	if (!adev)
> -		return 0;
> -
> -	INIT_LIST_HEAD(&ctx.gpio_controllers);
> -
> -	/* Walk all child devices and collect GpioInt controller references */
> -	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
> -	if (ret < 0 || ctx.ret < 0) {
> -		ret = ctx.ret ?: ret;
> -		goto cleanup;
> -	}
> -
> -	/* For each GPIO controller, check if its parent device is bound */
> -	list_for_each_entry(ref, &ctx.gpio_controllers, node) {
> -		acpi_handle handle;
> -		acpi_status status;
> -		struct acpi_device *gpio_adev;
> -		struct device *gpio_dev;
> -		bool bound;
> -
> -		status = acpi_get_handle(NULL, ref->path, &handle);
> -		if (ACPI_FAILURE(status))
> -			continue;
> -
> -		gpio_adev = acpi_fetch_acpi_dev(handle);
> -		if (!gpio_adev)
> -			continue;
> -
> -		gpio_dev = acpi_get_first_physical_node(gpio_adev);
> -		acpi_dev_put(gpio_adev);
> -
> -		if (!gpio_dev) {
> -			ret = -EPROBE_DEFER;
> -			goto cleanup;
> -		}
> -
> -		/*
> -		 * Check if the GPIO controller's device is bound. If not,
> -		 * defer probe to ensure GPIO initialization (including IRQ
> -		 * setup and quirks) is complete before we enumerate I2C
> -		 * child devices.
> -		 */
> -		scoped_guard(device, gpio_dev) {
> -			bound = device_is_bound(gpio_dev);
> -		}
> -		if (!bound) {
> -			put_device(gpio_dev);
> -			ret = -EPROBE_DEFER;
> -			goto cleanup;
> -		}
> -
> -		put_device(gpio_dev);
> -	}
> -
> -cleanup:
> -	list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
> -		list_del(&ref->node);
> -		kfree(ref->path);
> -		kfree(ref);
> -	}
> -
> -	return ret;
> -}
> -#else
> -static int i2c_dw_check_gpio_dependencies(struct device *dev)
> -{
> -	return 0;
> -}
> -#endif /* CONFIG_ACPI */
> -
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>  	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> @@ -286,14 +138,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	struct dw_i2c_dev *dev;
>  	int irq, ret;
>  
> -	/*
> -	 * Check if any child devices have GpioInt resources, and if so,
> -	 * defer probe until those GPIO controllers are fully bound.
> -	 */
> -	ret = i2c_dw_check_gpio_dependencies(device);
> -	if (ret)
> -		return ret;
> -
>  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq == -ENXIO)
>  		flags |= ACCESS_POLLING;
> 
> base-commit: 3f786abd23951f3f600a62fef42469d9200d5f52
> prerequisite-patch-id: 22fa9ba20fa28cf94185281704c51feef7abc701
> -- 
> 2.54.0
> 

-- 
Cheers,
Nathan

