Return-Path: <linux-gpio+bounces-38352-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ykgCHzLdKmpnyQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38352-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 18:07:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E06734D3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 18:07:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZXQD8vnl;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38352-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38352-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A3BD3201731
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 16:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E43E403B06;
	Thu, 11 Jun 2026 16:03:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0BC2C3757;
	Thu, 11 Jun 2026 16:02:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193780; cv=none; b=PNrsN0ar8FC+nXrZjDGSGoosoaC8LxQ7chBXKmW3RxhuRZ/7vjm9uYOhVO2cDh88jQMSvd3RfLL6+yAN7Sj8iYF004bUgLDB6d04hJoh7cGqnl0vx3nqDKkHIftYjKaRvgWvqtQDvBP2UAkt5YHBw7kpungc6b9ZQ4wdyj0SQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193780; c=relaxed/simple;
	bh=tTozRJ3nSx5mnMqm/xfkGRTD8tFDJixQAj2mL1WqllU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6KY4usIJtzfsiEwic79t17YCSywHjXWx8OYa6kQiYePKjtw5hi/neUPrCHlBB1PN3yNPF93hwECFrq+khWl/Z7HI6rufh5wVqIrpFDN9Kmb9J+fvy4NpCXrWXoJyPMu8bSOqqca30GvgLVqCIW8jGFgkcJWa3ztzZZWk1ZKqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXQD8vnl; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781193779; x=1812729779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tTozRJ3nSx5mnMqm/xfkGRTD8tFDJixQAj2mL1WqllU=;
  b=ZXQD8vnlqCsgHLAlB+f8Nwa8YPqdGNCNiZ8RQisrQj2vYF+LY16A3YUQ
   94fJMgfH6vFdti9h/lGAhSmz7C6A3epdY4iRhNAb1lU/mmSQQJNi8x/8y
   Qec87I00g9Mi4CMvwz/lksBCweLEixtTem1sNiXHXVdRfLh1BZBzTViyL
   C/YNEhptw1dRDC1yDiXserMGNIQ0ViiLptfyH0ul8dGutlJT6HPLRCldQ
   IV5MQkk1/7vcO6JeVGaUuaADs5bJ17WT1O9WCP4mehmSx9Oq4UkBD1el9
   xvI2fVi0jbw1pAPTTbHRtAzv7JFJwgJ7871VhBxu4L/chANbguv5uaiyQ
   Q==;
X-CSE-ConnectionGUID: Cqcf/H0aRi+URKqmDcFmEg==
X-CSE-MsgGUID: EjJJb58UR8CmrB0pFUSYag==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93118858"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93118858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:02:49 -0700
X-CSE-ConnectionGUID: OYV6Te0bQrKuJ/TyiThYiA==
X-CSE-MsgGUID: 48gV/i0tQdKhrYY4trnKDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270192027"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:02:45 -0700
Date: Thu, 11 Jun 2026 19:02:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: GaryWang <is0124@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
Message-ID: <aircIvoG1E4x9_Op@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-2-8185d2abbfb1@gmail.com>
 <CAD++jL=ZM72UhCxw2Ubx7dSUhrUAfynjJbWMHN9TuMNoK5xBhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=ZM72UhCxw2Ubx7dSUhrUAfynjJbWMHN9TuMNoK5xBhg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38352-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,bootlin.com,aaeon.eu,aaeon.com.tw,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC9E06734D3

On Thu, Jun 11, 2026 at 02:29:07PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 11:00 AM GaryWang <is0124@gmail.com> wrote:

...

> > +static const struct pinctrl_map pinctrl_map_adl[] = {
> > +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
> > +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
> > +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
> > +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "uart1_grp", "uart1"),
> > +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp", "ssp2"),
> > +};
> 
> This looks very ACPI so I do not dare to merge it unless Andy or Mika ACKs it.

Basically I proposed to merge via Intel pin control tree, in such a case
the Ack will be implicit (as it will have my SoB). But I want you to have
a look from high level point of view of pin control subsystem.

-- 
With Best Regards,
Andy Shevchenko



