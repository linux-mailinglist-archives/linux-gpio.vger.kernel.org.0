Return-Path: <linux-gpio+bounces-28651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E4C69359
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F6D24F4DEE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11AA339B43;
	Tue, 18 Nov 2025 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVjjDzHf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029132F6592;
	Tue, 18 Nov 2025 11:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466480; cv=none; b=qQpGojaysEc5sf0m2G24ImaM4NuIv68MyRqj9u+AtVSKP71UUowKJ/g4YanbOSJPaEqMPQSBRnbKKl3xh7TdkZD0bP3n39zCexXHtnLTLFruNzG+A4fyNw5AMCLdlPVkxdxWuot8/VjX7oXtC7zl/Abeg3K6zGA77TWm0T5S7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466480; c=relaxed/simple;
	bh=NKarvF/d0DQNUwl+y+r6TFJQuHwa/0WdCzNANevhBS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWKGCqOZGBX6x+jwRDvwNt/vaoLaWyWqkfrJ43/YMR/JezOKwLLvZGmaAh0v46FiAJSCN+iQg2zo/ToW6VFpheAiJpZNL/gtF59oI9OhnoNxKG2oe7WcixftSR8RDtJZQr/DpwbJNS1a1p9l9u7RFnFJKaoP4aafnSLIAmyOYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVjjDzHf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763466479; x=1795002479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKarvF/d0DQNUwl+y+r6TFJQuHwa/0WdCzNANevhBS8=;
  b=IVjjDzHfnlzce8Zn49FjTMGkf99V79G7LBj4cW6OayL5tvrwGCwIRrzv
   NFda088uyhLpWGrT+ysHzc5rMgXYgyAWmmu4iK+z/4XkFbVF6ep1WB5ch
   nDd8y3ppnRJJbx0vFB4ETztAAG7teBSXSSifeHRnbNRUXrpMDNau1bn/U
   WVf7gDHbKYQETCaSmOoFeOldN4RrvORIHq/GAhsRn18CMSQMc0dcchN24
   +YkLB15n4sg5AsrDq/uqp4z2oSkAwEwxEEzuFlbIJYicsUaJtsCqhUoRJ
   FjNV6vT65GCpmsi96PUBSkrYE6trqfJII5qTdSXKOmUit7H/+Zl2luAI+
   w==;
X-CSE-ConnectionGUID: vPx2A9VuTZ6CTG0LY6XG4Q==
X-CSE-MsgGUID: vqf16pXoT4u1yH/isY6VLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76163807"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76163807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:47:58 -0800
X-CSE-ConnectionGUID: 7H8jPDrfQWKaAgSEpyVixA==
X-CSE-MsgGUID: edntCQhJSzWqRGtY8DxOjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190764537"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 03:47:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0DB7F96; Tue, 18 Nov 2025 12:47:56 +0100 (CET)
Date: Tue, 18 Nov 2025 12:47:56 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/3] pinctrl: cherryview: Convert to use
 intel_gpio_add_pin_ranges()
Message-ID: <20251118114756.GH2912318@black.igk.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117075826.3332299-4-andriy.shevchenko@linux.intel.com>

On Mon, Nov 17, 2025 at 08:57:01AM +0100, Andy Shevchenko wrote:
> Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
> custom approach. Convert it now.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

