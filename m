Return-Path: <linux-gpio+bounces-39358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GJD+OBUoRmo3KwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:57:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F876F5028
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JLQf6gqQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39358-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39358-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55C033170C39
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 08:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7082039E9DE;
	Thu,  2 Jul 2026 08:46:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04983314D0;
	Thu,  2 Jul 2026 08:46:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982016; cv=none; b=Swg0aW1t0in6SWb+ETTsGURFGgOGyCZQsr286w7MNzeYaVC0HMByd6kA5RJv2/1gwFQTOSHaLmQo32w+00LbRjOIxwJ7nN/H/mmusA9QKBtZzIGH+TRnEDxWm9yYpj5rELtyHxVCOZKGmy02WgYA0QOwWTa0AkU+d07NFMRw09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982016; c=relaxed/simple;
	bh=NRO2jtVYc5zrSnF59sr3Pdvx9/Oq9OhC21JshLH1nYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDOm4NXR+O2LKis2GhwrJHNTSiZRZQvvpgdnGejSkO6Z9SHZm1iPeVot+z5qKZx2OfL2SAc7fhmEikrgDNHE315714xkv4N8WFr6A+d4RQRmA4RRLih+Kz/IeY+cif056QwWtkrhpHI1bB7D0yzbrzDrq2IzZJldcXhQYDm6DU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLQf6gqQ; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782982014; x=1814518014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRO2jtVYc5zrSnF59sr3Pdvx9/Oq9OhC21JshLH1nYI=;
  b=JLQf6gqQla2OSJMyXFOnVxTlz8/K2/y6HmfIL5LHYZFfnQkgM+7WBR7f
   BQPn5rC2L3Lqrx2ZmQmc3Oh8vJJB91kP41V5EaFGGn4SgNo6poXlPu37G
   3XhmbSY3sOAx4mfwmp7i02Kk60Lp9P9VnYL7FiDPMsi7hGg4/I75YNm11
   suA9pxlLNEa96eL9fvbyfeLdGWC/ZByAfGvYzhNL3+cOUz0X2MHgwBOqk
   U6wXGfJ/MasEJjB6APRbWZuHwZfdwm3V0H7NkAjKenk0oPXfcAkEt6EA9
   IGIt7LnPZwz7eSWJWpmNwGGFobeqwSjx1kZhbC/NO0w3Gutds4aqS/Uu+
   A==;
X-CSE-ConnectionGUID: 7V5Nl7TcRteDM848FnsZ0g==
X-CSE-MsgGUID: RtiwxZTlRQubcU1Npad8pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95232694"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95232694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:46:54 -0700
X-CSE-ConnectionGUID: jPOYwkjzRky4Oq2vild/kA==
X-CSE-MsgGUID: 7lYCrDNUTSiSLPZiYwKDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290924413"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:46:50 -0700
Date: Thu, 2 Jul 2026 11:46:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <akYlZCn9LKWGWM9e@ashevche-desk.local>
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39358-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17F876F5028

On Thu, Jul 02, 2026 at 03:10:37PM +0800, GaryWang wrote:
> Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> Add support "UP Xtreme i12" board.
> 
> The pinctrl-upboard is provide additional driving power & pin mux function
>  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
>  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

I don't see neither Linus' nor Mika's tags. Can you explain why you dropped them?

-- 
With Best Regards,
Andy Shevchenko



