Return-Path: <linux-gpio+bounces-6840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1535E8D3725
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24E2B1C20AD5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E9CDDAD;
	Wed, 29 May 2024 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyjEgtKP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DADDD4
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988219; cv=none; b=FOnJbYt1KmHLz59ztNwBs3pxIoeM5ImbCWT6RRZQzb+h0YD8qjEBP8vzYNp2wA/O38tLGSvbJt5OS6maGx48Ohm3IV4ENty8FTqf0lRU5nGTU5FzuwoHwmuMXH8StH1zJxz4mEvNwZ4m/6B+BLPbXOT7LUeadBcrI+nG8InlBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988219; c=relaxed/simple;
	bh=v7u3mMkWzE7hiSYjGlKgC9P9CX98vNIsWMoHptdzfUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3Bg8l/kETrQ+ZtLKquBClr5ijnqjBan1zZ4OUK76LwYXrJMb2JQA6CR6EN6YWc7IG+dD6hFHr8VfqtOdwfltZot2qTgRIV8opTHo0HEoXiEvOPE1eZCueqrqdnJ+NSnXP+uGI4uRvtQrMJi2ix75H4nMIlbzax2nYtLz7hxK0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyjEgtKP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716988217; x=1748524217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v7u3mMkWzE7hiSYjGlKgC9P9CX98vNIsWMoHptdzfUo=;
  b=EyjEgtKPMDHCqDsCe0nSjEcoXpuXt4ROm5S3pKZMO+FemenFdxK9NkVK
   mgqPRtKP+s5pwgiisMsDTtJnVeKbKoWv7mSNV/DPpYbcizxmx24lTGx3E
   QYZmekk2hQFrHOB4PCljyIsJ2qugUm4TXIuNWdvGrJaGqoi5De77j5sRq
   qpovw8K46DbXYi/JH2nMBExq65tQ3unuBjGCXdGdyUaeaj2YS5eqs0Gpp
   ZA35DVKxIiSZtuS8ihPA6KfpHcXyKoMIzf7vdoT2hchh5xFyYjx6Eohmw
   qBYFpDh8gbfVPjRVXcUWfpFiXakbVbYPjaboKFGR7xrkw5ZdrF0mk3Yom
   A==;
X-CSE-ConnectionGUID: sDTkIZIWR5KNHp9Ny4UjFw==
X-CSE-MsgGUID: Fx0F+e4+TgepPKPv/ltosw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24522562"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="24522562"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:08:53 -0700
X-CSE-ConnectionGUID: D9t2S1yMShWckolv8iN2yw==
X-CSE-MsgGUID: s/KNgWaDQrGzLWkHJ89uZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35497043"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:08:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCJ2v-0000000Bnlq-1tMP;
	Wed, 29 May 2024 16:08:49 +0300
Date: Wed, 29 May 2024 16:08:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527233910.GA3504@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> > > >  assert_fail() {
> > > > -	$* || return 0
> > > > -	fail " '$*': command did not fail as expected"
> > > > +	"$@" || return 0
> > > > +	fail " '$@': command did not fail as expected"
> > > >  }
> > >
> > > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > > should use $* there.
> >
> > But why does it do like this?
> 
> Read the link[1].

Okay, this is only for some debug / error messages. Still if one wants to have
clear understanding on what has been passed to some function, $* is not a
correct option. Also note the single quotes, shouldn't that protect from the
arguments loss?

> Because $@ is an array being used to build a string, and that may not
> work the way you expect.

I think it's the opposite, $* works in a way I do not expect :-)

> In this case $* is clearer as that has already
> been concatenated.

...loosing information about which word refers to which argument, yes.

> [1] https://www.shellcheck.net/wiki/SC2145

TL;DR: I consider this is still a bug in shellcheck. But if you rely on the
tool as on the ruleset carved in stone, I will not die. Just a remark to
myself "even honourable tools may also be broken".

-- 
With Best Regards,
Andy Shevchenko



