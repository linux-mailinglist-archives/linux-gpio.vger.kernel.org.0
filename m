Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE1718FCE4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 19:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgCWSlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 14:41:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:4251 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727011AbgCWSlB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 14:41:01 -0400
IronPort-SDR: 9ZUzGMCLHY4d9zR6RnuzhtggaX/W3hbXHrr0fVfL2qB+NSueVjNSV7xp3yy70TrZL1n2cI4gr6
 gjmoQTgfqRCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 11:41:01 -0700
IronPort-SDR: HGEymwe457Vj2f2lUyRzQhSbPQKgQfq3WRWjRVt677rv/RivSglMC9BfszmOeQ/BmcoLj++k5W
 8Oz/wIiW144Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="292661832"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2020 11:41:00 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGS0U-00CJYn-Ox; Mon, 23 Mar 2020 20:41:02 +0200
Date:   Mon, 23 Mar 2020 20:41:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add Segey Semin to maintainers of DW
 APB GPIO driver
Message-ID: <20200323184102.GW1922688@smile.fi.intel.com>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop unneeded Cc's.

On Mon, Mar 23, 2020 at 09:06:32PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Add myself as a co-maintainer of the Synopsis DesignWare APB GPIO driver.

By the way, if you are really wanting to maintain the driver, I may give you
(for free) Intel Galileo board where this IP is being used.

Send me private mail where we can discuss how to deliver.

-- 
With Best Regards,
Andy Shevchenko


