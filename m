Return-Path: <linux-gpio+bounces-40054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MVYvO2EaVmrkzAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:15:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A46753D01
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:15:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="lsAEWiM/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40054-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40054-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B02F3025ADC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 11:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3059C37C925;
	Tue, 14 Jul 2026 11:15:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C237475E
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 11:15:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027743; cv=pass; b=W4+UuNm9bCUiz8AL1nVFD4XJlHAvTsnZOsEymcDQKh9hV9nVRMFOoKkXad25v3wqATUoAd6m7HQxA52SggpTpIJAwMO+5reTAlfPw3Gdio6eXLwKe5qsphxuS92PdXtWX+87b3FQzG25rfomOJIk+PCtG1/tVxIfdglggf4qJRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027743; c=relaxed/simple;
	bh=7XGjSNLXWKGEqUEEbwp9bWHoLx/iVeYCcsoB37J1w+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhWdBg6j1vjgj9N1ljf+oEweitZGcXW/7CV6vg7xetEeHUCVFOZrxQW9EnsP5M+DFKo6bPD45qjVhbe9vGa6Is+VErK5ba4pHG7aixvWNH0BY4YCN00/oW3oSXA5E0WCioR8hPLW+w18PCobJUPWovx8ZdSwaAZI+DdHNPNf6Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsAEWiM/; arc=pass smtp.client-ip=74.125.224.42
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66804667af2so659111d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 04:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784027739; cv=none;
        d=google.com; s=arc-20260327;
        b=GMJW4aflNB6Nk/gIG/tCztwtLzxpQzwjgCq3RVmFbmRhm2vaNTKZ3w5jXashmKoODo
         fIpqmiBmsL5EPksF3wkqUeqpKCLRxidihpDmZwTfQjaNc3UI6ELkkxzyiDUltN2ozdZ1
         WHBkm4ePJCfK3VVzJrujzUhJyytW/qxuzzQ1hByLtrUtqnmha+XIAS9joVAj0EMpANBZ
         pWi+STcaCnjkn/APWtyoD7dsER/0XfCWjGAvMYfnDtqAYWi6ee8RT8Y5+1qdDooDRFrx
         3BxhWawmEKI+EzMEqrs95iiUKLjpe6Mi5w0rqSXxm+KNxeNGJPII8kAwBzx4rp3C/qpU
         WvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5WrXdskcetSUJ37CNYjivChidVHjycyoSSj47ydSryU=;
        fh=7S5MX/ph9CUBhGU8DFoMxpiAT7yVmEoRwWKjwTb5ooA=;
        b=IPD42qp+jWBEID7/WYkyOtJ9/FkuHEtMNPRINkWTwlr921W51EzCvZkMGgTphF1XZ9
         Em3CSjkCvwMWgfo86fQuNYrVWfvi7hAdIpVvmmgOHMDOdSN+dVDySiO6lpBkZKBGqEPt
         mK8hYzksAXH15Mhf8iUx6h+jdGyd4bdxpkQMPuhkd4GWUiFG0miKtuRbzEE1YgpVyXFc
         j/pxiS6JtwUwkYM0KbkNBx84zXTR/D+KJEjtySz/OSK2YO3ybJe5nv2kb7HlDzizdfsO
         8np9ZMOrmZ3wm/kMmsfB0rMfpokGBeHT8e6pnARTzIlcmKUQ8NmzK4DedXV/YI0q4QS0
         1pjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784027739; x=1784632539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WrXdskcetSUJ37CNYjivChidVHjycyoSSj47ydSryU=;
        b=lsAEWiM/COUgGUHiR6g4mQC0rdtU9IGZjWEuafFiG3T9npYUj9jqBipvageoHQ9IUA
         o4sVQa2LmpPK4X1N89kssXwGDtfRCH20FxsofBG5qWyNAfpwyCZKNCDr/mj2j3rqV0s0
         3Un3MjsF0C85F7uYDS1V1PJwj6v1MK7E/bRFA1cTjuKa3M1XtqP5CeyaSJU43ADPsa5I
         9deiGz5T1hQEO88Rqpvtn/Zp9uTL0LgzhqDaIJUdAhptu1tG9FJQOOzN3Yefk7y0wkxV
         gI4Vei6GO0lJUm3h7UJkKoWm4wOmh4R49R0VtPJ3hfJgdyFCx/wgGtwjYh3hKm+P+p6O
         yomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027739; x=1784632539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5WrXdskcetSUJ37CNYjivChidVHjycyoSSj47ydSryU=;
        b=CVrQzhR61uxa8tgc3oL4rh2Lc+2MGfP4OSQlzYdnsvzlBKOZx1QdUAu6O3NHvv1lBh
         ADH3QZPElxE38pXsGF1ezMYAG2GliooRgCDta24ASP14egpLdUlZy/NdiqSCVaKp05LW
         TiVJ2ijr/PMWilioRQand6eMJhM9P4GYhIA3fLsiFjE2YtUr97D+n5vyzBYe3CmYUk+V
         bkdTQbER3Ewzv1F5r4Kkxf8gaH8Wa6EvBRZ91JXUp/cJmE+oz5HPXDe9gDgD4cEy2lUL
         H5BkKg8RLeRPcz1Vq865ZMMzNraeT7CNHyIoeJiKxg7IXO6uN+9AeZqhWot30eYTjq2l
         VlYg==
X-Gm-Message-State: AOJu0YwA5CxbayZ0ykTrpQeJgE9nMZRZAvAThmPXqSm6WwoH0AP2b9r9
	xrgy5swOkCPz2odaVLqG0ljIFWLv6H5vUlpN2QVP3J4eWL584469mY2flexYmyD4kFiU1fTCLb0
	2OUmXO38Y9cTeUfFXZYwt/Pq8/Es3F2g=
X-Gm-Gg: AfdE7ck1l3e0gVBGDK1HN1sqlyNgEndmPSUicZPR/D/DRQNeivrhH9Ae3xKcGN5I2c5
	9UovebCweAhM9KjcpjGDAef8eJj4GkqDMMvNF60ECFVof4Uo4V6n0A1sAE3DHRzDMX2iR1zNqTh
	1G5g+oKsZRt9c6GhrjNzWWbNbqBuC4FLJm1p7BE64j6yDqPnw/jOJweMTww+s7+Gi09dq9ekHtO
	9R6b095rDvn9G+wijIWodgkIl+ZCh931llG3ydTjPeXNdsUaCB5LP35IpouBzPhmMpCbpoIda5l
	odnZSbMax3ayGDd02YleJWwZmE0HSub9GvqmhoRljwqQ9yW+RoZj9eWYqLY+OPKoXbVv4QGBlKZ
	7bfSjLGpUBV+JkS3N8YPNVajNXrHuEVYZueAyjjD+0Gdy3ZIz
X-Received: by 2002:a05:690e:159a:10b0:667:a382:baf4 with SMTP id
 956f58d0204a3-667d7bcb209mr6761078d50.47.1784027739393; Tue, 14 Jul 2026
 04:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701101218.42529-1-hardikprakash.official@gmail.com>
In-Reply-To: <20260701101218.42529-1-hardikprakash.official@gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Tue, 14 Jul 2026 16:45:28 +0530
X-Gm-Features: AUfX_mzwlZVZqsCh0b8gLqEghwoEKLwwOKTQ2PmtIentwiGoKw90Kb_vzL3KTXY
Message-ID: <CANTFpSXz+aR6LkOKGn=Co2gUVJz8wCZTiQ4BAxZguz2nVgo81A@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40054-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,amd.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0A46753D01

Hi all,

I just wanted to gently ping on this; it's been about two weeks since
v10 was sent. Checking if there's any feedback, or if this is ready to
be queued.

Thanks,
Hardik

On Wed, 1 Jul 2026 at 15:42, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
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
> fail with lost arbitration errors.
>
> Add a generic dependency check in i2c-designware that walks ACPI child
> devices, identifies any GpioInt resources, resolves the referenced GPIO
> controllers, and defers probe if those controllers are not yet bound.
> Uses acpi_gpio_get_irq_resource() to avoid duplicating GPIO resource
> parsing logic from gpiolib-acpi. Skips resources with no resource
> source string (string_length == 0 or string_ptr == NULL) to avoid
> crashes on hardware where GPIO resources have no named controller.
>
> The probe ordering race was confirmed via dynamic debug tracing:
>
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
>
> Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT:gpt-5.4-mini
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 132 ++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 6d6e81242f74..d8331d1dead8 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -8,6 +8,8 @@
>   * Copyright (C) 2007 MontaVista Software Inc.
>   * Copyright (C) 2009 Provigent Ltd.
>   */
> +
> +#include <linux/acpi.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> @@ -130,6 +132,132 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>         return 0;
>  }
>
> +#if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
> +struct gpio_controller_ref {
> +       struct list_head node;
> +       const char *path;
> +};
> +
> +static void free_gpio_controller_list(struct list_head *gpio_controllers)
> +{
> +       struct gpio_controller_ref *ref, *tmp;
> +
> +       list_for_each_entry_safe(ref, tmp, gpio_controllers, node) {
> +               list_del(&ref->node);
> +               kfree(ref->path);
> +               kfree(ref);
> +       }
> +}
> +
> +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> +{
> +       struct list_head *gpio_controllers = data;
> +       struct acpi_resource_gpio *agpio;
> +       struct gpio_controller_ref *ref;
> +
> +       if (!acpi_gpio_get_irq_resource(ares, &agpio))
> +               return 1;
> +
> +       if (!agpio->resource_source.string_length)
> +               return 1;
> +
> +       /* Skip if we've already tracked this GPIO controller */
> +       list_for_each_entry(ref, gpio_controllers, node) {
> +               if (!strncmp(ref->path, agpio->resource_source.string_ptr,
> +                            agpio->resource_source.string_length))
> +                       return 1;
> +       }
> +
> +       ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +       if (!ref)
> +               return -ENOMEM;
> +
> +       ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> +       if (!ref->path) {
> +               kfree(ref);
> +               return -ENOMEM;
> +       }
> +
> +       list_add_tail(&ref->node, gpio_controllers);
> +       return 1;
> +}
> +
> +static int check_child_gpioint(struct acpi_device *adev, void *data)
> +{
> +       struct list_head res_list;
> +       int ret;
> +
> +       INIT_LIST_HEAD(&res_list);
> +       ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, data);
> +       if (ret < 0)
> +               return ret;
> +
> +       acpi_dev_free_resource_list(&res_list);
> +       return 0;
> +}
> +
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +       struct gpio_controller_ref *ref;
> +       LIST_HEAD(gpio_controllers);
> +       struct acpi_device *adev;
> +       int ret;
> +
> +       adev = ACPI_COMPANION(dev);
> +       if (!adev)
> +               return 0;
> +
> +       /* Walk all child devices and collect GpioInt controller references */
> +       ret = acpi_dev_for_each_child(adev, check_child_gpioint, &gpio_controllers);
> +       if (ret < 0)
> +               goto cleanup;
> +
> +       /* For each GPIO controller, check if its platform device is bound */
> +       list_for_each_entry(ref, &gpio_controllers, node) {
> +               struct acpi_device *gpio_adev;
> +               struct device *gpio_dev;
> +               acpi_status status;
> +               acpi_handle handle;
> +               bool bound;
> +
> +               status = acpi_get_handle(NULL, ref->path, &handle);
> +               if (ACPI_FAILURE(status))
> +                       continue;
> +
> +               gpio_adev = acpi_fetch_acpi_dev(handle);
> +               if (!gpio_adev)
> +                       continue;
> +
> +               gpio_dev = acpi_get_first_physical_node(gpio_adev);
> +               acpi_dev_put(gpio_adev);
> +               if (gpio_dev) {
> +                       guard(device)(gpio_dev);
> +                       bound = device_is_bound(gpio_dev);
> +               } else {
> +                       bound = false;
> +               }
> +               /*
> +                * Defer probe until the GPIO controller is fully bound,
> +                * ensuring its IRQ setup is complete before we enumerate
> +                * I2C child devices.
> +                */
> +               if (!bound) {
> +                       ret = -EPROBE_DEFER;
> +                       goto cleanup;
> +               }
> +       }
> +
> +cleanup:
> +       free_gpio_controller_list(&gpio_controllers);
> +       return ret;
> +}
> +#else
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +       return 0;
> +}
> +#endif /* CONFIG_ACPI && CONFIG_GPIOLIB */
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>         u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> @@ -138,6 +266,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>         struct dw_i2c_dev *dev;
>         int irq, ret;
>
> +       ret = i2c_dw_check_gpio_dependencies(device);
> +       if (ret)
> +               return ret;
> +
>         irq = platform_get_irq_optional(pdev, 0);
>         if (irq == -ENXIO)
>                 flags |= ACCESS_POLLING;
>
> base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
> --
> 2.54.0
>

