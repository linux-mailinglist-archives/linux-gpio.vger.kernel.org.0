Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41EF11AE75
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 15:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbfLKOzQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 09:55:16 -0500
Received: from mga09.intel.com ([134.134.136.24]:46349 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729435AbfLKOzQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 09:55:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 06:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="225551751"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 11 Dec 2019 06:55:13 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1if3OS-0000SM-LY; Wed, 11 Dec 2019 16:55:12 +0200
Date:   Wed, 11 Dec 2019 16:55:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: pinctrl-cherryview: Use GPIO direction
 definitions
Message-ID: <20191211145512.GW32742@smile.fi.intel.com>
References: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
 <1e962b7f5905a0336528eeb0a43eee0cf870879c.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e962b7f5905a0336528eeb0a43eee0cf870879c.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 04:32:54PM +0200, Matti Vaittinen wrote:
> Use new GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT when
> returning GPIO direction to GPIO framework.

> -	return direction != CHV_PADCTRL0_GPIOCFG_GPO;
> +	return direction != CHV_PADCTRL0_GPIOCFG_GPO ? GPIO_LINE_DIRECTION_IN :
> +						       GPIO_LINE_DIRECTION_OUT;

Same as per patch 1.

-- 
With Best Regards,
Andy Shevchenko


