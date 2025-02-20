Return-Path: <linux-gpio+bounces-16321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D314AA3DE9D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0389C7ABE60
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8380D1FDA9D;
	Thu, 20 Feb 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aU8OfeyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F61FC7C1;
	Thu, 20 Feb 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065141; cv=none; b=JLR2LDmaFQ7Irb/MWUnAHSpTvZSQqL91soGsZGroxbvvLm7dCapwvzZNt1BM7XStLS+eQVVE2E4CRC6ZdqRdsTYjG64wY2Jif9v2aMAmUTgQNPMEv5PjptvWRmoQmPULRRv7lv/CdVkdYCVXSxQxihrqJpvCedlBzYxjEHBuCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065141; c=relaxed/simple;
	bh=LtlCA9gAYrXyRD44vmahzSC1Q7R5+LM52g4qYW0YgvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z32fY4LlJhfzTHxiQyG/maxjCSLmv75fSQuiW9Nq+x7ddRpfowYR8fy4vhPNm9JIoBQm+WpfsZfm3vtPanH/MD602p7K6+l8EgB3XEciGO1Qet3riRsuv2oIE9TBreYtCfhzVgAcGZV5fUXMTNMCyOCVtya437vzQUbf9zupcqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aU8OfeyJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740065140; x=1771601140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtlCA9gAYrXyRD44vmahzSC1Q7R5+LM52g4qYW0YgvI=;
  b=aU8OfeyJjMqG53+i1+CcJD2n9ESohVBX856u5L4BKqXRMBT6u9YLk5Zc
   Li+1mCWT8g7EKr8Yh8nv+a6J5V1A/3KgPTgfjFd7XwMQSX506oU/KWQcu
   wgkSwqR1VUdlpAzTIYzymsJEOqvnQ1R51LTlpOIDDIWQvmwrfwMx46xic
   49rNkdFskOwrlW/hTj8jmASZ6S94h/Ad/MuASJO16hsxUJL3/gMwOt5T5
   X9eVC6jQ+Bfcqcqv1fkuDV0Knw6VELcMN7kYMhz2cCPMGM8bn/OimkkxQ
   GX+a9MICaHu/Mn4mdrZ2Bh+OZV0k55u0DADTmpLoPD2Ftt5EM4EPQgUE3
   Q==;
X-CSE-ConnectionGUID: +B7SymRaTrqIEjJueRtDFQ==
X-CSE-MsgGUID: neFuwZu/T1iCZjg+6Jok5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40772897"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40772897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:25:39 -0800
X-CSE-ConnectionGUID: YYSWpya3TWe40IR+FqlSZQ==
X-CSE-MsgGUID: 78RYVG6zQTGicJ2BQ2fg/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="114908928"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:25:37 -0800
Date: Thu, 20 Feb 2025 17:25:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/4] devres: Add devm_is_action_added() helper
Message-ID: <Z7dJbpEy50aOgmJw@black.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
 <20250220141645.2694039-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220141645.2694039-3-andriy.shevchenko@linux.intel.com>

On Thu, Feb 20, 2025 at 03:44:58PM +0200, Andy Shevchenko wrote:
> In some code we would like to know if the action in device managed resources
> was added by devm_add_action() family of calls. Introduce a helper for that.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

