Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1A291D9A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 09:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfHSHOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 03:14:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:36077 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbfHSHOR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Aug 2019 03:14:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 00:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; 
   d="scan'208";a="195475459"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 19 Aug 2019 00:14:14 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 19 Aug 2019 10:14:13 +0300
Date:   Mon, 19 Aug 2019 10:14:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Chris Chiu <chiu@endlessm.com>
Cc:     andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com
Subject: Re: [PATCH] pinctrl: intel: remap the pin number to gpio offset for
 irq enabled pin
Message-ID: <20190819071413.GI19908@lahna.fi.intel.com>
References: <20190816093838.81461-1-chiu@endlessm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816093838.81461-1-chiu@endlessm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 16, 2019 at 05:38:38PM +0800, Chris Chiu wrote:
> On Asus X571GT, GPIO 297 is configured as an interrupt and serves
> for the touchpad. The touchpad will report input events much less
> than expected after S3 suspend/resume, which results in extremely
> slow cursor movement. However, the number of interrupts observed
> from /proc/interrupts increases much more than expected even no
> touching touchpad.
> 
> This is due to the value of PADCFG0 of PIN 225 for the interrupt
> has been changed from 0x80800102 to 0x80100102. The GPIROUTIOXAPIC
> is toggled on which results in the spurious interrupts. The PADCFG0
> of PIN 225 is expected to be saved during suspend, but the 297 is
> saved instead because the gpiochip_line_is_irq() expect the GPIO
> offset but what's really passed to it is PIN number. In this case,
> the /sys/kernel/debug/pinctrl/INT3450:00/gpio-ranges shows
> 
> 288: INT3450:00 GPIOS [436 - 459] PINS [216 - 239]
> 
> So gpiochip_line_is_irq() returns true for GPIO offset 297, the
> suspend routine spuriously saves the content for PIN 297 which
> we expect to save for PIN 225.

Nice work nailing the issue!

> This commit maps the PIN number to GPIO offset first in the
> intel_pinctrl_should_save() to make sure the values for the
> specific PINs can be correctly saved and then restored.
> 
> Signed-off-by: Chris Chiu <chiu@endlessm.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I think this should also have:

Fixes: c538b9436751 ("pinctrl: intel: Only restore pins that are used by the driver")
