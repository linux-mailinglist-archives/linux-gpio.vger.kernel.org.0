Return-Path: <linux-gpio+bounces-35916-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHsKFxVP82lnzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35916-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:46:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD34A2E06
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F7613019441
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204D9407596;
	Thu, 30 Apr 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ55+oCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B640626A;
	Thu, 30 Apr 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553150; cv=none; b=Z6f6lLiOd6XSgbF6E6AZbRuGxaoUFZdv5/kSYWKA6VhHCLGqXAoX6anZYci2yCQk1ZPuGUfm+0q1B5+d/nJDUQlM35gF6+boSARgWnvREbVB81VgAXQbdasUNxobymTvciKbYK867uTgNAXy2tbSzZ473j8BTnSiU0AnXm+az/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553150; c=relaxed/simple;
	bh=8FuyhcU0NeKHWu/h/BN34/C2sPypqOjPWw6HFO+7NIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXqf2LJUArvJARPhRDFR5CwXj9CZcTmXtJcvRe9Pb0etYmDjA5SttkouwrnF/4V5h81xLxbw1YcL772KLZ/uUaXUXgrQtPtH1ulvor0P5PtRL3bjjQ/nm8nL6flf9YlizjxwCEX9oVCAl89SjxwOP3/6sdqslOp0Wv5Lb9elzUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ55+oCU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553150; x=1809089150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8FuyhcU0NeKHWu/h/BN34/C2sPypqOjPWw6HFO+7NIc=;
  b=OZ55+oCU63HOubmqPJkMkUHW/8Jard4ysbI3E/HIyR2ImmkOKyE4lgjf
   c6wXDwsL+/UcvSHh/WEhsWh1MKwkDIKnfP+VNwVjaA1Lh6bszxGQVXkkL
   FYRbH/bm7JIftq0bDYzAje9EnmnSLAS1G4PxCpZP5NYy3w6Dg0a/Wf7I3
   XgJVpgkaQ+YZ9EITXufIHSKExtMzSpOpBRZbnEW9yLeAg+hO5413OJROm
   TpNusMw+yf23btj17QJxtvTWymQLUi7CpCNnS7chKIeeQJZDLB8voQ7nT
   eApQ2/Dnw12VR2bd0FeXH8KdLKV2xW6/BnPexJaMW8eMcIeA0f2WNxtRk
   g==;
X-CSE-ConnectionGUID: gjNaqOxoSMKu2n+vZuk4rw==
X-CSE-MsgGUID: 3IZZWYowRxytJhZl3qKjBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78690618"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78690618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:45:49 -0700
X-CSE-ConnectionGUID: GZTtNbivQxSecGNk4u4Cpw==
X-CSE-MsgGUID: ZSHJZfEgS4aClLwmXRJ1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233542862"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.42])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:45:44 -0700
Date: Thu, 30 Apr 2026 15:45:41 +0300
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
Subject: Re: [PATCH v4 1/2] ACPI: provide acpi_bus_find_device_by_name()
Message-ID: <afNO9Ub3qaOYLxUr@ashevche-desk.local>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
 <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: DBAD34A2E06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-35916-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]

On Thu, Apr 30, 2026 at 09:34:05AM +0200, Bartosz Golaszewski wrote:
> Provide a helper allowing to locate an ACPI device by its name.

...

> +/**
> + * acpi_bus_find_device_by_name() - Locate an ACPI device by its name
> + * @name: Name of the device to match

 *
 * Caller is responsible to put_device() on the returned object
 * when it is no more needed.

Or use whatever wording that is already present nearby and around similar
cases there.

> + *
> + * Returns:
> + * New reference to the matched device or NULL if the device can't be found.
> + */

-- 
With Best Regards,
Andy Shevchenko



