Return-Path: <linux-gpio+bounces-406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBEA7F6175
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 15:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AF3CB21401
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B172FC55;
	Thu, 23 Nov 2023 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StxfxrCI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F058AB9;
	Thu, 23 Nov 2023 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700749699; x=1732285699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XLAZfxCJx9i3M+lTjWT8waPS+sPI734OcLBi9WVbsM4=;
  b=StxfxrCIIRWkiL25HVPIyK+qGu9Lfv+2tB1WW3ZYGMYB1KuGUtwGg2W8
   q4RV8P2V4DQEbgzTwK5NiwQrcoFgyOwsmO5drgHrz2Kau+Q9tbqIQ9GCc
   dDM8u/TRcMrIeY2MKjvLw5VsHzDKOCXUB1Nz5uvIaIuXSiV6MbbzEVm2k
   nuoPo/Nhe1ftpdFhD+FIqHdFAvnlHYIMG2uy7OvI7rWI3X+DeW87NrDFN
   9gc8hozTvKbW1BRvLe1a9XpgDtRjRSECYq4Si6PuqMiB3T3ooFUIdmiox
   +h3f9Lnp1jKkKtYlGzb3YjRgAdzFO/Ado2GddtE+//p4ukHbmdtVnTAUn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478474726"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="478474726"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014642713"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="1014642713"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Nov 2023 06:28:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0CDCA387; Thu, 23 Nov 2023 16:28:16 +0200 (EET)
Date: Thu, 23 Nov 2023 16:28:16 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: tangier: simplify locking using cleanup
 helpers
Message-ID: <20231123142816.GE1074920@black.fi.intel.com>
References: <20231123140212.12135-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123140212.12135-1-raag.jadav@intel.com>

On Thu, Nov 23, 2023 at 07:32:12PM +0530, Raag Jadav wrote:
> Use lock guards from cleanup.h to simplify locking.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

