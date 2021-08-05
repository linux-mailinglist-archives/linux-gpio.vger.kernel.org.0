Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF2B3E12C1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 12:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240447AbhHEKjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 06:39:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:10683 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240519AbhHEKjI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 06:39:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="194399042"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="194399042"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 03:38:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="668859348"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 03:38:52 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mBaly-005QbL-42; Thu, 05 Aug 2021 13:38:46 +0300
Date:   Thu, 5 Aug 2021 13:38:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <YQu/tscUCweZdoCo@smile.fi.intel.com>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
 <20210804160019.77105-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804160019.77105-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 04, 2021 at 07:00:17PM +0300, Andy Shevchenko wrote:
> For backward compatibility with some legacy devices introduce
> a new (*) property gpio-base to read GPIO base. This will allow
> further cleaning up of the driver.
> 
> *) Note, it's not new for the GPIO library since the mockup driver
>    is using it already.

Serge, I haven't put any tags here since the patch has been modified.
It still works for my case. I hope that's what you wanted me to do.

Since Lee gave his ACKs, this is the last in the series to be reviewed.

-- 
With Best Regards,
Andy Shevchenko


