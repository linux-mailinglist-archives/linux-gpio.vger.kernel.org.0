Return-Path: <linux-gpio+bounces-32381-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NnXFyhgpWmx+wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32381-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:02:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59C1D5F24
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52B4B3012813
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E0E395240;
	Mon,  2 Mar 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZcelR/E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB0037C0F8;
	Mon,  2 Mar 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445688; cv=none; b=Nm3cUuos+VyDRO4VsTidkpzOWuEKxVqhZP0vMtv4t0r90kk6N/deqMoqzXYHqdbukSlc3uQKtp4G1a1/85OSWU52U53anXOF8znzkjVwypzVunk2XLP5fBzd0BXqcxwVINzZMFJ4q+lk6nIbNes/lC9nWVJCUnc+mzcMDFuVPz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445688; c=relaxed/simple;
	bh=lZzJJ3hlONwc57RL+uJIn34oradMLDGmvd8FuKS0eNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UreROFmgaRwUM06ZOZHYEpYi7oHflMrhdWWlpD7oU73tQYC8uuXem4oNtexWT9DrwFE4CVZ4fm2DFsTIIjHu2ayBVTy4jnaxVMNxrbXD4psliwWRCr8stbHaR3/m6xZmZ4MYkD6KjEeW8no9Vvta3rkpvClPFBKv2gFpWc26Kf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZcelR/E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445688; x=1803981688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lZzJJ3hlONwc57RL+uJIn34oradMLDGmvd8FuKS0eNI=;
  b=WZcelR/E2kBa9Wm6dyXtfJiEZjNI7qjkftYgf60TViGdQ7obQ6YRuEcZ
   8YCImjii9A9t8gwhqF3sGfGzf8q23JVSiHyBD29+0GAF5p01czjTYNTgE
   IQ4rRwT1MoBXLdmMW2nEVmhAANK3CKolYQTiuws8deKF0nhNJszS5sH/j
   bR5Lh0XJzodTEKgEi6p62T/RZ118ShJtMua1xAOsugFegrlSmBFw1rH39
   oki/UY3f3NMVK8eYy1pjzkMj6oCsUDAH7BYXoX9mYeakikU+TqP8a35dF
   6Khz5wBv5NyGii6tRLgPekgyEbHwDhpjmUj5pbR5Z0lBW3pehseIzQIlO
   A==;
X-CSE-ConnectionGUID: RjUETVwtRWulFA8PDxmm3g==
X-CSE-MsgGUID: 5WqfFIgPSxm3M4g2cwhFVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84541530"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84541530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:01:27 -0800
X-CSE-ConnectionGUID: k4DrYQrMTraWqz7Favl2BA==
X-CSE-MsgGUID: ZkvNsBx7RMaYOSyi4cbXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="215263899"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.52])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:01:24 -0800
Date: Mon, 2 Mar 2026 12:01:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Zhu Ling <1536943441@qq.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andy@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	chenbaozi@phytium.com.cn
Subject: Re: [PATCH v1 0/3] gpio: Add Phytium platform GPIO controller support
Message-ID: <aaVf8XXqO1GFwF9H@ashevche-desk.local>
References: <tencent_3D2D916753B073166B6392D71A1F4B371908@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3D2D916753B073166B6392D71A1F4B371908@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32381-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6E59C1D5F24
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:51:44PM +0800, Zhu Ling wrote:
> This series adds support for the Phytium platform GPIO controller.
> 
> It includes:
> - devicetree binding for "phytium,gpio" and vendor prefix registration
> - core and platform GPIO driver support
> - MAINTAINERS entry
> 
> This submission intentionally covers only the platform GPIO path.
> Phytium PCI GPIO and SGPIO support are not included in this series.
> 
> Validation:
> - dt_binding_check passed for Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
> - build tested with ARCH=arm64 cross compile
> - runtime tested on a Phytium arm64 board with DT boot

I get cover letter detached from the patches (in terms of email thread).
Please, check how you prepare patches.

-- 
With Best Regards,
Andy Shevchenko



