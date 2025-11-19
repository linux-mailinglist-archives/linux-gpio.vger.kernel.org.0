Return-Path: <linux-gpio+bounces-28738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0CC6DAF2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 10:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76DE04FC610
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B403358DE;
	Wed, 19 Nov 2025 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENeBLE5s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B62E9ED6;
	Wed, 19 Nov 2025 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543472; cv=none; b=Qur2IQpsRK8pC93NPYhQCWPiZAOVhKCsdV4zGLxwz60Ipi5FjgF3hDLrpjPqZcSyVtWEv41UCQMsR+8hK8wR0x3F2A+aiWk3HnF4qSvz4zotqulbq9WX2JdEmzov5D/9Omrz7qjr7GKe9KxAlCI1cElp1mag0fYSyl+mSgztcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543472; c=relaxed/simple;
	bh=Q/1kVKdXBer7CmaZG7HzHlZfLUuG+in1nDAl3ME36c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARBBd3+ZuyXZsziEoY3LFQuYJPIDwqiy6k6QeAu2m6c3GScvFKQGSLKAZ1b0b99lNzg1NkjTvQ3AADf/8ne7Ofl1I552M0MebXMnrqqCk2ZUXTwYXSYna3WEGXHFZchACfHdq7EHiiXN+ZRM2m31Ug/gSf5nSqTyJezOGyqQZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENeBLE5s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763543471; x=1795079471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q/1kVKdXBer7CmaZG7HzHlZfLUuG+in1nDAl3ME36c4=;
  b=ENeBLE5sXTTrowUTzJj6bdB4jOcF/ERln8cZOQi+if6md369Czm1qL5s
   Urk1CjpRlzBoDlF93yIxUrtvqhLlDPhjgreq5doDjJWL1ZYpzaRIvUHsx
   mnqTL8bY5DxAIfbAgoKKz+rz7Lp+xdTmB8mzvWy3t2TLNszlHeqyp6z6i
   g5Id9yP5Wncbt5fleH2zzCJgZ/YB63zcgxiDjR+TmibXz2Utg2q4h3OS8
   +AsTpXzrjijMkLHEVty8+aKmMU2hXuqTBgTU5rgxVdNoaj/QyclFkHUMp
   eOpcQG7bBBOxRtg8hBFLfZhrjxVuj9jS1bjxazkc0QJVjVVt9NV0j4QgC
   g==;
X-CSE-ConnectionGUID: 0F8pNGOPTPqGQS+ocwkd1Q==
X-CSE-MsgGUID: +4hxV5nmRNO7NEf6w6g73A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76934018"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76934018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:11:10 -0800
X-CSE-ConnectionGUID: 5Ly7XDjhQa2aR/AZjQSkGA==
X-CSE-MsgGUID: o/QQkq09SsiWzDwC+CjFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190801433"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:11:08 -0800
Date: Wed, 19 Nov 2025 11:11:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
Message-ID: <aR2Jqrjb5dN9LeWq@smile.fi.intel.com>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me>
 <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
 <CAMRc=Mci_jEp-8TW9+hAyb=viMy69SXDSE99k0Rsss_0b7ZY1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mci_jEp-8TW9+hAyb=viMy69SXDSE99k0Rsss_0b7ZY1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 08:51:54AM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 18, 2025 at 7:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Nov 15, 2025 at 08:25:54AM +0700, Bagas Sanjaya wrote:
> > > On Wed, Nov 12, 2025 at 11:48:20PM +0100, Andy Shevchenko wrote:

...

> > > The rest LGTM.
> >
> > Thank your for looking into this.
> 
> Is there anything else to address or is it good to go?

I believe it's good to go, as per last Bagas' email (as I read it). In any case
it's documentation and can be amended in-tree.

-- 
With Best Regards,
Andy Shevchenko



