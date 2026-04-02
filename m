Return-Path: <linux-gpio+bounces-34592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGKjB39yzmnxngYAu9opvQ
	(envelope-from <linux-gpio+bounces-34592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 15:43:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE3389EE5
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 15:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D39FF3130F7A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 13:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1C13009CB;
	Thu,  2 Apr 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+uXZyYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F130E831;
	Thu,  2 Apr 2026 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136964; cv=none; b=gPAxzV5WtNJ4LHPHhBg7XroCyXjXKeD4qJ8W6XV73xgmk8YjouhORy4/6qF/IxEXDdCHNzIgi7X/E1uNVXpYBcJd29Zh7WzT9lDs0pPIbWbyz92cVGjypk1/yrEShorzOL+/PMETcrhWU2DjZnb/qyOC9QzkE+6u92oTnKQKgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136964; c=relaxed/simple;
	bh=EUyHOU+PT6gcnQyOOsL/7iU6RX6nDZfCu5E3pc2js84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtM7TrL24Xwtx5QTdFc+2VlCM02AJrGtwCeUjgKAYnm0+KBSYZkHrxchPzFI3WYKXx5K8PECUJVVPMGqZNe38QC4QUCK6dUUM7ZW9VwCln86FBcXYlJIS0c4FGJ5wPlmdWla890vj/tgfx9aAYX0YrJ1dY+67LD3zaGsF3U19t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+uXZyYm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775136963; x=1806672963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EUyHOU+PT6gcnQyOOsL/7iU6RX6nDZfCu5E3pc2js84=;
  b=c+uXZyYmGZoJw5GpIgc4SGi5XUFlX0JQURrWqT0ThjSno7TCrkxQPWPC
   CwczDuB1Sg4fPbZSSoM4w7kjyxj8e8FmKONLlvKO5FluO0J4tJV/Yg2d4
   Eij5Oc/1biospJiLIlGceQnYtI5/98rIeJbXEr3U6QAqly7NpDC2R7Jju
   iz2kwqHdzxgc6Rj9akUWtao68DoNzbUo23iBb1i/ms737xU0jWldDrqAy
   OVnmG1RTf3RTpV58hHqlFykVV3CHFKgJYZDBPKD9HNrArC4rxw2iQlGFl
   0lGfZMLQy5kaACmAFmvKv0uNSiMyhhBRYwEtYyMY95yocl0TLmDHE6qfw
   g==;
X-CSE-ConnectionGUID: KV9QR5sZQzKfQ96CrpKxoQ==
X-CSE-MsgGUID: Hfj39xJrQ9ORyL/gmrYLSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86896088"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="86896088"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:36:03 -0700
X-CSE-ConnectionGUID: ohdmiZMgRjSwR2KP1n23kg==
X-CSE-MsgGUID: +0H3evrnRy+vKvbW51rkjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="257464118"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:35:38 -0700
Date: Thu, 2 Apr 2026 16:35:34 +0300
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
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <ac5wprh9vfTU5pGa@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34592-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: D3FE3389EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> It's possible that at the time of resolving a reference to a remote
> software node, the node we know exists is not yet registered as a full
> firmware node. We currently return -ENOENT in this case but the same
> error code is also returned in some other cases, like the reference
> property with given name not existing in the property list of the local
> software node.
> 
> It makes sense to let users know that we're dealing with an unregistered
> software node so that they can defer probe - the situation is somewhat
> similar to there existing a firmware node to which no device is bound
> yet - which is valid grounds for probe deferral. To that end: use -ENXIO
> which stands for "No such device or address".

This error code is also too generic to my taste. What about alternative(s)?
EADDRNOTAVAIL
ENOTCONN

(The brief grep shows that the second one might suit slightly better than the
 first one by existing use cases.)

Do we need to update the (chain of) kernel-doc?

-- 
With Best Regards,
Andy Shevchenko



