Return-Path: <linux-gpio+bounces-36786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PZ2IzO+BGoBNgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 20:08:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 298395389A3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 20:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47198300B98E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979934DC539;
	Wed, 13 May 2026 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Utup4GxB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0419640FDBE;
	Wed, 13 May 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695607; cv=none; b=YSOdzu5vXVXPwRkCYN6E/W7jjSJeVqnG4T3irsu/fFrGyV4YLKz4ZXw9DWZQKFTIH9Tv/Q6F4gKxXQI3w9eAH3ZSa564z7DcNZUsK96uCKfvgGlO8vOJwOjyVwVFY8jo5XceE/4igeZCUJNwrX0sjrK8BIem+yNJHhXO5s87bpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695607; c=relaxed/simple;
	bh=ZBx/OcXX1kCL7sU4jKs+HFRKwNh+FG9VZnZXCN50i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkxCL6UW0iovz9lx5oz+e+5lDGr1kIjjRdSvarHigzoAp2hvYa8MBSfT3+Hyg38TeXUrzHkCqowo7XJU29ckTCZnk1wXDg6VL8LoSyGX1vOpkjaeg0Lv7KhNTlBfQhyHz/d521m+ne27lCVRzuIhbhoLsmCjrPnUZPAEwCLxs/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Utup4GxB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778695605; x=1810231605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBx/OcXX1kCL7sU4jKs+HFRKwNh+FG9VZnZXCN50i2Q=;
  b=Utup4GxBGvAM383Q5dojdKucpcZb+iO64corYjZGVEAGu+x1L1BBhxTe
   7Bi+24ZL9QAlJxqO7pTQJ4vC2rNlzkKopNpLENgu1XxeVcklGRHfS2GAh
   ZFORfFFqgy07kCJUigCBhoqBuXrVMx+76G+JpBFKZ2awpanWoq217PKQu
   UePQ5qgNE3UboPXeseMLbCP6sHRUptMGfSTqHTGy2oCs70d9KupXbwwxF
   My2p3MMUoz/15YkTuffRhfExsjjCcvVEUTE0bxWeW+sL6x520QLPP2TuN
   sMpr0Pur4p3zQ5s9tsPR01NFIj30FjXCecA+YshGWv0hz+jp4Dg2MFeY0
   Q==;
X-CSE-ConnectionGUID: D3LbzfmFSbi5xdFMRITjtQ==
X-CSE-MsgGUID: fLG9NCncTsCXnVjPDiav5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67162820"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="67162820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:06:43 -0700
X-CSE-ConnectionGUID: 9sRVOiwXRlWuIgJYFKtNwQ==
X-CSE-MsgGUID: 3KoQB6heSr2BoG8A6UjFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243130244"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:06:38 -0700
Date: Wed, 13 May 2026 21:06:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 5/5] pinctrl: pinctrl-scmi: Log number of pins,
 groups, functions
Message-ID: <agS9rD_EUTv2pyjQ@ashevche-desk.local>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 298395389A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36786-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:16:58AM -0700, Alex Tran wrote:
> The SCMI pinctrl driver does not currently log the number of pins,
> groups, and functions discovered from firmware. This information is
> useful for confirming the firmware exposed pinctrl resources during
> debugging.
> 
> Log these counts after a successful probe to align with the existing
> SCMI client driver logging pattern.

NAK. Even for debug level. This can be easily derived from debugfs.

-- 
With Best Regards,
Andy Shevchenko



