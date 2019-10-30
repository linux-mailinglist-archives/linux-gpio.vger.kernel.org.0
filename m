Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94B5E9DCF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfJ3OrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:47:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:44524 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfJ3OrZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 10:47:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 07:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="225353521"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 30 Oct 2019 07:47:22 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iPpFq-0007K0-8o; Wed, 30 Oct 2019 16:47:22 +0200
Date:   Wed, 30 Oct 2019 16:47:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
Message-ID: <20191030144722.GZ32742@smile.fi.intel.com>
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
 <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com>
 <CACRpkdboOodR4Ux-bNp+XcFkTtxA-QehtP6+H+RsfFk+h6OaXQ@mail.gmail.com>
 <cae76d3c-7a9d-2fdd-2899-b1a98cf0df78@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cae76d3c-7a9d-2fdd-2899-b1a98cf0df78@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 02:11:50PM +0100, Hans de Goede wrote:
> On 30-10-2019 13:42, Linus Walleij wrote:
> > On Wed, Oct 30, 2019 at 10:31 AM Hans de Goede <hdegoede@redhat.com> wrote:

> > > TL;DR: commit 88583e340a0e ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip")
> > > breaks a bunch of stuff and should be dropped from pinctrl/intel.git/for-next
> > > and this needs some more work before it is ready for mainline.
> > 
> > I don't know if that is such a good idea if this is a global problem,
> > like something that would potentially disturb any ACPI-based
> > GPIO chip. We might leave something else broken even if we
> > fix the issue locally.
> 
> Right, I did a quick check and at least these x86 pinctrl drivers
> all 3 have this ordering problem once the irq chip registration is
> moved to the gpiochip_add_data() call.
> 
> drivers/pinctrl/intel/pinctrl-baytrail.c
> drivers/pinctrl/intel/pinctrl-cherryview.c
> drivers/pinctrl/intel/pinctrl-intel.c
> drivers/pinctrl/pinctrl-amd.c

Hmm.. do we have cherryview broken in next / vanilla?

> 
> And it seems that drivers/gpio/gpio-merrifield.c is already
> suffering from this problem in 5.4!
> 
> So some more generic solution would be ideal...

-- 
With Best Regards,
Andy Shevchenko


