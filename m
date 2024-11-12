Return-Path: <linux-gpio+bounces-12861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF39C5566
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD7928E013
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 11:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CAC21733B;
	Tue, 12 Nov 2024 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mcaq+EWt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38003217443;
	Tue, 12 Nov 2024 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731408016; cv=none; b=EL7hRSEy3gz2gxH15XhKpK6ZGwuyRu6F4ygLK3LJ5Q4gBr6M8rpVpJCzKdxxrNsWC5ts5hpn9qh/qcA7wCWi3p1er98GZrrX/w1866znrwjbmSrVjuITMBzlLO3hEJ5492NpxS7l/HhyCHVFA02UYmO6Z+iuzNztu9D5C8SJKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731408016; c=relaxed/simple;
	bh=WSbuPZjViriUwxWd751c13Ib+xMquV1ZIwNh2c1zfsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMcucfHSJGb96DtjsJlxGuCM9f6hbs62pRfRiDF/nlKB/pzxKfV1UqQLn1LAF18834LMGeFqfaZSYM53JlxL+krer2VX9OeJ/2ANTg3s8IwjeONbADAombuqSjUbCz+QZtCilG9GPz6F/VqvKqsISHe2i+E8gUerYQiRRoUMEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mcaq+EWt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731408014; x=1762944014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WSbuPZjViriUwxWd751c13Ib+xMquV1ZIwNh2c1zfsk=;
  b=Mcaq+EWtEaGzXKgPGzJ2XrbutIyCI85qy92sbOx/n8JhxjeSR4WOynls
   I0rT6O336VFre0hgMS6z5b/QN2UkDtCOL8PaxmrsQ7KY+kuLKu1SPK3iH
   3Xo/gRMYnshBIO1NHy7ukyjeHQge7bocBu2h42rPrwPIV/lfrnTeL6JrN
   xSYXFTtqEIjJbnWzOoXJS3omPe+BWXPDZmtyB1IXsoq2Y3qM9QkuTL/59
   Al1FttMEYWdwOsciG6a5IIlqejTY/IdxWZc9ME6TMNhK6Oy2aOxyVCVu4
   06JS0dIYNKZRIYmm2iX06YXlmaC55tB8jopvBgvtTFNtLm6QVLGmBYWIk
   A==;
X-CSE-ConnectionGUID: XAoEOv54Q4eEoGgPM4DBTg==
X-CSE-MsgGUID: AI5uHsAtR3KkMOhmlFj9MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31091437"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31091437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:40:13 -0800
X-CSE-ConnectionGUID: x1PI4aN5Rga4d8kiUcZPSA==
X-CSE-MsgGUID: o+qOjH0vRYiNEwLirGwchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="92482645"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:40:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAoJb-0000000DwMj-1sn6;
	Tue, 12 Nov 2024 12:40:07 +0200
Date: Tue, 12 Nov 2024 12:40:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
	heiko@sntech.de, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request
 irq
Message-ID: <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com>
 <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 12, 2024 at 2:54 AM Ye Zhang <ye.zhang@rock-chips.com> wrote:
> >
> > Since the GPIO can only generate interrupts when its direction is set to
> > input, it is set to input before requesting the interrupt resources.

...

> This looks like a fix to me, do you want it sent for stable? If so,
> please add the Fixes tag and put it first in the series.

Independently on the resolution on this, can the first three be applied to
for-next? I think they are valuable from the documentation perspective as
it adds the explanation of the version register bit fields.

The last one seems to me independent (code wise, meaning no potential
conflicts) to the rest and may be applied to for-current later on.

-- 
With Best Regards,
Andy Shevchenko



