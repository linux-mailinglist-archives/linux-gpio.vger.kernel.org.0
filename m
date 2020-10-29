Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0A529EE59
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 15:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgJ2Odr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 10:33:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:24109 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726712AbgJ2Odr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 10:33:47 -0400
IronPort-SDR: 9Y887UelA6l7T1ynj1crPSaPLzmso3fp3VBT7y+cFq+RRje7st1PzWjsBu9SsrHg7Xb1X6q7Vg
 TR3oZ/P7wUzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="156213453"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="156213453"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:33:46 -0700
IronPort-SDR: VsAs4O/xO7Fwfujk72/QAUD5fFgKMJygds4FBREvq+5soRHz1F3s1Zo3feiqrtHHqaHBo/WgqS
 0SUZhG4lMqqg==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="526750468"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:33:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kY90q-001JDi-1d; Thu, 29 Oct 2020 16:34:48 +0200
Date:   Thu, 29 Oct 2020 16:34:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add blank line before endif in Kconfig
Message-ID: <20201029143448.GZ4077@smile.fi.intel.com>
References: <20201029111728.70196-1-andriy.shevchenko@linux.intel.com>
 <20201029131445.GW2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029131445.GW2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 03:14:45PM +0200, Mika Westerberg wrote:
> On Thu, Oct 29, 2020 at 01:17:28PM +0200, Andy Shevchenko wrote:
> > Add a blank line before endif directive in Kconfig for better readability.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


