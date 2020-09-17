Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB90426D848
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 12:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIQKCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 06:02:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:32026 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgIQKCl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 06:02:41 -0400
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:02:41 EDT
IronPort-SDR: B+xH0zFmjQIIhZFtByEb1uFS4KP+tIhp/hdDsPEYoPils0TxuAu9obgiFv6DkNRPHceuPAEYMA
 xNs0//Q/78QQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160590741"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="160590741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 02:55:20 -0700
IronPort-SDR: 6AWgY6k2jSM6QsujXaNtiiUDS/Fn+dL8VWCglFvIAk26Fo4St2OUfqS3ZchJAQuNrr212bTyNP
 sdO6q+0OmcHw==
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="452231616"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 02:55:16 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 17 Sep 2020 12:55:14 +0300
Date:   Thu, 17 Sep 2020 12:55:14 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        linux-gpio@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH next v2] gpiolib: check for parent device in
 devprop_gpiochip_set_names()
Message-ID: <20200917095514.GO2495@lahna.fi.intel.com>
References: <20200917074857.6716-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917074857.6716-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 09:48:57AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> It's possible for a GPIO chip to not have a parent device (whose
> properties we inspect for 'gpio-line-names'). In this case we should
> simply return from devprop_gpiochip_set_names(). Add an appropriate
> check for this use-case.
> 
> Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Anders Roxell <anders.roxell@linaro.org>

FWIW,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
