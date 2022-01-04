Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64375484304
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 15:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbiADOFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 09:05:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:36960 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230369AbiADOFt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 09:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641305149; x=1672841149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RPOOZ7x9Qp1gxF/JD2OJ1FeHXZYr5tv0YtFpt3we5zM=;
  b=PFS0I+wj2nAWpgXYBi+wegsktNrYV9gccWj/FFEcJ7JSWehrw6ctmiZP
   MYsktyMI/B6WtE124IvMY4DAyc1JnpuzqDIS0BKBEEFwX7gNrbAFeEkiT
   lNdznbQOyojGgzdjvGh88BytTpFgfcBeqGS/v2v7PQKnnRQYomCbfRM+y
   ZZEC/TirOv2yfdXzh5z62UMKd7pXJLQhprD6ImT5YeU07K3blu7+R+GJ4
   uff4ku7MNttO4JtaVCwHisj2eYJvmeqAz/lcF8OgOVFWJJam31/L8Q1vO
   uodFn77FowqdEMWEiQ2A/SU0rG8aCsbGqBiLuN1IVlU6xI0x+CoDnPVVe
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266495975"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="266495975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 06:05:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="556176341"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 06:05:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n4kQ0-006E8Y-VM;
        Tue, 04 Jan 2022 16:04:04 +0200
Date:   Tue, 4 Jan 2022 16:04:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Richard =?utf-8?B?SHN1KOioseiCsuW9sCk=?= 
        <Richard_Hsu@asmedia.com.tw>, linux-gpio@vger.kernel.org
Cc:     Yuchang Hsu <saraon640529@gmail.com>,
        Yd =?utf-8?B?VHNlbmco5pu+6KOV6YGUKQ==?= <Yd_Tseng@asmedia.com.tw>,
        Cindy1 =?utf-8?B?SHN1KOioseWHseiMtSk=?= 
        <Cindy1_Hsu@asmedia.com.tw>,
        Andrew =?utf-8?B?U3Uo6JiH5L+K5rqQKQ==?= 
        <Andrew_Su@asmedia.com.tw>
Subject: Re: [PATCH v4] gpio: amdpt: add new device ID and 24-pin support
Message-ID: <YdRT1AlungmKZSbn@smile.fi.intel.com>
References: <20211210090315.4889-1-Richard_Hsu@asmedia.com.tw>
 <YbM64Dhlii+lKhRu@smile.fi.intel.com>
 <3dd07ebd15f6450a8efa73402b22ffa8@asmedia.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dd07ebd15f6450a8efa73402b22ffa8@asmedia.com.tw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 03, 2022 at 02:42:00AM +0000, Richard Hsu(許育彰) wrote:
> Hi Andy!
>     I need to wait for new kernel for this patch or I still need to do something later.

Please, do not top post and do not send this kind of messages privately (Cc ML back).


To answer your question:

$ git tag --contains 2ac5eb840f1da
next-20211223
next-20211224
next-20220104

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com> 
> Sent: Friday, December 10, 2021 7:33 PM
> On Fri, Dec 10, 2021 at 05:03:15PM +0800, Yuchang Hsu wrote:
> > From: Hsu Yuchang <Richard_Hsu@asmedia.com.tw>
> > 
> > Add an ACPI HID(AMDIF031) and pin number in the pt_gpio_acpi_match.
> 
> Very well!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


