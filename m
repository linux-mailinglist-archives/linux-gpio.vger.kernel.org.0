Return-Path: <linux-gpio+bounces-9686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E396A425
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAE3D1F211EE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B15518BBB1;
	Tue,  3 Sep 2024 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D49gqtMh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1572618B499;
	Tue,  3 Sep 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725380467; cv=none; b=i2cWl8GiKzeDYSY7N5QsEf4MLrX9lxgXXNIJDsX5d+6D5xx5cJewEqLTGmMjPArOfW3dnohL5PWso4R1tk6cxcNmmB2NLEv142gC9fAS5HjcKAFOH06Nz3u1t3CBgJJplLB8p2VgX54/JmgWrulp47ocJhBiaKR77exST92tGyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725380467; c=relaxed/simple;
	bh=ob6EmkUy93WfbYLEB5n+UNyuqj290xfoUL8zt6t2aEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRgOc5UZ7H2R+e1OFRZUO0wy94yoJp/Go9iQ3OQI58rTa22MDfi8bSc2b6iJBbpRAVkDMMRP6crgIf6TtfSBGqVgHJqvWjXJYH4h48efKq+ZwEPMGx+Fo+84xi7tGThSSTPruWe2w8O8T4xwHJJNdrJL6xVWysFySGw8e+dMSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D49gqtMh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725380462; x=1756916462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ob6EmkUy93WfbYLEB5n+UNyuqj290xfoUL8zt6t2aEg=;
  b=D49gqtMhKv0UzeB4SL/zhQp9LLEuBGIrJC4wkYHPZFe+g4q4rilXzTEj
   lCMWRqGrW/itVUCyST0MGyWwm3k4WDcdkJ5eioAm77rYHelz8bQKzfk/O
   7YHAmgiH0FwBuFJhzMlDO8gH1SxizYtIye8RpOHAZFR6CTk8pF1gOnqU4
   CPBy4IgSqR1bL1JYox1aHIgmmYD/pmdTmxzmJb7tnpi6MDA/SvAXBjjbB
   bxldhuTqs+1N+DOc6pUoaKINbPmirH5PRZHmMewTd8LuScyGpYu1oFCNO
   VYrh8F4N1cPg7y1RXvG0+hXhRRadh5wUUzekVhrbjaeMpZmByxWYlVwei
   Q==;
X-CSE-ConnectionGUID: fYo6O+GWSFWGhxHhydqpNg==
X-CSE-MsgGUID: +tiGiNzOSbKtULhrjCqE0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46519769"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="46519769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:21:02 -0700
X-CSE-ConnectionGUID: iSa+5TsdQ9+lYnm1DGEugw==
X-CSE-MsgGUID: kBdBgZ4/Roi+MPXQFWVGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64953734"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:21:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slWH3-00000004lci-10lA;
	Tue, 03 Sep 2024 19:20:57 +0300
Date: Tue, 3 Sep 2024 19:20:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Martyn Welch <martyn.welch@collabora.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: order headers alphabetically
Message-ID: <Ztc3aV2HM8eS3hC7@smile.fi.intel.com>
References: <20240903154533.101258-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903154533.101258-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 05:45:32PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Cleanup the includes by putting them in alphabetical order.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



