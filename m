Return-Path: <linux-gpio+bounces-27791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AABDC19F05
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18CEF353C11
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1129832E13A;
	Wed, 29 Oct 2025 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4B11zFT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF48228CA9;
	Wed, 29 Oct 2025 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736417; cv=none; b=X2Cm9EbZ6+r4ErbSb5H5WK4m0401XVY9SDrAT9Y2fj5fuw028F0fzReD/GFUfnSgGWkmrgNy1LryWvUc/SB77rUwm06LbGkDpouYkUaraPcfuF394x+flpd22KENssKAMKXdtphP/YP7Y1v3vIT5QilDBvF+Y9onSojhDoFj9do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736417; c=relaxed/simple;
	bh=NSnH+E+jSW6jSODYU4V9JtFGATLzpMIWV0ZGRvO47SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmTQMcHghWC1rEgiqgtPy85UneNlmriiGxi/0x4Lr0k27DKgj+XeEmD0hbfgxvrSOdGqjlGK57J92CBXojt9CDPoIgCeB3iXFy/NDZn4RHAZ5/n0qSU0McWRfjJxjap4xZ0Ix47HTsfMFam50ss6XLnnA6b3Ixdw2D+CGKyCYKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4B11zFT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761736416; x=1793272416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NSnH+E+jSW6jSODYU4V9JtFGATLzpMIWV0ZGRvO47SI=;
  b=d4B11zFTjoWd9i9vq99xkrHgI3Kr7d/NFqD/Xdba8XesYGXaB7GHynD6
   bMVCmO1/mv1isIf/8E3jYNDT/xccVyMt88s2/nSdfQBYmdVVLVjN86xDg
   S9tbHoPl1xOuu599LtD02aL4mevk4hNXiWfWVQjmWEPpTNirwNFXawLKR
   jlcQK9r4MwfSCsuSAvmlOpmR0CosRn2C9wTrtaeD8jbWwZ8lyY+uRFk2U
   /RzQrQAuqUM3GY+5rSnOVc7lCR2y6cGCaJtTuI6JauRZMZcdjwVdVjPAk
   lziRJ0s6m6NTA+7W3VJu5ocJqKP5lLQ5LS5gXZFYa6S5ZIi99y7EPzP+A
   w==;
X-CSE-ConnectionGUID: Yev54jRvTViEkChWp6/UGA==
X-CSE-MsgGUID: fQSziircSr2rrS5C8JehXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="89322928"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="89322928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:13:35 -0700
X-CSE-ConnectionGUID: PCKALzsOTA6gs24ryGIYNw==
X-CSE-MsgGUID: dAa9QsizQbiGV73T38XL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185977478"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:13:33 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vE47P-00000003am4-08ZS;
	Wed, 29 Oct 2025 13:13:31 +0200
Date: Wed, 29 Oct 2025 13:13:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Raag Jadav <raag.jadav@intel.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, linus.walleij@linaro.org,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
Message-ID: <aQH22oSGllHuOkBI@smile.fi.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-3-raag.jadav@intel.com>
 <CAMRc=Mcz3df6KUx6q5MLGfB06jQhBTGfhCM7yovHBE3k1vn+nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcz3df6KUx6q5MLGfB06jQhBTGfhCM7yovHBE3k1vn+nQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 11:40:17AM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 7:21 AM Raag Jadav <raag.jadav@intel.com> wrote:
> >
> > Since PCI device should not be abusing platform device, MFD parent to
> > platform child path is no longer being pursued for this driver. Convert
> > it to auxiliary driver, which will be used by EHL PSE auxiliary device.
> >
> Are there build-time dependencies between this and patch 1/2?

There is a new header file which is shared IIUC. So, yes.

-- 
With Best Regards,
Andy Shevchenko



