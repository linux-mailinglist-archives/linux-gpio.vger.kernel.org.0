Return-Path: <linux-gpio+bounces-36048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C9fG+R9+GlvwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 13:07:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3064BC298
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 13:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAD983015A4D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 11:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E79D3A7597;
	Mon,  4 May 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjrFDp5J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61034252C;
	Mon,  4 May 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892747; cv=none; b=Iv1nvN7hUToykY7NMIl6erN4pBQZnGjLkQqqVRUKKObzGGRr7etobdMDpGuGFULRj9EHb51pNNB2yJrqyK5eBCahgCJphXCPrslw2TC+d0DzwTBMe41J8gFMwkdOJ6uSO4tGQgA/eU2lf0v2hg2P+iZqNvIxHO9Bk2EOIkVhJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892747; c=relaxed/simple;
	bh=pd0CV/kgRoy/Ie0aa/FbLfX3NCPZyqxXB93xfwHnrvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjAyVctzlq47bIqEnjebe4UvGG7N1BkI2DEZoQwGeQMJNZctKeDFXqZqdmZJ/V4QBna7opXZonXGU8qa7s8ScjjsUowRdrVCU0eQZahTXJh2wEO59A9EZtSB39BGv00gA4pSa9CPvSESc/IWl1bD2pukn31eS0PpknE+PJWE8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjrFDp5J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777892747; x=1809428747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pd0CV/kgRoy/Ie0aa/FbLfX3NCPZyqxXB93xfwHnrvw=;
  b=YjrFDp5Jyw9lssyW2T/0yOZ5+UQOd4zjzrbtdSrY8iIcYc2Lu8LXgp0d
   fhILPQwVB2hC7J6WQoaUakcv4CDlycKokhv/2E8z6VbE8O/Sr71khrkd9
   jC2RVcnNL7o+moRMg9o/5xHIOU2TqTfHYGsclFMl1ltJ62txdUDavX34Q
   uktckCP4K3CQadit+hsAm7LCuuhJqZdveD+bAj/sJ7bGRjVhQ14T8bgKQ
   HTPvCe7Hh/EFm51NhFzNlm847tYbQkrwm/9bWbuHs1aD5Wj6pQ+h40pst
   mY1bhCKjga+/hJXSF7Cj7aMiILi0bDIu+m78YGkSEA/A+ICcsJyiP8IwN
   w==;
X-CSE-ConnectionGUID: yskaeksRRBS/xgcIw3gigg==
X-CSE-MsgGUID: 4UqTw+zBQz6Phjc+3JLkRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78738925"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78738925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:05:46 -0700
X-CSE-ConnectionGUID: UnvderQeTcirAk4hGVk4+g==
X-CSE-MsgGUID: 0MjSFDvkQ5e+lDa++RYqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="259135356"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:05:41 -0700
Date: Mon, 4 May 2026 14:05:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH v5 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Message-ID: <afh9g5GapMYUwu1S@ashevche-desk.local>
References: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
 <20260504-baytrail-real-swnode-v5-2-c7878b69e383@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-baytrail-real-swnode-v5-2-c7878b69e383@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: DB3064BC298
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-36048-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 12:58:57PM +0200, Bartosz Golaszewski wrote:
> In order to allow GPIOLIB to match cherryview and baytrail GPIO
> controllers by their firmware nodes instead of their names, we need to
> attach the - currently "dangling" - existing software nodes to their
> target devices dynamically.
> 
> The driver uses platform_create_bundle() and expects all required
> providers to be present before it itself is probed. We know the name of
> the device we're waiting for so look them up and assign the appropriate
> software node as the secondary firmware node of the underlying ACPI node.
> 
> Scheduling fine-grained devres actions allows for proper teardown and
> unsetting of the secondary firmware nodes.

This version is much better than previous variants (and simpler), so, FWIW
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



