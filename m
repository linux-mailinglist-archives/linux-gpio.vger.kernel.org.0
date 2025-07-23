Return-Path: <linux-gpio+bounces-23699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED8B0F511
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 16:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1006AAC0721
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 14:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D992E54D9;
	Wed, 23 Jul 2025 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtRH3XXW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23BE18C034;
	Wed, 23 Jul 2025 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280248; cv=none; b=Bg9uP7qBXf+rZb6VevyQdV5osun3puJVZDIZ1J7kaGrJiw4CJ1zsKUuJdD5sm+nBKiZb0IC7Y101CL6pj/aLWi7s8COBIX8Fg++HuVS4O3Y4H9hal3xFYOTcTZ++0cbmmLgeXrYmaq6D35fe3ZghfhgZKARoV9ZaItw6hC4KxAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280248; c=relaxed/simple;
	bh=29LVle+wSRNguORIKu4VAfjYQUrr6xiqipG3iOASr/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6l3oDAH+8Ef9JaN8mevzhKFZJzB3MpxVHET0gS+QMOOwVWm+ZLKzjcy/rfaeG41ouCKeciG9WFEnApUU1d2GRQrd20hUNgi/AMUeRcUVtag0tZdd1++3Yk8YK6gF7sO2n2CZU4At8d0WaTaG4xGN0RV/JcUvsM2uI682mGhjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtRH3XXW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753280247; x=1784816247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=29LVle+wSRNguORIKu4VAfjYQUrr6xiqipG3iOASr/o=;
  b=WtRH3XXWzGU7DQ4a994KqSmqfUH1QdvxGtxRk8SA7uDOB5shI5Pk6DH4
   UKBHWgbhghUsHQiD+BMsHMpqmcOaMeO1eMUZ80zuKgIDJ4VeC5X8joRWJ
   qhjCK10dk5HNtC7i1VQMrksWvH0AfFGQ1HSYBEueSXq8AL/8zYGY5AaQH
   aXy34OJGXQx27C1QJNK2cgajPo5vBbrCFLEhCT0AkpptL5Ip6zKsSpEVs
   3psLKd5SHEx+c6KioW03D4wY6GHo4/WivmqTNMJHcol+flg7VPASYKD4L
   8htk1dogmq0XT65KYHFfAYpq83upUQ52wUtMaqMPZyW4+3XkKoz05VyQs
   w==;
X-CSE-ConnectionGUID: lP34U+inRXWkCX3AIL73PA==
X-CSE-MsgGUID: Pg+3L5NZSJm7f6kkVjWeiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59222750"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="59222750"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:17:27 -0700
X-CSE-ConnectionGUID: 0oCgyZXZTRqPGy0rk+oSIA==
X-CSE-MsgGUID: 7loGisEJSV+sVi1kSoChfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159844458"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:17:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ueaHY-00000000JJQ-1QvF;
	Wed, 23 Jul 2025 17:17:20 +0300
Date: Wed, 23 Jul 2025 17:17:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: make legacy interfaces optional
Message-ID: <aIDu8McZRsk8xspV@smile.fi.intel.com>
References: <20250722153634.3683927-1-arnd@kernel.org>
 <CAMRc=Mejnr8UzN93X=CWcV5jDTt9-U+Nxcm3qb=6uVV0PMiZVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mejnr8UzN93X=CWcV5jDTt9-U+Nxcm3qb=6uVV0PMiZVQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 23, 2025 at 10:39:32AM +0200, Bartosz Golaszewski wrote:
> On Tue, Jul 22, 2025 at 5:36 PM Arnd Bergmann <arnd@kernel.org> wrote:

...

> > +#ifdef CONFIG_GPIOLIB
> > +#include <linux/gpio/consumer.h>
> 
> I want to queue this ASAP but do we really need this guard here?
> consumer.h already guards against !CONFIG_GPIOLIB internally, right?

I probably missed something, but I do not understand why we need this include
at all in the gpio.h.

> > +#endif


-- 
With Best Regards,
Andy Shevchenko



