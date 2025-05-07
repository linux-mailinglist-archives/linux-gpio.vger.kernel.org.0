Return-Path: <linux-gpio+bounces-19750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A478CAAE5E5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 18:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8AB4E4618
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1616B28B7DC;
	Wed,  7 May 2025 16:05:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5670B19047F;
	Wed,  7 May 2025 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633913; cv=none; b=EAEn9f8ugePKrvtEc3hhrgAD+MkwYtUzgu9MtgGb/L0ldSO7isWVLyywMXisbG0coom2SO+0i5LbAEwrPE0VcpF7exIrdBapqZOFbxrQniNguWGy9l917Gogmw4Gn+Z4rtC0Q1wcRaidv8W4QAP7rIVUKjmtH5j8BQJNswHR/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633913; c=relaxed/simple;
	bh=5Lc+6qjcgo99zASOnfht6H5SgJYNqToDMZJHW4RhmJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+n2KGNZp19I8SDUVjVwVkSss6bPz1wbR0rKCEGhm2lL/Koa+6oEiuiZ9WX1LYI4HPhIeZwHedAealXoT59A7SePY51MoW/i20dM8nMsKmC8VXD7ZbvXjbxI7xqKhWPHKdLADV+yKBboejssB4G/NezWOTy2JVkEzLGVifu4Kjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: vBKlma7fQViCIMmXsyvtVg==
X-CSE-MsgGUID: B/rcTjnFSGq3iMmr9Mzllg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519805"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48519805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:05:06 -0700
X-CSE-ConnectionGUID: Tswh+QfXRImyo3mn+KMR4A==
X-CSE-MsgGUID: 62GTDZbuQ7GD7CowmxTU4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136518068"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:05:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1uChGY-00000003mCo-0nvn;
	Wed, 07 May 2025 19:05:02 +0300
Date: Wed, 7 May 2025 19:05:01 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Ariel Simulevski <ariel@simulevski.at>
Cc: Guido Trentalancia <guido2022@trentalancia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: tigerlake: Document supported platforms in
 Kconfig help
Message-ID: <aBuErZKeelnCaWbw@smile.fi.intel.com>
References: <CAMz-Jg-Vz9npxtVqjPXnK_WSDm2zc9_MBsQKTJKVghaSU7fyxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMz-Jg-Vz9npxtVqjPXnK_WSDm2zc9_MBsQKTJKVghaSU7fyxg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 05, 2025 at 08:07:23PM +0200, Ariel Simulevski wrote:
> Hi Andy,
> 
> Thanks for the feedback.
> 
> Just to confirm: for the Kconfig help text, would you prefer keeping
> it strictly to a plain list of supported platforms (e.g. "Supported
> platforms: Tiger Lake, Alder Lake-N, Alder Lake-S") with no additional
> explanation or context?

Yes.

> And only PINCTRL_TIGERLAKE because I think
> that the note on PINCTRL_ALDERLAKE is actually quite helpful.

That note, about particular touchpad or touchscreen is confusing as
it is small part of the users that be hinted by it. The rest won't
understand why it is there. The driver runs on tons of different
platforms and configurations, so such a niche notices are not
applicable here.

> I want to make sure the v2 follows your expectations exactly.

Sure.

-- 
With Best Regards,
Andy Shevchenko



