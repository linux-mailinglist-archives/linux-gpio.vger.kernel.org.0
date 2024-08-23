Return-Path: <linux-gpio+bounces-9070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC84195D150
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A832528506A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EAB188A1B;
	Fri, 23 Aug 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wsr42u7L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1604B185E65
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426759; cv=none; b=clTDm4Xkf5AkCYcgoJRMMsLxLnr/ZJGqcggIVxSN/q+d2sIY50jTumkb1p2whDo6OjUBWlJjmiKYjq6Nf6ECwDam3oTukHf5tuXsHfEkZlBk5oVDNKNgkyncJHcQ1zw+8mZEjMI0ORQ8The9GedemQiB0RL/9Sq1eu3qijABFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426759; c=relaxed/simple;
	bh=dE2k0MXA43pJNrGOAYuppq2M2CIPKcWyTqG6IuVurvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W59pccq1kLuTE/Ty+flByMR83tlyc28i1QsQ03xSM0U2OLnfWjb79iwabHprE8NTg2hPDMIZc9gAv33M8hSEx0oSrNnwQNcDgZtdiFQInx0asTLf+X0WE6TJc0Ncgon1xr3NCBnTnOQ8EoIEx+0rMY0PXGbn3bP5sGulPUpf8po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wsr42u7L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724426758; x=1755962758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dE2k0MXA43pJNrGOAYuppq2M2CIPKcWyTqG6IuVurvc=;
  b=Wsr42u7L74P6TyFqr0Ng657FvIaQcmusz5fkXAPyGo3Yk3OSNs0mYyMH
   nlnGwKSGzBmzIssJ3dIrifXZQ4cw/NSdehAnOPe2g4+5FwQu9wFdOQrAB
   ZDNh3w1veYHp+xeBP17pV9YmYaa64TQwcryvjvlbfUCZ82hscGlPVj74I
   7vvT77yzNXU+DqpiH5tU/m+4eUDSbmQDIy/D0IODd66aGwB6G1wgdDlhj
   gNmyLgvJOrt9Gh7+3ZeGJhZBifD2T1CQ8HhFDRHTqAk2/kaajVApsF52u
   tBFZy9BrK7R/NlZKdITowYUwox/78qq4ALPnzgc+Dpy6EbN6i//8x9EQM
   w==;
X-CSE-ConnectionGUID: EfXX7++hSJirwFuK1V8bpA==
X-CSE-MsgGUID: 7ebSpB2HTBi/PMj4XmD/Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="13170813"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="13170813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:25:57 -0700
X-CSE-ConnectionGUID: GQIV/QSoTCOKSHa8SaRA1Q==
X-CSE-MsgGUID: c8r5ec/FS1iTEvfFDzA0LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66520815"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 23 Aug 2024 08:25:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B3B62209; Fri, 23 Aug 2024 18:25:54 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:25:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: brgl@bgdev.pl, linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux@armlinux.org.uk, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] gpio: pca953x: Print the error code on read/write
 failures
Message-ID: <ZsiqApDv_eL9zLn1@black.fi.intel.com>
References: <20240821114202.2072220-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821114202.2072220-1-festevam@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 21, 2024 at 08:42:02AM -0300, Fabio Estevam wrote:

> Print the error code in the pca953x_write_regs() and pca953x_read_regs()
> functions to help debugging.

May be, or may be better to use (implement?) proper filters for regmap
tracepoints? In that case we may drop all these noisy messages and leave
only the fatal ones.

-- 
With Best Regards,
Andy Shevchenko



