Return-Path: <linux-gpio+bounces-37742-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PE/Bh4WHWqIVgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37742-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:18:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4856199C9
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60471301A3A6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 05:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8DE330641;
	Mon,  1 Jun 2026 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMk6MJVj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2678F4C92;
	Mon,  1 Jun 2026 05:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291060; cv=none; b=rsMrqQie4DS4ko4wlesFrLexIuFuxoBas7h7weq29QBgHh3bA2IE5ItrVFu++8vmj74/oV0nr4KlMuaRV2RtDs5z80YRZ6tasKKtf3Ii+OcDYVMTQWL5lKCbWg/SDI51SaU91j3nD25gXZii7ug4TTpzgdHB8n7EtvuXxJcc/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291060; c=relaxed/simple;
	bh=+ukaA0+ja99isS38Kj0XPj94c6uwNUbuYhUg4aHZ12U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpW43TsTQ2OkUrZQT04y35wMfGaDG9jqkyhLOd/hWdHHgE6sHXA70LAZTQaTugeKeZQ90dzog1jnRH2tQmQ1DLu7aE3Vt0yvZE1SZPElx57SpUuOOajfACJDzLugk7k6E0R/y66GgNC2t0z/MLQzfdIdZE7u0KJA0yj86++Ih0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMk6MJVj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780291059; x=1811827059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ukaA0+ja99isS38Kj0XPj94c6uwNUbuYhUg4aHZ12U=;
  b=nMk6MJVj0sTYjevtCXFHz0nwEelVefOLmNG7vhO5p+uh4YKIiJ/tixXc
   cTgGUfqPrLpPIrU7yNpTM0fsfBLKrOuR2DHxMKIdWwKsXFB6STcwccg1U
   74FyuNX4qgsy53rhVTyrBURE1crM6SdvU2GaHH1OBTi6MH348rUlB7XVC
   1tXLuG2tBTopwSg9Q5Yd4vZZCYWapxN7PQ2H2EdfuB9jnlGYT0vrBG7t4
   pZtkRhtdm4AfJoiqM/9t8q5MjGz3EQ/++palMiqPvC87PsUGVI7cdT5U2
   uYT240lASofI4zKIcYrxejt7plm5gxtd9Hr+IyR5sIm6U9ycol2QeXWG2
   w==;
X-CSE-ConnectionGUID: IZzmcS4SQjmiqKY0P6OpXQ==
X-CSE-MsgGUID: wJENuLP4Sdi6dXqbIfKTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="98459948"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="98459948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:17:38 -0700
X-CSE-ConnectionGUID: Kg8NYwp/RFi2MrBglq7yzg==
X-CSE-MsgGUID: YCfCyRPFQ2aUP8np6RE0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="243308455"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 31 May 2026 22:17:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B754E95; Mon, 01 Jun 2026 07:17:35 +0200 (CEST)
Date: Mon, 1 Jun 2026 07:17:35 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpiolib: acpi: fix out-of-bounds pointer arithmetic
 in acpi_gpio_package_count
Message-ID: <20260601051735.GN3102@black.igk.intel.com>
References: <20260530094012.184276-1-scardracs@disroot.org>
 <20260530094012.184276-3-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530094012.184276-3-scardracs@disroot.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37742-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 9A4856199C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 11:40:12AM +0200, Marco Scardovi wrote:
> When counting GPIOs in an ACPI package, encountering a reference or
> string causes the element pointer to be advanced by 3 (element += 3)
> and then by 1 (element++).
> 
> If a malformed ACPI package contains fewer than 4 remaining elements
> when a reference or string is processed, this pointer arithmetic
> advances the element pointer past the end of the package elements
> array. This results in undefined behavior and can cause out-of-bounds
> reads.

How can it cause out-of-bounds reads? We increase "element" but the next
iteration checks that it is still inside "end" and it's never dereferenced.
Maybe I'm missing something?

> Fix this by ensuring at least 4 elements remain in the package before
> advancing the element pointer, returning -EPROTO if the package
> structure is invalid.
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index 049e4cbc14ed..494dcd166aef 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -1310,6 +1310,8 @@ static int acpi_gpio_package_count(const union acpi_object *obj)
>  		switch (element->type) {
>  		case ACPI_TYPE_LOCAL_REFERENCE:
>  		case ACPI_TYPE_STRING:
> +			if (end - element < 4)
> +				return -EPROTO;
>  			element += 3;
>  			fallthrough;
>  		case ACPI_TYPE_INTEGER:
> -- 
> 2.54.0

