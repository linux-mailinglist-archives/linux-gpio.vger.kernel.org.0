Return-Path: <linux-gpio+bounces-31697-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBEdIGvJkmm6xgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31697-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:38:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7714150E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53028300F5E2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 07:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7452EFD95;
	Mon, 16 Feb 2026 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3GfvLkO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06F2D29AA;
	Mon, 16 Feb 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771227489; cv=none; b=LYdS1zc6aMK3/cS+9fb66Etu1STGXXjbNOJGqFzciZHpWQDJ8qsKm4h8chI/pCWTaClkfnpkEFPwjW/W3p4gJbej5IIeRVFWyFiAHWCNqtVl+pRufJaG50V3vO3Ic2VhKWkuikAxoLYJZ71X8hOvOzSlcUQhRUN60L8PR0NjytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771227489; c=relaxed/simple;
	bh=nCZ4NiwuDsoLiBa20YbgHZ5csgZ2EwKqPA1Cf/2HJSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyJRuX+qXMzEfwFE8unO2+ODb+MZ5oAK/GRqSqrcXc1B92mOEWblyUCD6JienDfParRjhfpx0k/osoRNi37rEBiPvSj1V9bWJa/D6+P5rsmJUGPxq/emJ5S0iXhJKLxxqq6et2uWo6C9EqsZf5qIuz0M8xYtvcNAOgnMr2faNEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3GfvLkO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771227488; x=1802763488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nCZ4NiwuDsoLiBa20YbgHZ5csgZ2EwKqPA1Cf/2HJSY=;
  b=R3GfvLkOiyAg72CtGBq91E/WButfCgWNiFN521JwpsnFhbT9VolsS46S
   ovYvS+cagh+wMcvDHS1z7GJCJyZeScGV71pwbCfKrmTDn/3P2AWXiiP+c
   HqYnhS2MqMyn1gwHndCAp3AJa+YTn+swBVM8YzJqKqQqVsdb5qX4KPsLR
   82coDlnbwp5LBo/N1ZQmM021gWcIw9PH31km6UCQjaFOXG6QFGLayGZe/
   lyJKZEMbkLG6WJO5sqJAu+vwERJmnvnLgMQDdB/iqjALAY6K6g4Fohfqv
   mBB5qDAb0HG8FSCG/lFt74UhYbPOH7OO1VaLNz8dKZS0hHPl8WUItyf8A
   g==;
X-CSE-ConnectionGUID: WEfowuxeR5KO/blScZQLZw==
X-CSE-MsgGUID: ou6Ntsv5Tky0EIil/SNDmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72477183"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72477183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:38:07 -0800
X-CSE-ConnectionGUID: EdsirQxuThy4pZ//UAUwww==
X-CSE-MsgGUID: 4FbVnXzOReaqw6nAKXK6Tg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:37:59 -0800
Date: Mon, 16 Feb 2026 09:37:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH v2 13/13] hwspinlock: refactor consumer.h from public
 header
Message-ID: <aZLJVfTe0-oZzb3w@smile.fi.intel.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,kernel.org,linux.alibaba.com,infradead.org,redhat.com,lwn.net,linuxfoundation.org,baylibre.com,analog.com,gmail.com,foss.st.com,arndb.de,lists.linux.dev,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-31697-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 1DF7714150E
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 11:54:53PM +0100, Wolfram Sang wrote:
> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers.

> FIXME: separate driver changes?

To me the change sounds quite small and unlikely to conflict in the future, I
would just mark it

  treewide: refactor hwspinlock/consumer.h from public header

-- 
With Best Regards,
Andy Shevchenko



