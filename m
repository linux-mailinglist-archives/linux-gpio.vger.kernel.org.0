Return-Path: <linux-gpio+bounces-30074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E8CEE76B
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 13:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9BE130222C2
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 12:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6BD30E83C;
	Fri,  2 Jan 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIHHoUeO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99312D24B4;
	Fri,  2 Jan 2026 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767355858; cv=none; b=XwkcYmXXKZRyK4CJLpSvgdcu6SFX4ZOklTeEX/7iUDBBJSy0aX8DPJ7CdUW3KUSqsIrarH2mX1P+1lNdWTs8ycKY6oOQZZ7hnlmDkDahwFfB7DU9pg6v8gkvfuq2sXzlzl1aArhLT0DwajQKaMkAukXvPmVErgi7AKJKKjo5deY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767355858; c=relaxed/simple;
	bh=JK7nSk0IJHSQlVpb8K07ZplJPjYnIqFLO73vpnXu68k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5vJcZau9IjSBZfH78xm6dDZPNq2iLaiSnAaONFkA/B83ozz8UVw2uvKJA/CFFMqP8eo/vq9ciIYnNnVoreQrNwDWK+0lSfXzQvqoc3kAILXp9k57Zeb6OVI6jC8u6wx//2znWof1aVtTWJSm9VsMc9/tqStw4ZbD6Mf6lxvP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIHHoUeO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767355857; x=1798891857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JK7nSk0IJHSQlVpb8K07ZplJPjYnIqFLO73vpnXu68k=;
  b=eIHHoUeO9lWD/LWglPKdiWQHdyqY3z1YjWQWxNQJwb2FG2fITNSgvmui
   KzgpdB4s/bUFosJJ7NzjwKfgB9wETs9d336TT6zvGwIcw7VUlwyCDCBRE
   Bgo+ze+TA5TSFwGPiUsJWnPfxFaGL7kTRxI1N0q1WGkFuhj5Cg26OA6nt
   HLaVD/LdsYXRIzIKstHZGY9NFeYAEuB/wb+ue3xVMgkKs7uBFJjJQ22lI
   OT5a1KLACX1lej6m4A0yYeypbeN3BUjdnDSL3+1lPx3xGqBS1/0eJVv0R
   6uIkgkZgwyW0Mv1MyFFLtLrzgwVsF8T+hulpLCD6D6HzX2ascrmu2MtQq
   Q==;
X-CSE-ConnectionGUID: XWuRJaJJSNWp8VyOUi/mDA==
X-CSE-MsgGUID: fciQFgkaTSCtFoHWGz5PVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68892446"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68892446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:10:52 -0800
X-CSE-ConnectionGUID: hvj5HC3CRqWEugoZfoa00Q==
X-CSE-MsgGUID: w9HVVgW+RQukI5+MQNiwjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="232500026"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:10:50 -0800
Date: Fri, 2 Jan 2026 14:10:47 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Javier Rodriguez <josejavier.rodriguez@duagon.com>
Cc: linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
Message-ID: <aVe1x3a_q4b6rSrX@smile.fi.intel.com>
References: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
 <d0c53c64-37c6-46dc-8df4-7dcabda4a980.d621b331-3ed1-47f1-9d60-e41be6c9e787.6c4fe9b6-7521-4dba-9edc-dba43347acca@emailsignatures365.codetwo.com>
 <20251230215928.62258-2-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230215928.62258-2-josejavier.rodriguez@duagon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 30, 2025 at 10:59:24PM +0100, Javier Rodriguez wrote:
>    From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> 
>    The MODULE_ALIAS() is redundant since the module alias is now
>    automatically generated from the MODULE_DEVICE_TABLE().
> 
>    Remove the explicit alias.
> 
>    No functional change intended.

The patch is mangled.

>    Fixes: 1f4ea4838b13 ("mcb: Add missing modpost build support")
>    Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>

>    Cc: Linus Walleij <linusw@kernel.org>
>    Cc: Bartosz Golaszewski <brgl@kernel.org>
>    Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
>    Cc: linux-gpio@vger.kernel.org

Please, move the Cc: list after the '---' line...

>    Signed-off-by: Jose Javier Rodriguez Barbarin
>    <dev-josejavier.rodriguez@duagon.com>
>    ---

...here. It will have the same effect on email, but will reduce a noise in the
Git history.

...

>    The information contained in this message is private and confidential, as
>    well as any enclosed document/file attached to it and is addressed
>    exclusively to its recipient. Please if you are not the intended recipient
>    and have received this message by mistake, notify us of this fact and
>    delete the message from your system. The copying, dissemination or
>    disclosure of its content to third parties without the prior written
>    consent of DUAGON IBERIA S.L. is forbidden. Otherwise, it will violate
>    current legislation. In accordance with Spanish Data Protection Law 3/2018
>    and the European Data Protection Regulation 2016/679, we remind you that
>    your data is processed by DUAGON IBERIA S.L.. You can freely exercise the
>    rights of access, opposition, rectification, cancellation or suppression,
>    revocation of consent, portability and limitation of data processing, by
>    contacting DUAGON IBERIA S.L., Ronda de Europa, 5. Tres Cantos. Madrid,
>    C.P. 28760. Spain.

This is not compatible with the Open Source workflow. Please, make sure there
is no footer in the next version.

...

Also, you missed a cover letter. Or send the patches separately as I don't see
now any evidence of the cross patch dependency.

-- 
With Best Regards,
Andy Shevchenko



