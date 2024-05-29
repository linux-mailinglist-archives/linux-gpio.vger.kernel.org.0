Return-Path: <linux-gpio+bounces-6857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955B8D3956
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05860288117
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D8159217;
	Wed, 29 May 2024 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="So/aCabK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD421E878
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993188; cv=none; b=lJBwkNrD5XGif/DcPp3Lzkte+8i/pyk03jr6RUi1Hz+GuE01DkhjjcWYYZsR5UoS/gizl6REzbHeAGj7OiLndguj06srzlxJcgNORnDuv4JQXpgjFxbqQQlcJW+OP+lUuSUA+WYJqDT0/Z9Hx7qL0DS+tOz/pC7is/9g5mO7z6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993188; c=relaxed/simple;
	bh=OXOt0Fhkn0rU9Bpuv7it8LPEoKda0R/OenKf0O031Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K77u5ZOGBkaich0aLaZUp3h46oHRKzD+QBMlgBTqgk87E02Szq+oOuYzCEu5bZ4FggYBTWPh3esPtEbxmRd/ZSnKK1x3JKRmgQZ1RXIHeYkbPCOnfnLsmfaUPHytKIQAmOex2QEwCgSDxdQRAQQajx/elvj53fIEfbb4J78RQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=So/aCabK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716993187; x=1748529187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OXOt0Fhkn0rU9Bpuv7it8LPEoKda0R/OenKf0O031Q0=;
  b=So/aCabKGj8V/hxVE/Vho1Wp3KCrgmgVFnGlYKre1zTAfUZZqntmV6vH
   EO4z6+gzpsFE02hPqWgUTLNsMxy35WKmd9CYVJyiFkYgedJnrxzu4KhLm
   Xi97TAdWSwZGSOIHawKGyK+aswrhqMjnZ/HafHB+EN7seVUf0wRg/ZGhx
   FHyvzof4DfhdWch5yBgeNH9ACzCqvTCnlye0SSBC/ROCYbj/jhg9SnFdf
   w9jkCuG3e5FL1Kw4fUFTYceo9urJNhwUKMWmxGv2Bx+pm4n2h+YSX1x6Q
   PVcCoyPxdhRIQw9HBc+U6vJp5qh4gTB/rqLAzzHRcjLg9Eoyx+pCX2CQL
   w==;
X-CSE-ConnectionGUID: FscR43eZRuG0haDSYB3d0Q==
X-CSE-MsgGUID: QuJ/sS/tQo+d+FLpzUOvxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17233836"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="17233836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:33:05 -0700
X-CSE-ConnectionGUID: wOpgek3YRCCsUgpz+6T2JA==
X-CSE-MsgGUID: Qavx3ZC+RwehK6K+bn8y7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35399182"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:33:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCKMP-0000000BpUd-1XUc;
	Wed, 29 May 2024 17:33:01 +0300
Date: Wed, 29 May 2024 17:33:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <Zlc8nBQIH89d_mug@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
 <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
 <20240529131847.GA191413@rigel>
 <ZlctJNXjc5a-LYCg@smile.fi.intel.com>
 <20240529134440.GA204223@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529134440.GA204223@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 29, 2024 at 09:44:40PM +0800, Kent Gibson wrote:
> On Wed, May 29, 2024 at 04:27:00PM +0300, Andy Shevchenko wrote:
> > On Wed, May 29, 2024 at 09:18:47PM +0800, Kent Gibson wrote:
> > > On Wed, May 29, 2024 at 04:08:49PM +0300, Andy Shevchenko wrote:
> > > > On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> > > > > On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > > > > > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > > > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> > > > > > > >  assert_fail() {
> > > > > > > > -	$* || return 0
> > > > > > > > -	fail " '$*': command did not fail as expected"
> > > > > > > > +	"$@" || return 0
> > > > > > > > +	fail " '$@': command did not fail as expected"
> > > > > > > >  }
> > > > > > >
> > > > > > > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > > > > > > should use $* there.
> > > > > >
> > > > > > But why does it do like this?
> > > > >
> > > > > Read the link[1].
> > > >
> > > > Okay, this is only for some debug / error messages. Still if one wants to have
> > > > clear understanding on what has been passed to some function, $* is not a
> > > > correct option. Also note the single quotes, shouldn't that protect from the
> > > > arguments loss?
> > >
> > > That's right - I was only referring to this particular case where a
> > > string is being constructed.  Wasn't that clear?
> >
> > I meant that if you want to have this knowledge in the debug / error message,
> > you will fail with $*, that's why I consider shellcheck is incorrect.
> >
> > Ex.
> >
> > I have
> >
> > 	foo bar "baz bar2"
> >
> > and I want
> >
> > 	"ERROR: 'foo bar "baz bar2"' failed"
> >
> > type of message.
> >
> 
> Fair point, but $@ doesn't give you that either:
> 
> boo() {
> 	echo "star '$*'"
> 	echo "hash '$@'"
> }
> 
> boo foo bar "baz bar2"
> 
> gives:
> 
> star 'foo bar baz bar2'
> hash 'foo bar baz bar2'

Oh, this is unfortunate. It seems entire model with quotation depends on the
commands, printf makes it different, print -r -- makes it better, though, if
one uses non-space IFS for it.

> Is there any form that gives you the format you want?

Yes, but it requires an iteration over arguments, roughly something like below
(which is not yet what I want, but closer):

	for a in "$@"; do
		echo -n '"$a" ' # echo -n seems not portable IIRC
	done
	echo

-- 
With Best Regards,
Andy Shevchenko



