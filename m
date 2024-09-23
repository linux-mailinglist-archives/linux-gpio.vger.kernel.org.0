Return-Path: <linux-gpio+bounces-10380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146B197EA0E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFB9C281A56
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34643196455;
	Mon, 23 Sep 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCovq27e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285A78B60;
	Mon, 23 Sep 2024 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727088249; cv=none; b=h0sso3Wr89VPBDrRLQZ7TRR4dVweoKEb14Wfod+R5LSK563vfUp7r/OancxdC/yFWwpY/B8tDTv7+8XzlhZVHNwnkYoQFL2ZIpr+pImAZe2dWGLHYqfICezO7LVFSak8SH7SxNhoSvLMBt+DXuchaVFhXxm/uXWeWFG033sZ1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727088249; c=relaxed/simple;
	bh=oKcFWTGa4Wd1F63+4plK6XDY/MxtOsFMlyeMw92+6eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxoXdKdS3Svk9vo56g1WUZ1R2Yap2l6PK4/z8nHd95D4etJJA29Z+DooGxvj6ddCqGP77tZ7ig9+Wc7TdJE6c0dT/Ugyr1Ius32JLTZvN2+V/abADh8TBS6YefHdcm0JAC0QsfV5sjpDlkpvLcdDuPBEfuYW4i/42gFmbs99Fl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCovq27e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727088248; x=1758624248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oKcFWTGa4Wd1F63+4plK6XDY/MxtOsFMlyeMw92+6eY=;
  b=RCovq27eC04qwnQWoafbT9RI0aD0OjjbyMiZJDUy6eFFojc338BT1qhz
   PCaK4qsYRVri3TlKuJTibEIRJ29HllUQDJcLe+n/c/Dbh+3A0bbfSKWDF
   M7F4UZOPfV94tCuvxUDIlQSR53q7lKsUWtiY9ms+pE/yf0huFMJZMuWv3
   PoP9TbONPJenEK3IAbQkOcV7BcjrTYlXrO/AvapBwWnnMLpxOPBx1AMZv
   8YJKkvtc3yG14i779MXrC0mtL7Qzmr4bLtAaE2RTz9IId9yA3mobpG3Dr
   0fvmERxjJ7HP6Wbb4WHtjmaDWoZM1MDcYsSgmwxkEhPR98rqpcOS5FpBu
   w==;
X-CSE-ConnectionGUID: 6Pta1CafSZ+nGHyhU0XMQQ==
X-CSE-MsgGUID: B3iLkegKQTSVxPUcGyKTLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26123755"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26123755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 03:44:07 -0700
X-CSE-ConnectionGUID: wBEHr1JxRz2EvFbS6PFTNg==
X-CSE-MsgGUID: 5d6hTUnMTfe+LzCf8TrTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75970264"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 03:44:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ssgXz-0000000BxIp-0UHc;
	Mon, 23 Sep 2024 13:44:03 +0300
Date: Mon, 23 Sep 2024 13:44:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: nomadik: Use string_choices API instead
 of ternary operator
Message-ID: <ZvFGctwe1vu9lQmd@smile.fi.intel.com>
References: <20240826095723.1421065-1-andriy.shevchenko@linux.intel.com>
 <ZtmqdP6Q92vRWh_I@smile.fi.intel.com>
 <CACRpkdYSPGsQt_FQDurtwmyaLtB3=gaay-hLN2QdOj25e3sK8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYSPGsQt_FQDurtwmyaLtB3=gaay-hLN2QdOj25e3sK8A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 11:11:12AM +0200, Linus Walleij wrote:
> On Thu, Sep 5, 2024 at 2:56 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Aug 26, 2024 at 12:57:23PM +0300, Andy Shevchenko wrote:
> 
> > > Use modern string_choices API instead of manually determining the
> > > output using ternary operator.
> >
> > Linus, do you have any comment on this?
> >
> > I had sent two patches of similar changes (different drivers, thoug),
> > one got applied and this is not. Anything should I do about it?
> 
> Sorry for late reply :(
> 
> I thought it looks weird to replace just one string choice
> in the middle of everything and it will be confusing for readers?
> They will be "but what is this now, this looks weird".

Do you mean it's incomplete? So, i.o.w., if we have str_output_input()
it will go?

-- 
With Best Regards,
Andy Shevchenko



