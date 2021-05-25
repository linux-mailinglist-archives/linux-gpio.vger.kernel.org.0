Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4622C390274
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 15:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbhEYN3S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 09:29:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:16565 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233270AbhEYN2X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 09:28:23 -0400
IronPort-SDR: QzqyoSPT/gjCHsSfWF6As1y1tsFbZd/Btp52hxbMZYNxJwhm1PeHYj9bxDGg9/EDvJsNsg6E+8
 +fqWDyuVt1IQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182513494"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="182513494"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 06:26:52 -0700
IronPort-SDR: iQrAKuM6IvtK8zCU5skSqkL/7M3cRiBlhKq/AyzfGkERaK1Jfs1thAwd3ssE65oFcT1TXt/PYI
 iCA69gbVTOUQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="443378992"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 06:26:50 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1llX55-00Eajh-4v; Tue, 25 May 2021 16:26:47 +0300
Date:   Tue, 25 May 2021 16:26:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tigerlake: Add Alder Lake-M ACPI ID
Message-ID: <YKz7F0mT9evKlXY3@smile.fi.intel.com>
References: <20210525085050.34713-1-andriy.shevchenko@linux.intel.com>
 <20210525103538.GR291593@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525103538.GR291593@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 01:35:38PM +0300, Mika Westerberg wrote:
> On Tue, May 25, 2021 at 11:50:50AM +0300, Andy Shevchenko wrote:
> > Intel Alder Lake-M PCH has the same GPIO hardware than Tiger Lake-LP
> > PCH but the ACPI ID is different. Add this new ACPI ID to the list of
> > supported devices.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


