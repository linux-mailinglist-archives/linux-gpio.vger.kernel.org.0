Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8418C48B8C2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243987AbiAKUle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:41:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:25886 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233821AbiAKUle (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641933694; x=1673469694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ot8Wb0gfbskpqwZ58cZVXm4U58CltaZTvKJj6o6hZW4=;
  b=SamjQk7rEFEZ7fYJpFzTGV/GE8aX3AJe0znHcWoyUchWJoZ7rMvJ2A08
   51OWD1kNKsAoBGFKEW6wbROx7nUW3xkrMcC20Tp+K8+vZCaGLBcwdnto5
   P9lqDu1V5AdduLYHyIFe3ebow834QXK+dM1XCWLYIXyxYitSvGtkkGCBk
   YDZFvahgh3dnReX5su2w+SuR4NifW5N/nkai6nQY3ZSMFeA5rhFi4Fzig
   Rbx6dHfWoIpCFJhUiPIspyBTnKIPjv3Fpq5BJd70kS+BnuV5WsYAO9zu1
   BCpQw6uZjRuF+VDX8SktKC3rlkzx9yKO7U4eiY/bqZyEIKdcqnQ4CL809
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="267920978"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="267920978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 12:41:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="623195483"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 12:41:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n7NwI-009RDv-EY;
        Tue, 11 Jan 2022 22:40:18 +0200
Date:   Tue, 11 Jan 2022 22:40:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping
Message-ID: <Yd3rMkD9cX+6Bt9b@smile.fi.intel.com>
References: <20220104164238.253142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104164238.253142-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 04, 2022 at 05:42:38PM +0100, Hans de Goede wrote:
> Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
> an interrupt line as unused") made the code properly differentiate
> between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
> to GPIO pinnumber/hwirq mapping.
> 
> This is causing some boards to not boot. This commit restores the old
> behavior of triggering hwirq 0 when receiving an interrupt on an
> interrupt-line for which there is no mapping.

I conducted a research and, on the board Jarkko has issues with, all
mentioned pins are floating.

[    3.556875] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
(I believe this matches to 76 below)

[   37.287821] cherryview-pinctrl INT33FF:03: using interrupt line 0 for pin 81
[   37.371456] cherryview-pinctrl INT33FF:02: using interrupt line 0 for pin 22
[   37.389548] cherryview-pinctrl INT33FF:03: using interrupt line 2 for pin 77
[   37.407050] cherryview-pinctrl INT33FF:00: using interrupt line 0 for pin 76

Two of them are designated for SD card and Audio Daughter board.
But in all cases is seems like PCB error, unfortunately.


-- 
With Best Regards,
Andy Shevchenko


