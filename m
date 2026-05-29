Return-Path: <linux-gpio+bounces-37674-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPe/ItJmGWrZwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37674-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:13:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 876306008C4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75B4D303CC63
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B89D361DDE;
	Fri, 29 May 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOIawC66"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A835E957;
	Fri, 29 May 2026 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049557; cv=none; b=VCABlrYlaitlyP8nTBxAPvaSStl8nFQsFE+MaC+HKzxkPky0bDFCv/G9TArzVGlpVN8xL6jzkKZ4A5pnQ4nk4p0AJt3uA8k6xdg7XWuOeVYqMcTeLC8DVI1tFX5NgAul2bjG3faRw0fq/MUuOrzdMhjpx5m49whukLRVJxPPkmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049557; c=relaxed/simple;
	bh=GIcaFG6M1SkHjKXigMemRInzge4mXe57mJYdhK74ABo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvUZv/c81UukE2xrf5IOYF9GnQ8rSNm43Vv9IetcZw1pSP5WNekkIjC+3yImByeAWcY27FkBpuRz6PqYM7D2XPBzcSpkNHYUoKdUikyxF3onYDc20yWIelEGGNhNwV5Q1IoNtqi6qonH52QsUPcsdXCKA0KdachmyuwABZqxZm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOIawC66; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0336A1F00893;
	Fri, 29 May 2026 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780049555;
	bh=fMAQQSReMiieejVumH4eORqXy543frXxNA1ljzjLNko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cOIawC66wU/4SWqYpaI3BiT85KM8A5TvOwzxasmQXs9FEeLeuUw2sUZCvsD8I3P+w
	 Wr9QTPppV0WwZDljiWul15z3Hung0cpWwqIBhbaj6pyjGuOCIZ4XvhF86ZLDc1eEWd
	 9HI+usja5rwPZyAFQBWsc+3x3NKlcVzgsJ/Ki4dQjGiEww2jKwWV+HJpEBvVkgbWRa
	 x8h3S002Ap+yuQ4rZrsol9NFcBa5470FIuHN36GLedAUqJwKSbGfl5yjLm2YnxRLdi
	 B01oqK8HiQFkdkeQG9UCCXuEVAJCfiNBk5peinTnMdb3xFZA9weTWe5JLU5wgzAKoA
	 hIggSVxdMDiWg==
Message-ID: <4de80fd6-007e-484f-a7c9-17838ee5b1da@kernel.org>
Date: Fri, 29 May 2026 12:12:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 kernel test robot <lkp@intel.com>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260529100838.8896-3-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37674-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 876306008C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/26 12:08, Hardik Prakash wrote:
> I2C controllers may have child devices with GpioInt resources that
> depend on GPIO controllers to be fully initialized. If the I2C
> controller probes and enumerates children before the referenced GPIO
> controller has completed probe, GPIO interrupts may not be properly
> configured, leading to device failures.
> 
> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> 
>    i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> 
> Add a generic dependency check in i2c-designware that walks ACPI child
> devices, identifies any GpioInt resources, resolves the referenced GPIO
> controllers, and defers probe if those controllers are not yet bound.
> 
> This ensures GPIO controllers complete initialization (including IRQ
> setup and quirks) before I2C child enumeration begins, fixing the race
> without device-specific quirks or DMI matching.
> 
> The probe ordering race was confirmed via dynamic debug tracing:
> 
>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>    2.348157  lost arbitration
> 
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494

Fixes: 3812a9e84265a ("pinctrl-amd: enable IRQ for WACF2200 touchscreen 
on Lenovo Yoga 7 14AGP11")

> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 156 ++++++++++++++++++++
>   1 file changed, 156 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 3351c4a9ef11..1c01b0460385 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -8,6 +8,8 @@
>    * Copyright (C) 2007 MontaVista Software Inc.
>    * Copyright (C) 2009 Provigent Ltd.
>    */
> +
> +#include <linux/acpi.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> @@ -130,6 +132,152 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_ACPI
> +struct gpio_dep_ctx {
> +	struct list_head gpio_controllers;
> +	int ret;
> +};
> +
> +struct gpio_controller_ref {
> +	struct list_head node;
> +	char *path;
> +};
> +
> +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> +{
> +	struct gpio_dep_ctx *ctx = data;
> +	struct acpi_resource_gpio *agpio;
> +	struct gpio_controller_ref *ref, *tmp;
> +	bool found = false;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
> +		return 1;
> +
> +	agpio = &ares->data.gpio;
> +	if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
> +		return 1;
> +
> +	/* Check if we've already tracked this GPIO controller */
> +	list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
> +		if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +		if (!ref) {
> +			ctx->ret = -ENOMEM;
> +			return 0;
> +		}
> +
> +		ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> +		if (!ref->path) {
> +			kfree(ref);
> +			ctx->ret = -ENOMEM;
> +			return 0;
> +		}
> +
> +		list_add_tail(&ref->node, &ctx->gpio_controllers);
> +	}
> +
> +	return 1;
> +}
> +
> +static int check_child_gpioint(struct acpi_device *adev, void *data)
> +{
> +	struct gpio_dep_ctx *ctx = data;
> +	struct list_head res_list;
> +
> +	INIT_LIST_HEAD(&res_list);
> +
> +	acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
> +	acpi_dev_free_resource_list(&res_list);
> +
> +	if (ctx->ret < 0)
> +		return ctx->ret;
> +
> +	return 0;
> +}
> +
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	struct gpio_dep_ctx ctx = { .ret = 0 };
> +	struct gpio_controller_ref *ref, *tmp;
> +	int ret = 0;
> +
> +	if (!adev)
> +		return 0;
> +
> +	INIT_LIST_HEAD(&ctx.gpio_controllers);
> +
> +	/* Walk all child devices and collect GpioInt controller references */
> +	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
> +	if (ret < 0 || ctx.ret < 0) {
> +		ret = ctx.ret ?: ret;
> +		goto cleanup;
> +	}
> +
> +	/* For each GPIO controller, check if its parent device is bound */
> +	list_for_each_entry(ref, &ctx.gpio_controllers, node) {
> +		acpi_handle handle;
> +		acpi_status status;
> +		struct acpi_device *gpio_adev;
> +		struct device *gpio_dev;
> +		bool bound;
> +
> +		status = acpi_get_handle(NULL, ref->path, &handle);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		gpio_adev = acpi_fetch_acpi_dev(handle);
> +		if (!gpio_adev)
> +			continue;
> +
> +		gpio_dev = acpi_get_first_physical_node(gpio_adev);
> +		acpi_dev_put(gpio_adev);
> +
> +		if (!gpio_dev) {
> +			ret = -EPROBE_DEFER;
> +			goto cleanup;
> +		}
> +
> +		/*
> +		 * Check if the GPIO controller's device is bound. If not,
> +		 * defer probe to ensure GPIO initialization (including IRQ
> +		 * setup and quirks) is complete before we enumerate I2C
> +		 * child devices.
> +		 */
> +		scoped_guard(device, gpio_dev) {
> +			bound = device_is_bound(gpio_dev);
> +		}
> +		if (!bound) {
> +			put_device(gpio_dev);
> +			ret = -EPROBE_DEFER;
> +			goto cleanup;
> +		}
> +
> +		put_device(gpio_dev);
> +	}
> +
> +cleanup:
> +	list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
> +		list_del(&ref->node);
> +		kfree(ref->path);
> +		kfree(ref);
> +	}
> +
> +	return ret;
> +}
> +#else
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_ACPI */
> +
>   static int dw_i2c_plat_probe(struct platform_device *pdev)
>   {
>   	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> @@ -138,6 +286,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	struct dw_i2c_dev *dev;
>   	int irq, ret;
>   
> +	/*
> +	 * Check if any child devices have GpioInt resources, and if so,
> +	 * defer probe until those GPIO controllers are fully bound.
> +	 */
> +	ret = i2c_dw_check_gpio_dependencies(device);
> +	if (ret)
> +		return ret;
> +
>   	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq == -ENXIO)
>   		flags |= ACCESS_POLLING;


