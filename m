Return-Path: <linux-gpio+bounces-10824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A899008C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B7DB285192
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 10:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C36B14A0B9;
	Fri,  4 Oct 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5JoM15+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180DB146A72
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036536; cv=none; b=amrLSAWxBQP+qfbScjf0LPQO4GrDrcg1wzHNsIcM+oz35xm1Rv1Y7PJgV7QjjYBl48j37us7xpmgDBVNorZ/mCOktwfXwct3Ok5SeuHBIieRKsoiGhDeVgnq9Q8e7XUNWi3vwM2OIXBhvqLpI+8WV5B0iyuWksLpoZMGW/6lMx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036536; c=relaxed/simple;
	bh=vRVs9ZwJ5kPErNpUu5wj2GBI0XmTBdG16MrT61DaPyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9BZxj8DLGKmuwMiidXfZI6mSx8PhArgcgEN962RKYkLpJgHjjWr7TZKJ1E69HnNANU6BcVD6rP+p1D/MV8y2RXiYK7LhYeUohRDZ2qcEqJRyhvkWclKVtXPXIy/NqL/J30ESj+w/HHIAbEfriIufi9zG4cWUDLoHF3RoWVych0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5JoM15+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728036535; x=1759572535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vRVs9ZwJ5kPErNpUu5wj2GBI0XmTBdG16MrT61DaPyI=;
  b=O5JoM15+oUzAHQ62uSW18Wx3R9Eu6K2G7OilbQnGQeythIE8zRIfa45L
   7TZYCAyrDTH2pFgm2xSwmlxDy9vyZWslRDkh5iM1GotWLmXhume0WVACo
   z+6u1EVvjTYvZFDDXIN+Cml32mxO7aKVC/lM5KqG+a4QxuoEC9SQKKiHp
   UDb6B0ohCIRqieiPeMdFUjON8ML50moy9gOSaTOtbdrUjlCuVunMV6YPc
   A+/UaBWdQOz5Ng73+4TFDUYOa+ZRCAucK5y3z/5PLEUZTvKh6krAsUB6c
   j9cbRkRw0v7x/NO4GgEdwpEDzkN/TEYjEltgFC33cMSN4jtEttGdWSGMw
   g==;
X-CSE-ConnectionGUID: gw7jazBDSoCt/weOek3lug==
X-CSE-MsgGUID: ELJMGt2wQheidutZf7xifA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38389074"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="38389074"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:08:54 -0700
X-CSE-ConnectionGUID: 02P2b3YuTXyok5+SxChFwA==
X-CSE-MsgGUID: 59yodGdrR22q4TdwnBkh0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="78658321"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:08:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D0C511F727;
	Fri,  4 Oct 2024 13:08:50 +0300 (EEST)
Date: Fri, 4 Oct 2024 10:08:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/51] gpio: Switch to __pm_runtime_put_autosuspend()
Message-ID: <Zv--slwrimdSIUwm@kekkonen.localdomain>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094112.113487-1-sakari.ailus@linux.intel.com>
 <CAMRc=Mfx+OagrGPkMw2LFu_Yzu4cpDnCQPVA3C3rJarCBGE_bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfx+OagrGPkMw2LFu_Yzu4cpDnCQPVA3C3rJarCBGE_bw@mail.gmail.com>

Hi Bart,

On Fri, Oct 04, 2024 at 11:55:01AM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 4, 2024 at 11:41 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > pm_runtime_put_autosuspend() will soon be changed to include a call to
> > pm_runtime_mark_last_busy(). This patch switches the current users to
> > __pm_runtime_put_autosuspend() which will continue to have the
> > functionality of old pm_runtime_put_autosuspend().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> 
> Sakari,
> 
> You didn't Cc me on the cover letter, please do it next time whenever
> you post such a big series.

I thought of that but it would have included 120 more recipients. That
wouldn't make it through to most lists.

> 
> I got the cover letter from lore but it doesn't explain how this will
> be merged, are there prerequisites earlier in the series? Or are the
> patches independent? If the latter, why not send them separately
> targeting individual subsystems?

This patch can be merged independently and my intention was the tree
maintainers could pick them.

-- 
Kind regards,

Sakari Ailus

