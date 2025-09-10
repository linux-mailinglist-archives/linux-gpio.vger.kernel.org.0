Return-Path: <linux-gpio+bounces-25909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BCB51A75
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 16:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E34B60BD9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 14:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE44C334382;
	Wed, 10 Sep 2025 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfSK4Dvy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8903314B0;
	Wed, 10 Sep 2025 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515405; cv=none; b=rt06jxRa3iAd6zIcX2EW84RHYjXNz1XY5rd4WM6lK9OdTNxtkD8+OtIJ+J0qb1iP6njEPLGJMnSUwfaHTpCmYBrAHPvnyuZhPHdMLbEnWwPB4fvBt8X9hTRum4kmiLTO9PUY1vWVF8JTJZkSJzj+wqpLf0RhWW92tpo5mmFt4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515405; c=relaxed/simple;
	bh=ZbY2B6yVl12t9+vakyT6Odcj14A3coWtEtGibMgyy5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGv8AVhx0VKN6CZZQrvv1v+gbI/A9sqNP6JiILaObQYFgYsz5jTga1LPcYcdvRn0b4GMzm2kPVH3GgUy7kmBb9dHGGoIf0M9nGGxv5d3UdlsB/MTzr+6hFXicM+ZqdYV5OabnahpTXnM6VFbDoGTF0xPHiEsE7fQwN9B7naD5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfSK4Dvy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757515404; x=1789051404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZbY2B6yVl12t9+vakyT6Odcj14A3coWtEtGibMgyy5g=;
  b=LfSK4DvyERA/iNHfF5ncuvpu7wtYxlMM7hlGj4IXxXXE7WAc7qUgD1io
   Wwx0VuoCwCdxdX4myd1yzWonbhFamRhcIp731HHF8SMXF+nyMu4aR9rSx
   lcp7353g+aD4xiiboUb4y6wUbESlxhyHdgMIIEbqC6jv2/JaOBnL6zO4d
   NmhVNy7ZntrvoMegvfulghyPqwqyMc/ab3fdTUm1RTizXyNkwYYE5uzbY
   Rtmn7wovRq+S7HT2CZakOTFmWbRQtkGKxnGMYRF4o0mGxEpTHxUOJMPbu
   1vfqCO2csdPeGIftVWIAJw4x7TOwCHKYHC2/0nQqDcR6vEShIdXgXpDvN
   Q==;
X-CSE-ConnectionGUID: 2+1n5nY/S3CYQYwQzdCXcg==
X-CSE-MsgGUID: UFGrXi9yS0KA00qj+3roQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71248286"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="71248286"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:43:21 -0700
X-CSE-ConnectionGUID: 8xOG4fZsS/Wlx1q+FywMXA==
X-CSE-MsgGUID: uILFlauiRmePsJvk6TcztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="177742939"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:43:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F09371201B4;
	Wed, 10 Sep 2025 17:43:12 +0300 (EEST)
Date: Wed, 10 Sep 2025 17:43:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aMGOgHzwig8NvxT-@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
 <aMEgNtjcy1-NuBds@kekkonen.localdomain>
 <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>

Hi Cosmin,

On Wed, Sep 10, 2025 at 01:48:29PM +0300, Cosmin Tanislav wrote:
> 
> 
> On 9/10/25 9:52 AM, Sakari Ailus wrote:
> > Hi Cosmin,
> > 
> > On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
> > > Hi Sakari.
> > > 
> > > I recently left Analog Devices but I will continue to try upstreaming
> > > this driver. After the upstreaming is done we can switch the
> > > maintainer status to someone else.
> > 
> > Ack, thank you.
> > 
> > > 
> > > Here's the output for the commands you asked, provided by my
> > > ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
> > > 
> > > Do we need to fix anything based on the compliance tests?
> > 
> > Looking at the errors, it looks like some fixing is needed, possibly also
> > on v4l2-compliance side.
> > 
> 
> I'll take a closer look at the failures whenever I get the time.
> 
> > Regarding GMSL, are the image width, height or mbus code used for anything
> > by the serialiser or deserialiser drivers?
> > 
> 
> No, not really. All the information needed by the GMSL drivers is
> provided through get_frame_desc() ops, and there's no fallback for the
> data type, so the stream format is not involved at all, but as far as I
> remember it's necessary to be set properly for the media pipeline to
> pass validation.

In earlier iterations of multi-stream support we've had link validation dig
this information up from the closest sub-device that supported get_fmt pad
op but that also made the assumption there would be no stream branching
taking place, which is not the case anymore.

I guess the most simple way to address this indeed would be to add the
formats to the streams, even if the driver doesn't need them. Also for
backwards compatiblity related reasons they are probably necessary -- the
older max9671* drivers did support them, too.

This would also address (most of?) the v4l2-compliance issues.

-- 
Kind regards,

Sakari Ailus

