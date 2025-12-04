Return-Path: <linux-gpio+bounces-29261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F57CA5043
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 19:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEFB0303134A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 18:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6222534A76D;
	Thu,  4 Dec 2025 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKT5sXda"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64293349B06;
	Thu,  4 Dec 2025 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874597; cv=none; b=X3bSi+6mpIqypWeIsc+IcJ2Et5lCs/BWLrecElXSfL86m2Jt6+u+V+FFycGyN9bBWb+i8qYyVpHE/tCu1BC4vmqF1l+x2kDeofWenzcQkmzqNb+LdcWEZpO8oQH8H0afGIYp6KbfzHvrzzPJJqnCc+hDnG5XHj3OzJlfDvhnAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874597; c=relaxed/simple;
	bh=l6n8oWsMj1pVNAMOOySSE3E+7y53RXTxJDMoJ0edKy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWtleY+QZHEukFz5Dc5zkZZPUJ7p3lMcjPu/s0M7VMe7e9kBKlpGYxcIgHmA2LC1kp17rkQelEa+cQgD05xE+pJUM9rfiLwscbtazQWKgC2xcz69uddR+oz9QVsztfRVcJChThqp4TvoBOGcJ6uj83Aof5JKgQI7ctKTNyfhBao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKT5sXda; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764874596; x=1796410596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6n8oWsMj1pVNAMOOySSE3E+7y53RXTxJDMoJ0edKy8=;
  b=WKT5sXdaPidOgiyukaqdQhv5TGKJPaInJAV2Y/0ZktD0J62u0H7cvnyN
   VikhfPo2c+XjHgjKN3FjLEJtsaqILy5ISf4XuH1MJ2yF1ZhvcZWOQfPzU
   /F9iL1YMYK82FZvBcP7WytyWQxkQ1nHV7TvkrDT/YD9MFybVbiRijZwk6
   qqKqHPpns9Nloi9caqEyssXTPEvOtQJbvTfTNw7+jOXINfi/Tgsjfm4tV
   rhE125H05gby5ZdsTKKS3KGGHayloSGYkonV1/IRC7ijY5y7MMfGwA6PK
   kONQA8s46PEZ4t90qkzmvItJ+fsuKn2vvn4nlq0dW+UCrv7FlJka89flJ
   g==;
X-CSE-ConnectionGUID: g9mEVP4eRbq67pKkaFrAVQ==
X-CSE-MsgGUID: AlRHzMEmSgioUfJhlKNlPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66787933"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="66787933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 10:56:35 -0800
X-CSE-ConnectionGUID: 69jBT2mCReyNW1GdrlS4ig==
X-CSE-MsgGUID: ah85tzF/TOqNZqLUq1+B3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194951657"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 10:56:32 -0800
Date: Thu, 4 Dec 2025 20:56:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Yulin Lu <luyulin@eswincomputing.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: add CONFIG_OF dependencies for microchip drivers
Message-ID: <aTHZXl9IpdvvYHJL@smile.fi.intel.com>
References: <20251204095024.1031947-1-arnd@kernel.org>
 <aTF6ai3PCK6B_EJI@smile.fi.intel.com>
 <1722bf4d-2974-4b17-a333-515d4242fb90@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1722bf4d-2974-4b17-a333-515d4242fb90@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 02:44:36PM +0100, Arnd Bergmann wrote:
> On Thu, Dec 4, 2025, at 13:11, Andy Shevchenko wrote:
> > On Thu, Dec 04, 2025 at 10:50:14AM +0100, Arnd Bergmann wrote:
> >> 
> >> The two newly added drivers fail to link on builds without
> >> CONFIG_OF:
> >> 
> >> x86_64-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
> >> pinctrl-pic64gx-gpio2.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
> >> x86_64-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinconf_generic_dt_node_to_map_all':
> >> pinctrl-mpfs-iomux0.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
> >> 
> >> Add a Kconfig dependencies.
> >
> > This will reduce the compile test base. In other drivers we usually put
> > ifdeffery in the code.
> 
> I usually prefer the Kconfig dependency: It's still covered by
> both allmodconfig and half the randconfig tests on the few
> architectures that don't already require CONFIG_OF on all builds.

OK!

-- 
With Best Regards,
Andy Shevchenko



