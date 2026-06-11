Return-Path: <linux-gpio+bounces-38353-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wNEMIoPcKmo6yQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38353-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 18:04:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0567349E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 18:04:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GBGRd1nO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38353-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38353-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEF9630344E7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 16:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438D9402435;
	Thu, 11 Jun 2026 16:04:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305F13D8B1;
	Thu, 11 Jun 2026 16:04:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193856; cv=none; b=oq1IMuAjvNfOaydK8Xr2BMZqGs+vp8IzXn43/yY3Nvxqhnb2COWWoKKq65XtqVZrrynpq3FDwCLR1R+CkNc0UsQiS7CdtueswYcX21875/1kQ3Zjp59wi88UFulbRVTPVShoIjh16DXMnG2qVbEvwHwiQZP53TdGQXUr2kyJw1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193856; c=relaxed/simple;
	bh=BTFPdK0YmtCYk3ZL3QqrQIMuZpGi++C62xxjASrT4pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8HpOkeuo0CWbEZVRV9+Edr4BX9njmQ0ZY3GIm9uudF4UnZwkQ+SbYGertubUMbLi1B61bNm3nypKx+ye8GjxnEisoeO3eBNtew8tRJM6BnflOfO5/PTHyQ/0e5w5XGE/jdpZ0hisebQOIqgsqNTp5u2QZ4k7b4nI2Oa1F5iBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBGRd1nO; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781193854; x=1812729854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BTFPdK0YmtCYk3ZL3QqrQIMuZpGi++C62xxjASrT4pA=;
  b=GBGRd1nOl2hjqUc/vcoUl8q19BbFEO3c0OSjOngJ55AWsR6z5bazHMjf
   exOBTZkTrLv+4b0aNZmZ6s3//oz+21W2tjaJ1IDsi9loAnepBBAcOZYOF
   hnpAkx9O9FVwQtPyR/aysjofjXNbSSSY2gRg29/WbCTpqVUK8Wnb83I0U
   1oG7NX4k+UUX9CtnVWxPmY5/HqXgZqrEHIOw1RBqxpK8DSL8f86DVpnfW
   2VDdMftcpVdcxOO/4Y2ibDF9Olq1jgxCh4WJl7MVE0W6YtlRTklfXd9sx
   TR229MHVv3OMvKp7Nb2guI/4a0yJbqClLBL7XoIUD3W4S2a1n3EuWZ/35
   w==;
X-CSE-ConnectionGUID: T+ht2U3FScqE4+/Wpth+1g==
X-CSE-MsgGUID: s6p9x4PhQnSSUXHUPpYFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92577772"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92577772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:04:13 -0700
X-CSE-ConnectionGUID: noJeCfDAQkykJp4r3CLL6A==
X-CSE-MsgGUID: try4bs/kQ+yF3dKhoyEYSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="284612059"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:04:08 -0700
Date: Thu, 11 Jun 2026 19:04:06 +0300
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
Subject: Re: [PATCH 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <aircdlL323BTioZE@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <ailxCrCYXPkrKqi-@ashevche-desk.local>
 <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38353-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12F0567349E

On Thu, Jun 11, 2026 at 02:30:00PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 4:13 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Jun 10, 2026 at 04:34:22PM +0800, GaryWang wrote:
> > > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> >
> > I can take both via Intel pin control tree, just waiting for Mika's and Linus' acks.
> > Then I can send PR to Linus to (try to) include this to v7.2-rc2 as it seems close
> > enough to the category of adding new HW support without breaking anything else.
> 
> Excellent, thanks.
> Acked-by: Linus Walleij< linusw@kernel.org>

Thanks! I consider that for both patches. Gary, please send a v2 with all tags
and elaborated commit messages and cover letter to address Mika's questions and
concerns.

-- 
With Best Regards,
Andy Shevchenko



