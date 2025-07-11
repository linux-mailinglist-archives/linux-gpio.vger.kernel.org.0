Return-Path: <linux-gpio+bounces-23157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC8B01B79
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B9854008D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1FC28C02C;
	Fri, 11 Jul 2025 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZsOSKfE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75081F4C8C;
	Fri, 11 Jul 2025 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235606; cv=none; b=bXNiWbBsCA95k4saEU21hSOBDHkO+wj18BHz1/SCmk5ckF4dyXeHHZ9rmu2SYuDgBVP93ZhTU3OMFqBWuvGsQ6OzxgyLtRUvkonY2q9V4Au0c1GWmZZVzkKhVfKLcMIoNWuCFbwU1Jug/JqRUoQ+indaO22kgKf1wxLbryCRDuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235606; c=relaxed/simple;
	bh=73v4Bf8TnQ9yXXT9YnpP+P6hsSsUhaMVhsvbAtr3caM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8FbHXCfAxi6oCwEEyGjwECjI04djkzkFR7drR2kfa1MSq+wXRzMXxjRSkR1DubP1b+n/DEp0FXuUNwWOteMK1+ufOK3nS/kbYUjuokhm94I9KtD7lzqIhDFdnAmDrTz2Hrcwje3dmqUdIV20s0mW0XGpDOXgktPOCrKW+ryxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZsOSKfE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752235605; x=1783771605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=73v4Bf8TnQ9yXXT9YnpP+P6hsSsUhaMVhsvbAtr3caM=;
  b=nZsOSKfE/Ey5OoVDEYxloufJ5DKidrafw5yYZABZkLzC9yFL7yNcosyP
   uHHV9yGeMuk9iFwTnL6rEUJzzP961DMrgoczWtko5VJhgui2MMmcakiY3
   OBsR9O8JHaM9fVmSXUAWRYA1Np78tfdW7sdEhjNZi8ws2yFQ4x/TlIcqy
   wGvoEC98TDm+s2BVGEBppmSxrX3+E71OVb2RxnHYcns3+CkU84pLDHznO
   O0XjQK4C5dr5tklto/yToonoA+iVxJy+pAFfUUCCglGkCqNoBRw4ADYX0
   dCKUmk7BdUKgGlUKbNPIEBYWBlApWbXXswlLhAHJ8kXYSdeQFkztfUQc8
   w==;
X-CSE-ConnectionGUID: JQNC7lACQwKAzQpgYMxmVA==
X-CSE-MsgGUID: 1kGsElRTQYyx9CKG9yWv+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54470395"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54470395"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:06:44 -0700
X-CSE-ConnectionGUID: npBLzSw0QA+o0aV7WIqGWA==
X-CSE-MsgGUID: FyNsipgBQ9eoYSukALiNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156472372"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 11 Jul 2025 05:06:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7DDAB1A1; Fri, 11 Jul 2025 15:06:40 +0300 (EEST)
Date: Fri, 11 Jul 2025 15:06:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcos Del Sol Vives <marcos@orca.pet>,
	William Breathitt Gray <wbg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Message-ID: <aHD-UH2PsnzJrvQ1@black.fi.intel.com>
References: <20250709091542.968968-1-marcos@orca.pet>
 <aHD40TD8MLug0C6b@black.fi.intel.com>
 <CAMRc=MeNo8sBToDu_P7SahMQcW1xGARgOyQdgJBf7LdtvoYduQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeNo8sBToDu_P7SahMQcW1xGARgOyQdgJBf7LdtvoYduQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jul 11, 2025 at 01:56:26PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 11, 2025 at 1:43 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > +Cc: William,
> > who is an expert in embedded industrial x86 platforms and might help with this.
> >
> > Bart, thanks for Cc'ing me. I have tons of questions and comments regarding this.
> 
> FYI: I haven't given it a thorough review yet as I wanted to clarify
> the way the driver is registered first so thanks for looking into it.

Here is even more. There are drivers for 0x6030 chipset (rdc321x-southbridge.c),
this one is unclear to what chipset it is. Is it compatible with gpio-rdc321x.c?

-- 
With Best Regards,
Andy Shevchenko



