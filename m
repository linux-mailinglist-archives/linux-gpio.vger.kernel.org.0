Return-Path: <linux-gpio+bounces-6850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD38D378F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77121F26432
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1FD11718;
	Wed, 29 May 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euM53Z3V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4812B73
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989227; cv=none; b=f7SF71Ye9f3vrep4EFuIfqaBzD+SzAIkm2udfL6bzsHYK3UnJ7Y0QFmUdSG23gqaDyfSfnRFsZxonSLC7j7VkEAOZCfEX3q+351S3WTRzvJd4MA86YUfMQsZHaMEwCFlO7rU4Wg0tNr4a2NSG7vSedq0HvDyu3iywLNYILvu35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989227; c=relaxed/simple;
	bh=8nBMhJ/8JmYN0yI1QAtZ5FHC+HorM83/k1lWjGj7rik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSojJIgT9uFdgQFphL0QGdGuj0D6rStDEdDc4oCqEv4PLYLCQ+d3yyCx6xUmf/XpaYNnZCInzotNDm+dBb7E+MhX/jaC5KjjgCUttIyajwkfn7K8SSxSPF7zpgwlzodJtD6L+/Bek0iFAJOlIf+03DwayXmpRXR8TRLrjw5gCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euM53Z3V; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716989226; x=1748525226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8nBMhJ/8JmYN0yI1QAtZ5FHC+HorM83/k1lWjGj7rik=;
  b=euM53Z3Ves9fStSBORyVfZCpYMl6ewxCEQ5ZrnytvDEMScCn57ZKs8Kw
   bDInUUqdR6cqFBaBhkX1jyYqAnIB1W0ifmToqmpDemBKajK4/e61wvvcU
   x/uKDsifAqpcBGuUjFgQuHq5V2VnZnTAJLcYWt2i9UMgz3Us8WYBrEd2K
   HUo2J4FX/FYJ9JKlxbWZRAVYwx4//++EryY9aMp1hvjlH5KEuSAaGQI/Y
   0D3/p8BEk1VydBvXrgT8jN1anjt//eeG/ClW9UMaj+FIw93z+a7zJIgKv
   RRTNhx5Lz9ThJMpWBtbVlYnSgysoO40SYHrNzKr7BP5q6xXRXW3snJ3lc
   g==;
X-CSE-ConnectionGUID: 57tBVbY9TlynXQFb5zB3fw==
X-CSE-MsgGUID: AjR1aVVQRhufL0Xm2pXoTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17222782"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="17222782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:27:05 -0700
X-CSE-ConnectionGUID: VpqBTrarQb2X9Z4EuH2HJA==
X-CSE-MsgGUID: S80RtiizSN+XUA7Le5y0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="40329991"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:27:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCJKX-0000000Bo18-06G1;
	Wed, 29 May 2024 16:27:01 +0300
Date: Wed, 29 May 2024 16:27:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <ZlctJNXjc5a-LYCg@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
 <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
 <20240529131847.GA191413@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529131847.GA191413@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 29, 2024 at 09:18:47PM +0800, Kent Gibson wrote:
> On Wed, May 29, 2024 at 04:08:49PM +0300, Andy Shevchenko wrote:
> > On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> > > On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > > > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> > > > > >  assert_fail() {
> > > > > > -	$* || return 0
> > > > > > -	fail " '$*': command did not fail as expected"
> > > > > > +	"$@" || return 0
> > > > > > +	fail " '$@': command did not fail as expected"
> > > > > >  }
> > > > >
> > > > > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > > > > should use $* there.
> > > >
> > > > But why does it do like this?
> > >
> > > Read the link[1].
> >
> > Okay, this is only for some debug / error messages. Still if one wants to have
> > clear understanding on what has been passed to some function, $* is not a
> > correct option. Also note the single quotes, shouldn't that protect from the
> > arguments loss?
> 
> That's right - I was only referring to this particular case where a
> string is being constructed.  Wasn't that clear?

I meant that if you want to have this knowledge in the debug / error message,
you will fail with $*, that's why I consider shellcheck is incorrect.

Ex.

I have

	foo bar "baz bar2"

and I want

	"ERROR: 'foo bar "baz bar2"' failed"

type of message.

AFAIU this is not what shellcheck wants. It want me to mange this to

	"ERROR: 'foo bar baz bar2' failed"

Thanks, but no thanks to shellcheck.

> The single quotes are within double quotes, so aren't they just part of
> the text in this context?

I don't remember by heard the shell expansion rules. I presumable that it
might affect the inner argument on the recursive expansion.

> > > Because $@ is an array being used to build a string, and that may not
> > > work the way you expect.
> >
> > I think it's the opposite, $* works in a way I do not expect :-)
> 
> When passing arguments, sure.

> Not when constructing strings.

Why not? This is pure puzzle to me why anybody wants the mangled string.

> > > In this case $* is clearer as that has already
> > > been concatenated.
> >
> > ...loosing information about which word refers to which argument, yes.
> 
> It is building a string, so arguments are irrelevant.

See above why I think it's relevant.

> > > [1] https://www.shellcheck.net/wiki/SC2145
> >
> > TL;DR: I consider this is still a bug in shellcheck. But if you rely on the
> > tool as on the ruleset carved in stone, I will not die. Just a remark to
> > myself "even honourable tools may also be broken".
> 
> If you think it is a bug then raise it with shellcheck.
> I think you are conflating cases, and I agree with shellcheck on this one.

Okay.

-- 
With Best Regards,
Andy Shevchenko



