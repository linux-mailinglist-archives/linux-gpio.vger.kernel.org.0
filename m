Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFC82EF366
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbhAHNr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:47:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:14041 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbhAHNr3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 08:47:29 -0500
IronPort-SDR: ZMFb7xcBU0cGC1QWe1o07MFm+pfXd1yBM5En3gUTTedoOGHL4A1iKaj3vwqdX2pL9nSsTDRSS5
 NGBS6Qwp8Bvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="262367841"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="262367841"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:45:43 -0800
IronPort-SDR: VVl8J/CSLC6Wc1e7wJVGjdCzRCAz94BBVTLQz4ZqEcuDAXDHlJlDzjk0gZKPeo6l6xkJH3KlHO
 qBqEgWYDq79w==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="362335213"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:45:42 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kxs6G-006CIf-Iv; Fri, 08 Jan 2021 15:46:44 +0200
Date:   Fri, 8 Jan 2021 15:46:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: tigerlake: Add Alder Lake-P ACPI ID
Message-ID: <20210108134644.GN4077@smile.fi.intel.com>
References: <20210107185406.40415-1-andriy.shevchenko@linux.intel.com>
 <20210108065855.GV968855@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108065855.GV968855@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 08:58:55AM +0200, Mika Westerberg wrote:
> On Thu, Jan 07, 2021 at 08:54:06PM +0200, Andy Shevchenko wrote:
> > Intel Alder Lake-P PCH has the same GPIO hardware than Tiger Lake-LP
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


