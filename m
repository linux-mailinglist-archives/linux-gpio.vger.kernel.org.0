Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7BD33C611
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 19:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhCOSuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 14:50:01 -0400
Received: from mga09.intel.com ([134.134.136.24]:11157 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhCOSth (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 14:49:37 -0400
IronPort-SDR: emUrZaC6HZp69aZ/YK4wCxOfrL0aCaQIxWDJlI6YP6OR3E4rerI54d3SX2O4bO4d/O7tSV7zue
 qFGQPwkWFBdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="189229645"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="189229645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 11:49:29 -0700
IronPort-SDR: smpqX6XBZLNQYi/uw+E1RhoCqVRlIQTe4xxlC7aKIhngCJU2UJgP2yevO+ubIdKUp6wShF5cHb
 MloBDap+/Rtw==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="511133334"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 11:49:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lLsHK-00Ckak-Pu; Mon, 15 Mar 2021 20:49:22 +0200
Date:   Mon, 15 Mar 2021 20:49:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Assign fwnode to parent's if no primary
 one provided
Message-ID: <YE+sMiNxOHxFsilv@smile.fi.intel.com>
References: <20210315184430.17755-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315184430.17755-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 08:44:30PM +0200, Andy Shevchenko wrote:
> In case when the properties are supplied in the secondary fwnode
> (for example, built-in device properties) the fwnode pointer left
> unassigned. This makes unable to retrieve them.
> 
> Assign fwnode to parent's if no primary one provided.

Bart, I missed to add you as a Reporter, feel free to do that or tell me I'll
send a v2.

> Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> Fixes: 2afa97e9868f ("gpiolib: Read "gpio-line-names" from a firmware node")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Side note: The patch done in this way to avoid conflicts with the future
(for-next) code once it will be in upstream (v5.12-rcX).

-- 
With Best Regards,
Andy Shevchenko


