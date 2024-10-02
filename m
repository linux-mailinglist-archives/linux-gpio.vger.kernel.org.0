Return-Path: <linux-gpio+bounces-10733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8898DF24
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D23285193
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA621D0DEB;
	Wed,  2 Oct 2024 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Obvsb5Sa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2221D0B8F;
	Wed,  2 Oct 2024 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882883; cv=none; b=WcXFQk4YyTwYudZWO4XvZ9Boi7icQ0pZVV1R3/vVhuQU7c9AdLavclhAYFuaVwaLX3tmpAuJ2/KXoiBm4MrcV6aHHUN2z7MOUj5Mow3+wnSU58NACvX8/bKOmMvXSicte83tH5rCKZbASF+0iYIlD71strWfpfn9P7wnfg76bE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882883; c=relaxed/simple;
	bh=g47XGvfHUtrw4Jh/YhmedZ7VELF5O07MOi5rpW6qj5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Te7VAdZWDtaIgwlur/iNqYR73qJc5LFq4ar8U06CGRJPKgMo0itAMjj3Iw3CK5aKfds0DMIEMcDzz06MrGJvI447Btz8l+VrRn9lob+Cq0rpoWkquK5ghJwbNmfAIJJvjh1jFe26PqTgEa/I4o0B+Cri8a8gIns2ZUKuxm8b8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Obvsb5Sa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727882881; x=1759418881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g47XGvfHUtrw4Jh/YhmedZ7VELF5O07MOi5rpW6qj5o=;
  b=Obvsb5Sa9Df4F+BUMhixvf2ZTVeogr4/b/hcpPlO4Y76cofQPu7AZiUM
   FxFE1DupBb/MNDf6728BUeYMvwQK2CPU6Ftj2NX1m+ymq+aeHaCdo5M7N
   Hhp9onZRg3/zpiMsW8Q9/7dkcazymKurNQ1TAowbQYMGD0zy7u0wgtTXJ
   R2BUqDxXy8ssos60qOHCdhrRtdmkMlCB9xoQaPAXVxDufAJlLlk5ZYjPi
   HDrw4kHKawtIUfki92OZfbgbBoK+bs4RU4m7a2aDAPXmrudIvadirrr+0
   M8ZBOmmXuy8cBWDAdac8GzHiEHk1FjuSv5IfeCp+15ikpjNp+zBvGtIHq
   A==;
X-CSE-ConnectionGUID: UiWd/15PScmpNVMv1Cz6vQ==
X-CSE-MsgGUID: PwUtnoVgQgSSmuGsJSNNxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27181204"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="27181204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:28:01 -0700
X-CSE-ConnectionGUID: 4RyxjIeNTY6GeWfOocw5dg==
X-CSE-MsgGUID: C88evIq6SKu50RMJN7sPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="78775818"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2024 08:27:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 498C918E; Wed, 02 Oct 2024 18:27:58 +0300 (EEST)
Date: Wed, 2 Oct 2024 18:27:58 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: platform: Add Panther Lake to the
 list of supported
Message-ID: <20241002152758.GL275077@black.fi.intel.com>
References: <20241002150036.3698181-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002150036.3698181-1-andriy.shevchenko@linux.intel.com>

On Wed, Oct 02, 2024 at 06:00:36PM +0300, Andy Shevchenko wrote:
> Intel Panther Lake is supported by the generic platform driver,
> so add it to the list of supported in Kconfig.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

