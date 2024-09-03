Return-Path: <linux-gpio+bounces-9681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B5596A39E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29FC1B26DF0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DD518A6DE;
	Tue,  3 Sep 2024 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKJc6pBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA2405C9;
	Tue,  3 Sep 2024 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379632; cv=none; b=E4tZuO/E/XWib1wpCuhzVRTUx5vc3+FjuBLvXWxNOdL7/46Fy20uiAkuRxJlSbZxzL/yw7W9PFTT3nqKvGsrxh/OW5IomRDctHzfZqOoV791P3o9rpjNMBlbj+9gxxhfaQ44CVGArP0X3D0HRDy+zRDxwzw+NNpvp525JFSed7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379632; c=relaxed/simple;
	bh=jcwL3wXQmF/0n6wIcun46qKYmsnJHtE2TCTE9mp4RGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma1cKA4vbYrPajkhtvWPxnvB353EYoBYXhggya8i4Z3KJ3voIc86Zh+sQ4nc7iiJm6BHwnF9BZxTkg9gNd64FYlxoQd2B+jjDpv9NgDYFIdGDwA0f5xOhnJVXDKPHu080i3qnQl9c4PiJywHjDRjglLHqbtujb3gsKxBs2jiRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKJc6pBt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379631; x=1756915631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jcwL3wXQmF/0n6wIcun46qKYmsnJHtE2TCTE9mp4RGU=;
  b=YKJc6pBt5EZdm4eec8A/uNOJ7QL84jY2wfWC5P4FGnyil/Pan45kqMeH
   6ncxp9QCKp1dzE+17eHYoIMEpW580dWmLnYfrauycW56Rk/EbUBfxrGwS
   aCDOX1dMMSn8k/uATcMgIbFptqXBDeIJbGtc39Aa0OKv/SFerg7pMdHBG
   eGqj5L2PMiJwRE3rlkfIsrx3X0BFyLE/cI7izCKZWwfOUDkT64ivIRyLQ
   Srv8EGKnHQ+RVOLz7fUNQWTNtd37P6drYLbaUydG4RJUftEwk+6LOpByc
   0uo7bUXohxeMlpzd4826cyLHzzScf1/JZYXv8nLIdVpDU9JX+bnhZKJXL
   g==;
X-CSE-ConnectionGUID: 61weAr33SuSOOeW4eeVRnA==
X-CSE-MsgGUID: 03ZE0m/NRcK+bMzMjDnibg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46516601"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="46516601"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:07:10 -0700
X-CSE-ConnectionGUID: iEc3CUm7QImXojrv9JBSRA==
X-CSE-MsgGUID: ydNiDzDwTJevfd7p22mbwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69819978"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:07:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slW3c-00000004lO5-1FEs;
	Tue, 03 Sep 2024 19:07:04 +0300
Date: Tue, 3 Sep 2024 19:07:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 10/12] gpio: rockchip: support new version gpio
Message-ID: <Ztc0KNxleCCroE2C@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-11-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-11-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:47PM +0800, Ye Zhang wrote:
> The next version gpio controller on SoCs like rk3576 which support four

GPIO

> OS operation and four interrupts

operations ?

Also missing period at the end.

...

What does this all mean?

-- 
With Best Regards,
Andy Shevchenko



