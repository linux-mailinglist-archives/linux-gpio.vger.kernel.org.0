Return-Path: <linux-gpio+bounces-16948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6EA4C2B5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 15:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB623A956D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B50521323C;
	Mon,  3 Mar 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="borDWWZl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C461212F83;
	Mon,  3 Mar 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010617; cv=none; b=SIw5cMG2o3IhasTtyJTWnhjidnB+IoNN4VK0v6pKkQMDPk6Cms0rCXKpZe2jyXcUvmR4HISa1mwGI+aXIWA0U1j0EivLC+uoamMo61ajQJiZE2U2TXglLyUgQGx0DN84bm62sVTfXtRBqElDbgZeKypglqWGUabVaFZC0sMWs8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010617; c=relaxed/simple;
	bh=zjnRUgVtw4tIYOQbjCW2NJAxQLO6Dt7V7NdP7hG98yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDzJm1ARcVwMDJtPR6jmrevIhrzZtiqieMKxLUEphDWIEIpK8g1REkVt1+xIbV7qAZUA6vYjE9YQ/nNZhOyn3X6W7cstHB5kmTXcNnIxzcIvfrnAacS+mZXTX2t8+DA5XA7+mhwNeOpHaSAoxxuBE0KYYm09uSm1rrMBucgkVrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=borDWWZl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741010615; x=1772546615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjnRUgVtw4tIYOQbjCW2NJAxQLO6Dt7V7NdP7hG98yg=;
  b=borDWWZlP591VoSJ9nxVjzXmGIvZRvw9uRSXjLCY61oMLUpnba4vAZVE
   oEYaAYfQqCG0hTbBxr4A604CwyxMkc2mfFz5ONafn+oS8zfspp9OAGmg+
   jc3Fm7UIc11gJ7IpOQzGsBdd8Ao5UHiDzR+GlSEhbtEHwVAlMHCDVthNH
   mxuKAp2clLAODgXOnjqCcI/73shIZdI9PQCEM83e00sGrrvygQiEIymMO
   DWjuwPDmaDUUx3mmZGQ0K0eT5kACxOgrdhLDEqEXeOZ6sZPXMB2pCXCAc
   lsbHKCn8pVEKmlsQArswGMVMU0nZnNpGhwbULUgWfjWva26tiMyMBUA/t
   w==;
X-CSE-ConnectionGUID: uDJ09uccQm+Tle/SGvFE4A==
X-CSE-MsgGUID: /n6m2FEZQ8+wj0I6KjIQ1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="67256985"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="67256985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:03:35 -0800
X-CSE-ConnectionGUID: XKHXptEuSwK7JNtYE0yk0A==
X-CSE-MsgGUID: xkYezJXETR2Oq3+gK4NxgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118043870"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2025 06:03:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2ED45151; Mon, 03 Mar 2025 16:03:32 +0200 (EET)
Date: Mon, 3 Mar 2025 16:03:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: drop repeated config dependency
Message-ID: <20250303140332.GZ3713119@black.fi.intel.com>
References: <20250303135506.323533-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303135506.323533-1-raag.jadav@intel.com>

On Mon, Mar 03, 2025 at 07:25:06PM +0530, Raag Jadav wrote:
> We already have ACPI dependency for Intel pinctrl menu. No need to
> repeat it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

