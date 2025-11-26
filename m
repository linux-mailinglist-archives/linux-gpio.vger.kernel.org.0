Return-Path: <linux-gpio+bounces-29078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B22C89E4B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 456AC4E24CE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 13:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370501DE4E0;
	Wed, 26 Nov 2025 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMS8Qaqv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566D22629D;
	Wed, 26 Nov 2025 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162108; cv=none; b=aPUPTdgaZk6y1hdPMIXFSZ7WlpcO4Xo0Dz44qcARPJZEu4MLrwte+pqmb5hOLteLYiJvsQj5obAvNh7o9vvLNHw06gPfZNyXAKtos7Mv6lKGrpXifuhW2ikDS36coPGcNQgbNQw4l0EB7elN67gpFvPax5+vqREv3DVXsAF9x70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162108; c=relaxed/simple;
	bh=An3uYWCi2Xvr+ZbPILQiXOQydrNPvCqpTTR5CFjldNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOTobA8F2mgEjcePQjWMSt5HJtM6sC9YzV9f5GHU6v0jC4E9VQ1aObG0ZG7zX5m/wAU9pq6giaYfUyC/lvPFj7u/tCuQuoTTp8/weSxrKxoCY6VLuhiWrxPUhY1hvIUORgJkDc084FAS8ntasGB7BZFnAN4SbwABbc1XAzF9SKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMS8Qaqv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162106; x=1795698106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=An3uYWCi2Xvr+ZbPILQiXOQydrNPvCqpTTR5CFjldNI=;
  b=DMS8QaqvoV57L4z/qP4WLAQy0+HJiEZGB8v9igbTMi1MlEU7OhXY8qEw
   OjpTA7fopWeFLtnNZGQYPfc0AASA5rtU7QFVMACv3kJXN7DEHjuVXHF05
   tI0ON2N9uUu2nNnIxbodnMFrnnvSAy1s0AlG6HBhVJ0V3GoZH+XYJANEO
   Apqtp3+3XBWNOubapYYfFKa0KbBBkcvlIXVWdOngC27NLyUe/Nw+TBtQB
   4KbTii8fWkPDb8P3YZcGAaqzgErZQmlj92o0W1LfXYphcAZ/KR2rafvhF
   XjYEvp5hPQ/PcdwBdFQ3xqDu1HmJC2ralJZQQhTIKxj2Oj+HOPO7Ts9K5
   g==;
X-CSE-ConnectionGUID: cesHNq2oTKOXT3Qu4jHdig==
X-CSE-MsgGUID: zu1YXCNjQ4msNXf/lEU0QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66145589"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66145589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:01:46 -0800
X-CSE-ConnectionGUID: RF+qD0YuTD+GlxyzJsSkzA==
X-CSE-MsgGUID: VXMMLDE0RvmnowPHfzEjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197099215"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2025 05:01:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 607CCA0; Wed, 26 Nov 2025 14:01:37 +0100 (CET)
Date: Wed, 26 Nov 2025 14:01:37 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	alexey.klimov@linaro.org, krzk@kernel.org,
	bryan.odonoghue@linaro.org, jorge.ramirez@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
	quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
Message-ID: <aSb6MSAoG68EmnLq@black.igk.intel.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
> The GENI serial driver currently handles power resource management
> through calls to the statically defined geni_serial_resources_on() and
> geni_serial_resources_off() functions. This approach reduces modularity
> and limits support for platforms with diverse power management
> mechanisms, including resource managed by firmware.
> 
> Improve modularity and enable better integration with platform-specific
> power management, introduce support for runtime PM. Use
> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
> qcom_geni_serial_pm() callback to control resource power state
> transitions based on UART power state changes.

...

> +	devm_pm_runtime_enable(port->se.dev);

First of all, this misses the error check.

> +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)

Second, we have a new (already like 2+ years) approach, so, drop __maybe_unused
and try not to add more in a new code.

...

> +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)

Ditto.

...

>  static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> +			   qcom_geni_serial_runtime_resume, NULL)
>  	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>  };

Please, do not use deprecated macros, switch to new ones in conjunction with
pm_ptr() at the PM ops assignment below.

...

Since it's going to be applied, I think, send a followup to fix this.

-- 
With Best Regards,
Andy Shevchenko



