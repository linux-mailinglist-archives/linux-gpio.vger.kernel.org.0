Return-Path: <linux-gpio+bounces-17046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 500DFA4E0B2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 15:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1023A5C58
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D06204F6B;
	Tue,  4 Mar 2025 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdPyp7wY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174215383A
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741097906; cv=pass; b=UXgrGiR5DwH8vN0Q4b4297Qd3wMxrsK0nTc6pEKrDwBfzjk9d1lgzSxRcDH2F6o6D2gu2Hb4vwlFZTbhGtJNnKnLLfiVg8B4zG6u8NpIxnGeqSXtioR/q3iWUjngTPa3TwDTP3MnXF2HUxMgKjGiN/bfxLI5BT4z0zn79wbXeOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741097906; c=relaxed/simple;
	bh=hWKhorvWNU5jIlxY+oXqSYlO0FKSzqJ4UxdwFEyxyzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pI9Tf1HZ97oBDRNz1VKJtbrns90vBmcWrfEbbt07On3z3Y05ioFIuheswxDdoUpSmQV7HEqqFtK6jvlmqXZrRu2e1D9BP8M96MfKvYjrLyIotIq9X+gzMsH74Gzz6kOMHkj1RW9cVaEIE1ZSmODOO8rAVS7KbO/sHIM5UrOSzb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdPyp7wY; arc=none smtp.client-ip=198.175.65.12; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 7E36240CF12A
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 17:18:23 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdPyp7wY
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6d615ynxzFw3l
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 17:16:41 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id E85BB42741; Tue,  4 Mar 2025 17:16:21 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdPyp7wY
X-Envelope-From: <linux-kernel+bounces-541867-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdPyp7wY
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 026F441E71
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:02:06 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id CE9933063EFE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:02:06 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351611894257
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF442135B9;
	Mon,  3 Mar 2025 14:01:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198098489;
	Mon,  3 Mar 2025 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010510; cv=none; b=SYxw29mDeSGtb+iDjAlAlplK/CJp8Z52B410bnNLjz5aD075ngY068vlQqaJOH25eOHgRDSvdTMs6SSAfjNFF47xJPP48lehcslqwF1KG8xC4tJ+IXGqkjZuyiuaavHHV8gdKe+XRAeJgDNdud8oukSgmdpcbci0xvx0+qAk4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010510; c=relaxed/simple;
	bh=hWKhorvWNU5jIlxY+oXqSYlO0FKSzqJ4UxdwFEyxyzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmnLWjFEug5vuByJYJQe1kahQlOZm6H635aSCVEHO16OVx3GbhuyP1BONwu1wRsQwXfc1YvVA9MSO2h2otpq2hp2H3bfoTykegwOgeoWBsfhHnZOKjpBIkF0xI3btqFStKOjyFaXV6BjG+1HfqG9wLb3l5NrV1RP8GPqhY+t6gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdPyp7wY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741010509; x=1772546509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hWKhorvWNU5jIlxY+oXqSYlO0FKSzqJ4UxdwFEyxyzg=;
  b=hdPyp7wYGiRUiUN2VK0TOMK1+VK4B80SyMMldacConT1k6y9rcEXqmCc
   mBsM8sctFZQvRdY8d1noQFmymwhLIZ9XgsoRh+gUlHKU1kpygV7IV/TJo
   YvkGrba5ulMy5rGjsOg6R+4L5ax9i+mbHP+0agRTGA+XXwpRs7zGTqfHo
   euL/9Cf3hQXNruSXWdVkg1zzGKi1dcMv9wzxT1n/pN9WxY7+4UJqsADdU
   iGuh4cpKQaJNu4sTt9v6qMZxgGhtOMTdAktVPTn2TdtMY2pLU2pznuF+H
   W0d2y0RxyBZdxoi7vDuC0vTvpsCkFtFB00VBmkr8WxgfI+lA8dpDCbkn+
   A==;
X-CSE-ConnectionGUID: bFv6T7M1TFKwUecT8PnN8Q==
X-CSE-MsgGUID: nFo5nh2gS86uiCgdo5sOGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53277544"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="53277544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:01:48 -0800
X-CSE-ConnectionGUID: BAgAY12/QnmN45QMtoC30A==
X-CSE-MsgGUID: KPOP2WG6T+6khWCYU8FLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122974866"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:01:46 -0800
Date: Mon, 3 Mar 2025 16:01:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8W2R0DUS6lctU8v@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
 <Z8We4_FJvxTxegpN@smile.fi.intel.com>
 <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
 <Z8WsfXV1vMlRxzLi@smile.fi.intel.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WsfXV1vMlRxzLi@smile.fi.intel.com>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6d615ynxzFw3l
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741702628.42016@O3GiNx0jXf4kE6yxdTM0LQ
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 03:19:57PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 02:46:24PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 02:21:55PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> > > > On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > > > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:

...

> > > > Better CI coverage?
> > > 
> > > How? I do not see the difference, can you elaborate?
> > > (Assuming that CIs are using the merge_config.sh approach or alike)
> > 
> > That is my understanding of it.
> > 
> > config COMPILE_TEST
> >         bool "Compile also drivers which will not load"
> >         depends on HAS_IOMEM
> >         help
> >           Some drivers can be compiled on a different platform than they are
> >           intended to be run on. Despite they cannot be loaded there (or even
> >           when they load they cannot be used due to missing HW support),
> >           developers still, opposing to distributors, might want to build such
> >           drivers to compile-test them.
> 
> Yes, and how does my suggestion prevent from this happening?

Nothing's preventing it, but since we have an opportunity to allow
a wider build test (even without arch or mfd dependency), shouldn't
we allow it?

Raag


