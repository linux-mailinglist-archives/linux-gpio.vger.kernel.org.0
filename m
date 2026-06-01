Return-Path: <linux-gpio+bounces-37760-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNHOACp6HWrEbAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37760-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 14:25:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 826DD61F3E1
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 14:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A28C3029786
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 12:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC32374E7D;
	Mon,  1 Jun 2026 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKy6YAZB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824C369D6D;
	Mon,  1 Jun 2026 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316301; cv=none; b=r8DwXF9QbBZ2Z8D/Q48McPCNtgVFuUbIprxjEA3Dr5C7tI4Ty5tOUj2OLi3jcBalGpT3aWPXyPtZOa7scX8Rr9phEy4ybw29v5zojG1XufZ6zRXabmjRtLjVCwJ4CKCF7MRnSykY+pJYO5xd+0KJdcIu2PDN7mZUj2hks9JenOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316301; c=relaxed/simple;
	bh=wxAMZwp74wh2HogaaNRzqMwkCTTt6zJ1smlhMpTZy14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsMwvWuyIGh1nLKR0P5uY46A9/0y01149B9cCEjCPB1mzDh9O1pzXmHm5OsSDEN9Gi1i3WtvGwMvQNpdDNw2oB03UkZWTvID67e3D8a74ddDipEtM7StqlPu4tGcbCAuWPpudDfaeybJH1uUV862SRRJJ9F1qI5bwLdItWN6T+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKy6YAZB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780316300; x=1811852300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxAMZwp74wh2HogaaNRzqMwkCTTt6zJ1smlhMpTZy14=;
  b=UKy6YAZBeW7HJ70TeIRwr+s/0G5dtYLg0DRVAY/z6GBrIxX2hLJM41rX
   f6SZ/Aaycl5HT2McmY6jpb/kTY97tmyHoD2uWFSVbKoAK0p53/IhUkKyA
   b3hfSj9eELMlqwpEfDpN4wB0Y00GNyrYuWVak6X/baGru7ggpL6MyjUKm
   EVhNRS+LqjAkipAhYde74eG5HlVP8HmORsoY9KRvkuWNcAbf1o+rSi9ts
   GaKzf0hYEKZyZxUJxU+jsq7z+4UEpD64kskD8C7pcrpsqpv+G3n4Rytdx
   +MIzqPRBxINEkZMUr6qsYFMfWxuSwbysb+jt0/x2elWt93w8xxjwwFtq0
   w==;
X-CSE-ConnectionGUID: QSL8yUsoRRK2GHWGJpxwDQ==
X-CSE-MsgGUID: iDdZZob3S1+DvBGAI7py7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81102641"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81102641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 05:18:19 -0700
X-CSE-ConnectionGUID: TQk/6IDMRJy5uME9cJmVcw==
X-CSE-MsgGUID: f9d72IYKRQWWEGz2UicR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239140336"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 05:18:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EBB4095; Mon, 01 Jun 2026 14:18:15 +0200 (CEST)
Date: Mon, 1 Jun 2026 14:18:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: Re: [PATCH v4 2/4] gpiolib: acpi: fix resource leak in OpRegion
Message-ID: <20260601121815.GS3102@black.igk.intel.com>
References: <20260531120816.17255-1-scardracs@disroot.org>
 <20260531120816.17255-3-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260531120816.17255-3-scardracs@disroot.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37760-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 826DD61F3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Sun, May 31, 2026 at 02:03:09PM +0200, Marco Scardovi wrote:
> From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
> 
> If acpi_remove_address_space_handler() fails, the cleanup function
> acpi_gpiochip_free_regions() previously returned early. This leaks
> the connections list and all requested GPIO descriptors.
> 
> Similarly, if acpi_gpio_adr_space_handler() fails to allocate a connection
> or request a GPIO descriptor during a multi-pin transaction, it exits
> without freeing the descriptors and connections that were already allocated
> in the same call.
> 
> To avoid leaks, introduce a localized new_conns list inside the handler to
> track the new connections requested during the current transaction. On
> error, roll back only the connections in the new_conns list (avoiding
> deadlock on the non-recursive conn_lock and preventing over-cleanup of
> historic connections). On success, splice the new_conns list into the
> global achip->conns list under the conn_lock.
> 
> Additionally, rename the global connection cleanup function to
> acpi_gpiochip_free_all_connections() and call it in the GPIO chip teardown
> path.
> 
> Fixes: 473ed7be0da0 ("gpio / ACPI: Add support for ACPI GPIO operation regions")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 142 ++++++++++++++++++++++++-------
>  1 file changed, 111 insertions(+), 31 deletions(-)

This is really complex solution to a problem I'm not sure that even exists.

> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index a6d78dad299e..e3bc4677b51d 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -1094,6 +1094,51 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *con_id,
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
>  
> +static void acpi_gpiochip_free_connection_list(struct list_head *list)
> +{
> +	struct acpi_gpio_connection *conn;
> +	struct acpi_gpio_connection *tmp;
> +
> +	list_for_each_entry_safe_reverse(conn, tmp, list, node) {
> +		gpiochip_free_own_desc(conn->desc);
> +		list_del(&conn->node);
> +		kfree(conn);
> +	}
> +}
> +
> +static void acpi_gpiochip_free_all_connections(struct acpi_gpio_chip *achip)
> +{
> +	guard(mutex)(&achip->conn_lock);
> +
> +	acpi_gpiochip_free_connection_list(&achip->conns);
> +}
> +
> +/*
> + * Find a connection in the global or local list.
> + * The caller must hold achip->conn_lock to protect the global list.
> + * The local list new_conns is private to the calling thread.
> + */
> +static struct acpi_gpio_connection *
> +acpi_gpiochip_find_conn(struct acpi_gpio_chip *achip,
> +			struct list_head *new_conns, unsigned int pin)
> +{
> +	struct acpi_gpio_connection *conn;
> +
> +	list_for_each_entry(conn, &achip->conns, node) {
> +		if (conn->pin == pin)
> +			return conn;
> +	}
> +
> +	if (new_conns) {
> +		list_for_each_entry(conn, new_conns, node) {
> +			if (conn->pin == pin)
> +				return conn;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static acpi_status
>  acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  			    u32 bits, u64 *value, void *handler_context,
> @@ -1101,11 +1146,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  {
>  	struct acpi_gpio_chip *achip = region_context;
>  	struct gpio_chip *chip = achip->chip;
> +	struct acpi_gpio_connection *other;
> +	struct acpi_gpio_connection *conn;
>  	struct acpi_resource_gpio *agpio;
>  	struct acpi_resource *ares;
>  	u16 pin_index = address;
> +	LIST_HEAD(new_conns);
>  	acpi_status status;
>  	int length;
> +	u16 shift;
> +	u16 word;
>  	int i;
>  
>  	status = acpi_buffer_to_resource(achip->conn_info.connection,
> @@ -1129,20 +1179,15 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  	length = min(agpio->pin_table_length, pin_index + bits);
>  	for (i = pin_index; i < length; ++i) {
>  		unsigned int pin = agpio->pin_table[i];
> -		struct acpi_gpio_connection *conn;
>  		struct gpio_desc *desc;
> -		u16 word, shift;
> -		bool found;
> +		bool found = false;
>  
>  		mutex_lock(&achip->conn_lock);
>  
> -		found = false;
> -		list_for_each_entry(conn, &achip->conns, node) {
> -			if (conn->pin == pin) {
> -				found = true;
> -				desc = conn->desc;
> -				break;
> -			}
> +		conn = acpi_gpiochip_find_conn(achip, &new_conns, pin);
> +		if (conn) {
> +			desc = conn->desc;
> +			found = true;
>  		}
>  
>  		/*
> @@ -1163,34 +1208,66 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  			}
>  		}
>  
> +		mutex_unlock(&achip->conn_lock);
> +
>  		if (!found) {
>  			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");

If any of the below fails we clean up the descriptor while the prior are
already in the list. Once the GPIO chip is released the list is released as
well.

> -				mutex_unlock(&achip->conn_lock);
> +				/*
> +				 * In case of concurrent handler execution, another
> +				 * thread may have already requested the same GPIO,
> +				 * causing acpi_request_own_gpiod() to fail with -EBUSY.
> +				 * Re-check the visible connection lists and reuse an
> +				 * existing connection if one is found.
> +				 */
> +				if (PTR_ERR(desc) == -EBUSY) {
> +					mutex_lock(&achip->conn_lock);
> +					conn = acpi_gpiochip_find_conn(achip, &new_conns, pin);
> +					if (conn) {
> +						desc = conn->desc;
> +						found = true;
> +					}
> +					mutex_unlock(&achip->conn_lock);
> +					if (found)
> +						goto use_existing;
> +				}
>  				status = AE_ERROR;
> -				goto out;
> +				goto err_free_new_conns;
>  			}
>  
>  			conn = kzalloc_obj(*conn);
>  			if (!conn) {
>  				gpiochip_free_own_desc(desc);
> -				mutex_unlock(&achip->conn_lock);
>  				status = AE_NO_MEMORY;
> -				goto out;
> +				goto err_free_new_conns;
>  			}
>  
>  			conn->pin = pin;
>  			conn->desc = desc;
> -			list_add_tail(&conn->node, &achip->conns);
> -		}
>  
> -		mutex_unlock(&achip->conn_lock);
> +			mutex_lock(&achip->conn_lock);
> +			/*
> +			 * Re-check both lists again before adding to local
> +			 * new_conns, as another thread could have completed
> +			 * and spliced its list while conn_lock was released.
> +			 */
> +			other = acpi_gpiochip_find_conn(achip, &new_conns, pin);
> +			if (other) {
> +				struct gpio_desc *desc_to_free = conn->desc;
> +				struct acpi_gpio_connection *c_to_free = conn;
>  
> -		/*
> -		 * For the cases when OperationRegion() consists of more than
> -		 * 64 bits calculate the word and bit shift to use that one to
> -		 * access the value.
> -		 */
> +				desc = other->desc;
> +				mutex_unlock(&achip->conn_lock);
> +
> +				gpiochip_free_own_desc(desc_to_free);
> +				kfree(c_to_free);
> +			} else {
> +				list_add_tail(&conn->node, &new_conns);
> +				mutex_unlock(&achip->conn_lock);
> +			}
> +		}
> +
> +use_existing:
>  		word = i / 64;
>  		shift = i % 64;
>  
> @@ -1204,9 +1281,19 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  		}
>  	}
>  
> +	mutex_lock(&achip->conn_lock);
> +	list_splice_tail(&new_conns, &achip->conns);
> +	mutex_unlock(&achip->conn_lock);
> +
> +	status = AE_OK;
> +
>  out:
>  	ACPI_FREE(ares);
>  	return status;
> +
> +err_free_new_conns:
> +	acpi_gpiochip_free_connection_list(&new_conns);
> +	goto out;
>  }
>  
>  static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
> @@ -1229,22 +1316,15 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
>  {
>  	struct gpio_chip *chip = achip->chip;
>  	acpi_handle handle = ACPI_HANDLE(chip->parent);
> -	struct acpi_gpio_connection *conn, *tmp;
>  	acpi_status status;
>  
>  	status = acpi_remove_address_space_handler(handle, ACPI_ADR_SPACE_GPIO,
>  						   acpi_gpio_adr_space_handler);
> -	if (ACPI_FAILURE(status)) {
> +	if (ACPI_FAILURE(status))
>  		dev_err(chip->parent,
>  			"Failed to remove GPIO OpRegion handler\n");
> -		return;
> -	}

If we fail to remove the OpRegion handler and continue to release the
structures does that mean any AML code that accesses the GPIOs now are
accessing already removed (below) objects? Here _REG is not called (we
failed to remove the OpRegion handler) so the AML does not know that it is
gone so it can happily still access the region. So IMHO it is safer to keep
the connections instead of removing them.

Of course it is possible that I'm missing something. It has been a while
since I looked at any of this stuff.

>  
> -	list_for_each_entry_safe_reverse(conn, tmp, &achip->conns, node) {
> -		gpiochip_free_own_desc(conn->desc);
> -		list_del(&conn->node);
> -		kfree(conn);
> -	}
> +	acpi_gpiochip_free_all_connections(achip);
>  }
>  
>  void acpi_gpiochip_add(struct gpio_chip *chip)
> -- 
> 2.54.0

