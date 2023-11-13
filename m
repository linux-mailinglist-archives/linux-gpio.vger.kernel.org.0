Return-Path: <linux-gpio+bounces-64-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172157E9D6F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3CFD280D8E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128AD20325;
	Mon, 13 Nov 2023 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShXopCs+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238891D527
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:42:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E32D53;
	Mon, 13 Nov 2023 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699882975; x=1731418975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xzzD/0+ZYLR2IjlJENS/3cfv3WT3931bgroIdQuIApA=;
  b=ShXopCs+Ww6VmQrPmEMruiUaEvdNFOu8I8mRMxiWNzEcwKYKr4FLdE/6
   8wfzb+JSkFss24b2zjDzuNWzMvjMm/VeCulgJIgdH2hA08gLuK76Yiid0
   PvpWTzdNu2hI70sDd4CJ0uVywgmIXKJyIKMRXuzq0eySMuRYLIdPV20Ns
   hq+mVr9777GqH3Nr1B0aIbVQxi3qM1E9ZlQ2X0EbgH2MJq7NOss3LoGds
   LY7J2CBJLLLMiLuq2ufytQSJm+Sp8bVLDJry7nbhH1Z6yMH6sVEN/pLeV
   3F3v+cS7abdpwiSzRnqViouk7tceJ8BefsjosVsZdYN42/DdOzblcp0F/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375463751"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="375463751"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="767923056"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="767923056"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 13 Nov 2023 05:42:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E9A231A6; Mon, 13 Nov 2023 15:42:51 +0200 (EET)
Date: Mon, 13 Nov 2023 15:42:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com
Subject: Re: [PATCH v1] pinctrl: intel: allow independent COMPILE_TEST
Message-ID: <20231113134251.GR17433@black.fi.intel.com>
References: <20231113125534.4993-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113125534.4993-1-raag.jadav@intel.com>

On Mon, Nov 13, 2023 at 06:25:34PM +0530, Raag Jadav wrote:
> Now that we have completed the transition to standard ACPI helpers for the
> entire Intel pinctrl tree, we can detach COMPILE_TEST from ACPI dependency.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

