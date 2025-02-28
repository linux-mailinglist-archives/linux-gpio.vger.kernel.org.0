Return-Path: <linux-gpio+bounces-16843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE5DA4A23A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 19:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 291BC1746B7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 18:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2542727700B;
	Fri, 28 Feb 2025 18:54:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8B1F4C85;
	Fri, 28 Feb 2025 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740768893; cv=none; b=VtmZn1pCfTvZLsVHxgV+Bk02fnOT6bftAkYK9hFIYK9ILrJFCkNR/f8pHACfknGsd7CfKiO6K8lPM7ZY8pIqfoEF4IM6/H6f7jouV9ZGnzLOeqDnB60syh9CCV6Wx7SOF9GI4bBXqNWVkt26t76G9pJwCupEEwAYL3ujIUz+E5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740768893; c=relaxed/simple;
	bh=xSeI8SzAJ1aDpOrBjd/hAZfvQVcKMWue9Nv0j6Pw46k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGW/9CZBZ2/H69R1/kaMRWb27vjpgAXY8NhBNzU67Uj/BjWuWpuo1h+dfNaGS2t6xtsUxl8NQVuonOdcqWsA4sOY1FT27W4kDh0X671XOkYPxlngYjKXC10U4NpYlcZiiQmh9ZjlGhzy16oMc42+rostCpA4gV9/VGHWuD1i+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: WX/lxBl+Srelwk3o8oc99w==
X-CSE-MsgGUID: XSIMB8C7QJqXSsyJdLRnQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41955454"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="41955454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:54:51 -0800
X-CSE-ConnectionGUID: 4dGhwxRWR3GPxUu6Jw8pow==
X-CSE-MsgGUID: dQLJJYebRySwOs1YChFZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117910604"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:54:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1to5VW-0000000G3pk-25wJ;
	Fri, 28 Feb 2025 20:54:46 +0200
Date: Fri, 28 Feb 2025 20:54:46 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: use the required minimum set of headers
Message-ID: <Z8IGduXgC3O74ipE@smile.fi.intel.com>
References: <20250225095210.25910-1-brgl@bgdev.pl>
 <Z72fBfM4afo5SL0m@smile.fi.intel.com>
 <20250226214613.1e814f9a@pumpkin>
 <Z8Au4WwXDlPQwfn2@surfacebook.localdomain>
 <20250228175019.1a01e698@pumpkin>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228175019.1a01e698@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 28, 2025 at 05:50:19PM +0000, David Laight wrote:
> On Thu, 27 Feb 2025 11:22:41 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> > > A 'fun' activity is to pick a random file add "#define _IOW xxx" at the
> > > top and see where ioctl.h is is first included from.
> > > (I've not got a build machine up at the moment.)
> > > 
> > > Then start fixing that include sequence.
> > > Moving a few headers around is otherwise pretty pointless.  
> > 
> > Have you tried to help with reviewing this?
> > 
> > https://lwn.net/ml/linux-kernel/YdIfz+LMewetSaEB@gmail.com/
> > 
> 
> Not seriously, though maybe I remember it.
> 
> 'dayjobs' makefile first deletes all the SUFFIX and builtin rules.
> Then it copies lots of headers from all over everywhere into a (fairly
> flat) obj/include tree to reduce the number of -Ipath to a minimum.
> A 'create' dependency is added to all the main targets to ensure the
> headers get copied (the .d files pick up updates).
> 
> It then generates explicit rules for each .o against its .c file.
> 
> Definitely speeds things up because make is no longer searching
> directories for all sorts of files that might be needed - but never are.
> 
> (I've not dug through the bowels of the kernel makefile, but probably
> have the skills to do so!)
> 
> But that is all different from solving the 'all the header files always
> get included' issue.

How? That gigantic series makes the headers cleaner in a sense to avoid
"include everything" thingy.

-- 
With Best Regards,
Andy Shevchenko



