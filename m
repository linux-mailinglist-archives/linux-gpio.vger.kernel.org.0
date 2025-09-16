Return-Path: <linux-gpio+bounces-26203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A474B594E9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 13:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 621507A4F23
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77B725B30D;
	Tue, 16 Sep 2025 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmDlNVlV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246F722F01
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021428; cv=none; b=mx/mNlsrJsk9Mw/l/dODmzWHyVXpZdT/TOCbJ1Mb+dItmO8244XHd5Tg4QRDg92jtEru7zIkqjOvOLbW/aRVGPfBX5PRu3yIYFvi1IMj6Xli7B5SBETpe41x0epLXFjVDZZzILTMYKC7SXMBX81Enz7nHEZhQYVuGHNIMeux/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021428; c=relaxed/simple;
	bh=T2yMebB1xRdjx+H9AJIx7ALGAez88KIaWVnRcewbVOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyP2kSTHutQ1xnZdG4/nY76Pm0t1k0hy1Kl8XjKERVKNBkKwGQdPagUgCdxfQxzka7XN591NYyNaquAgVigNkASiTxQqePa8rRE9tSdIGSzEp8Yh6fK2QTwchJpJBskU0zKbKUqrmVI0yCfFKJ6d8PNshO2/7BP1wgSah7gcg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmDlNVlV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758021427; x=1789557427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T2yMebB1xRdjx+H9AJIx7ALGAez88KIaWVnRcewbVOY=;
  b=mmDlNVlVkPIbzVVruz32PMlqpNAyLGJ5BhqeFGTD0nfH8c3J6GXxts3I
   ypSn5+0jZWxFPcNHdflMS1j7aocyTX5iQQQ+LOIjfqHb9p9XPyevAuozC
   H4K+lZUiEeorLaIV4K6by0n+/Tkk8d3BAmcahHtaVrKFgkib1JvctpgwB
   TfkIHD4SuFI58VDgqCQhwCa10I7ssSMMQAeq15foCLQj9HLSd5kOtw9kn
   mz8W33+K5FtdfFmaqqi6ZP0kNFA59z7iNGKp1CV6hFeiSZUswFzJKIjXn
   QQyAgDVJFL//hk0LvB43OZu3jJ8/7vrvSbc+MSiiQ+SnK1b/nIa8CNTiO
   g==;
X-CSE-ConnectionGUID: RTzUcQOtRRyVlHaehFso/A==
X-CSE-MsgGUID: EDiLrOuMT82akPQxfrpFFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60166683"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="60166683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 04:17:07 -0700
X-CSE-ConnectionGUID: 0lFVVd4pQkG7uTLcARMmyA==
X-CSE-MsgGUID: pBSkb6kRRn24tfJZpbtynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174028293"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 04:17:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyTgF-00000003Vcd-10je;
	Tue, 16 Sep 2025 14:17:03 +0300
Date: Tue, 16 Sep 2025 14:17:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] intel-gpio for 6.17-1
Message-ID: <aMlHLwC-1nuc_JW8@smile.fi.intel.com>
References: <aMgy0K-jpmegAp-d@black.igk.intel.com>
 <CAMRc=Mc5eYN3=mWAkjwkS+-qfBpsVM3v1vP9v+eFk+-Fs1oKpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc5eYN3=mWAkjwkS+-qfBpsVM3v1vP9v+eFk+-Fs1oKpw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 16, 2025 at 02:39:45AM -0700, Bartosz Golaszewski wrote:
> On Mon, 15 Sep 2025 17:37:52 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:

My takeaway from the discussion between Linus and Darren Hart [1] is that
if you do automatic `git log`, mention it clearly. Do you read it differently?

Note, PDx86 does this for ages and since than (see [1], it was 2017) Linus has
no complains over Hans', Ilpo's and my PRs.

> Just a nit for the future: please don't do "automated gitlogs" etc. Linus T
> is known to frown upon such things and you're also duplicating the info you
> already put into the tag. Just manually summarize the changes this PR brings
> in.

[1]: https://lore.kernel.org/lkml/20171118180910.qzbuh4donbwrxbyg@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko



