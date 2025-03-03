Return-Path: <linux-gpio+bounces-17073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180AA4EA61
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 19:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F9BC421A0D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87A42853E5;
	Tue,  4 Mar 2025 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkFSxw9H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF1259C97
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109852; cv=pass; b=tO9iqSYEsn6UH4Ba6mjRU3uBiskLAtK5xNXSBRTOu/Wh1ioE9PORJUtrXM3oJM9nS01iFjVcVekH9/DiOwNwiGHH0Bwm5MSHe4P7gi9WV6l/gFCRIl6j82nU23/tifnwdVNThmn28JA9UudlU32zNpMcY/gVihu/qM++Z/dDRuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109852; c=relaxed/simple;
	bh=LdAb8B+A2aIRRqA7TGNbZE49m+hpZy1lkM63kR3qKqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTj826TywNiAHL+tx/eOClBrkK7NinRjE2Y/7KMv0tTEcr801zxIkNFALUmiBIO83jzYmq9YqczaAg0s4/r7kNWoPTAPr60OhYBKeyBMBFSA6yPGhVKc93VyjDX1q0MSJjpM9JsqK6raQfV7f1m+42yBBW0+Hyeku+qgsPbSwOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkFSxw9H; arc=none smtp.client-ip=198.175.65.19; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 141CA408B641
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 20:37:29 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jkFSxw9H
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fQK47cszFyx5
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 18:15:53 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 2491C42720; Tue,  4 Mar 2025 18:15:39 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkFSxw9H
X-Envelope-From: <linux-kernel+bounces-541697-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkFSxw9H
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 6094D41D89
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:23:47 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 37623305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:23:47 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D1C18902D8
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58DA210F59;
	Mon,  3 Mar 2025 12:22:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5851CF96;
	Mon,  3 Mar 2025 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741004568; cv=none; b=RnXXvL5uMAfL5pEcsDh7P/N/GJDe/G+rE0KbhfHzNK+mFJUW3NIkNOsSXKu5n56rSR6Ozzxq40DmY2CZmn9Za/sDWfO+eY4XZS+LJ8jV3uPBj/1Iw2ArV5ncHNcvnjCibF+Pqkjs0NIWpaKogsmA9gwf1HLaR/KCisNhFDvjiN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741004568; c=relaxed/simple;
	bh=LdAb8B+A2aIRRqA7TGNbZE49m+hpZy1lkM63kR3qKqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GphP2pSUBTWl7OCHsx3+V/PgsyUiMT8pA/57i9R7eKIdkvaePTKketHptXVCWvRQoxFRXwbC7KA5nXqoJbMfKeWJBbq7thmdgYPPVfa1MRUklkdQAPoHRdDbFsjEAwd1D8rAxcOCz2zuF4s9jPmIgw/C3GQsWcwsdM2JxhWPKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkFSxw9H; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741004567; x=1772540567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LdAb8B+A2aIRRqA7TGNbZE49m+hpZy1lkM63kR3qKqU=;
  b=jkFSxw9HrnQ/P+wJObFJiHCzZQanAcgTCvZmAjZx9XzskrTtf5oL1Z3Q
   IhSWsSPp6VvlSruo1x5QwDL61VwdEaBLJsUsFNaKZyo0cuo75KcF8wtFI
   WnxEc23mE9UsNcr5uTobKsRI8WafilU8mJM9EMQ/Q3mFRsgKvZFfwFH6q
   YO5khWdo/8VF2j2wP4UKpttb1vd3M+RR4kxMTNqxiAohvvof2KAvhFjJd
   iUfw8DZTVr06cjG1jvCufgp9C4vYj+StEN57qi6nZ28OqmkeHmWxOjk0T
   DbNO1FhOysSIvEC2WY10hXqQLi+//c7nRv3UhR+cZoHq9FHVtdpymTMz0
   g==;
X-CSE-ConnectionGUID: GoY1AOpwTBGshJ0XtN7cwg==
X-CSE-MsgGUID: SXKEPV6gQGGA/cQW+mvH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41729753"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41729753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:22:47 -0800
X-CSE-ConnectionGUID: JwvZv7yUQBawHs74UT+2Ag==
X-CSE-MsgGUID: jeZ9L7JYReiks6Snb6yFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123208067"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:22:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp4oj-0000000GoKS-3Onw;
	Mon, 03 Mar 2025 14:22:41 +0200
Date: Mon, 3 Mar 2025 14:22:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8WfESNmu4MjEbcx@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
 <Z8WdK7wkNnAerkCO@black.fi.intel.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WdK7wkNnAerkCO@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fQK47cszFyx5
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741714530.74409@MMbkdTR7s1r/SHW7vnUubA
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 02:14:35PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:

...

> > > > > +INTEL GPIO MFD DRIVER
> > > > 
> > > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > > to support all of them (existing and comining)?
> > > 
> > > Not that it is planned as of now but I wouldn't mind :)
> > 
> > It sounds like solving the problem that even might never appear :-)
> 
> Right, somehow that sounds familiar :D

So, can we rename the MAINTAINERS record as the result of our discussion?

-- 
With Best Regards,
Andy Shevchenko




