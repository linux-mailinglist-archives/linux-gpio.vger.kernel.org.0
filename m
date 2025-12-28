Return-Path: <linux-gpio+bounces-29964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F0CE5508
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 902EE300818C
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 17:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8825F21ABC9;
	Sun, 28 Dec 2025 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChVmEDKM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F11DFF7;
	Sun, 28 Dec 2025 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766943845; cv=none; b=f9D4hM7vk+CwUvuXxgozYHbnReG59LgTwu1Xt22Fl9mf79lAcHpp93eAViyCrvKuZTniNBrXFRIehlEWTnkT6C8yUNpVY3MOmSF8ip1zGKZrxd00rqubc5F1FFab3qNVY1nkaRrnUyss3bU22dt3ZTVEPkhTzn7a7RCzy66lX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766943845; c=relaxed/simple;
	bh=ZH9RS7z2atif6YeuzoEh7zNzqzBmccj8ujvgtviX7tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9bsZYoKr61EbazuQEzWtV7ybi1ZWh7TdMVnAaJbX7pRmbzTd7LyQX7J77S8DEeMd6XCef86gOWOPUZtKe2hFMhr84prI/TLWaaVUsE8WyyoIbikt8cO8Z4IF57QEc8ehqhkVnGT/vpSCYmXTVQJE0vSOGrV+dULUu50mvXf2QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChVmEDKM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766943843; x=1798479843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZH9RS7z2atif6YeuzoEh7zNzqzBmccj8ujvgtviX7tc=;
  b=ChVmEDKMzTxoPCs+8kc1duwZXwToLpWuTwW4tElGF60cjO5xIWlq5T8y
   Ym1elrnY3MPlCZXnlPnpYgPQUHWXVU9kNG5gDMLDjeS5ZZAOam8Wm/4mL
   /YIONfeHeZNMOuogWrf9pCt9Due+ibtOB7/TkNdOaa3nmIkT3lno5wv6s
   lo/Itx0k5+JV+wN4kVkWYmYEmgvQEOJlVVg+7WbPie2lj73W6mfT6nqst
   gH86iXl70suIGMTQoGG2mxcSxUOT6An9SXDiEops1OmVv+PxgDUYUcL8f
   cy9d970vGUwXeChq98Ut9JcmI1f4JDhVVBmxje14Hw3t53b51ivptDERG
   w==;
X-CSE-ConnectionGUID: qv9UkCUCQ6mXc1x+Qve+fA==
X-CSE-MsgGUID: XXzaXweKTSWlzPid/1Y2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68470178"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="68470178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:44:03 -0800
X-CSE-ConnectionGUID: 7RV5eGmRQNyFg9SObzkiDg==
X-CSE-MsgGUID: lS799vH/QseljKjRJ0MGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="231420028"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:44:00 -0800
Date: Sun, 28 Dec 2025 19:43:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: compare the "undefined" swnode by its
 address, not name
Message-ID: <aVFsXuSacKr483W8@smile.fi.intel.com>
References: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 15, 2025 at 04:46:24PM +0100, Bartosz Golaszewski wrote:
> We know the address of the underlying remote software node referenced by
> the GPIO property (if it is a software node). We don't need to compare
> its name, we can compare its address which is more precise anyway.

...

> -const struct software_node swnode_gpio_undefined = {
> -	.name = GPIOLIB_SWNODE_UNDEFINED_NAME,
> -};
> +const struct software_node swnode_gpio_undefined = { };

This will remove the name from sysfs, which may be informative.

-- 
With Best Regards,
Andy Shevchenko



