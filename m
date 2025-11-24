Return-Path: <linux-gpio+bounces-29003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4EC7F4AD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 08:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C36E3472B6
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 07:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA502EAB61;
	Mon, 24 Nov 2025 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIXEcrmx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165427FB26;
	Mon, 24 Nov 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971014; cv=none; b=fcKul1DikECaiWA6cahLvn2OPeDNce3KmTW+885CJvdmYTLl/kPcW+jtsb8ET4fYAMdnYAsQGOlkIkvjnJqtKtspS+NMAWC3oRKwUAmu646zaVNkHE1KILdyPJi0LoKdqAAmhRjOS2P8UqR9KyGmmooYE9hazJ5XdKuRIuIupIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971014; c=relaxed/simple;
	bh=tag5WWq9S7SPszT6Zz3f2Cr546F5LfXLjdu3U4ffTkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6WFbmVF7v7zSigbBsKb6w8prqTQquzO5dC7AEc9RxX04t29kTLveN56EfLEZ5xwjSRDW+YUi9Nt8Xtf8mPVZyggFYGta6I+yA5b9dNRk3uXpV344+hwXjDdUS7+fFNxNEJsIMeWOObfCn0I9fliAemDuxCctRslfj/wxbvy5sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIXEcrmx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763971013; x=1795507013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tag5WWq9S7SPszT6Zz3f2Cr546F5LfXLjdu3U4ffTkM=;
  b=iIXEcrmxl+gJkwF67NBM/TTtkjm2gf25ZxgAYcD7N/Nz9Pz8O3brQ3w0
   uaWvgmcqXrzbdEs0YpgSSmy6qKpKvixAzVIliUQ06z6ZumCxJWGqofhLW
   rEMsuQi5Gvvy77iYTuTVOxw1qwQYd5WFCf4NOqLmiDiazR7aIRN3nbEt0
   wMzzph+Rx6cNVs/CmQk8qZfvdwTUi+VMTnznpschgXmTLvVp2QgeNDemo
   evByLCqocGI3v+5YHjpfMz1NlgvkXBPgTZe4rmj2I80ijw4LJ2tqLro6C
   dfUOZZgr/aZHk/HumutugWhvwMFv437dTqyxKDl7nf6K9otI4nxcd/3po
   g==;
X-CSE-ConnectionGUID: QEjlFXrSQc2q0xE0DBQs5Q==
X-CSE-MsgGUID: mw1n5Z8PRQWl2x6wORaxYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="68556010"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="68556010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:56:53 -0800
X-CSE-ConnectionGUID: 4OOqYPnnS3OqJfmrGhYYag==
X-CSE-MsgGUID: ecXLDAJVRK2ypiKkSpaPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191430148"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:56:51 -0800
Date: Mon, 24 Nov 2025 09:56:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael =?iso-8859-1?Q?B=FCsch?= <mb@bues.ch>
Subject: Re: [PATCH v2] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Message-ID: <aSQPwEJhsUxuDAmH@smile.fi.intel.com>
References: <20251124003206.25618-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124003206.25618-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 08:32:06AM +0800, Jisheng Zhang wrote:
> Fold dwapb_context into struct dwapb_gpio_port to further simplify
> the code. Sure this brings a tiny 36 bytes data overhead for
> !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
> GPIO port number is 6(the berlin2q soc family), so this means we will
> waste 216 bytes memory in total which is trivial compared to the
> system memory.
> 
> From another side, as Michael mentioned:
> "The driver currently allocates the struct with kzalloc and stores a
> pointer to it in case of PM=y.
> So this probably has an overhead in the same order of magnitude
> (pointer + malloc overhead/alignment/fragmentation) in case of PM=y
> now."
> 
> So let's Fold dwapb_context into struct dwapb_gpio_port.

Fold --> fold

Given more thinking on this, I believe the approach with kmalloc() is
preferable, but what should be done is

- making context a global variable
- considering allocation for all ports at once

If this is done, the embedded approach will look less efficient.
So, please try that one instead.

-- 
With Best Regards,
Andy Shevchenko



