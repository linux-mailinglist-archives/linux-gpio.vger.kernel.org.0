Return-Path: <linux-gpio+bounces-11975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A69AEB0A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 17:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9033E1F23EA6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3783E1F7065;
	Thu, 24 Oct 2024 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwpMc2vQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555D1D63E5;
	Thu, 24 Oct 2024 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784955; cv=none; b=TW4PPPWQY+U9Bx/kGkbgOPFz6a1o0KkLp1Vq1+r+Wbl3JDPzU06QsaVWf8zuCWVPPkwMAGCLdojRhw6zeCHnaI/wr+zt/DgnNA0bSoUsEOIwkpkTXDQK4ZTwLYmJvrwoAxaaVfCtsdjVFRnnQ+XgGIQW3rCmqYjEA6v8W0zcTpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784955; c=relaxed/simple;
	bh=3UqZsQBHYfQ7kUxdr8MBGSN3MdpcvXq5uvrYPFN7WpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8r1nrXfPf8Ay6G6/F7z7vCdc6EKjI3e0TqAG8tnBLx5CQmnliIeyLWDwiBhuans1NW63UHPmmlec7Vd0DTwhsT98AizFrHDTBm8/TjoX1mOWuVvc5uJObg/1+LY4HUYF060dMT0pRSk9CzTD1excvXW6OHV77RlJxGnmuMJ3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwpMc2vQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729784953; x=1761320953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3UqZsQBHYfQ7kUxdr8MBGSN3MdpcvXq5uvrYPFN7WpM=;
  b=XwpMc2vQB6AaXa1r73YKPUYo8pwd47uvT0vSt9zHs810cCHEMR73MhYt
   J/r8ZANSyEAeeQJHaD8/nJS3OG1xWX4SH7mJu5Sv07sadiHL9ymFMbD7g
   uA7c2QsM5ODzsUB+rBb6g+Kwg71Sdr00rIMn6m3IL9+OAMVuAanWUjjcL
   zZDo7GhrzbQiVI7dEauL5UA/qiP4LkAcARkB1MV3Oi2kTOSph4mAbIVDk
   4vZCkYzBjngGDYIrfC9SEXiqhF8b68xlMmPnNqU9Hj366FM0WagIvpRWg
   mQ5p7fk+4wYKSCGXYiEPIrK22QESRpbbwKOllsuTBRRbAn8Bp/ySAw7Sq
   Q==;
X-CSE-ConnectionGUID: msbkhk20TWu3VqN1yt794w==
X-CSE-MsgGUID: 3/vGc1I4TwiJU01tVRRLWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17051996"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="17051996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:49:12 -0700
X-CSE-ConnectionGUID: YeYktbWkSCqn+qd5RDtBuA==
X-CSE-MsgGUID: jhW6jrn1THe59f0ADosm0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80548663"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:49:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t405E-00000006cmY-0n4r;
	Thu, 24 Oct 2024 18:49:08 +0300
Date: Thu, 24 Oct 2024 18:49:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Add a human readable decoder for
 pull bias values
Message-ID: <Zxpsc9zfjBbb53cw@smile.fi.intel.com>
References: <20241024151044.4038250-1-andriy.shevchenko@linux.intel.com>
 <20241024152802.GJ275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024152802.GJ275077@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 24, 2024 at 06:28:02PM +0300, Mika Westerberg wrote:
> On Thu, Oct 24, 2024 at 06:10:44PM +0300, Andy Shevchenko wrote:
> > Add a human readable decoder for pull bias values in the comment.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This is nice!
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



