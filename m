Return-Path: <linux-gpio+bounces-11969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060719AEA61
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 17:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFC78283C2A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB95E1EC011;
	Thu, 24 Oct 2024 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko00MJ/3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2034D8DA;
	Thu, 24 Oct 2024 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783687; cv=none; b=uQAh+GC6rGPWEe5yWtY74LGoroOGL4T8TMf+nPfdO0a8zauStvrVvNNJKgXSEsPAmAcWeM7aHwaf0+mZ0WpQZlWed8aOnII538to98PKSfeaglZ82m/0PggHAMPffbwLM9VIi3ich+ueWX2jCRXwPnyVvc79lMILU1nxeXaFyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783687; c=relaxed/simple;
	bh=3mb8sshLEJZq24kO6iMNOmdA+98XdBHa/+zEyNXnwtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8nHlmCyRMa7np2w96p3y2UjjSFqiS4FPO+KvL8WARXo7y52rXY91Cm8cad5fjkon8FMLgQmod4d1RLbKIq+hNERl89WPlysK9/lAXyCT7H/7R6xtwyPP11YrDLshZpZRF6bdStBLgvAt2O8i3y0aVSM63HsVxJs5lVZmsNG1k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ko00MJ/3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729783686; x=1761319686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3mb8sshLEJZq24kO6iMNOmdA+98XdBHa/+zEyNXnwtg=;
  b=ko00MJ/3KZJnJdW7vbkPB6nsxSHcRxnE+3tDjMS9flsVv3pYE+0S2haS
   gcJ2jMzHdSGTedp7OkZ9etjgGT5XFF59cn0eOUfScYtWag+v2ohgvn4kb
   e0CziX4hzGsppAJIeezoTv8gl4P40pXBwPOFgERHIG1T/PkUfaeYBzwd1
   NM/2od30s+Jj4pOSbfxwKMMsUYGLhNoOj3yfuAyudkI4gYlSjfM+1BqVp
   wzdDoEB7WuBcHRA2jC9jtRxv+0dMdxZfYwR+Lnt5WjxOGMftyzPmO0v5r
   uRvoAe85gNKkMCe47lBVxAJSf2fw27HcwC7pxplaELu8vvRY2fH95Ne7i
   A==;
X-CSE-ConnectionGUID: eQQl+SSMSlSDlYQGBBNDSQ==
X-CSE-MsgGUID: GdMv7Is6SoaAFzGeBEt2Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40009729"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="40009729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:28:05 -0700
X-CSE-ConnectionGUID: XpFA3v5JRyuXK2Awn9o/Ig==
X-CSE-MsgGUID: FgP7jK0lRNyDDtMJF2GPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="118079822"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2024 08:28:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 385EF252; Thu, 24 Oct 2024 18:28:02 +0300 (EEST)
Date: Thu, 24 Oct 2024 18:28:02 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Add a human readable decoder for
 pull bias values
Message-ID: <20241024152802.GJ275077@black.fi.intel.com>
References: <20241024151044.4038250-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024151044.4038250-1-andriy.shevchenko@linux.intel.com>

On Thu, Oct 24, 2024 at 06:10:44PM +0300, Andy Shevchenko wrote:
> Add a human readable decoder for pull bias values in the comment.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is nice!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

