Return-Path: <linux-gpio+bounces-35606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MeUHnuH72ksCQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:57:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B6475BD6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1DF430C7FEA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE86344024;
	Mon, 27 Apr 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1zVc9Am"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A10337B97;
	Mon, 27 Apr 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304620; cv=none; b=m9/m00xGw8fYDtomACvfn0R+PW2ccEdpSVc7G7F2T+nR+50jQ0xYxJDerhMTeL+K3g5/lUfgBhgR/VcobAa6Z6Ugno4B79UtNhhvUuvt4p2GY7JhILcOzUV9cFjSlqhrbrXXU0qfJHy7re/jsv9lfbxVEJcbxbMi5Vzgtfn77BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304620; c=relaxed/simple;
	bh=6ISVTMtRX4NqFtLqj4qSZrtb1sJJjw46nVYpkNvtzzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGf9jvaWjBKwv6QCs3/18vbUqepBaviGk1RzOPCSp6WuvVEe1goDvBuY7qnBUTyNd6vab53JhzpcYd9NAbKxiPdac1OKpExgGs67Bc4cEX34zp8oOb98/DrA3F2LsxE3k1hgwk6UFs5DaMa4CTx3/dpHHuNMFJ6LXTRe3zERluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1zVc9Am; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777304618; x=1808840618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ISVTMtRX4NqFtLqj4qSZrtb1sJJjw46nVYpkNvtzzE=;
  b=G1zVc9Am0lg0OLEg0IaI2O93vquAA+1aB7uJwL2FFFUoHkoN1wWbMQGt
   5vEjNa5dzQkTtpqQVVZmZLXCNeg7WPvUJ4gdh5cCh8OiN99ww4OjG8+7F
   bEzVFHJepQMpR24mq92heRJmi4hD0UE9cjybDfryspqclBIqxLAvdOiyC
   NXi82JGeJ5atAUruEA2A/yDhzJldBGqUYTFaBf3VeXr0cgq0az6qUUsSC
   uf8c/0/U0qo5dSl4VtAwVdrTkVyezQZu+qODHJ7Sl2Yu64eg0JRh8yN51
   ZnzqtFI7iJ2X+09mB4ubkdgp8+OeCZqTvSXFlESMI5blDcDb8XN+gvvFB
   A==;
X-CSE-ConnectionGUID: pkfnsPSvSaqbuizfOlhiyg==
X-CSE-MsgGUID: kqlQ3sM3ScmYFVbfEsrwtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="103656950"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="103656950"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:43:38 -0700
X-CSE-ConnectionGUID: MSbhwIMpSU6XPZgGx/cnPg==
X-CSE-MsgGUID: VNR5LbqfS7Cae+5Twd97QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="238660909"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:43:35 -0700
Date: Mon, 27 Apr 2026 18:43:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] usb: udc: pxa: remove unused platform_data
Message-ID: <ae-EJW3UXgVbiXt0@ashevche-desk.local>
References: <20260427143300.2887692-1-arnd@kernel.org>
 <ae-D4Qki41GpOHyx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-D4Qki41GpOHyx@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: D30B6475BD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,arndb.de,zonque.org,gmail.com,free.fr,kernel.org,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35606-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 06:42:31PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 04:32:10PM +0200, Arnd Bergmann wrote:

...

> I even wouldn't mind this to be long single line
> 
> 		dev_dbg(dev, "can't get pullup GPIO: %ld\n", PTR_ERR(dev->pullup_gpio));
> 
> (I dropped ' err' part in this variant, though).

Or even

		dev_dbg(dev, "can't get pullup GPIO: %pe\n", dev->pullup_gpio);

which fits 80.

-- 
With Best Regards,
Andy Shevchenko



