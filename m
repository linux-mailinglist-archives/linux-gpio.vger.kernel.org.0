Return-Path: <linux-gpio+bounces-13005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63E9C8C66
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A6F1B2E6A7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 13:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F081DFE8;
	Thu, 14 Nov 2024 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H08tIFnA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B87D17C8B;
	Thu, 14 Nov 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592213; cv=none; b=DZvm9C1JETF98Gge8ZlfoCFHogdE+VEl167QpMR0PEdV6G7c+Gl0LTC1gc7xLoF/kF+o/i/0Lr5H+oIaBOZofCZyiystlhZq4NrJBXgFnsr7EgcLDz2Qqs+idMDI+gff8Yyc0ebB0jrsyCaKiGvBhKZKdTkv2vZAgADlpNgY7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592213; c=relaxed/simple;
	bh=RxFq6bYjSC95SEdvaMlXM31AEtsd7ZEogKLttu9p5dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+eHVgJXPZo0u6jn8LZ2+VLa8mp+4gkJR3x0I4q+hozysInBtTNWuqPBQxnJW6lxLi2eDXXZ129jA9RYYGZkxfp1VHpm6/pe7CiP9Om6PWBXZqKf9RJ163ZOC+yYPzfyeahMnx28fBv+Kw/FZgsl6TDoMMG2BIq7HXkHKalzwdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H08tIFnA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731592212; x=1763128212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RxFq6bYjSC95SEdvaMlXM31AEtsd7ZEogKLttu9p5dM=;
  b=H08tIFnArnRWl4TmrvoqpeAa6ul9RzNoalInMa48hiUh2uOEmfLGj4N9
   UnSsev+LOxfg+yZholTx4ZYORE+hiVDK17oqJPHa036fPji2a5UDlRIto
   45f03DP1Nf4a0Oe772jvn66LivLz9zfL16tnukxzsyPMihI7o0l8LSAXn
   Fgu7BTECSUua8OvonHhy3CXZnnziNRuGj+TMGDymQd7f6JZs4/QHD2Kfs
   /KQYthHCwfCug88Akc5z9KE9D2TH5ooWEeZ9SekDZlL6YfA/Pw8ykfX7A
   k0dmPf/bdkqU++GkWkpqYBCWqfnuHKZX5sHMyvbZJmFq3jvOV/zh4NnJS
   Q==;
X-CSE-ConnectionGUID: eHjTXNaNQZevHSHZ3SA5fQ==
X-CSE-MsgGUID: 40DMI41kToeIZ9Sds4vprg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42158949"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="42158949"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 05:50:10 -0800
X-CSE-ConnectionGUID: uSzprHoUSGOcIj4vMWD/mg==
X-CSE-MsgGUID: cOMhJ5kAQ3ucIjbtCIcFUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="88599940"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 05:50:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBaEY-0000000Ejne-1oUB;
	Thu, 14 Nov 2024 15:50:06 +0200
Date: Thu, 14 Nov 2024 15:50:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
Message-ID: <ZzYADpZgTyQN_NDo@smile.fi.intel.com>
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com>
 <ZzXTbEcrLigXWpAu@smile.fi.intel.com>
 <CAMRc=MeEtyTXr6A4gXbbN=ZY1tzAQnbVMF0NYA2_6Xm3=jfS6Q@mail.gmail.com>
 <ZzXhf2zM9IisvZhs@smile.fi.intel.com>
 <CAMRc=Mdo2DysJRPvJRU9RwTCH8nmw_CFRYYoLfvfC8+j0K9roA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdo2DysJRPvJRU9RwTCH8nmw_CFRYYoLfvfC8+j0K9roA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 14, 2024 at 01:59:19PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 14, 2024 at 12:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> You know what? How about just reordering Kconfig entries
> alphabetically for this merge window and next release cycle we can
> decide on what to do about Kconfig consistency?

I think I expended time for this patch. Consider it as a report and proceed
how you think is the best, Thanks!

-- 
With Best Regards,
Andy Shevchenko



