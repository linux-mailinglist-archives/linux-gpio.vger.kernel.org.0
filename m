Return-Path: <linux-gpio+bounces-36209-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFnILgbv+WlqFQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36209-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:22:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 948464CE5EA
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 431953001441
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 13:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170D13E8C70;
	Tue,  5 May 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YC3A8T78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC91335555;
	Tue,  5 May 2026 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987325; cv=none; b=e50v/zujOBa3QMKLQMwmnvnXREup/S7J5ci8pozwsQJMAznw8tr0/e9/XJL2mnpNiVV7pBcyyNz40y7lOgASf9OYA/WffmCEur1PUIxqyGvT+C2cQ+IaDfbpCefEc7aMwQAzKfU8Q0md9GRLoUF1KDHtHcb+YAG/k8TSZzd/rfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987325; c=relaxed/simple;
	bh=Ij/RKBgYy56O0uzaxUs3gQoxepG4M1vO6rUuWWatVlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seQzBr0gTDOV0rMajnW5UkCfRmL4Ycbxbm4H8I0UWDwvHJwbjmbhtOzdPupAcWFTO6h9sOnJXQD2aWulVUub7GOnZl0yhkRjpA2Q5A7Yd+qAwkinZ8LMktnIdWzir6ZT3oBFFtpnXFW30PLhVOOVGb599Cfe97hgegX2Ihw3ojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YC3A8T78; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777987324; x=1809523324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ij/RKBgYy56O0uzaxUs3gQoxepG4M1vO6rUuWWatVlo=;
  b=YC3A8T78LtR5ttteE4V2SIfoCSjEBG4R6trC0w07kOEBwTLDk4oVksCl
   5glQ7kIoMK8gNB9GRvzDXqHEOwuKGJHjQUj2kSxfpQSAgHTW/wrQY+wMr
   M9zbQ7ieTjGEUXsvfRvD2gPp4H2SIyY+QU1E7uu91nGoaugzfTXxGYa6j
   swvr/AfI4aSp+bO0DgjaziZjaCjrG3KnjvOa491HLuZY1tdcsGw1OS6JU
   34rH4HSXYbL3jAYGY5DLAwH19CGNBCzDeAqM8EtIK/24+w3UPwnH5GFFo
   pt15dVyFodKWmsBQYMfvvFxZtGnRSIqSallcPMrEOb8GTbjAJdZedjmQ8
   g==;
X-CSE-ConnectionGUID: A3IEFTGPQyew7d7HdFw4rg==
X-CSE-MsgGUID: bNNOhoipSJy7gcgrqL+t+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78847355"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78847355"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:19:36 -0700
X-CSE-ConnectionGUID: r7vLLG3aT0abFqy7ISkkxA==
X-CSE-MsgGUID: vTupwnkYSm2EyyQgnNW/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="240807974"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:19:34 -0700
Date: Tue, 5 May 2026 16:19:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
Message-ID: <afnuY6IPvC7dgUC9@ashevche-desk.local>
References: <20260430091202.2724109-1-arnd@kernel.org>
 <afhLS6xwHGm9_mLy@ashevche-desk.local>
 <bfecac99-3ec1-473a-bd5f-e49ae48aebf3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfecac99-3ec1-473a-bd5f-e49ae48aebf3@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 948464CE5EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36209-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]

On Tue, May 05, 2026 at 03:10:28PM +0200, Arnd Bergmann wrote:
> On Mon, May 4, 2026, at 09:31, Andy Shevchenko wrote:
> > On Thu, Apr 30, 2026 at 11:11:55AM +0200, Arnd Bergmann wrote:
> >> -	/*
> >> -	 * This is the legacy code path for platform code that
> >> -	 * still uses GPIO numbers. Ultimately we would like to get
> >> -	 * rid of this block completely.
> >> -	 */
> >> +	return gpiod;
> >
> > Do we need to repeat the upper `return gpiod;` statement? With this split
> > I don't see that we need to have two repetitive return statements.
> 
> Right, I've simplified this now to
> 
> static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>                                            const struct gpio_led *template)
> {
>        struct gpio_desc *gpiod;
> 
>        gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);

>        if (gpiod && !IS_ERR(gpiod));

And this is not needed. The below is NULL-aware.

>                gpiod_set_consumer_name(gpiod, template->name);
> 
>        return gpiod;
> }
> 
> which still keeps the existing behavior but is a bit more compact.
> 
> I think we can actually just remove that function altogether
> and just pass the name into devm_gpiod_get_index_optional()
> from the caller like
> 
>   gpiod = devm_gpiod_get_index_optional(dev, template->name, i, GPIOD_OUT_LOW);
> 
> Did I get that right? If so, I'll fold that in as another
> simplification.

-- 
With Best Regards,
Andy Shevchenko



