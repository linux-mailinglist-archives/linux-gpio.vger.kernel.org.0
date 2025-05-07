Return-Path: <linux-gpio+bounces-19745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC943AAE39A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 16:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1940D4E585C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 14:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61090289E0B;
	Wed,  7 May 2025 14:55:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FFC72637;
	Wed,  7 May 2025 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629756; cv=none; b=WxNkor6sqVJS2dbWobKRjeesZqvQU6RdGq+OqFSMu7ofnTfuTSDmsCI5rq1NsP4x18c48EAeFV1zeotnQGh5d92Cptovdk7yuknNn+uKkHAKUVUTw/5v3dW14FsbzQCRNyRRQ5mx6rMNHUif+hmUbcAGZ2EVT6KOFSelJDg2ghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629756; c=relaxed/simple;
	bh=o5GOjlPSuFb3knLMrtqOwgVnz2Ys5BjuXTmzVET+4YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5t2HbKHBNg/GTWyGy1dEzB/CBU4cmEgUWvggVoVOU0DzZJ93tm6QXqpkVtdYrJuC0GyLL9iCE5n6xOlgGyJZ92rnu+QGxgjpJpiEzVXtpi7+hF0rUfCaTfPfq+RDnLFbRB9T9lado+V3WPLomIBNj6iu/MEWGSBfAnj2rXpEdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: k6bXGk9cTfufKKGVR22Q9Q==
X-CSE-MsgGUID: x7odT/WSQnWhbmDX0y34yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48381502"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48381502"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:55:46 -0700
X-CSE-ConnectionGUID: 4ZO337GzRVuRNVkfTZ2zdA==
X-CSE-MsgGUID: d0ykZMZiTeiZdxGpT2udZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136908212"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:55:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uCgBQ-00000003lHU-2h4G;
	Wed, 07 May 2025 17:55:40 +0300
Date: Wed, 7 May 2025 17:55:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/12] gpio: ml-ioh: use new GPIO line value setter
 callbacks
Message-ID: <aBt0bFTPUK3qh9H0@smile.fi.intel.com>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
 <20250506-gpiochip-set-rv-gpio-part3-v1-12-0fbdea5a9667@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-12-0fbdea5a9667@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 06, 2025 at 11:01:55AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



