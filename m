Return-Path: <linux-gpio+bounces-4095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C78703F2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 15:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24571C22680
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 14:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE71E40C03;
	Mon,  4 Mar 2024 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwK9Nk2W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161914087C
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562228; cv=none; b=ZrPZ6qSx/KleZbgtlcrFeVijNgWohQAn6ZqNlE/na1AmdMlGPv0zjguVfUq/Pu5pPIPCyAFG8BFVGHs1Hg1qKCR/7ds9SvXSLSVrJGf6FZOrW5MNomvAwLfKhs4i9nQm61CPqqVI3fGSPsqK1VGtaJyvh0L43xTLjN6GDvPOqOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562228; c=relaxed/simple;
	bh=XlCnbLOswWF6+lTjv2GLnip9lHAqOGu2ayFPqZQGzPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o78FLJk2phpghnYZBWd2gQvNzw3vTa8lYogr+5kHRURgKWKimRdqkL/IcBi7vG2t2EN6yfAfMHyzKGpc42n0klr2jvVv7NCFk8YQ9++zHVYO0a3VVuvF6N/TtWlj82kgiBtyP9QYyej5523rWP3H0lyMndXFf4lSzMrcXOs2l+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwK9Nk2W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709562227; x=1741098227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XlCnbLOswWF6+lTjv2GLnip9lHAqOGu2ayFPqZQGzPY=;
  b=hwK9Nk2WagtJvoXbOHju0BjtAGp9CjKN4QK+mXPDNUpK105bSXSOpR0d
   SPdqfK3pfOuCZ6QQd4wqYWxi8UeJLIlEoBGaeBbViNQZTUpmRD+YiWAVF
   VryWSXq60cX6JZPv/HLdSfrrWtBpOMmkFQsxPEyaaslsvfpSTMbZA3tIH
   zWequceKpBncn/EJTjQqmd42iaHUMvdwapKjqSk5PVjVGXBHWxQ/wsA0k
   Tizy0wES03O/enefcrXtz5NngAAz/o/I8whDXDNrMNw8LjQ7hwJUJnTkW
   JqvhZb6VfMAWPVGECP97dKaK4LVigYrnDcWirGfNDa2AC7X7ZmRIrCJdL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3909443"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3909443"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 06:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="914107157"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="914107157"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 06:23:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rh9EE-00000009jlL-1gID;
	Mon, 04 Mar 2024 16:23:42 +0200
Date: Mon, 4 Mar 2024 16:23:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: Immutable branch for nomadik-gpio rework
Message-ID: <ZeXZbjE1imUh3jbl@smile.fi.intel.com>
References: <CACRpkdbCniO7imk3+EfhAqR11Wj9NFnR08d2+Hf_oXks5QKzqw@mail.gmail.com>
 <CACRpkdY07F=kq=MZq94WJdf18VXFpsO_SvaDvF_B4zPUzUiVrQ@mail.gmail.com>
 <ZeWtgsRaW7jmjM8d@smile.fi.intel.com>
 <CACRpkdYXZxbvksCTOYAw+HpowM6Zdk38bj-rrPb7aW+Oi8cauQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYXZxbvksCTOYAw+HpowM6Zdk38bj-rrPb7aW+Oi8cauQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 04, 2024 at 03:12:37PM +0100, Linus Walleij wrote:
> On Mon, Mar 4, 2024 at 12:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Mar 04, 2024 at 11:22:12AM +0100, Linus Walleij wrote:
> > > On Mon, Mar 4, 2024 at 9:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > > I prepared an immutable branch with Theo's rework of the Nomadik
> > > > GPIO driver, including some icing on top from Andy making it a solid
> > > > rework and cleanup series.
> > >
> > > Nix that for now, I discovered that it doesn't boot on the Ux500 anymore :(
> > >
> > > I have to backtrack and see what the problem is. At least two patches
> > > are regressing.
> >
> > Since MobilEye works, I believe it's deeper than just my top patch.
> 
> It is, mainly my old hack to peek into the gpio driver from the pin control
> driver is a bit insane so now I have to properly fix it.
> 
> I'm onto it!

Cool! Feel free to fold my patch into other(s) in case you want to rebase /
rework that MobilEye/your series.

-- 
With Best Regards,
Andy Shevchenko



