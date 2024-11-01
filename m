Return-Path: <linux-gpio+bounces-12455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FC9B90EF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E8C1F22D14
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DD219F423;
	Fri,  1 Nov 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLlJuwV6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D319E997
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462956; cv=none; b=W50iGcF5gL5f4K4d8omfeYd7FtFunFRbsikNm0KXbKIeHnhm/aZBvC90caA+SjfhGf+zQCRPvsuFiN+Glksyd0S2r7MyHvrsN6QPCykrJnNbo3T7nkoc9IC1YgmcwO+4I+q37dti+mCpT1BnUixBntZ1uI9LYH9KixESJEieT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462956; c=relaxed/simple;
	bh=Xw3gUxp4NreqDr81PnqV12zQuTGAQJPLtbEsEBJpgU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqwmNsxXL4YqGvjuC3HXanKfF7IAbGMvU2zCXRCHXJQAk8RkQcBxd5RYeMjcRJYrXAOcNqVIshhIWbhhK7pZLnWbOYXPEcZM5X//cHQBtmv6j4qotfRnr13Vos2/3tz8rmn5LZwIc4wzDB0u3MnVqQ3DnA/sYUJxvKOic3/PrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLlJuwV6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730462954; x=1761998954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Xw3gUxp4NreqDr81PnqV12zQuTGAQJPLtbEsEBJpgU8=;
  b=JLlJuwV6rS2mrrfAw3RJJSOHZrE85CbV6MHT7Ij40gv2QRcZy/Ge3rDv
   KytzkxGg1TNwOtul+XPB+BTRQJsY1PUCzKxLaV4ccSaPaCr1t3g/PxWtd
   EpQkyvmYAj0SCQujdxuL5oysGX3xUETKFjlLEGHtpZRXz2QFNEmSFXt1i
   yigeb3BHRU12UvmR3UZJCMGFLSrjibk+ywSqZMZ3gdutgC1p5LD3etHhz
   KXMOaDx/TDLrcyKJUZAvAJ0jqc4AjKKTXtLoySnws2QmQBg4s2jsTDOXS
   XrU/ouwGv5XqzkxnvBkX9Q/c+KFI7c37JyjqYKtNK9fA4SG/5KxB3yfdu
   g==;
X-CSE-ConnectionGUID: xLxc+yS5QVyOT7NmHepmJQ==
X-CSE-MsgGUID: Ya7xJnVRSBe9QSuHMkJlEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="55626447"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="55626447"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:09:13 -0700
X-CSE-ConnectionGUID: r2BSGnvlTiCtQ3ipf/amoQ==
X-CSE-MsgGUID: mEzcs3P+SQ+esIFKd+Oa3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82863489"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2024 05:09:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2104A2D3; Fri, 01 Nov 2024 14:09:11 +0200 (EET)
Date: Fri, 1 Nov 2024 14:09:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux pin control <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] intel-pinctrl for 6.13-1
Message-ID: <20241101120911.GX275077@black.fi.intel.com>
References: <ZySrvXpFANlXrnh2@black.fi.intel.com>
 <CACRpkdaDBsRGntbq4wyEFxA+-ffpQN=MbAhUsoWbp2MO8SK2MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaDBsRGntbq4wyEFxA+-ffpQN=MbAhUsoWbp2MO8SK2MA@mail.gmail.com>

Hi Linus,

On Fri, Nov 01, 2024 at 12:43:07PM +0100, Linus Walleij wrote:
> Hi Andy,
> 
> On Fri, Nov 1, 2024 at 11:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > One of the tiniest PR for Intel pin control drivers, only two changes there
> > which were in the Linux Next for some time without reported issues. Please,
> > pull for v6.13-rc1 (next cycle).
> (...)
> > The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:
> >
> >   Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)
> 
> Does this require stuff from rc4 or can you send it based on rc1?
> 
> I know we added some ACPI ID or so for rc4 but ... that's only
> required at runtime right? Are there hard compile-time or
> textual dependencies?

It does not strictly depend on -rc4 but is that a problem pulling from
something that is based on > -rc1? I mean this is what we do all the
time in TB/USB side of things and typically apply first patches to
"next" branch on top of what was the -rcX at the moment.

Thanks!

