Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEAED11E436
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 14:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfLMNB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 08:01:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:8748 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbfLMNB1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Dec 2019 08:01:27 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Dec 2019 05:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="scan'208";a="220918227"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 13 Dec 2019 05:01:18 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 13 Dec 2019 15:01:17 +0200
Date:   Fri, 13 Dec 2019 15:01:17 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v1 0/5] pinctrl: baytrail: Clean up (part 3)
Message-ID: <20191213130117.GN2110480@lahna.fi.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 12, 2019 at 12:25:52PM +0200, Andy Shevchenko wrote:
> This is a part 3 of clean up pin control driver for Intel Baytrail.
> After this applied the driver will use all available data structures
> from pinctrl-intel.h header.
> 
> Note, that patch which exposes common pin control data structrure for drivers
> will be used by Lynxpoint as well.
> 
> This has been tested on the tablet with SD card detection and buttons pressed.
> 
> Based on our pinctrl/intel for-next branch.
> 
> Andy Shevchenko (5):
>   pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated
>     callback
>   pinctrl: intel: Share struct intel_pinctrl for wider use
>   pinctrl: baytrail: Keep pointer to struct device instead of its
>     container
>   pinctrl: baytrail: Use local variable to keep device pointer
>   pinctrl: baytrail: Reuse struct intel_pinctrl in the driver

For the series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
