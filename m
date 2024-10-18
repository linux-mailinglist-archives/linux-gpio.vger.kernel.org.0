Return-Path: <linux-gpio+bounces-11640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1308D9A4047
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF22A1F2668D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3FFB667;
	Fri, 18 Oct 2024 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew2iD+gs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31E1D95B5;
	Fri, 18 Oct 2024 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259074; cv=none; b=Q2Bhag+TxZpPCNYJYJJFH37Y55cxOysuS9ZZdBeqA9Ph0wZ4Lbxl9cnULbWz4ISi9s+sVMLeMBYVCTHDc65sVqWQbHwpdg1KpFRIn3lO5HnzmxXWV1ThUUnUZL2V0gYRYcOCVouaes9iHnc1fdUB561qZJu8YZ9nXlJ5P/jsfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259074; c=relaxed/simple;
	bh=7FJz9go6NmDrdGqWGJYOcGvUN9zYPmW5q3YnQ1vjR/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIgxxzC4guAWgIIuD4ablMd1KNkcrjjMicam4aHM4E1/6R1RXs+ZVwvorYnXn5W1iTrWvb1JR6chWzKD9RnhLTRE+Ku+Q7q2wg1EEAVGA2y4AEFHJty1yJ+TVjZZjiGmRwVn0PsHJwZRdIoOt0DVMFAzmAvi5qk0iallJu8gU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew2iD+gs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729259072; x=1760795072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7FJz9go6NmDrdGqWGJYOcGvUN9zYPmW5q3YnQ1vjR/I=;
  b=ew2iD+gsR6BRwhIKjI24eInZ4EZsPd74o5KCrQikYgOyWCQmGG4Z019A
   LI8EIrOK8nJk05wl5vW0s1kpQDk4OO/PlfctXvIP8qdrXIHhOmyCCtRhs
   qVrL4YeUKKoBACP2O6le1210sLxv8+xz7gVgv9kZ5mWiz8AFw/tE4LW7T
   txjxxLzWO91xD3pzPvmbeuJ9cs9m2H+EXJFaT6SPIMeE+7HzA2PctZPAG
   +trhbefZzKEZ9KFTVU5smaiq2N2KVVjJnpbVBeyDdf9ZQnCeLFWXxkb9F
   fAqj3hDfm85agUEPAhYVcrW7FJ+AY1RIu/DmVivGJxUr6eVChSfAYlcQp
   A==;
X-CSE-ConnectionGUID: eeUYQLuYRkS+S7iosTa4Fw==
X-CSE-MsgGUID: SA5/MpiNSpKjTCKK1B4lsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28668869"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28668869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:44:32 -0700
X-CSE-ConnectionGUID: YjqSYosrTx+AFDfZaWoROw==
X-CSE-MsgGUID: X/4xZGt5SKegZ3VIVbIstg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="109698128"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:44:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1nHH-00000004Tvm-0gsm;
	Fri, 18 Oct 2024 16:44:27 +0300
Date: Fri, 18 Oct 2024 16:44:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/4] gpio: xgene-sb: Improve ACPI and property related
 code
Message-ID: <ZxJmOjvQAKUc0_4A@smile.fi.intel.com>
References: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 18, 2024 at 04:32:31PM +0300, Andy Shevchenko wrote:
> Improve ACPI and property related code in the driver.
> 
> Andy Shevchenko (4):
>   gpio: xgene-sb: Remove unneeded definitions for properties

>   gpio: xgene-sb: don't use "proxy" headers

Ah, patch order is wrong (we will see CIs are not being happy),
the above should be the last one.

>   gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
>   gpio: xgene-sb: Tidy up ACPI and OF ID tables

-- 
With Best Regards,
Andy Shevchenko



