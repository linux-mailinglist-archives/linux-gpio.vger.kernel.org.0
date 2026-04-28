Return-Path: <linux-gpio+bounces-35649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHiQOIVq8GkITAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:06:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C047F96D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B727302B53C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 07:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5D830FF1E;
	Tue, 28 Apr 2026 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xa/2VSoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1E2FE56F;
	Tue, 28 Apr 2026 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363187; cv=none; b=VNuOP5FOgt7DNEsueg9WtzcVZz1O04DM66T/iXFepJw/2mNHftX66TH7HC08kqptFzaEUYgJvIyVyigKWHgS5upoY2cvw8neMIyP5Em3Kdy5VP+arbBVHW5h99dIDqI6yPhCYEsTDItFhlZkr3W+c5B92C/PPyJVikpjtqE+8Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363187; c=relaxed/simple;
	bh=HLINe8lynGNsfZTVUlUPCIOIxQ8h4hN1PYtWjQ7oL0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFHH/VLEu08Rn7oQAccdU+PcXJdzT3WHHL8hWlO2waItbf9rMv9XkqEfIDZuXMQwTMBzWN2azr7yuroeIFFH2dH+qw7UHHRb+DBZ23DQ4z9u/AeJvsyqP94mU0tWk8LcQpZlCjDwjuv6xWalOfHOPWZ+Zq58at8CCIZQRim4KzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xa/2VSoK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777363186; x=1808899186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLINe8lynGNsfZTVUlUPCIOIxQ8h4hN1PYtWjQ7oL0U=;
  b=Xa/2VSoKCR0gm2VB0ekbIcB191XO3+bPTaII88kfTNpXPeM9qh/lKvWh
   C3MDoZcmr2IMqoqVBlX7mUbuHum8q8MZSPsMFl6DAeaVH8sVpjdNqOQTY
   zjQ/9k7rBi6dePRrqXOSdwrNigrLdBU2B8QgFTWXlEWMAJchMhj4UKz0r
   gLYK8mKl1rq29XIluoxVKRwvaw1OCG21tOV9LbcJX09qvyoL0cumIzuBV
   1Lg6gUZ0RfB1gDAvbbQSfWGwwX5KhHvZmeI1c2X10kETQ25eT627Ea5Pw
   tkvierc6WbQLDsNDXgOYickzflW5q0/6dKCpD7TsmbdlRuD+6V4rmbR6w
   g==;
X-CSE-ConnectionGUID: DZ1kixXPTtOazAQwsuxUvw==
X-CSE-MsgGUID: KDZnieHJR/iOpHAY7qYU7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78327390"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78327390"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:59:45 -0700
X-CSE-ConnectionGUID: B1J0amLZRPqtfZF+mLna+w==
X-CSE-MsgGUID: mXNGaTliRvOFdyzj7W0MxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="232876844"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2026 00:59:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 81B4895; Tue, 28 Apr 2026 09:59:41 +0200 (CEST)
Date: Tue, 28 Apr 2026 09:59:41 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <superm1@kernel.org>,
	Marco Scardovi <mscardovi95@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
Message-ID: <20260428075941.GQ557136@black.igk.intel.com>
References: <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
 <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
 <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
 <bcdd110b-489e-4f09-892d-b2d6ce4b0ff0@gmx.de>
 <20260427045731.GI557136@black.igk.intel.com>
 <92b504d2-3d6e-4380-883c-be6b50eec25d@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92b504d2-3d6e-4380-883c-be6b50eec25d@gmx.de>
X-Rspamd-Queue-Id: A13C047F96D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35649-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gmx.de:email,black.igk.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi,

On Tue, Apr 28, 2026 at 12:09:10AM +0200, Armin Wolf wrote:
> Am 27.04.26 um 06:57 schrieb Mika Westerberg:
> 
> > On Sat, Apr 25, 2026 at 10:41:46PM +0200, Armin Wolf wrote:
> > > > > according to the Microsoft documentation
> > > > > (https://learn.microsoft.com/
> > > > > en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
> > > > > section "GPIO controllers and ActiveBoth interrupts"), triggering
> > > > > GPIO interrupts marked as ActiveBoth during initialization is
> > > > > correct as long as the associated GPIO line is already "asserted"
> > > > > (aka logic level low). I think the problem is that we also trigger
> > > > > edge-based GPIO interrupts _not_ marked as ActiveBoth.
> > > > > 
> > > > > Based on this i agree with Hans, except that we should continue you
> > > > > trigger ActiveBoth GPIO interrupts as long as the above
> > > > > condition applies.
> > > > > 
> > > > > Thanks,
> > > > > Armin Wolf
> > > > > 
> > > > So maybe something like this (attached)?
> > > Yes, exactly.
> > This is good information and definitely scales better than the quirk list.
> > The linked document also mentions that there is _DSM under GPIO device that
> > could be used to override the asserted state:
> > 
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/gpio-controller-device-specific-method---dsm-
> > 
> > I wonder if we should implement that as well?
> 
> I already did some work in this area, but i kind of forgot about it
> because i have no suitable device for testing this.  Maybe someone has a
> device that uses this _DSM and can check if the attached patch works?

I don't have devices with the _DSM but few comments on the code (thanks BTW
for doing this!).

> 
> Thanks,
> Armin Wolf

> From 2e1dc51c864802c05c3a9e6b745dd8c34b4b615b Mon Sep 17 00:00:00 2001
> From: Armin Wolf <W_Armin@gmx.de>
> Date: Thu, 5 Feb 2026 22:39:35 +0100
> Subject: [PATCH] gpiolib: acpi: Add support for Microsoft GPIO _DSM
> 
> Microsoft has defined a ACPI device specific method for determining
> the logic level for which a given ActiveBoth GPIO interrupt should be
> considered "asserted". Such GPIO interrupts are normally considered to
> be "asserted" when being logic level low.
> Being able to override this assumption might be important for firmware
> implementations where a ActiveBoth GPIO interrupt is asserted at logic
> level high.
> 
> Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/gpio-controller-device-specific-method---dsm-
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 67 ++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index eb8a40cfb7a9..f7c58ae4d423 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -15,6 +15,8 @@
>  #include <linux/irq.h>
>  #include <linux/mutex.h>
>  #include <linux/pinctrl/pinctrl.h>
> +#include <linux/printk.h>
> +#include <linux/uuid.h>
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> @@ -23,6 +25,14 @@
>  #include "gpiolib.h"
>  #include "gpiolib-acpi.h"
>  
> +/*
> + * Defined by Microsoft at https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/
> + * gpio-controller-device-specific-method---dsm-.
> + */
> +static const guid_t acpi_gpio_microsoft_guid = GUID_INIT(0x4F248F40, 0xD5E2, 0x499F, 0x83, 0x4C,
> +							 0x27, 0x75, 0x8E, 0xA1, 0xCD, 0x3F);
> +#define ACPI_GPIO_DSM_ACTIVE_BOTH_POLARITY 1
> +
>  /**
>   * struct acpi_gpio_event - ACPI GPIO event handler data
>   *
> @@ -216,9 +226,11 @@ bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
>  EXPORT_SYMBOL_GPL(acpi_gpio_get_io_resource);
>  
>  static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
> -				      struct acpi_gpio_event *event)
> +				      struct acpi_gpio_event *event,
> +				      union acpi_object *obj)
>  {
>  	struct device *parent = acpi_gpio->chip->parent;
> +	bool active_low = true;
>  	int ret, value;
>  
>  	ret = request_threaded_irq(event->irq, NULL, event->handler,
> @@ -248,18 +260,67 @@ static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
>  	if (acpi_gpio_need_run_edge_events_on_boot() &&
>  	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
>  	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
> +		if (obj) {
> +			for (u32 i = 0; i < obj->package.count; i++) {
> +				if (obj->package.elements[i].integer.value == event->pin) {
> +					active_low = false;
> +					break;
> +				}
> +			}
> +		}
> +
>  		value = gpiod_get_raw_value_cansleep(event->desc);
> -		if (value == 0)
> +		if ((active_low && value == 0) || (!active_low && value == 1))
>  			event->handler(event->irq, event);
>  	}
>  }
>  
> +static union acpi_object *acpi_gpiochip_evaluate_dsm(struct acpi_gpio_chip *acpi_gpio)
> +{
> +	struct device *parent = acpi_gpio->chip->parent;
> +	union acpi_object dummy = {
> +		.package = {
> +			.type = ACPI_TYPE_PACKAGE,
> +			.count = 0,
> +			.elements = NULL,
> +		},
> +	};
> +	acpi_handle handle = ACPI_HANDLE(parent);
> +	union acpi_object *obj;
> +
> +	if (!acpi_check_dsm(handle, &acpi_gpio_microsoft_guid, 0,
> +			    BIT(ACPI_GPIO_DSM_ACTIVE_BOTH_POLARITY)))
> +		return NULL;
> +
> +	obj = acpi_evaluate_dsm_typed(handle, &acpi_gpio_microsoft_guid, 0,
> +				      ACPI_GPIO_DSM_ACTIVE_BOTH_POLARITY,
> +				      &dummy, ACPI_TYPE_PACKAGE);
> +	if (obj) {
> +		for (u32 i = 0; i < obj->package.count; i++) {
> +			if (obj->package.elements[i].type == ACPI_TYPE_INTEGER)
> +				continue;
> +
> +			dev_err(parent, FW_BUG "Ignoring GPIO _DSM due to invalid data\n");
> +			ACPI_FREE(obj);
> +			return NULL;
> +		}
> +	}
> +
> +	return obj;
> +}
> +
>  static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
>  {
>  	struct acpi_gpio_event *event;
> +	union acpi_object *obj;
> +
> +	obj = acpi_gpiochip_evaluate_dsm(acpi_gpio);
>  

So intead of here I think it should be called from
acpi_gpiochip_request_interrupts() after acpi_walk_resources() and make it
fill new field active_low in struct acpi_gpio_event.

Then use that field in acpi_gpiochip_request_irq().

>  	list_for_each_entry(event, &acpi_gpio->events, node)
> -		acpi_gpiochip_request_irq(acpi_gpio, event);
> +		acpi_gpiochip_request_irq(acpi_gpio, event, obj);
> +
> +	if (obj)
> +		ACPI_FREE(obj);
>  }
>  
>  static enum gpiod_flags
> -- 
> 2.39.5
> 


