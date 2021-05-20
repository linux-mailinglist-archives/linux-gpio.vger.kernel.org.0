Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133D938A086
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 11:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhETJFK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 05:05:10 -0400
Received: from mga06.intel.com ([134.134.136.31]:45664 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230458AbhETJFK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 05:05:10 -0400
IronPort-SDR: Oa4/FM46h0EirZ4YwSesLRXTce9wb9NsTFfQ3LI/Yvv4azJTnv+lf+wLzU2I6zZIuTmltPy2ZE
 d7rreW/4L7TQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262403018"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="262403018"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:03:46 -0700
IronPort-SDR: YfeVf+F4r2kE5T7hr3/j2ub5v0/161DCoyXMukyDECpCk/UO05a8GFIMmx6f1gw/KwbBDC5EiX
 msFjCwdBRACg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="440369395"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:03:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1ljeak-00DRRy-ET; Thu, 20 May 2021 12:03:42 +0300
Date:   Thu, 20 May 2021 12:03:42 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Message-ID: <YKYl7kt5aGMAHUP9@smile.fi.intel.com>
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
 <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
 <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
 <YKYe4rgGTDRfq+va@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKYe4rgGTDRfq+va@hovoldconsulting.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 10:33:38AM +0200, Johan Hovold wrote:
> On Thu, May 20, 2021 at 11:15:31AM +0300, Andy Shevchenko wrote:

> FWIW, NAK due to the non-descriptive for_each_desc_if() name.

I'm fine without this change, thanks for review!

-- 
With Best Regards,
Andy Shevchenko


