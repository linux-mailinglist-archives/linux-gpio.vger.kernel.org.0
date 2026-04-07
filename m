Return-Path: <linux-gpio+bounces-34782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELUMAY731GlszQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:24:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD483AE49B
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AA27300CA02
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BA43B38AF;
	Tue,  7 Apr 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP20bL8l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B43A3831;
	Tue,  7 Apr 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564681; cv=none; b=Subv2QE685CkzntzB8/CnnJf0ucGZOKloh0iGCYpWs3OGaPX2dMo9AHVPqTO+hkw5Sbmn/wdawJL8zYcQB728kwswyW9OWydNtnV+jvE+z7ZW3m1QnLUufbGcgOeQZG5kpC0kqNzN1bJ3PULz/xSMlD5F2zc0vyUkvGHiifSCk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564681; c=relaxed/simple;
	bh=7vUEmXCiBvW5Q7MjYbPq7XgplXmNVer9sQSwSRnDVAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rmkd3L7jt/9D3yBrDlry0BXu7A8wayuWerkklT+aY5JZGF/31+h2kZ75PX4AY/Zm7J6BWN7KToUQEY/UlphodaiG6So2oEsE6RYVxlxxdJJ52l9dVS5K7RLKbNrcLOpDSwwkUMQoMQQay6YVsIKKxN5JwpX2PB20pBTtUB3onvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP20bL8l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564680; x=1807100680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7vUEmXCiBvW5Q7MjYbPq7XgplXmNVer9sQSwSRnDVAo=;
  b=DP20bL8lmqg7UiQggKwxE0uHvCOauw+IHNJYrXnGFUjegDftJKs5xQpQ
   k1MF32hQ4xTM7ktqS7hABzYuoAXV6T5GzBkrVJwQgXXnyFyWbyURsdqPs
   4bX3EZL/c7Nk3McZpC750hT06C18Z+s1YLQieROTr1rPFCTQkHg0N7xrC
   2zLSFsFYfA33sN0eGcmvtxUwtoqiYuKOpG9dJLWl2j39ZAn6rrUMH4mFH
   JR06cuqBterXw9x6TsHXCvDbruGBqmJ4bc6J4E4at2pTT/BcfCzbybF6R
   bWz2cAm/PAUzJOnq616Da1v9x/6hzYmpsWgO5eKQq5RZK3usTkBoovv0q
   w==;
X-CSE-ConnectionGUID: cEb4zXEIQQS4HDk4o4PBnw==
X-CSE-MsgGUID: /G7AQkRZQ8+mOUQKF/9f4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75698564"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="75698564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:24:39 -0700
X-CSE-ConnectionGUID: d81mAbAvQ/GjL3OQM7tAUQ==
X-CSE-MsgGUID: qQd4DCSgTAW144Bi5AtkNw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:24:36 -0700
Date: Tue, 7 Apr 2026 15:24:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
Message-ID: <adT3gs3H38bbj40L@ashevche-desk.local>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34782-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9AD483AE49B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 09:39:22PM -0700, Dmitry Torokhov wrote:
> The original reason for this series is to make sure ti_ads7950_get()
> returns result in range [0, 1] or a negative error code to comply with
> gpiolib requirement.
> 
> During review David noticed the fact that the function also clobbers
> gpio state. Fixing that lead to adding cleanups using guard() and devm.

Now the series LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Thanks.

-- 
With Best Regards,
Andy Shevchenko



