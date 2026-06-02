Return-Path: <linux-gpio+bounces-37791-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJUkJxCNHmoNlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37791-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:58:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A970162A007
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DE12300A263
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064C53B38BE;
	Tue,  2 Jun 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdkQajxy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60B1FCFFC;
	Tue,  2 Jun 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386343; cv=none; b=k3rdbEm3gDFLjtS7ptDMxXQB8Tyidd98uvCAhKQJJ7RpS4To6m7gqzIgeMMGdeB9xn/U3zcwaZqOAI1q61C7WoDH7dxWR7mC7t+DSR6p+ujthmHBq05ffKV7kprnmxTPNYwwWjVycs4T/75jb8Cg99xfCTHUFOyZFoKdfIvG4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386343; c=relaxed/simple;
	bh=/zl0drPy31zFHDDNvKnOSokXDtHazIA3TKkz1eDTasA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgWzLUP9HVd0zjhALxVKS8mK7SUFC9hPzN/PEoOOnp1QdrB1e9Qo70i4k6C4I7Bcqj/F71pZxMBAsya9sxO+ch2GHGl48Iiz+OHI8ES4wJVE+f3hi5AJn3xKR1iYl2zGAvYCOUySVLVmG++AQaF4NYtwBmWefiKt7EgHRBnnHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdkQajxy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780386342; x=1811922342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/zl0drPy31zFHDDNvKnOSokXDtHazIA3TKkz1eDTasA=;
  b=GdkQajxyE8VOe59wk31vkRfZuHda8H4X72EvjJ3SUY0yykAbSc0j90UK
   8ZONed9EIa5GFTt6dHu1tzFk+x75SfwxgDPwsj6DvVJqpSJ3kaID1RTse
   gekfOElLdwgPgCGvh2IHDtpsI4BDf0pl1fYZ7EK/zs4XMLrr7sRA476Ga
   O9XlagKJWc1hbJfJL2iIgFopnKTNIw7CeGKrrmEahDdSUz4NzOjiiVNZZ
   CRBLN7yupWzl6jq+sBcMaVq+uiYM6jV1iQO4uBcyjYOhL5pYnXGJ2FwRB
   0SDYNpcCvwfV8XdBZXOkHR0cdt8ZG6gVuK5WJZIh60OH76DntyxxxPgCS
   Q==;
X-CSE-ConnectionGUID: zoNrVfVNTnGlMhCXJnTMvA==
X-CSE-MsgGUID: 0c9590HEQ+Ou0Pbi0CNQUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81065081"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81065081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:45:42 -0700
X-CSE-ConnectionGUID: XB6yxphGQequjdc8bAkc6w==
X-CSE-MsgGUID: 9nJmKytcRSOBc8y3rInTxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="241331378"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:45:39 -0700
Date: Tue, 2 Jun 2026 10:45:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: brgl@kernel.org, linusw@kernel.org, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, westeri@kernel.org
Subject: Re: [PATCH v3 2/2] Fixes: gpiolib: acpi: resource leak in OpRegion
Message-ID: <ah6KIUb6FhmzAUs-@ashevche-desk.local>
References: <agwfEMtEctXYC1oc@ashevche-desk.local>
 <20260520074955.55443-1-mscardovi95@gmail.com>
 <20260520074955.55443-3-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520074955.55443-3-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37791-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: A970162A007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:45:47AM +0200, Marco Scardovi (scardracs) wrote:
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

...

> +static void acpi_gpiochip_free_connection_list(struct list_head *list)
> +{
> +	struct acpi_gpio_connection *conn;
> +	struct acpi_gpio_connection *tmp;

Make it a single line.

> +	list_for_each_entry_safe_reverse(conn, tmp, list, node) {
> +		gpiochip_free_own_desc(conn->desc);
> +		list_del(&conn->node);
> +		kfree(conn);
> +	}
> +}

...

> +static struct acpi_gpio_connection *
> +acpi_gpiochip_find_conn(struct acpi_gpio_chip *achip,
> +			struct list_head *new_conns, unsigned int pin)

We allow longer lines, so

static struct acpi_gpio_connection *
acpi_gpiochip_find_conn(struct acpi_gpio_chip *achip, struct list_head *new_conns,
			unsigned int pin)

is fine

> +{
> +	struct acpi_gpio_connection *conn;
> +
> +	list_for_each_entry(conn, &achip->conns, node) {
> +		if (conn->pin == pin)
> +			return conn;
> +	}

> +	if (new_conns) {

Is it ever called with new_conns == NULL?

> +		list_for_each_entry(conn, new_conns, node) {
> +			if (conn->pin == pin)
> +				return conn;
> +		}
> +	}
> +
> +	return NULL;
> +}

...

Before fixing the issue, introduce helpers and use them in the existing code
first. Then in the follow up fix the issue.

...

>  		struct gpio_desc *desc;
> -		u16 word, shift;
> -		bool found;
> +		bool found = false;

Do you still need it? Wouldn't 'conn == NULL' be equal to 'false'?

...

-- 
With Best Regards,
Andy Shevchenko



