Return-Path: <linux-gpio+bounces-38788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A9cfIQQQOWrRmAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 12:35:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0016AEBD6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 12:35:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=OnulI88y;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38788-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38788-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2A74300B828
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89946372069;
	Mon, 22 Jun 2026 10:35:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782CC27603C;
	Mon, 22 Jun 2026 10:35:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124523; cv=none; b=eRsQHMRbAsB83A5aQ13bKG1ij8Y0OwDiwgi8erIeAAbr95CYpohBcXKIZxs16av+Ra0UbHXYblfnWAeoDiss6FAnFoe0OZhkZtTzjyqCj+S+Vs278Euo+k1psbrFKfxzEojDj7zi9LDHHjj8AujZMRpxzYA3mvP6YSHgjpRVuVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124523; c=relaxed/simple;
	bh=nKS4zwQM+VFl+KcVzgjEHYMtbkj7E74mVR7te08Yyu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOMOnXHulxvImCALD4O/QGUnGTWho3kI8ieO8OCsS6+h0Xq9hKMvn/bKdrhNrq3k4dm5LVh2TKwcXVJdKdF5+dn9Zt6GW6msgSzFlFLJRhFtoVnGGxLph9GpxUs1ezaP3ZSJI7ezUxKsDPjjVBaR4xpM8TpGgrTud434DcH562E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnulI88y; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782124521; x=1813660521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nKS4zwQM+VFl+KcVzgjEHYMtbkj7E74mVR7te08Yyu8=;
  b=OnulI88yX0QSSucq/j1BKh6psinhnzMa+6iVYioE4Byy50/FLIQH92q3
   7TwrS8eFCNYEiUQgejlf/nrXeO5xlnXj9QNlj2mZC7qZrZMz5ZeymbLY7
   98QwhURC83bAFsOHX5T+hQ0yWG0O3r083PFeR0j2RAo/0HWSEGh9tHQ+P
   vYeab96A84CETpnVaj1lHm/W4HLimqiaKWNMrFfafkqbdxqbnv4ILckCN
   TnqszfxD3RDc5Jf/nywPs6W37AyuUC1/Y2ACN4tiClyZ7CVA6j3OU2Qr8
   nS/InqYaBtxmHsBfxwNfxZhLlOKX7Qjlq2c8HBflJE3PKDGoZ/7d1hFkX
   w==;
X-CSE-ConnectionGUID: fCFYSwzLQhqRaWQ7XDJeMA==
X-CSE-MsgGUID: fZkXNCwMTri+69p6CGQqPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70365448"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="70365448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:35:21 -0700
X-CSE-ConnectionGUID: NiAuEHaXRFyoiUSZMBV95Q==
X-CSE-MsgGUID: pwp5A8wfRVaZLysDxupkNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="248046762"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:35:15 -0700
Date: Mon, 22 Jun 2026 13:35:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,
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
Message-ID: <ajkP4DHN4JPjr6yb@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38788-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:mwalle@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E0016AEBD6

On Fri, Jun 19, 2026 at 11:08:30PM +0200, Linus Walleij wrote:
> On Mon, Jun 8, 2026 at 4:41 PM Michael Walle <mwalle@kernel.org> wrote:
> 
> > >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrieve the
> > >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirements in our
> > >>> map() function.
> >
> > Why is gpiochip_irq_reqres() called in the first place? Isn't that
> > only called if the irq handling is set up via gc->irq.chip and not
> > via gpiochip_irqchip_add_domain() like in gpio-regmap?
> 
> Not really, the gpiochip_irq_reqres() is called to mark that a
> GPIO line is used for IRQ, so the gpiolib cannot turn this
> GPIO into an output line, gpiod_direction_out() will fail
> on lines used for IRQ. So it's a failsafe.
> 
> You can live without it of course, but then you don't get
> this failsafe.

So, when we instantiate our own domain in regmap GPIO, we should have those
callbacks be defined somewhere?

-- 
With Best Regards,
Andy Shevchenko



