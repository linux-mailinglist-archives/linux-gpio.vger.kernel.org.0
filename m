Return-Path: <linux-gpio+bounces-37855-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I8TcHLJ2H2rdmAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37855-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 02:34:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD37D63337C
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 02:34:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=j5z06nNg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37855-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37855-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40E73013A90
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 00:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCD223EAB3;
	Wed,  3 Jun 2026 00:34:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963863B9;
	Wed,  3 Jun 2026 00:34:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446892; cv=none; b=m/vX9s0C+rlJ938MczTM2C0/4MGcdhXqYZbmTreSFnPy3azenwBmC8QxUDNvzSr4LCKx31ksi0Q3mqf68kK3fBFaDv6C8h0uMNeKTgM7dZDNu3wCFcEi3SPP43SjnGGL1cn/dVp4lnfWM/h7Ww5R1yZGNQREsHP1dy/zDk+Mcv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446892; c=relaxed/simple;
	bh=6CR/rYWpbekN6oqzrZ6DgconT/RJAzmKq8Nf7HR3UU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9gsamQNDOz40kRnxL2D3nqVYTuhCxB8WkAbYxf25agq1LS7WyM8nz2416B4AIN8bS8TeqzIn/ljqlAgUlqesCfpJIAz/1sCO5MecQtztyVUyQyxPdrVXYpgJ3v0AYa/InxsF00y6aWW04SSxWQ78C9njFaRXZkKm8FptAEpDAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5z06nNg; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780446890; x=1811982890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6CR/rYWpbekN6oqzrZ6DgconT/RJAzmKq8Nf7HR3UU4=;
  b=j5z06nNgO1u0oZ+2KEpENoVpZBCJhVHjdW+KsL4raVTBDJTaCmvBy2xz
   Ta2Bd2y74bT+6qx0YCSO2f+YuCx0Q9jbEppn4qPSnbNJQFZyDMqvSjRoG
   rE+4qIlDz6pY/NnPB+i++rG9kdIz2ti+Qrd0RUiyvmiAhI799TtYyb4n+
   wWMwjh/slGjAhDwYm7YYgy3iMXuZYlI8y2rLdbWfvUjV9wuqDgChZDWLd
   2OODjjfL83P8imyFimpAEYqI1wd0kbGvDbaRi8GKeKoBsyrTMm4g7qgiL
   zS+WOSe8iOPdIo/n8u9oD/EXa++fK0l0pAAJAbTKt5ad+GQqF7B7GQyPQ
   Q==;
X-CSE-ConnectionGUID: fhMjlcGaRjGoPFMZ+m2QVA==
X-CSE-MsgGUID: +oso91iKTuW/GUUq7Grs4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="85131701"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="85131701"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:34:49 -0700
X-CSE-ConnectionGUID: UL9swsBaS4GHr8Zz1+JY7A==
X-CSE-MsgGUID: 3lmg5tijRHmPL3vZdZQSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244170860"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:34:42 -0700
Date: Wed, 3 Jun 2026 03:34:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "linusw@kernel.org" <linusw@kernel.org>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"wbg@kernel.org" <wbg@kernel.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>,
	"andy@kernel.org" <andy@kernel.org>,
	"dlechner@baylibre.com" <dlechner@baylibre.com>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	"brgl@kernel.org" <brgl@kernel.org>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Message-ID: <ah92oEavMu4QRn8y@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37855-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:linusw@kernel.org,m:mwalle@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[irq_domain_ops.map:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD37D63337C

On Mon, May 25, 2026 at 12:04:09PM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Tue, May 12, 2026 at 11:33:12AM +0800, Yu-Chun Lin wrote:
> > > Expose an accessor function to retrieve the gpio_chip pointer from a
> > > gpio_regmap instance.
> > >
> > > This is needed by drivers that use gpio_regmap but also manage their
> > > own irq_chip, where gpiochip_enable_irq()/gpiochip_disable_irq() must
> > > be called with the gpio_chip pointer.
> > >
> > > Add gpio_regmap_get_gpiochip() to allow drivers with complex custom
> > > IRQ implementations.
> > 
> > Hmm... Can't we rather add
> > gpio_regmap_enable_irq()/gpio_regmap_disable_irq()
> > that take regmap or GPIO regmap (whatever suits better for the purpose) and
> > do the magic inside GPIO regmap library code?

> Thanks for the review! I apologize for the misleading commit message.
> The real reason I need the struct gpio_chip pointer is to properly set up a custom
> IRQ domain. Our SoC GPIO controller is quite complex. It routes different trigger
> types to multiple parent IRQs, which doesn't fit the generic regmap_irq framework.
> Therefore, we have to create our own irq_domain and pass it to
> gpio_regmap_config.irq_domain.
> 
> The core problem occurs inside our custom irq_domain_ops.map() callback:
> 
> static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
>                                 irq_hw_number_t hwirq)
> {
> 	struct rtd1625_gpio *data = domain->host_data;
> 	struct gpio_chip *gc = data->gpio_chip;
> 
> 	/* 
> 	 * The second argument MUST be struct gpio_chip *.
> 	 * If we pass our custom data structure here, the kernel will panic later 
> 	 * in gpiochip_irq_reqres() when it calls irq_data_get_irq_chip_data()
> 	 * and strictly expects it to be a gpio_chip.
> 	 */
> 	irq_set_chip_data(irq, gc);
> 
> 	irq_set_lockdep_class(irq, &rtd1625_gpio_irq_lock_class,
> 				&rtd1625_gpio_irq_request_class);
> 
> 	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_irq);
> 	irq_set_noprobe(irq);
> 
> 	return 0;
> }
> 
> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrieve the
> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirements in our
> map() function.

This is all good and needs to be depicted in the cover-letter and/or commit message.

> Before I send a v4, I see 3 possible paths:
> 
> Option 1: Keep the accessor (Current v3 approach)
> We keep gpio_regmap_get_gpiochip() but I will completely rewrite the commit message
> to explain the custom irq_domain_ops.map and lockdep requirements.
> 
> Option 2: Let gpiolib create the irq_domain via gpio_regmap_config
> Instead of creating the irq_domain in our driver, we add all necessary IRQ fields
> (irq_chip, irq_handler, irq_parents, etc.) into struct gpio_regmap_config. Then
> gpio-regmap.c populates the gpio_irq_chip structure before calling 
> gpiochip_add_data(). This prevents an early return and allows the core gpiolib
> (gpiochip_add_irqchip()) to automatically create the irq_domain for us.
> Drawback: This adds a lot of fields to gpio_regmap_config and might violate the
> original design philosophy of gpio-regmap.c (commit ebe363197e52), which explicitly
> states that it does not implement its own IRQ chip and delegates it to the parent
> driver.
> 
> Option 3: Drop gpio-regmap entirely (Revert to v2 approach)
> Currently, all drivers using gpio-regmap (mostly simple CPLDs and external I/O cards)
> use regmap-irq to get their domain. Since our SoC has a complex IRQ routing scheme
> with multiple parents, maybe gpio-regmap is simply not the right tool for this
> hardware, and we should just implement a standard GPIO driver directly using gpiolib.
> 
> Which approach would you prefer upstream?

This question to Bart, Linus, and poissibly gpio-regmap stakeholders. I'm not sure
that my personal opinion will be the best fit here.

-- 
With Best Regards,
Andy Shevchenko



