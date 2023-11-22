Return-Path: <linux-gpio+bounces-352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3F7F4843
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 14:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB55728126D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 13:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA224E618;
	Wed, 22 Nov 2023 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTw+Gboq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC35D45;
	Wed, 22 Nov 2023 05:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700661178; x=1732197178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M2EGjnpNn/aObs0x8/VhvdJ9roagkAJxzwT567tgnuc=;
  b=DTw+Gboq2Gc1Pi9MNcewLID0Ovw/cPpCBfcow8gFfwx9XWdZ15CYyRkI
   zF31VE2Zq5HmSdCZ5RdZSt8ogEjlztD8/KUmexSPKmGlgCK/dTRL883Zx
   sGKxCS8Bg8PcWEfagG9PN7AiX36OM3Q0DYt/HB+ZI5aC28Lz+HCzBnGnu
   O0qCgEynG/Q7CuGfLvLSBjYanvpqrMjn5kKFFWJNzEscav5X72WEaCLOL
   TSGbIeEKfkL/F2iYYEx2Xuy+7SWkzjWd6MePs1wOcG2lOLtJQgTAyaIch
   3bSr1TKOK0qgm/lSATShkoNlneq0em6whFolT0T/V8YbiEiiezNdmuEAI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="423146260"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="423146260"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 05:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014239951"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="1014239951"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2023 05:52:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 81471387; Wed, 22 Nov 2023 15:52:54 +0200 (EET)
Date: Wed, 22 Nov 2023 15:52:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: use the correct _PM_OPS() export macro
Message-ID: <20231122135254.GY1074920@black.fi.intel.com>
References: <20231122105401.11006-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122105401.11006-1-raag.jadav@intel.com>

On Wed, Nov 22, 2023 at 04:24:01PM +0530, Raag Jadav wrote:
> Since we don't have runtime PM handles here, we should be using
> EXPORT_NS_GPL_DEV_SLEEP_PM_OPS() macro, so that the compiler can
> discard it in case CONFIG_PM_SLEEP=n.
> 
> Fixes: b10a74b5c0c1 ("pinctrl: intel: Provide Intel pin control wide PM ops structure")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

