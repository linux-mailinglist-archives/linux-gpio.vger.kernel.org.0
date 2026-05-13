Return-Path: <linux-gpio+bounces-36784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF0sJ8q8BGrrNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 20:02:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60552538832
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 20:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41B1E3014686
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AB33A6B7E;
	Wed, 13 May 2026 18:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k64PxZSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D6388394;
	Wed, 13 May 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695363; cv=none; b=mEWlM7McwT5nT73eDyUlrF6OhkHckk5uTNJP+9DqrtZXVBnxY4aOLhBighJ1Z7pwsrkp8REJLONqy5iwvEvzEolkQXHEyTdrqajlAMOnRvEVHG58ZXCqCMX4Y5hoOD4fXfdUSphHjSkP4aHk1oaH7TynPrwozHTxho2LuE5COgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695363; c=relaxed/simple;
	bh=aHZIz4hYTuSjsATQj/AJOW5Udmy+w4c+hHTnvk8Qu4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3T2O4Ijc9H4WWyOaNOwQpdgN76jVGlGIXpTHZ87ZIr15Ba8Vx/JNY98jNEBZJeC80osVPnuP8ItdXOad+SRgEsD6BIAd5ecAevFqjSQ9XczcFbaSlKS+LkAZWJPltxF+lT/pHPXOK1uQYnDsR5Rm3VNDK+oXuOXwZr3EQXiqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k64PxZSU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778695362; x=1810231362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHZIz4hYTuSjsATQj/AJOW5Udmy+w4c+hHTnvk8Qu4E=;
  b=k64PxZSUT/YUq7idtq/qBkS+Zzd52fBT4/qi10Or95LymjyM2A/8/sko
   F5XlHdW3cg8Co2lYT1n3tcfCSpRvM50L4QXh7Ku4ZZntlz6D9rvPbqH2d
   RpMce52WS2JGFInz6V+LdwpqHkbvZb2c4U/BuuGoAN5Bwo+odRm6ZyPjq
   l6DVXRuCd8bLj2bZZ1w9CYllLe5lT9N5A/i0Ri0ccFNFrJWXOK7UE9Qnd
   k78De2FKZ+IZs/OCYJE147ZgBkQwYruItS5SIxVQinqIROjDIXrKg+VZG
   4fTGqiPWfEYQ2g3Yp0fq9tveSJNYiuMYMqr0ueNrYbgpVyeNvLX3LWife
   g==;
X-CSE-ConnectionGUID: T4527m1EQzWq5+m24kDrFA==
X-CSE-MsgGUID: 8IoziHZPRzeMCcKj7CipfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97201738"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97201738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:02:41 -0700
X-CSE-ConnectionGUID: uHI03tMxSxWaY8esQUwn2A==
X-CSE-MsgGUID: 4yUmGZg3Ra+2Wl66l+e5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="268488853"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:02:36 -0700
Date: Wed, 13 May 2026 21:02:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
Message-ID: <agS8udcvqgQmiqB4@ashevche-desk.local>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 60552538832
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36784-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

+Greg (I believe the trend is to drop such messages and not add them [back]?)

On Wed, May 13, 2026 at 09:44:18AM -0700, Alex Tran wrote:
> SCMI client drivers do not consistently log the number of supported
> entities discovered from firmware. This information is useful during
> debugging because it shows which domains or resources were exposed by
> firmware during probe.
> 
> Add logging of the number of supported entities to the SCMI cpufreq,
> pinctrl, reset, hwmon, and powercap client drivers after a successful
> probe. This aligns these drivers with the existing logging in the SCMI
> power and performance domain drivers.

-- 
With Best Regards,
Andy Shevchenko



