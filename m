Return-Path: <linux-gpio+bounces-6961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29B8D4DA9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 16:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1CC5284B7F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 14:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079011474C3;
	Thu, 30 May 2024 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMEWYNzR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB74186E26
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717078490; cv=none; b=G+LFXYstC/1Cf1b1wp5onS782kVHjt6l7j/XL0SMmxTNuvasqsCyInytoaW+rQfmQVsIApBP8G1SwG2aQL8HAEQcDQbtgcJ5DUOpDyAb8ZtQ1GZw5lXxdpGiuVSm08d5hZCGp8+uAaExP83hKIr5ovuXvfsiFnqxl7Hk5HhqRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717078490; c=relaxed/simple;
	bh=jIo8lva+fd2SIUgrFv3cNxQvk9ZFnGciDGyJCQCHdvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtiPtwEXDvN6cBBzQT9gJn9upCBl/qRbcc7gRMuz+3YPEqt6K4nWeN+BvA+RwsvFk+hxnDFOl6LZ+bImG+HAJaPoPUsg7I4vvv39e8GT8L2m3fZDUWsZgmTwaK2qxbpymdotv/OC9sHOJFVBYtSvygl3x9olLam2VvdvdjqEJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMEWYNzR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717078489; x=1748614489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jIo8lva+fd2SIUgrFv3cNxQvk9ZFnGciDGyJCQCHdvI=;
  b=eMEWYNzRNqxqMroZpoDVESdP8dEyHwrzrJfyMmobFLS+IXsaB7gTEy+z
   eT4ThvaQ6CupMK5jMB8DONSmDHTpdp4ACL7nxXekHSNUrzRmdhHHf88Mn
   2Fvt5wrZZvoMcFTzGetaVlBDzbfd+IFtajwpb+aqMiZ8OqeKnJIgP6ubm
   INGreWcV0INtOHKezhRfliYbW/DCTTyDR0j/fmYaofUku2Qrqfa1T+PBZ
   lbNOvX0SiPeG4XDpX8aOF4P+TZDCft2fgZ4DEoDoMR9K7drYGgpyIB9PA
   dmRJdBaRc2XZCNVC8f6+uXqwr0/66Wc7GP68/cfEg8S+9sWwn47z8i8ax
   g==;
X-CSE-ConnectionGUID: w6a6m7OETOGzKwna/CVVvg==
X-CSE-MsgGUID: GFS0pgNXSOykU9vCJfBHzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24227150"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24227150"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 07:14:48 -0700
X-CSE-ConnectionGUID: E2Ya/2g8Rb6LR7jWIQdnTQ==
X-CSE-MsgGUID: MUOFlYI4TLm8vjI10X2wzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="40878097"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 07:14:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCgYG-0000000C6Kh-0rAq;
	Thu, 30 May 2024 17:14:44 +0300
Date: Thu, 30 May 2024 17:14:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <ZliJ0xjkOwwnTF3m@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
 <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
 <20240529131847.GA191413@rigel>
 <ZlctJNXjc5a-LYCg@smile.fi.intel.com>
 <20240529134440.GA204223@rigel>
 <Zlc8nBQIH89d_mug@smile.fi.intel.com>
 <20240530002202.GA33089@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530002202.GA33089@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 30, 2024 at 08:22:02AM +0800, Kent Gibson wrote:
> On Wed, May 29, 2024 at 05:33:00PM +0300, Andy Shevchenko wrote:
> > On Wed, May 29, 2024 at 09:44:40PM +0800, Kent Gibson wrote:
> > > On Wed, May 29, 2024 at 04:27:00PM +0300, Andy Shevchenko wrote:
> > > > On Wed, May 29, 2024 at 09:18:47PM +0800, Kent Gibson wrote:
> > > > > On Wed, May 29, 2024 at 04:08:49PM +0300, Andy Shevchenko wrote:
> > > > > > On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> > > > > > > On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > > > > > > > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > > > > > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> > > >
> > >
> > > Fair point, but $@ doesn't give you that either:
> > >
> > > boo() {
> > > 	echo "star '$*'"
> > > 	echo "hash '$@'"
> > > }
> > >
> > > boo foo bar "baz bar2"
> > >
> > > gives:
> > >
> > > star 'foo bar baz bar2'
> > > hash 'foo bar baz bar2'
> >
> > Oh, this is unfortunate. It seems entire model with quotation depends on the
> > commands, printf makes it different, print -r -- makes it better, though, if
> > one uses non-space IFS for it.
> >
> > > Is there any form that gives you the format you want?
> >
> > Yes, but it requires an iteration over arguments, roughly something like below
> > (which is not yet what I want, but closer):
> >
> > 	for a in "$@"; do
> > 		echo -n '"$a" ' # echo -n seems not portable IIRC
> > 	done
> > 	echo
> >
> 
> Ok, we're heading into the weeds here.
> The issue isn't that shellcheck is wrong, it is that the error message
> is not formatted the way you would like, and fixing that requires
> writing a function to perform that formatting as bash can't do it out of
> the box.  That isn't a huge issue, as we currently don't have any
> parameters containing whitespace, but it is something that might want to
> be addressed at some point.

Yeah, I have no objection now for using $* in the strings for reporting.

-- 
With Best Regards,
Andy Shevchenko



