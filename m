Return-Path: <linux-gpio+bounces-36280-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGRJCsgm+2kQXAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36280-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 13:32:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C604D9BA0
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 13:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD1E5300C0C1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 11:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C69429819;
	Wed,  6 May 2026 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/yd5YKL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76644313543;
	Wed,  6 May 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067140; cv=none; b=lHvVFvma2o6R3T44WOGoomeUZzIU8/Ccr6F7x0GbEu/iABp0L9cqPhV32/WLX3ssi0GjVXwVg+a0tisG1GM8AV2GVw1eNrYRAgjgh34jz8wuEMkJZAOG4XZ0lzG6z8B2tWRFSdcxYyTuLcU/eLLNUbF86b9hzhSNdjK6nz2CLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067140; c=relaxed/simple;
	bh=O6TF3HsWcTy6sdh8ERgaGEDnfbxo5JycHdzco+fV99Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+IlvOw5TavIGw1ISXEKXfdkQFd2Zu8292MM1VYXde/dEKkE1Ajoxj0D9yfiVT2qgqdMQFbTmD8mRLr6An9k8cZoP53XjL/7/Q9CKVwTzQNGeHIbqz9U+DP8UR+eGz9m07/zSFM85Zevvxx385R7Qe57iI1M71/KCtS8IsT8oew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/yd5YKL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778067139; x=1809603139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O6TF3HsWcTy6sdh8ERgaGEDnfbxo5JycHdzco+fV99Q=;
  b=N/yd5YKL4rmRwtBSWP2g4EKXH9VmLjzvKMXjJZrpjYhA4m+JfGQLqjQ3
   RkLgX6DpYvYEkeqlS8ZNmBeK31V0ifaVCuntGFf/OgTYpGDvflIDc1pga
   pICdHmcQF8QrKdkpvLHsPde+Tzhr67AZCjc7aZLaemoWmuHNDXFTlkx2x
   fUyxzjefOIRCWSi6YP9NEst4/8xuqA4coChShZcFET9v29IYP0b+HrmcK
   TtQWZJVFlN1zrXG6YJGcNe3yIi15GB92iMEeAKbeZHjsG9c4lkrZSzjDH
   a94egeXC2uoZw8O/vzeYhaJSwCZEndYz1UCZme2QxyurVHdPDYFF9JfXj
   w==;
X-CSE-ConnectionGUID: I80yiqw3TKKTD0zIPruOjQ==
X-CSE-MsgGUID: sBaMIdCgTqmtcKnQ6ZyuhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90451370"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90451370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:32:18 -0700
X-CSE-ConnectionGUID: I0uO+rMCQnWeXhjzshuPZg==
X-CSE-MsgGUID: 2eQO0X2DT4Ke8O30NSNBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="231568222"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2026 04:32:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1EC3595; Wed, 06 May 2026 13:32:15 +0200 (CEST)
Date: Wed, 6 May 2026 13:32:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpio: acpi: modernize resource management using cleanup.h
Message-ID: <20260506113215.GK6785@black.igk.intel.com>
References: <59174ed2-dc3a-4891-929f-bf513deecdc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59174ed2-dc3a-4891-929f-bf513deecdc2@gmail.com>
X-Rspamd-Queue-Id: B6C604D9BA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36280-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]

Hi.

+Andy

On Wed, May 06, 2026 at 11:29:36AM +0200, Marco Scardovi wrote:
> Hi everyone,
> 
> I was looking for ways to switch to modern cleanup guards and auto-freeing
> pointers to simplify error paths and synchronization in gpiolib-acpi-core.c
> so I came up with the patch you can find below.
> 
> Here you can see the main points I've worked on:
> - Use DEFINE_FREE() for gpio_desc and ACPI resources.
> - Use guard(mutex)() within the OpRegion handler loop for automatic locking.
> - Use __free() for automatic descriptor and memory cleanup.
> - Fix off-by-one error in GPIO pin bounds check.
> - Return AE_OK on out-of-range pins to allow processing other resources
>   even if one is misconfigured in firmware.
> - Use break instead of goto in OpRegion handler for cleaner control flow
>   leveraging auto-cleanup.

That should be several patches not one doing all these.

> I've tested it (both build and functionality) against linux-next-20260430.
> 
> Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 94
> +++++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c
> b/drivers/gpio/gpiolib-acpi-core.c
> index eb8a40cfb7a9..19a18222b7b2 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -7,6 +7,9 @@
>   *          Mika Westerberg <mika.westerberg@linux.intel.com>
>   */
> 
> +#include <linux/cleanup.h>
> +#include <linux/slab.h>
> +

Drop the empty line.

>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/errno.h>
> @@ -23,6 +26,16 @@
>  #include "gpiolib.h"
>  #include "gpiolib-acpi.h"
> 
> +DEFINE_FREE(free_gpio_desc, struct gpio_desc *, {
> +    if (_T)
> +        gpiochip_free_own_desc(_T);
> +})
> +
> +DEFINE_FREE(acpi_free, void *, {
> +    if (_T)
> +        ACPI_FREE(_T);
> +})

These are white space damaged. Also I'm not big fan of these but if Andy is
fine then works for me too. However, please test with KASAN and kmemleak
enabled that you don't break anything.

> +
>  /**
>   * struct acpi_gpio_event - ACPI GPIO event handler data
>   *
> @@ -361,6 +374,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct
> acpi_resource *ares,
>      struct acpi_gpio_event *event;
>      irq_handler_t handler = NULL;
>      struct gpio_desc *desc;
> +    struct gpio_desc *desc_guard __free(free_gpio_desc) = NULL;
>      unsigned int pin;
>      int ret, irq;
> 
> @@ -370,6 +384,11 @@ static acpi_status acpi_gpiochip_alloc_event(struct
> acpi_resource *ares,
>      handle = ACPI_HANDLE(chip->parent);
>      pin = agpio->pin_table[0];
> 
> +    if (pin >= chip->ngpio) {
> +        dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, out
> of range\n", pin);

This is damaged too.

Actually let's start with a proper patch and then look the details :)

> +        return AE_OK;
> +    }
> +
>      if (pin <= 255) {
>          char ev_name[8];
>          sprintf(ev_name, "_%c%02X",
> @@ -392,31 +411,26 @@ static acpi_status acpi_gpiochip_alloc_event(struct
> acpi_resource *ares,
> 
>      desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
>      if (IS_ERR(desc)) {
> -        dev_err(chip->parent,
> -            "Failed to request GPIO for pin 0x%04X, err %pe\n",
> -            pin, desc);
> +        dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, err
> %pe\n", pin, desc);
>          return AE_OK;
>      }
> +    desc_guard = desc;
> 
>      ret = gpiochip_lock_as_irq(chip, pin);
>      if (ret) {
> -        dev_err(chip->parent,
> -            "Failed to lock GPIO pin 0x%04X as interrupt, err %d\n",
> -            pin, ret);
> -        goto fail_free_desc;
> +        dev_err(chip->parent, "Failed to lock GPIO pin 0x%04X as interrupt,
> err %d\n", pin, ret);
> +        return AE_OK;
>      }
> 
>      irq = gpiod_to_irq(desc);
>      if (irq < 0) {
> -        dev_err(chip->parent,
> -            "Failed to translate GPIO pin 0x%04X to IRQ, err %d\n",
> -            pin, irq);
> -        goto fail_unlock_irq;
> +        dev_err(chip->parent, "Failed to translate GPIO pin 0x%04X to IRQ,
> err %d\n", pin, irq);
> +        goto err_unlock;
>      }
> 
>      event = kzalloc_obj(*event);
>      if (!event)
> -        goto fail_unlock_irq;
> +        goto err_unlock;
> 
>      event->irqflags = IRQF_ONESHOT;
>      if (agpio->triggering == ACPI_LEVEL_SENSITIVE) {
> @@ -444,17 +458,15 @@ static acpi_status acpi_gpiochip_alloc_event(struct
> acpi_resource *ares,
>      event->irq = irq;
>      event->irq_is_wake = acpi_gpio_irq_is_wake(chip->parent, agpio);
>      event->pin = pin;
> -    event->desc = desc;
> +    /* Transfer ownership to event, prevent auto-free */
> +    event->desc = no_free_ptr(desc_guard);
> 
>      list_add_tail(&event->node, &acpi_gpio->events);
> 
>      return AE_OK;
> 
> -fail_unlock_irq:
> +err_unlock:
>      gpiochip_unlock_as_irq(chip, pin);
> -fail_free_desc:
> -    gpiochip_free_own_desc(desc);
> -
>      return AE_OK;
>  }
> 
> @@ -1086,7 +1098,7 @@ acpi_gpio_adr_space_handler(u32 function,
> acpi_physical_address address,
>      struct acpi_gpio_chip *achip = region_context;
>      struct gpio_chip *chip = achip->chip;
>      struct acpi_resource_gpio *agpio;
> -    struct acpi_resource *ares;
> +    struct acpi_resource *ares __free(acpi_free) = NULL;
>      u16 pin_index = address;
>      acpi_status status;
>      int length;
> @@ -1097,20 +1109,17 @@ acpi_gpio_adr_space_handler(u32 function,
> acpi_physical_address address,
>      if (ACPI_FAILURE(status))
>          return status;
> 
> -    if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO)) {
> -        ACPI_FREE(ares);
> +    if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO))
>          return AE_BAD_PARAMETER;
> -    }
> 
>      agpio = &ares->data.gpio;
> 
>      if (WARN_ON(agpio->io_restriction == ACPI_IO_RESTRICT_INPUT &&
> -        function == ACPI_WRITE)) {
> -        ACPI_FREE(ares);
> +        function == ACPI_WRITE))
>          return AE_BAD_PARAMETER;
> -    }
> 
>      length = min(agpio->pin_table_length, pin_index + bits);
> +    status = AE_OK;
>      for (i = pin_index; i < length; ++i) {
>          unsigned int pin = agpio->pin_table[i];
>          struct acpi_gpio_connection *conn;
> @@ -1118,7 +1127,7 @@ acpi_gpio_adr_space_handler(u32 function,
> acpi_physical_address address,
>          u16 word, shift;
>          bool found;
> 
> -        mutex_lock(&achip->conn_lock);
> +        guard(mutex)(&achip->conn_lock);
> 
>          found = false;
>          list_for_each_entry(conn, &achip->conns, node) {
> @@ -1150,17 +1159,15 @@ acpi_gpio_adr_space_handler(u32 function,
> acpi_physical_address address,
>          if (!found) {
>              desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
>              if (IS_ERR(desc)) {
> -                mutex_unlock(&achip->conn_lock);
>                  status = AE_ERROR;
> -                goto out;
> +                break;
>              }
> 
>              conn = kzalloc_obj(*conn);
>              if (!conn) {
>                  gpiochip_free_own_desc(desc);
> -                mutex_unlock(&achip->conn_lock);
>                  status = AE_NO_MEMORY;
> -                goto out;
> +                break;
>              }
> 
>              conn->pin = pin;
> @@ -1168,8 +1175,6 @@ acpi_gpio_adr_space_handler(u32 function,
> acpi_physical_address address,
>              list_add_tail(&conn->node, &achip->conns);
>          }
> 
> -        mutex_unlock(&achip->conn_lock);
> -
>          /*
>           * For the cases when OperationRegion() consists of more than
>           * 64 bits calculate the word and bit shift to use that one to
> @@ -1188,8 +1193,6 @@ acpi_gpio_adr_space_handler(u32 function,
> acpi_physical_address address,
>          }
>      }
> 
> -out:
> -    ACPI_FREE(ares);
>      return status;
>  }
> 

