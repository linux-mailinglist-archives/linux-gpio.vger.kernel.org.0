Return-Path: <linux-gpio+bounces-12511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE29BB096
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BDDEB20E4B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF05F1AF0DC;
	Mon,  4 Nov 2024 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAYQzmnY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C91AF0A8
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714854; cv=none; b=ePyQrv6pMTmvx16+J1u0U6rrahVSR5b22AUd8GR1s0w+zpcXOnvnptL6XNHWxdFgR5q5m1faMe9egamMInRs9n1I01uS7ILWAeC6k1vcMi6YIoUfJXxqwkLc7hb2S2Ce0sBMYuxGEzy4xraQ5Bvknp9RVH0y3dlUtpHLHXDknqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714854; c=relaxed/simple;
	bh=fGZR3n0SRBEkTWdnp0VEp20Dfulw/OR4kb96hC0uqGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vkggrq/e7pwA0TcNwYowmrLlvpUqUCqP3yXO/T3rWQI3ePQB/VlkVotBjUaypvRNLKXOUQuMVSsuI7zVGuUUnd8PTL6nA/OiM3uuPxGI54F+Zf++hLpY5X3LJsqyisWc3mrBvuzohNhENLyv7RYT+nz7npBvLoBc8OM8z1VZbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAYQzmnY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730714853; x=1762250853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fGZR3n0SRBEkTWdnp0VEp20Dfulw/OR4kb96hC0uqGM=;
  b=SAYQzmnY6ilxFDoL0cQ2+x5l5yuuKyZs/nPtdFBc+M+nROpU90g2ayNE
   4+cmd0wlxmJZbA8TwxFNbSGYcbOVD0iJRmOgbsMdDTBt2b4U6H4KdFY6d
   4pDjHYicRmheYPu9uTUMfWTtODeWPLX90mm+z0b7+oT2+Y5jHwmDPSDp0
   gvHd2z6bL3MJGRdQdyq7Rm4RJimtgErVcYU6WJ46qUwpUna2wxDvv3CWN
   EfoNpoys8KZWZLovuX6+wLAxvLrQJpSggcispIIwfnvM4DifEVvNzNhUH
   CdNMPb2t5Vcii9Br/A5kYODgegG1h2VOPYStfqLI2ElXzlXmFQtJ0lDHx
   g==;
X-CSE-ConnectionGUID: kQorOWVdT/GnvidCdoXCeg==
X-CSE-MsgGUID: OD8Zzc8nSymsG6pe1Fz52g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30567577"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30567577"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:07:32 -0800
X-CSE-ConnectionGUID: jK64RsWxQ82ewJcvMLd2TA==
X-CSE-MsgGUID: dwygBEPrTt62Hkcu5Fw+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88181636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 02:07:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 896701C4; Mon, 04 Nov 2024 12:07:29 +0200 (EET)
Date: Mon, 4 Nov 2024 12:07:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux pin control <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] intel-pinctrl for 6.13-1
Message-ID: <20241104100729.GB275077@black.fi.intel.com>
References: <ZySrvXpFANlXrnh2@black.fi.intel.com>
 <CACRpkdaDBsRGntbq4wyEFxA+-ffpQN=MbAhUsoWbp2MO8SK2MA@mail.gmail.com>
 <20241101120911.GX275077@black.fi.intel.com>
 <CACRpkdbdGLQu27i6YcR0ejbgw53YEFN-oFQZD=dYeqB3wvY=HA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbdGLQu27i6YcR0ejbgw53YEFN-oFQZD=dYeqB3wvY=HA@mail.gmail.com>

On Fri, Nov 01, 2024 at 11:30:48PM +0100, Linus Walleij wrote:
> On Fri, Nov 1, 2024 at 1:09 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Fri, Nov 01, 2024 at 12:43:07PM +0100, Linus Walleij wrote:
> > > Hi Andy,
> > >
> > > On Fri, Nov 1, 2024 at 11:21 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > One of the tiniest PR for Intel pin control drivers, only two changes there
> > > > which were in the Linux Next for some time without reported issues. Please,
> > > > pull for v6.13-rc1 (next cycle).
> > > (...)
> > > > The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:
> > > >
> > > >   Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)
> > >
> > > Does this require stuff from rc4 or can you send it based on rc1?
> > >
> > > I know we added some ACPI ID or so for rc4 but ... that's only
> > > required at runtime right? Are there hard compile-time or
> > > textual dependencies?
> >
> > It does not strictly depend on -rc4 but is that a problem pulling from
> > something that is based on > -rc1? I mean this is what we do all the
> > time in TB/USB side of things and typically apply first patches to
> > "next" branch on top of what was the -rcX at the moment.
> 
> I usually do not pull in later release candidates unless it is necessary,
> if it is necessary then I do it, such as if there will be merge conflicts unless
> I pull it in.

Okay, thanks. We'll rebase this on top of -rc1 and resend the pull
request.

