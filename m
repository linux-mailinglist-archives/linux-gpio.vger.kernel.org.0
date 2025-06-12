Return-Path: <linux-gpio+bounces-21419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E75AAD6720
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 07:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 607CD1BC0D36
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 05:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DE91DDC11;
	Thu, 12 Jun 2025 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lv5iX7Bf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A993C1F;
	Thu, 12 Jun 2025 05:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749705183; cv=none; b=pysXDgkFThZgoZEJyTT1KoWler3WLaCox+CsoDHWt28c8pOTl/MtrdWx5yNg7uUR5sf/g71GGLru94Z9CmzuPubUDILE4TI+eg0ZwKzkWr0+irldlb2ahOmI6u+jHpN/+HgTVmyxPK0xBwOTvg5OAZVmKptrp1m+uI6P074lTPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749705183; c=relaxed/simple;
	bh=QWFEf2ukFKf3rQHtC5hHquBlExojXkKz0hH6h9kSNe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsCuLZm/Y3bXQl0+d8Yis86ylgKxu2T9UbTC8eZ55suEdvsRZ+H9i1OgZeD/tAzTrcfFaOc4LNk8ZGcib+9TTPaTvtrhrht+Hk8i1WbPx7yytsWbzzHWepfIqU4LjFZ9b2BBORZpo5il1lcb+V5WJ3fqfOikXpBaelfzIQZZSv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lv5iX7Bf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749705181; x=1781241181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QWFEf2ukFKf3rQHtC5hHquBlExojXkKz0hH6h9kSNe0=;
  b=Lv5iX7BfUlwn9ByA74k3YzSnOaCDAHHNR5PW4nkhZ5ulqkzi0F2A2rsr
   4NZ/h7C/uYG95qnM9spZoRlR3OV9FaOBHcVYVVCGlqr+F46SD0yRewI6B
   pEfizqzjeAsnaexlFqCpn+vJ3StXoxHB05tOPIROPGNDy/QjDHviYLUO0
   eymRAGwM2sa/9Rpb5SLPZMGnQRTUNjyWMcaxZ+gSCsGFHpZq53JxNtG8m
   d0Z+MB5YkkNz5PtEG06Sm6hcfLkBRthEyZiLZNW56bDsNKmprMm5pD7pE
   gfYkfvJVwF0hoTxIb/EDr1yjHz21zJWbdLPq+T/ji7hN1OsG+Yc+Yz81s
   A==;
X-CSE-ConnectionGUID: rGhe4flpRpael/jihH6YAQ==
X-CSE-MsgGUID: TR1KBEPDRhuE0wCk22rRyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50974480"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="50974480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 22:13:01 -0700
X-CSE-ConnectionGUID: gM0b1NfMRVKTBXVvgA3EWA==
X-CSE-MsgGUID: BHW8lFLgRoO0E5aUI1nCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="151209937"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2025 22:12:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6E6CB191; Thu, 12 Jun 2025 08:12:58 +0300 (EEST)
Date: Thu, 12 Jun 2025 08:12:58 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: fix build warnings about export.h
Message-ID: <20250612051258.GH2063270@black.fi.intel.com>
References: <20250611180956.2780365-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611180956.2780365-1-andriy.shevchenko@linux.intel.com>

On Wed, Jun 11, 2025 at 09:09:56PM +0300, Andy Shevchenko wrote:
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1"), we get some build
> warnings with W=1:
> 
> pinctrl-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> So fix these build warnings for the driver code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

