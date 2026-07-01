Return-Path: <linux-gpio+bounces-39310-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NgcpFEX9RGp84goAu9opvQ
	(envelope-from <linux-gpio+bounces-39310-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:43:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD66ECEB8
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=aGxMsGES;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39310-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39310-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A91B730230EE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 11:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23929480355;
	Wed,  1 Jul 2026 11:38:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3047F2F7;
	Wed,  1 Jul 2026 11:38:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905923; cv=none; b=Q0vO9IQreBQvfRgcqj4GIxwP/z25YU0KxccUMlNAYfTMeCq/WpJ5EQwEM/qvIh19tCFaAgH2hK7XmNn+3M7OLBANR1T5AX4F0soMlqV0wcd5nPZIosgXeC1gzSCarD1qO6tpfW6vrvbNZiO9tuwj+gB7ePGT0etQ4H9ZrjKD6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905923; c=relaxed/simple;
	bh=DpQi5aHD1Rq2oQdH6gtw9i/QhFrOv7rlYgtQDdcfbSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdSoIL0bP/mMHUxMAHO1u5uOktJ2BSe+455343FXP0L6kg5jkZ03ecSe1ZVmhZ/92CO3CYPTu5atAFmknDzKYPgqedKkJ3+uRI0WVQw3aGuLRKn0eu81SCpYGJO2fvLBCOmtyTsHOxkIsNbzopvxN9PsseBuF8Xk98wYOPsomo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGxMsGES; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905920; x=1814441920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DpQi5aHD1Rq2oQdH6gtw9i/QhFrOv7rlYgtQDdcfbSU=;
  b=aGxMsGES/LhpIHmr7dstHzYYNGzm/u7ARkVQ6ErmN5nB4Hbh4rE0MUhH
   G2Fb9EbuRpG4WLz79v9g9mFCgn5eNQbyH9sMm3ZplCoeXTSK/W0XrWc8G
   WcmQtxsUIR9FV+/TAkuZEse07oZ9CMPV1mU1Nid/NDI9jrETbS2nFSmRg
   lw3ZcdhEEuPBUsYuPtE0i+hMYccFUVyKgww9qWnmtKLmJWkRy9+aYQYu7
   Hgcyu9a+PVvOfDLeD1R1gWY/TAMagd87fF3mmf3PrregcXUDX4Lt4TjdY
   sn9nmC5kaPEbBPXJg7ct2qBldmxFz+mGs6fEGYnSld3rticnNsGzZods1
   Q==;
X-CSE-ConnectionGUID: 03oF66lRTfy/Y8+Fj2523Q==
X-CSE-MsgGUID: NuqeR+T1SiqgDIeiJ7ZFpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87471921"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="87471921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:38:38 -0700
X-CSE-ConnectionGUID: rTQDfgZ4RGq/h2rchLoSMQ==
X-CSE-MsgGUID: VAriTwrzQjasz3AnxY77QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="257446464"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:38:32 -0700
Date: Wed, 1 Jul 2026 14:38:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
	Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Message-ID: <akT8Niv1ddo-uWmc@ashevche-desk.local>
References: <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
 <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
 <akTyDzdrt949VnWK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akTyDzdrt949VnWK@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39310-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:mwalle@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:andyshevchenko@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46BD66ECEB8

On Wed, Jul 01, 2026 at 01:55:11PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 01, 2026 at 01:01:10PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 1, 2026 at 11:44 AM Michael Walle <mwalle@kernel.org> wrote:
> > > On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
> > > > On Mon, Jun 8, 2026 at 4:41 PM Michael Walle <mwalle@kernel.org> wrote:
> > > >
> > > >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrieve the
> > > >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirements in our
> > > >> >>> map() function.
> > > >>
> > > >> Why is gpiochip_irq_reqres() called in the first place? Isn't that
> > > >> only called if the irq handling is set up via gc->irq.chip and not
> > > >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
> > > >
> > > > Not really, the gpiochip_irq_reqres() is called to mark that a
> > > > GPIO line is used for IRQ, so the gpiolib cannot turn this
> > > > GPIO into an output line, gpiod_direction_out() will fail
> > > > on lines used for IRQ. So it's a failsafe.
> > > >
> > > > You can live without it of course, but then you don't get
> > > > this failsafe.
> > >
> > > Thanks for the explanation! So did I make a mistake years ago by
> > > adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
> > > ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
> > >
> > > As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
> > > to be a gpio_chip, which isn't the case (in general) for an
> > > externally allocated domain, is it?
> > 
> > So the whole issue comes from the fact that the IRQ chip is not marked
> > as immutable. For immutable IRQ chips (which all GPIO provides should
> > have) there is no such issue to begin with, id est there is no
> > gpiochip_irq_reqres() callback assigned (and respective _relres).
> 
> Ah, for immutable chips we put either custom ones or
> GPIOCHIP_IRQ_RESOURCE_HELPERS which actually refers to those callbacks.
> 
> So, if the domain is external, it should also provide irq_request_resources
> and release callbacks. In the custom case we can wrap gpiochip_reqres_irq()
> and gpiochip_relres_irq() respectively.
> 
> But we need to have a struct gpio_chip pointer for them. And note, the
> IRQ chip data can be anything in that case, so it's not a requirement.

And looking back for implementation in v3 the whole mistake was to use
GPIOCHIP_IRQ_RESOURCE_HELPERS. It just wanted custom callbacks with
the IRQ chip data assigned to whatever from which we may then deduce
struct gpio_chip. It does *not* require to be struct gpio_chip.
The local driver data structure should keep pointer to struct gpio_regmap.
That one can be used in the respective .irq_request_resources() and
.irq_release_resources(). The default ones for gpio-regmap may also
be provided via a macro, say GPIO_REGMAP_IRQ_RESOURCE_HELPERS.

Hence I don't see the need of having gpio_regmap_get_gpiochip() helper
and driver can be implemented using gpio-regmap and external IRQ domain.

What did I miss?

-- 
With Best Regards,
Andy Shevchenko



