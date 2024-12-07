Return-Path: <linux-gpio+bounces-13607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F19E804E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 15:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9446188389C
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 14:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC07E14884F;
	Sat,  7 Dec 2024 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvAHBs6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6082CA6;
	Sat,  7 Dec 2024 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733582786; cv=none; b=SGh7Am9UdnHc5MqHZnuuarfLpWl+eRVii14ZC6fm2xKYB93ue5lCP/fbNf5kipCQidFSVQtc2inUUZDUfHklBAvYnD7uZscXiITttYNsQryz+oTbICX4lmy7XyVj35ycrXD2MN+Eh+PH8QhhEwMR0xgFhW0Tq6vRRVfHKvc1p+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733582786; c=relaxed/simple;
	bh=JrW/F2czD0j3SAFMSsWsnfxsb/gzYrG6taqhPvTMf00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mh5MyBHn1J/8Fhoss3Oc/r6nmucwUOmJI0tZx7enLinfd4Ny/BSj1Oo3rT0/27FF4USZmLInoqcf5llOOARQNjh0z5+PybrhFg3YUEW9TqWSzv7J5SHDaEXqaPPhEQ6k9W+m2M2w8Uv6SzSrtvoVxAV1i+Qb3DWXTCGKgUvdH9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvAHBs6i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733582785; x=1765118785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JrW/F2czD0j3SAFMSsWsnfxsb/gzYrG6taqhPvTMf00=;
  b=UvAHBs6ixyIII/ocz5P3tAg8+z0tgo+LQBw892WnTnCEG0gs6v8jreKO
   TsVWeL6jDLd+y0xFonKQRd1Cz+VW4kp2X4CqnGEnyVgF8JAZjtJIbQGCO
   ExsQ9f2DyrnffbQEqFgStv4dHFgwIc2irC/yqRpX5i8mjcoY1BFzc5LgL
   72T1ueD/3j11vnZKJUUJUcze5eYY4neBALVvqIl0sO5HmEATk30N06Qpj
   wxAwUwb2PQ4OexkLU1GgA2vistUUWHaAa3T9foFp2UYosAFSUhIM+AMkc
   cYz5LjSP7PvvRfzO4Sk2Pkz7DoF4oXQwj0PRPpmELyhwGn5GaAclGh5yt
   Q==;
X-CSE-ConnectionGUID: Arq29U96SWSnNoelsC31qQ==
X-CSE-MsgGUID: x4cFTnY/S4+8e/yRRP5Irw==
X-IronPort-AV: E=McAfee;i="6700,10204,11279"; a="33812920"
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="33812920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 06:46:24 -0800
X-CSE-ConnectionGUID: M+MFbYbRQpye6TweuzoGag==
X-CSE-MsgGUID: w87wJ9PsSbCKxDaNYcDcLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="95144361"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 06:46:21 -0800
Date: Sat, 7 Dec 2024 16:46:18 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	gregkh@linuxfoundation.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0nNnsmYIil0OZpy@smile.fi.intel.com>

On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > 
> > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > helper and uses it across drivers.
> > 
> > For the series:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > It seems like Andy will push it to me which is excellent.
> 
> Yep, that's the plan after we get all necessary ACKs.

Greg, anything I can do to move this forward?

Raag

